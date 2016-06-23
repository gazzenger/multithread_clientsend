object Form1: TForm1
  Left = 167
  Top = 156
  Width = 613
  Height = 515
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
  object Label1: TLabel
    Left = 344
    Top = 424
    Width = 254
    Height = 13
    Caption = 'Created by Wack-a-Mole [wackamonster@gmail.com]'
    Enabled = False
  end
  object Bevel2: TBevel
    Left = 16
    Top = 16
    Width = 273
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
  object EditSay: TEdit
    Left = 8
    Top = 400
    Width = 513
    Height = 21
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 1
    OnKeyPress = EditSayKeyPress
  end
  object ButtonSend: TButton
    Left = 520
    Top = 400
    Width = 76
    Height = 21
    Caption = 'Send'
    TabOrder = 2
    OnClick = ButtonSendClick
  end
  object ButtonConnect: TButton
    Left = 512
    Top = 40
    Width = 73
    Height = 21
    Caption = 'Connect'
    TabOrder = 3
    OnClick = ButtonConnectClick
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 442
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
    TabOrder = 5
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
    TabOrder = 6
  end
  object EditNick: TLabeledEdit
    Left = 24
    Top = 40
    Width = 185
    Height = 21
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = 'Nickname'
    TabOrder = 7
    OnKeyPress = EditNickKeyPress
  end
  object ButtonChangeNick: TButton
    Left = 208
    Top = 40
    Width = 73
    Height = 21
    Caption = 'Change'
    TabOrder = 8
    OnClick = ChangeNickname1Click
  end
  object ClientSocket: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = ClientSocketConnect
    OnDisconnect = ClientSocketDisconnect
    OnRead = ClientSocketRead
    Left = 568
    Top = 16
  end
  object MainMenu: TMainMenu
    Left = 120
    Top = 8
    object File1: TMenuItem
      Caption = 'File'
      object ConnectDisconnect1: TMenuItem
        Caption = 'Connect/Disconnect'
        OnClick = ConnectDisconnect1Click
      end
      object ChangeNickname1: TMenuItem
        Caption = 'Change Nickname...'
        OnClick = ChangeNickname1Click
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
  end
end
