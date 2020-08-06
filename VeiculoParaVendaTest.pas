unit VeiculoParaVendaTest;

interface

uses TestFramework, ModelU, SysUtils;

type
  TVeiculoParaVendaTest = class(TTestCase)
  protected
    FVeiculo: TVeiculoParaVenda;
    procedure SetUp; override;
    procedure TearDown; override;
  published
    [test]
    procedure testValorVendaSugerido;
  end;


implementation

{ TVendaTest }

procedure TVeiculoParaVendaTest.SetUp;
begin
  inherited;
  FVeiculo := TVeiculoParaVenda.Create;
end;

procedure TVeiculoParaVendaTest.TearDown;
begin
  inherited;
  FreeAndNil(FVeiculo);
end;

procedure TVeiculoParaVendaTest.testValorVendaSugerido;
var
 lDespesa1, lDespesa2: TDespesa;
begin
  FVeiculo.ValorEsperadoVenda := 10000;
  FVeiculo.LucroEstimado := 1000;

  lDespesa1 := TDespesa.Create;
  lDespesa1.Descricao := 'despesa 1';
  lDespesa1.Valor := 50;

  lDespesa2 := TDespesa.Create;
  lDespesa2.Descricao := 'despesa 2';
  lDespesa2.Valor := 100;

  FVeiculo.AddDespesa(lDespesa1);
  FVeiculo.AddDespesa(lDespesa2);

  check(FVeiculo.ValorSugeridoVenda = 11150, 'O valor deveria ser R$ 11.150,00');
end;

initialization
  RegisterTest('Modelo/Entidades/TVeiculoParaVenda',  TVeiculoParaVendaTest.Suite);
end.
