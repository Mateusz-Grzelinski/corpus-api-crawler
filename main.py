import os
import re

import scrapy
from scrapy.crawler import CrawlerProcess
from scrapy.http import HtmlResponse
import urllib.parse

OUT_DIR = 'crawler-out'
os.makedirs(OUT_DIR, exist_ok=True)

CORPUS_TYPES = {}


def parse_pascal(text: str) -> str:
    pattern = re.compile('Property (.*)\s*:\s*(.*)\s*read;?.*;')
    return re.sub(pattern, r"\g<1>:\g<2>;", text)


class CorpusStubFilesGen(scrapy.Spider):
    name = 'CorpusStubFiles'
    start_urls = ['http://corpus.corpus-online.com/corpusskripte.html']
    FEED_EXPORT_ENCODING = 'utf-8'

    def parse(self, response: HtmlResponse):
        # the navigation bar
        # for next_page in response.css(".nav > li > a"):
        #     yield response.follow(next_page, self.parse)
        for path in response.css("div.tab-pane.active a[href]"):
            href = path.attrib['href']
            next_page = response.urljoin(href)
            yield scrapy.Request(next_page, callback=self.get_pascal)

        for path in response.css("div.tab-pane a[href]"):
            href = path.attrib['href']
            next_page = response.urljoin(href)
            yield scrapy.Request(next_page, callback=self.get_pascal)

    def get_pascal(self, response: HtmlResponse):
        url = urllib.parse.urlparse(response.url)
        basename = os.path.basename(url.path)
        file_no_ext = os.path.splitext(basename)[0]
        run_once = True
        for listing in response.css(".linenums"):
            assert run_once, 'TODO support saving multiple listings'
            # cls_name = listing.attrib['class']
            text: list[str] = listing.css('::text').getall()
            text: str = ''.join(text)
            text: str = text.encode('utf-8').decode("utf-8")
            with open(os.path.join(OUT_DIR, file_no_ext + ".pas"), 'wb') as dump_file:
                dump_file.write(text.encode('utf-8'))
            # text = parse_pascal(text)
            CORPUS_TYPES[file_no_ext] = text
            run_once = False


if __name__ == '__main__':
    process = CrawlerProcess()
    process.crawl(CorpusStubFilesGen)
    process.start()

    if CORPUS_TYPES:
        out = ''
        for k, v in CORPUS_TYPES.items():
            print(f'writing stubs for {k}')
            out += str(v)
        with open('corpus_type.pas', 'wb') as file:
            file.write('uses classes;\n'.encode('utf-8'))
            file.write(out.encode('utf-8'))
