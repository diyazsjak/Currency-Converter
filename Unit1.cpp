//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
	this->RESTClient->BaseURL = "https://v6.exchangerate-api.com/v6/" + this->API_KEY;

	if (!FileExists("Currency-Codes.json")) {
		// fetch currencies into json file
		this->WriteCurrencyCodesFile();
	}

	// from json above load currency names to combo boxes
	this->LoadCurrencyCodesAndNames();

	this->CurrencyName1->ItemIndex = 0;
	this->CurrencyName2->ItemIndex = 0;
}
//---------------------------------------------------------------------------
void TForm1::WriteCurrencyCodesFile()
{
	/*
	* Fetch supported currencies' codes and names and write them to a json file.
	* Will be used for populating combo boxes.
	*/
	this->RESTRequest->Resource = "codes";
	this->RESTRequest->Execute();

	TJSONValue *Response = this->RESTResponse->JSONValue;

	if (Response->FindValue("result")->Value() == "success")
	{
		AnsiString Codes = Response->FindValue("supported_codes")->ToString();

		// Create and write into json file all fetched codes
		TStringStream *CurrencyCodesFile = new TStringStream();
        CurrencyCodesFile->WriteString(Codes);
		CurrencyCodesFile->SaveToFile("Currency-Codes.json");
		delete CurrencyCodesFile;
	}
	else
	{
		TJSONValue *Error = Response->FindValue("error-type");
		this->ErrorLbl->Caption = this->ErrorMessage(Error->Value());
	}

}
//---------------------------------------------------------------------------
void TForm1::LoadCurrencyCodesAndNames()
{
	/*
	* From Currency-Codes.json load currency codes and names to combo boxes.
	*/
	TStringStream *CurrencyCodesFile = new TStringStream;
	CurrencyCodesFile->LoadFromFile("Currency-Codes.json");

	TJSONValue *Codes = TJSONValue::ParseJSONValue(CurrencyCodesFile->DataString);
	delete CurrencyCodesFile;

	TJSONArray *CodesArray = (TJSONArray*)Codes;
	for (int i = 0; i < CodesArray->Count; i++)
	{
		TJSONArray *Code = (TJSONArray*)CodesArray->Items[i];

		AnsiString CurrencyCode = Code->Items[0]->Value();
		AnsiString CurrencyName = Code->Items[1]->Value();

		this->CurrencyName1->Items->Add(CurrencyCode + " - " + CurrencyName);
		this->CurrencyName2->Items->Add(CurrencyCode + " - " + CurrencyName);
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ConvertBtnClick(TObject *Sender)
{
	/*
	* Validate input for int/float number and replace , to .(if there is),
	* because of api format of currency amount. Then make a request with codes
    * from combo boxes(/code1/code2/amount) and display result.
	*/
	this->ErrorLbl->Caption = "";

	try {
        // validate input
		StrToFloat(this->CurrencyAmount->Text);
	}
	catch (EConvertError &Error) {
		this->ErrorLbl->Caption = "Неправильное число";
		return;
	}

    // decimal format of api is xxxx.xxxx
	AnsiString Amount = ReplaceStr(this->CurrencyAmount->Text, ",", ".");

	AnsiString CurrencyCode1 = this->CurrencyName1->Text.SubString(0, 3);
	AnsiString CurrencyCode2 = this->CurrencyName2->Text.SubString(0, 3);

	AnsiString Resource = "pair/" + CurrencyCode1 + "/" + CurrencyCode2 + "/" + Amount;

	this->RESTRequest->Resource = Resource;
	this->RESTRequest->Execute();

	TJSONValue *Response = this->RESTResponse->JSONValue;

	if (Response->FindValue("result")->Value() == "success")
	{
		TJSONValue *Result = Response->FindValue("conversion_result");
		this->ConvertedCurrency->Text = Result->Value();
	}
	else
	{
		TJSONValue *Error = Response->FindValue("error-type");
		this->ErrorLbl->Caption = this->ErrorMessage(Error->Value());
	}

}
//---------------------------------------------------------------------------
AnsiString TForm1::ErrorMessage(AnsiString ErrorType)
{
	/*
	* return some possible errors of api
	*/
	if (ErrorType == "unsupported-code") {
		return "Ошибка: Данная валюта не поддерживается";
	}
	else if (ErrorType == "quota-reached") {
		return "Ошибка: Достигнут лимит запросов(1500/мес)";
	}
	else {
		return "Ошибка: " + ErrorType;
	}
}
//---------------------------------------------------------------------------
void __fastcall TForm1::InfoImgBtnClick(TObject *Sender)
{
	/*
	* Fetch quota status of my API and display in ShowMessage how many requests
	* are left and on what day of month my requests will be updated.
	*/
	this->RESTRequest->Resource = "quota";
	this->RESTRequest->Execute();

	TJSONValue *Response = this->RESTResponse->JSONValue;

	AnsiString AboutApi =
		"Это приложение использует сервис www.exchangerate-api.com, "
		"который предоставляет информацию о валютах. Cервис предоставляет "
		"1500 запросов в месяц (бесплатный план).\n\n";

    if (Response->FindValue("result")->Value() == "success")
	{
		TJSONValue *Remaining = Response->FindValue("requests_remaining");
		TJSONValue *DayOfRefresh = Response->FindValue("refresh_day_of_month");

		ShowMessage(AboutApi + "Осталось запросов: " + Remaining->Value() + ".\n" +
					"День обновления запросов: " + DayOfRefresh->Value() + ".");
	}
	else
	{
		TJSONValue *Error = Response->FindValue("error-type");
		ShowMessage(AboutApi + Error->Value());
    }
}
//---------------------------------------------------------------------------

