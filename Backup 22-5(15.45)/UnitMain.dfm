object Form1: TForm1
  Left = 167
  Top = 156
  Width = 621
  Height = 487
  Caption = 'Simple TCP Sockets Chat Example - Client // By Wack-a-Mole'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 288
    Top = 16
    Width = 305
    Height = 49
  end
  object MemoChat: TMemo
    Left = 8
    Top = 72
    Width = 588
    Height = 329
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    Lines.Strings = (
      'MemoChat')
    TabOrder = 0
  end
  object ButtonConnect: TButton
    Left = 512
    Top = 40
    Width = 73
    Height = 21
    Caption = 'Connect'
    TabOrder = 1
    OnClick = ButtonConnectClick
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 410
    Width = 605
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object EditIP: TLabeledEdit
    Left = 304
    Top = 40
    Width = 169
    Height = 21
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 89
    EditLabel.Height = 13
    EditLabel.Caption = 'IP or DNS Address'
    TabOrder = 3
  end
  object EditPort: TLabeledEdit
    Left = 472
    Top = 40
    Width = 41
    Height = 21
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 19
    EditLabel.Height = 13
    EditLabel.Caption = 'Port'
    TabOrder = 4
  end
  object Button1: TButton
    Left = 96
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Queue File'
    TabOrder = 5
    OnClick = Button1Click
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
  object MainMenu: TMainMenu
    Left = 40
    object File1: TMenuItem
      Caption = 'File'
      object ConnectDisconnect1: TMenuItem
        Caption = 'Connect/Disconnect'
        OnClick = ConnectDisconnect1Click
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 8
    Top = 32
  end
end
