object Form1: TForm1
  Left = 550
  Top = 59
  AlphaBlend = True
  AlphaBlendValue = 220
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsToolWindow
  Caption = 'shifter 2.1'
  ClientHeight = 617
  ClientWidth = 678
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clNone
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 264
    Top = 8
    Width = 65
    Height = 13
    Caption = 'Source File'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 264
    Top = 176
    Width = 82
    Height = 13
    Caption = 'Encrypted File'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 264
    Top = 352
    Width = 83
    Height = 13
    Caption = 'Decrypted File'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 8
    Top = 408
    Width = 143
    Height = 13
    Caption = 'Key for one-time notepad'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 8
    Top = 520
    Width = 38
    Height = 13
    Caption = 'Notice'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 233
    Height = 89
    Caption = ' sipher of Caesar '
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 56
      Width = 21
      Height = 13
      Caption = 'key'
    end
    object BtnEncrypt: TBitBtn
      Left = 8
      Top = 16
      Width = 105
      Height = 33
      Caption = 'Encrypt'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BtnEncryptClick
    end
    object BtnDecrypt: TBitBtn
      Left = 112
      Top = 16
      Width = 105
      Height = 33
      Caption = 'Decrypt'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BtnDecryptClick
    end
    object Edit1: TEdit
      Left = 56
      Top = 56
      Width = 161
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Text = '0'
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 112
    Width = 233
    Height = 97
    Caption = ' Vigenere cipher '
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object Label2: TLabel
      Left = 24
      Top = 64
      Width = 21
      Height = 13
      Caption = 'key'
    end
    object BitBtn1: TBitBtn
      Left = 8
      Top = 16
      Width = 105
      Height = 33
      Caption = 'Encrypt'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 112
      Top = 16
      Width = 113
      Height = 33
      Caption = 'Decrypt'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object Edit2: TEdit
      Left = 56
      Top = 64
      Width = 161
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Text = 'relok'
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 224
    Width = 233
    Height = 57
    Caption = ' one-time notepad '
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 2
    object BitBtn3: TBitBtn
      Left = 8
      Top = 16
      Width = 105
      Height = 33
      Caption = 'Encrypt'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 112
      Top = 16
      Width = 113
      Height = 33
      Caption = 'Decrypt'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn4Click
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 296
    Width = 233
    Height = 97
    Caption = ' gambling '
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 3
    object Label3: TLabel
      Left = 8
      Top = 64
      Width = 28
      Height = 13
      Caption = 'seed'
    end
    object Edit3: TEdit
      Left = 48
      Top = 64
      Width = 177
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Text = '0'
    end
    object BitBtn5: TBitBtn
      Left = 8
      Top = 16
      Width = 217
      Height = 33
      Caption = 'Generate'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn5Click
    end
  end
  object Memo1: TMemo
    Left = 264
    Top = 24
    Width = 393
    Height = 137
    Lines.Strings = (
      'Memo1')
    TabOrder = 4
    OnEnter = Memo1Enter
    OnExit = Memo1Exit
  end
  object Memo2: TMemo
    Left = 264
    Top = 192
    Width = 393
    Height = 137
    Lines.Strings = (
      'Memo2')
    TabOrder = 5
    OnEnter = Memo2Enter
    OnExit = Memo2Exit
  end
  object Memo3: TMemo
    Left = 264
    Top = 368
    Width = 393
    Height = 137
    Lines.Strings = (
      'Memo3')
    TabOrder = 6
    OnEnter = Memo3Enter
    OnExit = Memo3Exit
  end
  object Memo4: TMemo
    Left = 8
    Top = 424
    Width = 233
    Height = 81
    Lines.Strings = (
      'Memo4')
    ReadOnly = True
    TabOrder = 7
  end
  object Memo5: TMemo
    Left = 8
    Top = 536
    Width = 649
    Height = 73
    Lines.Strings = (
      'Welcome...'
      'This is shifter 2.1'
      '----------------------------------')
    TabOrder = 8
  end
end
