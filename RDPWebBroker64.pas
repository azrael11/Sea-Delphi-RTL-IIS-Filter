unit RDPWebBroker64;

// 28 Febr 2019 Roberto Della Pasqua www.dellapasqua.com
// for better performances put RDPMM64 as first unit clause in project source
// define SEAZLIB for compression realtime acceleration

{$DEFINE SEAZLIB}

interface

uses System.Classes, Web.HTTPApp, Web.WebReq;

type
  TWBHelper = class helper for TWebResponse
  public
    procedure ZlibDeflate; overload;
    procedure ZlibDeflate(const Src:TMemoryStream); overload;
  end;

implementation

{$IFDEF SEAZLIB}
uses RDPZlib64;
{$ELSE}
uses System.Zlib;
{$ENDIF}

procedure TWBHelper.ZlibDeflate;
var
  ZBuff: TMemoryStream;
begin
  if ContentStream.Size > 0 then
  begin
    ZBuff := TMemoryStream.Create;
    ContentStream.Seek(0, 0);
{$IFDEF SEAZLIB}
    SeaZlib.CompressStream(ContentStream, ZBuff, Z_BEST_SPEED_AC);
{$ELSE}
    ZCompressStream(ContentStream, ZBuff, zcFastest);
{$ENDIF}
    ContentStream.Free;
    ContentStream := ZBuff;
    ContentStream.Seek(0, 0);
    ContentEncoding := 'deflate';
    ContentLength := ZBuff.Size;
  end;
end;

procedure TWBHelper.ZlibDeflate(const Src:TMemoryStream);
{$IFDEF SEAZLIB}
var
  Helper:TMemoryStream;
begin
  if Src.Size > 0 then
  begin
    Src.Seek(0, 0);
    Helper:=TMemoryStream.Create;
    SeaZlib.CompressStream(Src, Helper, Z_BEST_SPEED_AC);
    ContentStream := Helper;
    ContentStream.Seek(0, 0);
    ContentEncoding := 'deflate';
    ContentLength := Helper.Size;
  end;
  {$ELSE}
var
  HelperTZ:TZCompressionStream;
  Helper:TMemoryStream;
begin
  if Src.Size > 0 then
  begin
    Src.Seek(0, 0);
    Helper:=TMemoryStream.Create;
    HelperTZ:=TZCompressionStream.Create(Helper, zcFastest, -15);
    HelperTZ.CopyFrom(Src, Src.Size);
    HelperTZ.Free;
    ContentStream := Helper;
    ContentStream.Seek(0, 0);
    ContentEncoding := 'deflate';
    ContentLength := Helper.Size;
  end;
{$ENDIF}

end;

end.
