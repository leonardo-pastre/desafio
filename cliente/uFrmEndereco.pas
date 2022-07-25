unit uFrmEndereco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Endereco, CEP;

type
  TFrmEndereco = class(TForm)
    EdtCEP: TEdit;
    LblCEP: TLabel;
    EdtLogradouro: TEdit;
    LblLogradouro: TLabel;
    EdtComplemento: TEdit;
    LblComplemento: TLabel;
    EdtBairro: TEdit;
    LblBairro: TLabel;
    EdtCidade: TEdit;
    LblCidade: TLabel;
    EdtUF: TEdit;
    LblUF: TLabel;
    BtnPesquisarCEP: TButton;
    BtnLimpar: TButton;
    procedure BtnPesquisarCEPClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure EdtCEPKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    function PesquisarCEP(ACEP: string): TEndereco;
    procedure PreencherCampos(AEndereco: TEndereco);
  public

  end;

var
  FrmEndereco: TFrmEndereco;

implementation

{$R *.dfm}

{ TFrmEndereco }

procedure TFrmEndereco.BtnLimparClick(Sender: TObject);
begin
  EdtCEP.Clear;
  EdtLogradouro.Clear;
  EdtComplemento.Clear;
  EdtBairro.Clear;
  EdtCidade.Clear;
  EdtUF.Clear;
  EdtCEP.SetFocus;
end;

procedure TFrmEndereco.BtnPesquisarCEPClick(Sender: TObject);
var
  LEndereco: TEndereco;
begin
  try
    LEndereco := PesquisarCEP(EdtCEP.Text);

    if Assigned(LEndereco) then
    begin
      PreencherCampos(LEndereco);
    end else begin
      ShowMessage('Endereço não localizado! Favor preencher os dados manualmente.');
    end;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TFrmEndereco.EdtCEPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    BtnPesquisarCEP.Click;
  end;
end;

function TFrmEndereco.PesquisarCEP(ACEP: string): TEndereco;
var
  LCEP: TCEP;
begin
  Result := nil;
  LCEP := TCEP.Create;

  try
    Result := LCEP.ConsultarCEP(ACEP);
  finally
    FreeAndNil(LCEP);
  end;
end;

procedure TFrmEndereco.PreencherCampos(AEndereco: TEndereco);
begin
  if Assigned(AEndereco) then
  begin
    EdtLogradouro.Text := AEndereco.Logradouro;
    EdtComplemento.Text := AEndereco.Complemento;
    EdtBairro.Text := AEndereco.Bairro;
    EdtCidade.Text := AEndereco.Cidade;
    EdtUF.Text := AEndereco.UF;
  end;
end;

end.
