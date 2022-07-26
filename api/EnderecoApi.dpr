program EnderecoApi;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.CORS,
  Horse.Jhonson,
  Horse.GBSwagger,
  Api.Controller.Endereco in 'controllers\Api.Controller.Endereco.pas';

procedure CriarSwagger;
begin
  Swagger
    .Info
      .Title('Enderešo API')
      .Description('API para pesquisas de enderešos')
    .&End
    .BasePath('v1')
    .AddProtocol(TGBSwaggerProtocol.gbHttp);
end;

begin
  THorse
    .Use(CORS)
    .Use(Jhonson('UTF-8'))
    .Use(HorseSwagger);

  CriarSwagger;

  EnderecoRegistry;

  THorse.Listen(9000);
end.
