object FrmEndereco: TFrmEndereco
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Endere'#231'os'
  ClientHeight = 247
  ClientWidth = 412
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 14
  object LblCEP: TLabel
    Left = 16
    Top = 24
    Width = 25
    Height = 14
    Caption = 'CEP'
  end
  object LblLogradouro: TLabel
    Left = 16
    Top = 64
    Width = 73
    Height = 14
    Caption = 'Logradouro'
  end
  object LblComplemento: TLabel
    Left = 16
    Top = 104
    Width = 87
    Height = 14
    Caption = 'Complemento'
  end
  object LblBairro: TLabel
    Left = 16
    Top = 144
    Width = 37
    Height = 14
    Caption = 'Bairro'
  end
  object LblCidade: TLabel
    Left = 16
    Top = 184
    Width = 44
    Height = 14
    Caption = 'Cidade'
  end
  object LblUF: TLabel
    Left = 318
    Top = 184
    Width = 16
    Height = 14
    Caption = 'UF'
  end
  object EdtCEP: TEdit
    Left = 16
    Top = 40
    Width = 121
    Height = 20
    Ctl3D = False
    ParentCtl3D = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    OnKeyDown = EdtCEPKeyDown
  end
  object EdtLogradouro: TEdit
    Left = 16
    Top = 80
    Width = 375
    Height = 20
    Ctl3D = False
    ParentCtl3D = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
  end
  object EdtComplemento: TEdit
    Left = 16
    Top = 120
    Width = 375
    Height = 20
    Ctl3D = False
    ParentCtl3D = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 4
  end
  object EdtBairro: TEdit
    Left = 16
    Top = 160
    Width = 375
    Height = 20
    Ctl3D = False
    ParentCtl3D = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 5
  end
  object EdtCidade: TEdit
    Left = 16
    Top = 200
    Width = 291
    Height = 20
    Ctl3D = False
    ParentCtl3D = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 6
  end
  object EdtUF: TEdit
    Left = 318
    Top = 200
    Width = 73
    Height = 20
    Ctl3D = False
    ParentCtl3D = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 7
  end
  object BtnPesquisarCEP: TButton
    Left = 158
    Top = 37
    Width = 114
    Height = 25
    Caption = 'Pesquisar CEP'
    TabOrder = 1
    OnClick = BtnPesquisarCEPClick
  end
  object BtnLimpar: TButton
    Left = 277
    Top = 37
    Width = 114
    Height = 25
    Caption = 'Limpar Dados'
    TabOrder = 2
    OnClick = BtnLimparClick
  end
end
