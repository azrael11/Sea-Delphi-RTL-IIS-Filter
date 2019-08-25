library TestIsapi;

uses
  RDPMM64, // use this to achieve lock-free allocator
  Winapi.ActiveX,
  System.Win.ComObj,
  Web.WebBroker,
  Web.Win.ISAPIApp,
//  Web.Win.ISAPIThreadPool, this is useless in modern IIS architecture
  WebModuleUnitD in 'WebModuleUnitD.pas' {WebModuleD: TWebModule};

{$R *.res}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  CoInitFlags := COINIT_MULTITHREADED;
  Application.Initialize;
  Application.MaxConnections:=200; // goes from 32 concurrent users until thousands
// NumberOfThreads:=Application.MaxConnections;
  Application.WebModuleClass := WebModuleClass;
  Application.Run;
end.
