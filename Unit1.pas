unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, URLMon;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  SourceFile, LocalFile: string;
begin
  SourceFile := Edit1.Text;
  LocalFile := 'C:\Users\GAZZA\Documents\My Programs\test.htm';
  if URLDownloadToFile(nil, PChar(SourceFile), PChar(LocalFile), 0, nil) = 0 then
    ShowMessage('Done')
  else
    ShowMessage('Error downloading ' + SourceFile);
end;

end.
