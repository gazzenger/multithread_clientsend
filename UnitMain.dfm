object Form1: TForm1
  Left = 164
  Top = 156
  BorderStyle = bsSingle
  Caption = 'Network Client Queuer'
  ClientHeight = 417
  ClientWidth = 437
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 123
    Top = 3
    Width = 305
    Height = 49
  end
  object MemoChat: TMemo
    Left = 8
    Top = 64
    Width = 420
    Height = 329
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    Lines.Strings = (
      'MemoChat')
    ReadOnly = True
    TabOrder = 4
  end
  object ButtonConnect: TButton
    Left = 344
    Top = 24
    Width = 73
    Height = 21
    Caption = 'Connect'
    TabOrder = 2
    OnClick = ButtonConnectClick
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 398
    Width = 437
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object EditIP: TLabeledEdit
    Left = 136
    Top = 24
    Width = 169
    Height = 21
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 89
    EditLabel.Height = 13
    EditLabel.Caption = 'IP or DNS Address'
    TabOrder = 0
  end
  object EditPort: TLabeledEdit
    Left = 304
    Top = 24
    Width = 41
    Height = 21
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 19
    EditLabel.Height = 13
    EditLabel.Caption = 'Port'
    TabOrder = 1
  end
  object Button1: TButton
    Left = 16
    Top = 27
    Width = 97
    Height = 25
    Caption = 'Queue File'
    Enabled = False
    TabOrder = 5
    OnClick = Button1Click
  end
  object CheckBox1: TCheckBox
    Left = 24
    Top = 8
    Width = 81
    Height = 17
    Caption = 'Autostart'
    TabOrder = 6
  end
  object ClientSocket: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = ClientSocketConnect
    OnDisconnect = ClientSocketDisconnect
    OnRead = ClientSocketRead
    Left = 8
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Batch Files|*.bat|Self-Executables|*.exe|All Files|*.*'
    Left = 8
    Top = 32
  end
end
