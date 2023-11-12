object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = #1055#1088#1086#1076#1074#1080#1085#1091#1090#1099#1081' '#1082#1072#1083#1100#1082#1091#1083#1103#1090#1086#1088
  ClientHeight = 430
  ClientWidth = 377
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object RemainingRequestsLbl: TLabel
    Left = 8
    Top = 379
    Width = 141
    Height = 20
    Caption = #1054#1089#1090#1072#1083#1086#1089#1100' '#1079#1072#1087#1088#1086#1089#1086#1074': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object DayOfRefreshlbl: TLabel
    Left = 8
    Top = 402
    Width = 283
    Height = 20
    Caption = #1044#1077#1085#1100' '#1084#1077#1089#1103#1094#1072', '#1082#1086#1075#1076#1072' '#1086#1073#1085#1086#1074#1103#1090#1089#1103' '#1079#1072#1087#1088#1086#1089#1099': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 23
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
    Top = 73
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
    Top = 124
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
    Top = 242
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
    Top = 208
    Width = 4
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object CurrencyName1: TComboBox
    Left = 97
    Top = 71
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
    Top = 177
    Width = 137
    Height = 33
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
    Top = 21
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
    Top = 122
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
    Top = 240
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
    Top = 280
  end
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Params = <>
    Response = RESTResponse
    SynchronizedEvents = False
    Left = 168
    Top = 280
  end
  object RESTResponse: TRESTResponse
    ContentType = 'application/json'
    ContentEncoding = 'UTF-8'
    Left = 32
    Top = 280
  end
end
