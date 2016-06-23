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
    EditSay: TEdit;
    ButtonSend: TButton;
    ButtonConnect: TButton;
    ClientSocket: TClientSocket;
    StatusBar: TStatusBar;
    Bevel1: TBevel;
    EditIP: TLabeledEdit;
    EditPort: TLabeledEdit;
    Label1: TLabel;
    EditNick: TLabeledEdit;
    ButtonChangeNick: TButton;
    MainMenu: TMainMenu;
    File1: TMenuItem;
    ConnectDisconnect1: TMenuItem;
    ChangeNickname1: TMenuItem;
    Exit1: TMenuItem;
    Bevel2: TBevel;
    procedure ButtonConnectClick(Sender: TObject);
    procedure ClientSocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure ButtonSendClick(Sender: TObject);
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
    procedure EditSayKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

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
read : string;
begin
  read := socket.ReceiveText;
  memoChat.Lines.Add(read);
end;

procedure TForm1.ButtonSendClick(Sender: TObject);
begin
ClientSocket.Socket.SendText(EditNick.Text + ' says: ' + EditSay.Text);
EditSay.Text := '';
end;


procedure TForm1.EditChatKeyPress(Sender: TObject; var Key: Char);
begin
Key := #0; //i dont want to change the nickname at runtime
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
MemoChat.Clear;
StatusBar.SimpleText := 'Status: Ready [Not connected].';
EditNick.Text := 'Unnamed Soldier';
end;

procedure TForm1.ClientSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
StatusBar.SimpleText := 'Status: Connected with '+ClientSocket.Socket.RemoteHost;
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
old, new : string;
begin
InputQuery('New nick?', 'Please write the new nickname you want to use.', new);
if new = '' then
  Exit;
old := EditNick.Text;
ClientSocket.Socket.SendText(old + ' just changed its nick to '+ new);
EditNick.Text := New;
end;

procedure TForm1.EditNickKeyPress(Sender: TObject; var Key: Char);
begin
Key := #0;
end;


procedure TForm1.EditSayKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then //#13 is Enter
  begin
  ButtonSend.Click;
  end;
end;

end.
