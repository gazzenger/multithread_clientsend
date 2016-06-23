{This program was created by Wack-a-Mole. You are free to use
it or its source code in any way you want, just gimme some credit.
If you want you can contact me at wackamonster@gmail.com}

unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, StdCtrls, ExtCtrls, ComCtrls, Menus;

type
  TForm1 = class(TForm)
    MemoChat: TMemo;
    ButtonConnect: TButton;
    ClientSocket: TClientSocket;
    StatusBar: TStatusBar;
    Bevel1: TBevel;
    EditIP: TLabeledEdit;
    EditPort: TLabeledEdit;
    MainMenu: TMainMenu;
    File1: TMenuItem;
    ConnectDisconnect1: TMenuItem;
    Exit1: TMenuItem;
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    procedure ButtonConnectClick(Sender: TObject);
    procedure ClientSocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure EditChatKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure ClientSocketConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure Exit1Click(Sender: TObject);
    procedure ConnectDisconnect1Click(Sender: TObject);
    procedure ClientSocketDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ChangeNickname1Click(Sender: TObject);
    procedure EditNickKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
function ConvertToUNCPath
  (MappedDrive: string): string;

var
  Form1: TForm1;
  LocalHost: string;

implementation

{$R *.dfm}

procedure TForm1.ButtonConnectClick(Sender: TObject);
begin
  ClientSocket.Host := EditIp.Text;
  ClientSocket.Port := StrToInt(EditPort.Text);
  ClientSocket.Active := True;
end;

procedure TForm1.ClientSocketRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  read: string;
begin
  read := socket.ReceiveText;
  memoChat.Lines.Add(read);
end;

procedure TForm1.EditChatKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0; //i dont want to change the nickname at runtime
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  MemoChat.Clear;
  StatusBar.SimpleText := 'Status: Ready [Not connected].';

end;

procedure TForm1.ClientSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  StatusBar.SimpleText := 'Status: Connected with ' + ClientSocket.Socket.RemoteHost;
  LocalHost := Socket.LocalHost;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.ConnectDisconnect1Click(Sender: TObject);
begin
  ClientSocket.Active := not ClientSocket.Active;
end;

procedure TForm1.ClientSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  StatusBar.SimpleText := 'Status: Disconnected.';
end;

procedure TForm1.ChangeNickname1Click(Sender: TObject);
var
  old, new: string;
begin
  InputQuery('New nick?', 'Please write the new nickname you want to use.', new);
  if new = '' then
    Exit;

end;

procedure TForm1.EditNickKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;


function ConvertToUNCPath
  (MappedDrive: string): string;
var
  RemoteString: array[0..255] of char;
  lpRemote: PChar;
  StringLen: Cardinal;
begin
  if (MappedDrive[1] = '\') and (MappedDrive[2] = '\') and FileExists(MappedDrive) then
    Result := MappedDrive
  else
  begin
    lpRemote := @RemoteString;
    StringLen := 255;
    if WNetGetConnection(Pchar(ExtractFileDrive(MappedDrive)), lpRemote, StringLen) = NO_ERROR then
    begin
      if FileExists(RemoteString + copy(MappedDrive, 3, length(MappedDrive) - 2)) then
        Result := RemoteString + copy(MappedDrive, 3, length(MappedDrive) - 2)
      else
        Result := '';
    end
    else
      Result := '';
  end;
end;



procedure TForm1.Button1Click(Sender: TObject);
var filename: string;
    DefaultTitle: string;
    Response: boolean;
begin
  if opendialog1.Execute then
  begin
    filename := ConvertToUNCPath(opendialog1.FileName);
    if filename = '' then exit;

    DefaultTitle := 'Project';
      Response := InputQuery('Project Title', 'Please enter a project or analysis title', DefaultTitle);
      if not (Response) then exit;

     showmessage('[' + DatetoStr(Date) + ' ' + TimetoStr(GetTime) + '] ' + LocalHost + ': ' + 'proj=' + DefaultTitle + 'file=' + filename);
    ClientSocket.Socket.SendText('[' + DatetoStr(Date) + ' ' + TimetoStr(GetTime) + '] ' + LocalHost + ': ' + 'proj=' + DefaultTitle + 'file=' + filename);
  end;
end;

end.

