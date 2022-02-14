
//VariableElement,Curve,Bus,Calculation,Macro
Tvarijable = Class(tstringlist)
	//UseIfTheScriptNeedsSupport
	//ToCalculateTheFormula
	//Avar: =TvarijableCreate (nil)
    Constructor Create(Aparent : TObject);
	//UseOnlyOnYourOwnFacility
    Destructor Destroy;
	//CopiesOneVariableToOther
    Procedure Kopiraj(Source : Tvarijable);
	//CalculatesTheDefaultFormulaInValue "4 +5 *Test /50"
	//VariableTestMustFirstBeAddedToTheUsAdd ('test =100)
    Function ParseVar(value : string):extended;
	//SameAsThePreviousFunctionItselfReturnsTheResultAsAString
    Function ParseVarAsString(value : string):string;
	//VerifiesDaliValueExistsAsAVariable
    Function IsVar(value : string):Boolean;
	//IfVarnameThereIsAssigningHerValueOfVarvalue
    Function SetVarValue(Varname, VarValue : string) : boolean;
end;


   //TpotdataobjIsOneElementFromTheCorpusList
   //Consumable,AndMarginalTapes
   //ThereIsNoWayToAccessThatList !!!
   //EachConsumableAndStripAddedToTheElement,
   //ABoardOrProjectHasAReferenceTo "tpotdataobj"Object
   //PropertyHasTpotdataobjIsEnabledIndirectlyOver
   //Class "tpotrosnovnne", "tomomadni"And "tduzni"
   // "tpotrosni"IsAClassInTheBoard,ElementAndProject
   //ContainingSuppliesAddedToTheBoard,ElementOrProject
   
   //AllPropertyAndHave "read" (iCanRead)
   //SomeHave "write" (aNewValueCanBeAllocated)
   //AssigningTheValueOfPropertyInWhichThereIsNo "write"CausesStrangeMessagesFromScript
   //IsNot100%SureToBeAScriptReportedACompilationError
   //IfTheWrongMistakeOfTheNebudaReportedReadonlyAMistake
   
   TPotDataObj = class(tobject)		
        DPKSExtra :TDPKSExtraData ;
   end;

   //CommonClassForConsumablesAndEdgeStrips
   //PossibleCastIn "tomed"And "tduzni"DependingOn
   //vjednostiPropertyATip
   //Eg:
   //tmp:tConsumableBasic;
   // td: Carryu saver;
   //Tk:Tomomadni;
   //ifTmpTip =duzniThenTd:=tDuzni(tmp)else
   // Iftmptype = KomadnithenTk: = Tonight (TMP);
   
   TTipPotrosnog=(Duzni,Komadni);
   
   TPotrosniOsnovni = class 
		Property Naziv : string Read;
		//TpotrosniInWhichOneIsLocated
        Parent :Tobject ;
		//Ttippostrosnog = (due,Piece);
        Tip :TTipPotrosnog ;
		//ReferenceToActualConsumer
        Data :TPotDataObj ;
		//Šifa
        Oznaka :string ;
		//SameAsTag
        Sifra :string ;
		//ActiveYesOrNo (accessoriesThatIsTooLargeToFitInElement
		//IActive: =False;
        Property Active : boolean Read;
   end;

