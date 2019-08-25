unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//uses System.Zlib;
uses RDPZlib64;

procedure TForm1.Button1Click(Sender: TObject);
var
T,T2:TMemoryStream;
A,B:integer;
D1,D2: cardinal;
begin
T:=TMemoryStream.Create;
T.LoadFromFile('C:\Abook.txt');
T2:= TMemoryStream.Create;
T2.SetSize(T.Size);

A:=GetTickCount;
D1:=T2.Size;
D2:=T.Size;
//for B := 0 to 1000 do
//System.Zlib.compress2(T2.Memory,D1,T.Memory,D2,1);

Showmessage(IntToStr(GetTickCount-A));


T2.Free;
T.Free;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
T,T2:TMemoryStream;
A,B:integer;
D1,D2: integer;
C,D:PVOID;
begin
T:=TMemoryStream.Create;
T.LoadFromFile('C:\Abook.txt');
T2:= TMemoryStream.Create;
T2.SetSize(T.Size);

GetMem(C,T.Size);
GetMem(D,T.Size);
Move(T.Memory,C^, T.Size);

A:=GetTickCount;
D1:=T2.Size;
D2:=T.Size;
for B := 0 to 1000 do       // SeaZlib.Compress(GpvInData, GcbInData, IBuffer, IBufSize);
SeaZlib.Compress(C, D, D1, D2, Z_BEST_SPEED_AC);

Showmessage(IntToStr(GetTickCount-A));


T2.Free;
T.Free;
end;

end.
