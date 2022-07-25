program EnderecoApp;

uses
  Vcl.Forms,
  uFrmEndereco in 'uFrmEndereco.pas' {FrmEndereco},
  CEP in 'CEP.pas',
  Endereco in 'Endereco.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmEndereco, FrmEndereco);
  Application.Run;
end.
