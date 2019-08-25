unit WebModuleUnitD;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp;

type
  TWebModuleD = class(TWebModule)
    procedure WebModuleDDefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModuleDWebActionItem1Action(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModuleDhelloworldAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModuleD;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

uses RDPWebBroker64;

threadvar TestStream: TMemoryStream;

procedure TWebModuleD.WebModuleDDefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  if not Assigned(TestStream) then
  begin
    TestStream := TMemoryStream.Create;
    TestStream.LoadFromFile('c:\ABook.txt'); // put here a random file to test speed difference, you can use apachebench
  end;
  Response.ZlibDeflate(TestStream);
end;

procedure TWebModuleD.WebModuleDhelloworldAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content:='Hello world';
end;

procedure TWebModuleD.WebModuleDWebActionItem1Action(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  Helper:TMemoryStream;
begin
  if not Assigned(TestStream) then
  begin
    TestStream := TMemoryStream.Create;
    TestStream.LoadFromFile('c:\ABook.txt'); // same as above
  end;
  Helper:=TMemoryStream.Create;
  TestStream.Seek(0,0);
  Helper.CopyFrom(TestStream,TestStream.Size);
  Response.ContentStream:=Helper;
  Helper.Seek(0,0);
  Response.ContentLength:=Helper.Size;
end;

end.