TTocka = class(Tobject)
        Constructor Create(aparent:tobject);
        Procedure Kopiraj(source:TTocka;all:boolean);
        Procedure Rebuild;
		Parent:tobject; ;
        X:double; ;
		Z:double; ;
		Depth:double; ;
        S:integer; ;
        PrevControlpoint:TVector3f; ;
        NextControlpoint:TVector3f; ;	
		Segments:integer ;
        AStyle:TALineStyle ;
        TangentMode:TtangentMode ;
        OrgCoord:TVector3f ;
        OrgCoord1:TVector3f ;
        ArcStyle:TarcStyle ;
        ArcRadius:single ;
        XF:string index 0 ;
        YF:string index 1 ;
        ZF:string index 2 ;
        FiF:string index 3 ;
        ArcCentar:boolean ;
	end;

    TSegmentList = class(tlist)
        Tocka[Index:integer]:TTocka ;
    end;

    TrubneTocke = class    //PreservesPoints
        Constructor Create(aparent:TDaska;Aowner:TtockeSystem);        
        Procedure BildOutList;        
        Procedure Kopiraj(source:TrubneTocke);        
        Procedure MakeKocka(first:TVector3f);
        Procedure MakeTriangle(first:TVector3f);
        Procedure MakeCircle(first:TVector3f);        
        Procedure  ObrisiTocku(index:integer);
        Procedure  Strech(sType:TstrechType;strength:tvector3f;Propor:boolean);
        Procedure  Rotate(Plane:integer;Kut:single);
        Function   AddNewTocka(Index:integer;Value:tvector3f):TTocka;
		Property Parentd:TDaska; Read;
        Property Mainlist:tlist;  Read;        
          MainTocke[Index:integer]:TTocka ;
		  Name:String ;
          Owner:TtockeSystem ;
          Mode :TmodeRubneTocke ;
		Property   Centar: TVector3f Read FCentar write FCentar;
        Property   CentarMode:TcentarMode Read FCentarMode write SetcntarMode;
		  Otvorena:boolean ;
		Property   Count:integer Read GetMainCount;
        Property   SegCount:integer Read GetSegcnt;
        Property   TockaCount :integer Read GetTockaCnt;
		  Segment[index:Integer]:TSegmentList  ;
		  Tocka[Index:integer]:TTocka ;
          DoCNC:boolean ;
        
    end;
    
    TtockeSystem = class       
        Constructor Create(aparent:TDaska);         
        Procedure Clear;
        Procedure Kopiraj(source:TtockeSystem);
        Procedure Resize(x,z:single);
        Procedure DodajKocku(first:TVector3f);
        Procedure DodajTriangle(first:TVector3f);
        Procedure DodajCircle(first:TVector3f);
        Procedure RemoveCurve(index:integer);
        Procedure AddLine(line:TrubneTocke);
        Procedure InitRubneTocke;
        Parent:TDaska ;
        Count:integer ;
        Rubne:TrubneTocke ;
        Rupa[Index:integer]:TrubneTocke ;
                 
          Mode :TmodeRubneTocke ;
        SideType:TSideType ;
        Property Varijable   :Tvarijable Read Fvarijable;
        EditModes:TEditModesSet ;
        SpeenSeg:integer ;
        BasePoint:TBasePoint ;
        SpeenStart:integer ;
        SpeenEnd:Integer ;
        TxXtile:single ;
        TxYtile:single ;
        SphereMap:boolean ;
    end;

	TSideType= (TSFront,TSBack,TSBoth,TSBothOut,TSOpen,TsSpeen,TSPath,TSFree);
    TmodeRubneTocke=(RTDisable,RTRadius,RTCurve,RTSurface);
    TcentarMode=(TCFix,TcAuto,TcFree);
    TstrechType= (TSCentar,TsNula,TsFirstPoint);
    TALineStyle=(RLine,Rcurve,Rarc);
    TarcStyle=(ARplus,Arminus);
    TtangentMode=(TAtangentFree,TaTangentNotEqual,TaTangentEqual,TaRadius);
	THomogeneousFltVector = array[0..3] of Single;
	Tvector4I = array[0..3] of Integer;
	TVector4f = THomogeneousFltVector;
	TVector = THomogeneousFltVector
	TAffineFltVector = array[0..2] of single;
	TVector3f = TAffineFltVector;    
    TBasePoint = (TBPMinimum,TBPNula,TBPCentar);
	

