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

	// display how many requests left and day of request refresh
	//this->DisplayQuotaInfo();

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
void TForm1::DisplayQuotaInfo()
{
	/*
	* Fetch quota status of my API and display how many requests left and what
	* day of month will my requests refresh.
	*/
	this->RESTRequest->Resource = "quota";
	this->RESTRequest->Execute();

	TJSONValue *Response = this->RESTResponse->JSONValue;

    if (Response->FindValue("result")->Value() == "success")
	{
		TJSONValue *Remaining = Response->FindValue("requests_remaining");
		TJSONValue *DayOfRefresh = Response->FindValue("refresh_day_of_month");

		this->RemainingRequestsLbl->Caption += Remaining->Value();
		this->DayOfRefreshlbl->Caption += DayOfRefresh->Value();
    }
	else
	{
		TJSONValue *Error = Response->FindValue("error-type");
		this->ErrorLbl->Caption = this->ErrorMessage(Error->Value());
	}
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
