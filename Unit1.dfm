object Form1: TForm1
  Left = 0
  Top = 0
  Cursor = crHandPoint
  BorderStyle = bsSingle
  Caption = #1050#1086#1085#1074#1077#1088#1090#1072#1090#1086#1088' '#1074#1072#1083#1102#1090
  ClientHeight = 339
  ClientWidth = 377
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 39
    Width = 56
    Height = 23
    Caption = #1057#1091#1084#1084#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 89
    Width = 76
    Height = 23
    Caption = #1042#1072#1083#1102#1090#1072' 1:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 140
    Width = 76
    Height = 23
    Caption = #1042#1072#1083#1102#1090#1072' 2:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 258
    Width = 80
    Height = 23
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object ErrorLbl: TLabel
    Left = 98
    Top = 224
    Width = 4
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object InfoImgBtn: TImage
    Left = 344
    Top = 8
    Width = 25
    Height = 25
    Cursor = crHandPoint
    Hint = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
    ParentShowHint = False
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
      00180806000000E0773DF80000000473424954080808087C0864880000000970
      485973000000B1000000B101C62D498D0000001974455874536F667477617265
      007777772E696E6B73636170652E6F72679BEE3C1A0000024B4944415478DAAD
      954D888E5114C7CF934CC8C7C2CE3023266461C35A59080BE33363083B16627C
      962C64C142C60C628312A1C150988985922D2BE5B330CC4C584E269311C6EFDF
      3D4F3D4DCF73DFF7D57BEAD7737BEEB9F77FEEB9F79E9B58DCA6C366580C0B60
      2AFC853EE8816EB807FD45132405FF67C009D800634A04F11B2EC351F8528E40
      135C8289F00B3AE13E3CF7C825580B0B610DAC851A18F4D53E8809EC85366FDF
      813DB1E5BBD5C32958E7E96B81737902CD701D46601F9CB1CA6C379CF6F1ABD3
      95A4028AE2054CF1A8F3266F8047DE5E0EEF737C5A5CE43BCC83AFA9C015D8EA
      69595F10E17E68CDB4DB0AFC3A3D5D17608704EAE023FCF128FB0A06AAEFA1A7
      60057C88ECC93B0B8761669289EC868553500DBB69E188EF4C3C2AE574A37754
      C374D43BA05B02BD162ED66C4F55913DB570A3756CB77B604536CB53F8560243
      301EC6C170190232ED535DC47702FC80C1C427AD71919F652C7FC4BF49C46792
      85A33A24A74F1676BEC18A4F46A502BA036FA0574EBA3CCB2C6CCCAD2A096C81
      ABD025A70370D2C2AE37574920BD6C07E5A4CAD8E31D7333EDFF1598032FBDBF
      3E755291DB64F152518E80FEE9015AE929DA963A6915AF61B28582753622F0C4
      BF4B72FA0EC3710B6FC37CE8CF46A1ABDDE16DBD0B95946BCD73088E795B59B8
      9BB74C45DFEEFF952ED5A9CF252657CE5B3D2D4ADF2E389F551E6D5AC9454FD7
      B0E754D13C836F16AAA44ACB2258058D3016062C9490DBA3979667D32C3CFA4D
      3E38667AF4AFC111CB29F54989C1B5BEA2A5166EA78455BB54065EC1630B67BE
      E80DB17FAE7B84322ED2A9650000000049454E44AE426082}
    ShowHint = True
    OnClick = InfoImgBtnClick
  end
  object CurrencyName1: TComboBox
    Left = 97
    Top = 87
    Width = 272
    Height = 29
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object ConvertBtn: TButton
    Left = 120
    Top = 193
    Width = 137
    Height = 33
    Cursor = crHandPoint
    ParentCustomHint = False
    Align = alCustom
    Caption = #1050#1086#1085#1074#1077#1088#1090#1080#1088#1086#1074#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    OnClick = ConvertBtnClick
  end
  object CurrencyAmount: TEdit
    Left = 97
    Top = 37
    Width = 272
    Height = 29
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
  end
  object CurrencyName2: TComboBox
    Left = 97
    Top = 138
    Width = 272
    Height = 29
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    StyleElements = [seClient, seBorder]
  end
  object ConvertedCurrency: TEdit
    Left = 98
    Top = 256
    Width = 271
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object RESTClient: TRESTClient
    Params = <>
    SynchronizedEvents = False
    Left = 104
    Top = 288
  end
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Params = <>
    Response = RESTResponse
    SynchronizedEvents = False
    Left = 168
    Top = 288
  end
  object RESTResponse: TRESTResponse
    ContentType = 'application/json'
    ContentEncoding = 'UTF-8'
    Left = 32
    Top = 288
  end
end