TEditVar = class
    Constructor Create;
	//BeforeDestroyingTheObjectShouldBeRemovedFromParent
	//TeditablevarlistRemove ();
    Destructor Destroy;override;
	//CopySourceInItself
    Procedure Kopiraj(source:TEditVar);
	//SetsTheValueOfTheVariable
	//OnlyUsedWhenTheDtvcomboType
	//IndexYourIndexUVaudeslist
    Procedure PostaviVrijednost(Index:integer);
	//Title
    Property VarName:String;
	//Value
    Property VarValue:String;
	//ColorTextAtEdita
    Color :integer ;
	//TextThatIsSeenAtEdit
    Property Caption:string;
	//NotUsedForTheUs
	//ReservedForFutureUse
    Property Tip:integer;
	//VariableIsVisibleButCannotEditInTheEditor
    Property ReadOnly:boolean;
	//Category
    Property Category:string;
	//TypeOfValue,SeeAbove
	//ChangingTheTypeOfValueOfTheVariableValue
	//AndChangeStateValueslist
	//SetTheBestImmediatelyAfterCreationAndNoLonger
    Property VarDataType:TVarDataType;
	//VariableVisibleOrNotInEditor
    Property Visible:boolean;
	//HintForVariableInEditor
    Property Hint:string;
	//LimitValuesThatCanBeEnrolled
	//UEditorAsVardatatypeDtvintegerIliDtvextended
    Property MinValue:extended;
    Property MaxValue:extended;
	//ListOfValuesToChooseWhenVardatatypeDtVcomboOrDtvCheck
	//DtvcheckHasOnlyTwoValues
	//valuesList[0]zaFalseIValuesList[1]zaTrue
    Property ValuesList:tstringlist;
	//CorpusDoesNotUseThisProperty,It'sFreeFor
	//UseInScripts
	//IsGettingReadyToMakeUp
    Property Tag:integer;
	//ValueMustBeEnrolled
	//MakesSenseOnlyWithDtvstring
	//AllOtherTypesHaveDefaultValue
	//EditorAsksThatTheUserEntersTheValueIfTrue
    Property Required:Boolean;
	//VarvalueIsNotAlwaysTheExpectedValue
	//EspeciallyAtDtvcomboAndDtvcheck
	//varValueJeValuesListValuesFromIndex[index]textVračaValuesListNames[index]
	//ThisPropertyIsReadonly
    Property Text:string;
end;

	//PossibleTypesOfNewVariables (teditvar)
	//DtvnoneAndDtvbuttonAreNotUsed
	//Dtvinteger =WholeNumber
	//dtvString =text
	//DtvCombo =SelectFromTheValueList
	//Dtvcolor =Color
	//DtVextended =DecimalNumber
	//Dtvdate =Date
	// DTVCE = Checkbox (Yes / No)
	
	TVarDataType = ( dtvNone, dtvInteger, dtvString, dtvCombo, dtvColor, dtvExtended, dtvButton,dtvDate,dtvCheck );

    Tside = (SIDLeft,SIDRight);

    Tbox =  Record
        minx:Single;
        maxx:Single;
        miny:Single;
        maxy:Single;
        minz:Single;
        maxz:Single;
    end;

    TRotRect=Tbox;
    TMinMaxObj= record
        Left:tobject;
        Right:tobject;
        Top:tobject;
        Bottom:tobject;
        front:tobject;
        back:tobject;
    end;
	
    Tdimenzije = record
        visina:single;
        dubina:single;
        sirina:single;
    end;

	TNazPotTip = (PoElement,PoBokDesni,PoBokLijevi,PoPod,PoStrop,PoPrednjeOjacanje,
              PoStraznjeOjacanje,PoFronta,PoBlenda,PoLedja,PoPregrada,PoPolica,PoNogica,
              PoRuckica,PoCokla,PoRadna,PoStropna,PoPodna,PoLijevaL,PoDesnaL,PoGornjaL,PoDonjaL,PoUklada,PoFixna);
var   
   MinMaxObj:TMinMaxObj;
   PrgFolder:string;   
   ElementFolder:string;

TEditableVarList = class      
	//UseWhenATemporaryListOfVariables
	//ForExample,ForStoringInAFileOrReadingFromFile
	// List: = TeditbellavallyisCarreyaray (Neil)
    Constructor create(Aparent:tobject);
	//DestructionOfYourOwnList
    Destructor Destroy; override;
	//Classic
    Procedure Kopiraj(source:TEditableVarList);
	//AddsAVariable
    Procedure Add(aEditVar:TEditVar);
	//RemovesTheVariableButDoesNotDestroyIt
    Procedure Remove(aEditVar:TEditVar);
	//RemovesAndDestroysTheVariable
    Procedure RemoveAndFree(Index:integer);
	//DestroysAllVariables
    Procedure Clear; override;
	//SpringsFile
    Procedure SaveToFile(const FileName: string); override;
	//ReadsFile
	//ReadingFirstDestroysTheVariablesIfThereAre
    Procedure LoadFromFile(const FileName: string); override;
	//SortsVariablesByCategory
    Procedure SortByCategory;
	//VracaListVariablesThatHaveARequestedCategory
	//FirstMakeSortbycategory;
    Function GetCategoryVar(aValue:string):tlist;
	//OneVariableInTheList
	//Avar: =ListaEditvar [i];
    Property EditVar[index:integer]:TEditVar;
	//NumberOfVariablesInTheList
	Property Count:Integer;
