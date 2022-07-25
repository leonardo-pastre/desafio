unit CEP;

interface

uses
  Endereco;

type
  TCEP = class
  private
    function ConsultaDadosAPI(ACEP: string): string;
    function ValidarCEP(ACEP: string): Boolean;
    function TemApenasNumeros(ADado: string): Boolean;
  public
    function ConsultarCEP(ACEP: string): TEndereco;
  end;

const
  NUMERO_DIGITOS_CEP = 8;

implementation

uses
  System.JSON, System.SysUtils, Rest.Client, REST.Types;

{ TCEP }

function TCEP.ConsultaDadosAPI(ACEP: string): string;
var
  LRESTClient: TRESTClient;
  LRESTRequest: TRESTRequest;
begin
  Result := '';

  LRESTClient := TRESTClient.Create(nil);
  LRESTRequest := TRESTRequest.Create(nil);

  try
    LRESTClient.BaseURL := 'http://localhost:9000/';

    LRESTRequest.Method := rmGET;
    LRESTRequest.Client := LRESTClient;
    LRESTRequest.Resource := 'v1/endereco/{cep}';
    LRESTRequest.Response := TRESTResponse.Create(nil);
    LRESTRequest.Params.AddUrlSegment('cep', ACEP);
    LRESTRequest.Execute;

    if LRESTRequest.Response.StatusCode = 200 then
    begin
      Result := LRESTRequest.Response.JSONText;
    end;
  finally
    FreeAndNil(LRESTClient);
    FreeAndNil(LRESTRequest);
  end;
end;

function TCEP.ConsultarCEP(ACEP: string): TEndereco;
var
  JSONDados: string;
  LJSONEndereco: TJSONObject;
  LEndereco: TEndereco;
begin
  if not ValidarCEP(ACEP) then
  begin
    raise Exception.Create('CEP inválido');
  end;

  JSONDados := ConsultaDadosAPI(ACEP);

  if JSONDados = '' then
  begin
    Result := nil;
    Exit;
  end;

  try
    LJSONEndereco := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(JSONDados), 0) as TJSONObject;

    LEndereco := TEndereco.Create;

    LEndereco.CEP := LJSONEndereco.GetValue<string>('cep');
    LEndereco.Logradouro := LJSONEndereco.GetValue<string>('logradouro');
    LEndereco.Complemento := LJSONEndereco.GetValue<string>('complemento');
    LEndereco.Bairro := LJSONEndereco.GetValue<string>('bairro');
    LEndereco.Cidade := LJSONEndereco.GetValue<string>('cidade');
    LEndereco.UF := LJSONEndereco.GetValue<string>('uf');

    Result := LEndereco;
  finally
    if Assigned(LJSONEndereco) then
    begin
      LJSONEndereco.DisposeOf;
    end;
  end;
end;

function TCEP.TemApenasNumeros(ADado: string): Boolean;
var
  I: Integer;
begin
  Result := True;

  for I := Low(ADado) to High(ADado) do
  begin
    if not CharInSet(ADado[I], ['0'..'9']) then
    begin
      Result := False;
      Break;
    end;
  end;
end;

function TCEP.ValidarCEP(ACEP: string): Boolean;
begin
  Result := (Trim(ACEP) <> '') and
            (Length(ACEP) = NUMERO_DIGITOS_CEP) and
            TemApenasNumeros(ACEP);
end;

end.
