object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 528
  ClientWidth = 872
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Img_fond: TImage
    Left = -8
    Top = -8
    Width = 888
    Height = 545
    Stretch = True
  end
  object L_mot: TLabel
    Left = 256
    Top = 136
    Width = 81
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = 'Votre mot'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Gill Sans Ultra Bold'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Img_bulls: TImage
    Left = 72
    Top = 171
    Width = 150
    Height = 150
    Stretch = True
  end
  object Img_cows: TImage
    Left = 672
    Top = 171
    Width = 150
    Height = 150
    Stretch = True
  end
  object L_score_cows: TLabel
    Left = 720
    Top = 336
    Width = 57
    Height = 57
    Alignment = taCenter
    AutoSize = False
    Caption = '0'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Goudy Stout'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object L_score_bulls: TLabel
    Left = 112
    Top = 336
    Width = 57
    Height = 57
    Alignment = taCenter
    AutoSize = False
    Caption = '0'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Goudy Stout'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object L_nb_car_mot: TLabel
    Left = 495
    Top = 179
    Width = 81
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Gill Sans Ultra Bold'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object L_fin: TLabel
    Left = 384
    Top = 270
    Width = 121
    Height = 43
    Alignment = taCenter
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Goudy Stout'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object L_nb_essais: TLabel
    Left = 249
    Top = 214
    Width = 224
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = 'Nombre d'#39'essais restant :'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Gill Sans Ultra Bold'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object L_nb_car: TLabel
    Left = 249
    Top = 179
    Width = 224
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = 'Nombre de caract'#232'res du mot  :'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Gill Sans Ultra Bold'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object L_nb_essais_mot: TLabel
    Left = 495
    Top = 214
    Width = 81
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Gill Sans Ultra Bold'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Img_score: TImage
    Left = 37
    Top = -8
    Width = 233
    Height = 126
    Stretch = True
  end
  object L_score: TLabel
    Left = 93
    Top = 61
    Width = 121
    Height = 49
    Alignment = taCenter
    AutoSize = False
    Caption = '0'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Goudy Stout'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object B_Quitter: TButton
    Left = 767
    Top = 8
    Width = 97
    Height = 49
    Caption = 'QUITTER'
    TabOrder = 0
    OnClick = B_QuitterClick
  end
  object M_liste: TMemo
    Left = 37
    Top = 416
    Width = 185
    Height = 89
    Lines.Strings = (
      'M_liste')
    TabOrder = 1
    Visible = False
  end
  object E_mot: TEdit
    Left = 384
    Top = 135
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object B_GO: TButton
    Left = 416
    Top = 368
    Width = 75
    Height = 25
    Caption = 'GO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = B_GOClick
  end
  object B_Tester: TButton
    Left = 536
    Top = 109
    Width = 75
    Height = 25
    Caption = 'Tester'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    Visible = False
    OnClick = B_TesterClick
  end
end