end;

	//EdgeStrip
   TDuzni = class(TPotrosniOsnovni)
       Procedure SetOnOF(index:integer; Value:Boolean);
       Function GetOnOF(index:integer): Boolean;            
       function Getsifra(sirina:single):string;            
       Function GetKategorijaRrake(sirina:single):integer;
       Function GetKategorijaCijeneTrake(sirina:single):integer;       
       MatName:string ;
       SMatName:string ;
		//IndexMaterialsOfStripsInCorpusListOfMaterials
		//NotNecessarilyAlwaysTheSameForTheSameMaterial
		//ButIsAlwaysTheSameWithinOneStartingCorpusA
        Matindex:integer ;
		//ThicknessOfTheStrap
        Property Debljina:single Read;
		//OnlyOnePropertyCanBeTrue
		//DependingWhichIsIn "tposer"Class
		Lijeva:Boolean index 0 ;
        Desna :Boolean index 1 ;
        Prednja:Boolean index 2 ;
        Zadnja:Boolean index 3 ;   
    end;

	//EachBoardAndElementHaveAClassOfTpotrosni
	//Consulted:Tpotrosci;
	//ConsumptionCarriesAllAddedConsumer
	
   Tpotrosni = class
			//FunctionsWorkingWithTheEdgeStripsMakeSenseOnlyIf
			//IParentTdaska
			//StripsAddedToTpotrosniInElement
			//BeIgnoredOrCausedAMistake
		Function  SetOldTraka(stranica, IndexTrake : integer) : integer; //Stranica =03
        Function  SetTraka(stranica : integer; Adata : TPotDataObj):integer;
			//rub[0N] :=0N ,N =Max3;
			//EgEdge [0]: =3CartridesEdgeNumber3
        Procedure KantirajRub(Rub : array of integer; Atraka : string); //rub=[0,1,2,3]
		//index =03
        Function  GetTraka(index : integer):TDuzni;
		//AllTheAddedStripsSetTheSameMaterial
        procedure SetDekorTrake(dekor : integer);
		//DeletesAllConsumables
        Procedure Cleardata;
		// //
        Function AddKomadni(PotIndex : integer; komada : Single) : integer;             
        Function AddKomadniBySifra(Acreator : integer; Asifra : string; komada : Single) : TKomadni;             
        Function ReplaceKomadni(NewK : TPotDataObj; komada : Single; OldK : TKomadni) : integer;
        Function ReplaceKomadniByOznaka(Oznaka : string; OldK : TKomadni) : integer;
		//VracijaTdužniOrTomomadni,ACommonClassIsTtpotrosnios
		//ProperlyTmp:Ttpotrosniosnovni;
		//tmp :=tPotrosniOsnovni(getItem(xx));
        Function GetItem(index : integer):Tobject;
        Function GetIndex(value : TObject):integer;
        Procedure RemoveItem(index : integer);
        Procedure RemoveAItem(value : TObject);        
		//TdaskaOrTelem
        Parent :TObject;	;
        Count:integer; ;
		//MakesSenseOnlyIfParentTdaskaIsOtherwiseTheValueOfNil;
		//IfTheTapeWasNotAddedToTheEdgeResultIsNil
		//IfTheResult <>NilShouldBeCheckedProvidedTheTapeIsActiveOn
		//RequestedEdge,Eg:
		//IfLeftIt's =TrueTapeIsActive
		//IfLeftItIs =FalseTapeOnThatEdgeIsNotActive (theEdgeIsNotRated)
        Lijeva :TDuzni; ;
        Desna :TDuzni; ;
        Prednja :TDuzni; ;
        Zadnja :TDuzni; ;
   end;

	TKomadni = class(TPotrosniOsnovni)
		Komada:single ;
		//MakesSenseOnlyWithEquipmentInTheProject
		//InTheElementIgnores
        Rabat:double ;
        property Cijena:single Read;
        Creator:integer ;
        Jmj:string ;
		//UsedForMacroConsumableParameters
        PodKategorija:integer ;
        Property Mainpic:string Read;
        Iznos :extended ;
        Dobavljac:integer ;
        DobavljacAsString:String ;
        Proizvodjac:integer ;
        ProizvodjacAsString:string ;
        Category:integer ;
        CategoryAsString:string ;
        Subcategory:integer ;
        SubcategoryAsString:string ;
        SifraDobavljaca:string ;
        SifraProizvodjaca:string ;
        Tezina:extended ;
        ModelFile:string ;
        ElementFile:string ;
	end;

  TFilterSetup = record
    Dobavljac:integer;
    Proizvodjac:integer;
    Kategorija:integer;
    PodKategorija:integer;
    MaxDim:TVector3f;
    UseDobavljac:Boolean;
    UseProizvodjac:Boolean;
    UseKategorija:Boolean;
    UsePodKategorija:Boolean;
    UseSet:boolean;
    UseAccessories:boolean;
    UseRest:boolean;
  end;

    TDPKSExtraData = class
       Dobavljac:integer ;
       Proizvodjac:integer ;
       Category:integer ;
       Subcategory:integer ;
       SifraDobavljaca:string ;
       SifraProizvodjaca:string ;
       Tezina:extended ;
       ModelFile:string ;
       ElementFile:string ;

   end;

