//---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H
#include <Data.Bind.Components.hpp>
#include <Data.Bind.ObjectScope.hpp>
#include <REST.Client.hpp>
#include <REST.Types.hpp>
#include <System.Classes.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Dialogs.hpp>
#include <Vcl.ExtDlgs.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Imaging.pngimage.hpp>

#include <unordered_map>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TRESTClient *RESTClient;
	TRESTRequest *RESTRequest;
	TRESTResponse *RESTResponse;
	TComboBox *CurrencyName1;
	TButton *ConvertBtn;
	TEdit *CurrencyAmount;
	TComboBox *CurrencyName2;
	TLabel *Label1;
	TLabel *Label2;
	TLabel *Label3;
	TEdit *ConvertedCurrency;
	TLabel *Label4;
	TLabel *ErrorLbl;
	TImage *InfoImgBtn;
	void __fastcall ConvertBtnClick(TObject *Sender);
	void __fastcall InfoImgBtnClick(TObject *Sender);
private:
	// https://app.exchangerate-api.com
	const AnsiString API_KEY = "df440d89b3575cc5a09969fd";

	void WriteCurrencyCodesFile();
	void LoadCurrencyCodesAndNames();
    AnsiString ErrorMessage(AnsiString ErrorType);
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