TElement = class(TCorpusObject)
	constructor Create(x,y,z,v,s,d,de:double);
	constructor CreateParented(AParent:TCorpusObject;v,de:double);           
	Procedure  Kopiraj(asource:Tobject);override;           
	Procedure AddKorpus(nh:Double);
	procedure Addnogicu(x,z,h,r:Double;ime:string);
	procedure AddPrednju(h,de:Double);
	Procedure AddKutni;
	procedure AddVrata(Fvrata:TDaska);
	procedure AddPolice(Fpolice:TDaska);
	procedure AddDaska(Fdsk:TDaska);
	procedure AddElement(Fdsk:TElement);
	Function GetBox:Tbox;
	Function GetMinZ:Double;
	function GetMinHorY:Double;
	Function GetNextHorY(PrevY:Double):Double;
	Procedure RecalcFormula(caller:tobject); override;
	Function GetRubName(RubId:integer;var CntName:integer):tobject;
	Function Get3dPosition(Tmpv:TVector3f):TVector3f;
	function CountBrojRupa(DoChild:boolean):double;
	Function  GetVarValue(Varname:string):double;
	Function  GetVarValueSelf(Varname:string):double;
	Function  GetVarValueAsString(Varname:string):String;
	Procedure SetVarValue(Varname:string;value:double);
	Function SetNewEditPassword(oldp,newp:string):boolean;
	Procedure AddNewVar(Value:string);
	procedure MakeSpoj(r1,r2:tobject;m1,m2:string);
	procedure MakeSpojSetVars(r1,r2:tobject;m1,m2:string;avar1,avar2:string);
	procedure MakeSpojSetEditVars(r1,r2:tobject;m1,m2:tstrings;aedit1,aedit2:boolean);
	Procedure DeleteSpoj(Macroname:string;KogaSpaja:tobject);
	Function  GetBocnaDaska(LD:integer):TDaska;  //0 =Left1 =Provided
	Procedure DestroyLinks;
	Procedure GetAccessoriesList(Var AList:tlist);                   
	Function  HaveCustomFielsds:boolean;

	ChildDaska :Tchildelement; ;
	ElmList :Tchildelement; ;
	Property Naziv : string; Read; Write;
	Visina :Double; ;
	Dubina :Double; ;
	Sirina :Double; ;
	property Kut : Single; read; Write;
	property XKut : Single; read; Write;
	property ZKut : Single; read; Write;
	XPos :Double; ;
	YPos :Double; ;
	ZPos :Double; ;
	TipElementa :TTipElementa ;
	Cijena :Single ;
	FiksnaCijena :Single ;
	TipIzracunaCijene :byte ;
	Visible :boolean ;
	Parent :tobject ;
	Selected :boolean ;
	ImportName :String ;
	Potrosni :Tpotrosni ;
	Editable :boolean ;
	Locked :boolean ; 
	XF :String; ;
	YF :String; ;
	HF :String; ;
	ZF :String; ;
	SF :String; ;
	DF :String; ;
	XFormula :String; ;
	YFormula :String; ;
	ZFormula :String; ;
	HFormula :String; ;
	SFormula :String; ;
	DFormula :String; ;
	KXFormula :String; ;
	KYFormula :String; ;
	KZFormula :String; ; 
	ParentHolder :Tobject ;
	VarValue[Varname:string] :Double ;
	VarValueAsString[Varname : string]:string ;
	Property CleanOpis : string Read; Write;
	Property Napomena : string Read; write;
	Artikl :boolean ;
	Property Sifra : string; Read;
	Property CleanSifra : string; Read; Write;
	Property MinVisina : integer Read FMinV Write FMinV;
	Property MinSirina : integer Read FMinS Write FMinS;
	Property MinDubina : integer Read FMinD Write FMinD;
	Property MaxVisina : integer Read FMaxV Write FMaxV;
	Property MaxSirina : integer Read FMaxS Write FMaxS;
	Property MaxDubina : integer Read FMaxD Write FMaxD;
	Property KorakV    : integer Read FKorakV Write FKorakV;
	Property KorakS    : integer Read FKorakS Write FKorakS;
	Property KorakD    : integer Read FKorakD Write FKorakD;
	Property VKorakOn  : Boolean Read FVKorakOn write FVKorakOn;
	Property SKorakOn  : Boolean Read FSKorakOn write FSKorakOn;
	Property DKorakOn  : Boolean Read FDKorakOn write FDKorakOn;
	Property VString   : String  Read FVString write FVString;
	Property SString   : String  Read FSString write FSString;
	Property DString   : String  Read FDString write FDString;
	Property LockV     : Boolean Read FLockV Write FLockV;
	Property LockS     : Boolean Read FLockS Write FLockS;
	Property LockD     : Boolean Read FLockD Write FLockD;
	Property LockN     : Boolean Read FLockN Write FLockN;
	Property DefVisina : Integer Read FDefVisina write FDefVisina;
	Property DefDubina : Integer Read FDefDubina write FDefDubina;
	Property DefSirina : Integer Read FDefSirina write FDefSirina;
	Property OpisElementa : string Read GetOpisElementa;
	Vrsta :integer ;
	Property FVarijable : Tvarijable Read;
	Property FKalkVar : Tvarijable Read;	
	Property ListaGrupaPotrosnog : TStringlist; Read;
	ModelName :string ;
	CustomFields :TEditableVarList ;
end;

Tchildelement = class(tlist)
	Procedure DeleteAll;
	Procedure AddNew(value:tobject);
	Procedure Kopiraj(Source:Tchildelement);
	Procedure Obrisi(index:integer);
	Procedure Kill(obj:tobject);             
	property CountObj :integer read Getcount;
	Property Daska[index:integer] : TDaska Read GeTDaska Write SeTDaska;
	Property Element[index:integer] : TElement Read GeTElement Write SeTElement;
end;


TTipElementa = ( MojElement, Import, PC, PK, VC, VK, LA, VRE, RP, VRZ, PRO, LAM, TEZid, 
		CAparat, ERuckica, Ekolona, Enogica, Esudoper ,Emaska, Ecokla, EZl, EBocnaPloha, Estropna, EPodna);

TDaska = class(TCorpusObject)    
	Constructor CreateDaska(aparent:tobject;x,y,z,v,d,de:double);
	destructor destroy; override;        
	Procedure kopiraj(asource:tobject);        
	Procedure Rename(value:Shortstring);
	Function GetBox : Tbox;
		//DeleteAllFormulasOfTheBoards:
	Procedure ClearFormule;        
		//SetsTheMaterialOfTheStrip (1425, [1,0,1,0]);
	Procedure SetKantTexindex(value : integer; knt : array of byte);	
		// Absolute Position of One Cleaner Boke
		//aindex =07;
	Function Get3dPosition(Aindex : integer): TVector3f;                
		//ChecksGaveTheBoardNameAlreadyExistsInTheElement
	Function CheckNameExist(Value : string): boolean;
		//VračaNumberOfHolesInTheBoard
	Function CountBrojRupa : double;
		//DaliSeNaskaProducts,DependsOn "products,Visible"AndParentCanbeused
	Function CanBeUsed : boolean;
		//False:CorpusGeneratesCncProgramName
		//True:TheProgramNameIsSetByManual
	Function  FixProgram : boolean;
		//SetsMaterialToAllActiveStrips
	Procedure SetdekorTrake(value:integer);
		//NameOfMaterial;
	Property MatName : String; Read;
		//Curves
	Property TockeIRupe : TtockeSystem; Read;
		//NotUsed,RetainedDueToCompatibilityWithEarlierVersions
	Property ParentElement : TElement; Read;
		//HolesDrilledOnBoard
	Property ListaRupa : TGrupaList; Read;
		//OnlyUsedInScripts
		//NotGettingReadyInTheFile
	RedosljedKantiranja :Tvector4I ;
		//RotationAroundYAxis
	property Kut : Single; read; Write;
	property XKut : Single; read; Write;
	property ZKut : Single; read; Write;
		//LockOrientation (vertbok,Vertfront,Horiz)
	Smjer :TSmjerDaske ;
		//LocalPosition
	XPos :Double; ;
	YPos :Double; ;
	ZPos :Double; ;
		//dimenzije
	Visina :Double; ;
	Dubina :Double; ;
	Debljina :Double; ;
		//TheElementWhereTheBoardIsLocated
		//ParentIsAlwaysElementTelement (parent)
	property Parent : TObject read fparent;
	Naziv :String; ;
	property TipDaske : TTipDaske read; Write;
	Selected :boolean ;
	Property Visible  : boolean Read; Write;
		//IndexOfComputerMaterialInMaterialList
		//SkripaHasNoAccessToMaterials
	TexIndex :integer ;
		//True:PreventsCorpusToChangeTheMaterial
	Fixtex :boolean ;
		//HasMeaningOnlyIfTypeIs =Front
	TipFronte :TTipFronte ;
		//TheTapeAndStripsInTheBoard
	Potrosni :Tpotrosni ;
		//ChangeFormulaCallsARecalcformulaFunction
		//WhenToChangeMoreThanOneFormula
		//FasterUseXf,Xf,ZfPropertyE
		//AndAfterChangesToInviteRecalcformulaOnTheElement
	XFormula :String; ;
	YFormula :String; ;
	ZFormula :String; ;
	HFormula :String; ;
	SFormula :String; ;
	DFormula :String; ;
	KXFormula :String; ;
	KYFormula :String; ;
	KZFormula :String; ; 	
	RotiranGod :boolean;  ;
		//True =TheBoardCanBeRotatedWithOptimization
		//NoMatterWhatTheMaterial
	ZanemariGod :boolean; ;
	Primjedba :String ;
		//NameOfProgram1ForCnc
	BProgram :String; ;
		//NameOfProgramForCnc
	BProgram1 :String; ;
		//CurrentMaterial
	Property MMaterijal : TMatTex Read;
		//NameOfMaterial
	Property NazivMaterijala : String Read;  
		//IsNotUsed,RetainedForCompatibility
		//RanicVersions
	Artikl :boolean ;
		//TheBoardsCode,ReadOnly
		//ToChangeTheValueToUse "cleansifer"
	Property Sifra : string; Read;
		//BankCodeInTheFormOf "%Sn %%V% ..."
	Property CleanSifra : string; Read; Write;
		//NameModelParentElement
	ModelName :string ;
		//CorpusDoesNotUseThisProperty
		//FreeToUseInScript
	Vrsta :integer ;
		//02,IfVisible,Always,Never
	ProizvodiSe :integer ;
		//CorpusDoesNotUseThisProperty
		//FreeToUseInScript
	CustomFields :TEditableVarList ;
end;

	// (none,Gateway,Gateway,Doors,Doors,Ledia,Drawermacentar,Laddatald,Removed);
	       0        1           2           3           4         5        6           7         8
	TTipFronte = integer;
	
	TSmjerDaske = ( VertBok, VertFront, Horiz );
	TTipDaske = ( Korpus, Fronta, Polica, Cokla, RadnaPloca, Nogica, Sudoper, Ruckica, TDLedja, 
			TDZidD, TDZidG, TDPod, TDStrop, TDOkvir, TDCustom,TdBok,TDZl,TDStropna,TDPodna );

	
