unit ModelU;

interface

uses Classes, SysUtils, Contnrs;

type
  TPath = string;

  TVeiculoBase = class;
  TDespesa = class;
  TCor = class;
  TCidade = class;
  TMarca = class;
  TModelo = class;
  TAcessorio = class;
  TEndereco = class;
  TCliente = class;
  TVeiculoProcurado = class;
  TVeiculoParaVenda = class;
  TVenda = class;

  TClasseBase = class(TObject)
  private
    FId: Integer;
    procedure SetId(const Value: Integer);
  public
    procedure AfterConstruction; override;
    property Id: Integer read FId write SetId;
  end;

  TVeiculoBase = class(TClasseBase)
  private
    FAcessorios: TObjectList;
    FAnoFabricacao: Integer;
    FAnoModelo: Integer;
    FCombustivel: Integer;
    FCor: TCor;
    FModelo: TModelo;
    FNroPortas: Integer;
    procedure SetAnoFabricacao(const Value: Integer);
    procedure SetAnoModelo(const Value: Integer);
    procedure SetCombustivel(const Value: Integer);
    procedure SetCor(const Value: TCor);
    procedure SetModelo(const Value: TModelo);
    procedure SetNroPortas(const Value: Integer);
  public
    constructor Create; reintroduce;
    destructor Destroy; override;
    procedure AddAcessorio(acessorio: TAcessorio);
    procedure RemoveAcessorio(acessorio: TAcessorio);
    property Acessorios: TObjectList read FAcessorios write FAcessorios;
    property AnoFabricacao: Integer read FAnoFabricacao write SetAnoFabricacao;
    property AnoModelo: Integer read FAnoModelo write SetAnoModelo;
    property Combustivel: Integer read FCombustivel write SetCombustivel;
    property Cor: TCor read FCor write SetCor;
    property Modelo: TModelo read FModelo write SetModelo;
    property NroPortas: Integer read FNroPortas write SetNroPortas;
  end;

  TDespesa = class(TClasseBase)
  private
    FDescricao: string;
    FTipo: Integer;
    FValor: Currency;
  public
    property Descricao: string read FDescricao write FDescricao;
    property Tipo: Integer read FTipo write FTipo;
    property Valor: Currency read FValor write FValor;
  end;

  TCor = class(TClasseBase)
  private
    FNome: string;
    procedure SetNome(const Value: string);
  public
    property Nome: string read FNome write SetNome;
  end;

  TCidade = class(TClasseBase)
  private
    FNome: string;
    FUF: string;
    procedure SetNome(const Value: string);
    procedure SetUF(const Value: string);
  public
    property Nome: string read FNome write SetNome;
    property UF: string read FUF write SetUF;
  end;

  TMarca = class(TClasseBase)
  private
    FLogotipo: TPath;
    FNome: string;
    procedure SetLogotipo(const Value: TPath);
    procedure SetNome(const Value: string);
  public
    property Logotipo: TPath read FLogotipo write SetLogotipo;
    property Nome: string read FNome write SetNome;
  end;

  TModelo = class(TClasseBase)
  private
    FMarca: TMarca;
    FNome: string;
    procedure SetMarca(const Value: TMarca);
    procedure SetNome(const Value: string);
  public
    property Marca: TMarca read FMarca write SetMarca;
    property Nome: string read FNome write SetNome;
  end;

  TAcessorio = class(TClasseBase)
  private
    FNome: string;
    procedure SetNome(const Value: string);
  public
    property Nome: string read FNome write SetNome;
  end;


  TEndereco = class(TObject)
  private
    FBairro: string;
    FCEP: string;
    FCidade: TCidade;
    FLogradouro: string;
    FNumero: string;
    procedure SetBairro(const Value: string);
    procedure SetCEP(const Value: string);
    procedure SetCidade(const Value: TCidade);
    procedure SetLogradouro(const Value: string);
    procedure SetNumero(const Value: string);
  public
    property Bairro: string read FBairro write SetBairro;
    property CEP: string read FCEP write SetCEP;
    property Cidade: TCidade read FCidade write SetCidade;
    property Logradouro: string read FLogradouro write SetLogradouro;
    property Numero: string read FNumero write SetNumero;
  end;

  TCliente = class(TClasseBase)
  private
    FCelular: string;
    FCPF: string;
    FDataCadastro: TDateTime;
    FEndereco: TEndereco;
    FNome: string;
    FRG: string;
    FTelefone: string;
    FVeiculosProcurados: TObjectList;
    procedure SetCelular(const Value: string);
    procedure SetCPF(const Value: string);
    procedure SetDataCadastro(const Value: TDateTime);
    procedure SetEndereco(const Value: TEndereco);
    procedure SetNome(const Value: string);
    procedure SetRG(const Value: string);
    procedure SetTelefone(const Value: string);
    procedure SetVeiculosProcurados(const Value: TObjectList);
  public
    constructor Create; reintroduce;
    destructor Destroy; override;
    procedure AddVeiculoProcurado(veiculo: TVeiculoProcurado);
    procedure RemoveVeiculoProcurado(veiculo: TVeiculoProcurado);
    property Celular: string read FCelular write SetCelular;
    property CPF: string read FCPF write SetCPF;
    property DataCadastro: TDateTime read FDataCadastro write SetDataCadastro;
    property Endereco: TEndereco read FEndereco write SetEndereco;
    property Nome: string read FNome write SetNome;
    property RG: string read FRG write SetRG;
    property Telefone: string read FTelefone write SetTelefone;
    property VeiculosProcurados: TObjectList read FVeiculosProcurados write
        SetVeiculosProcurados;
  end;

  TVeiculoProcurado = class(TVeiculoBase)
  private
    FCliente: TCliente;
    FDataEntrada: TDateTime;
    FValorMaximo: Currency;
    procedure SetValorMaximo(const Value: Currency);
  public
    property Cliente: TCliente read FCliente write FCliente;
    property DataEntrada: TDateTime read FDataEntrada write FDataEntrada;
    property ValorMaximo: Currency read FValorMaximo write SetValorMaximo;
  end;

  TVeiculoParaVenda = class(TVeiculoBase)
  private
    FDespesas: TObjectList;
    FLucroEstimado: Currency;
    FPlaca: string;
    FProprietario: TCliente;
    FValorEsperadoVenda: Currency;
    FValorRealVenda: Currency;
    FVendido: Boolean;
    function GetValorSugeridoVenda: Currency;
  public
    constructor Create; reintroduce;
    destructor Destroy; override;
    procedure AddDespesa(despesa: TDespesa);
    procedure RemoveDespesa(despesa: TDespesa);
    property Despesas: TObjectList read FDespesas write FDespesas;
    property LucroEstimado: Currency read FLucroEstimado write FLucroEstimado;
    property Placa: string read FPlaca write FPlaca;
    property Proprietario: TCliente read FProprietario write FProprietario;
    property ValorEsperadoVenda: Currency read FValorEsperadoVenda write
        FValorEsperadoVenda;
    property ValorRealVenda: Currency read FValorRealVenda write
        FValorRealVenda;
    property ValorSugeridoVenda: Currency read GetValorSugeridoVenda;
    property Vendido: Boolean read FVendido write FVendido;
  end;

  TVenda = class(TClasseBase)
  private
    FComprador: TCliente;
    FData: TDateTime;
    FValorVenda: Currency;
    FVeiculo: TVeiculoParaVenda;
    FVendedor: TCliente;
  public
    property Comprador: TCliente read FComprador write FComprador;
    property Data: TDateTime read FData write FData;
    property ValorVenda: Currency read FValorVenda write FValorVenda;
    property Veiculo: TVeiculoParaVenda read FVeiculo write FVeiculo;
    property Vendedor: TCliente read FVendedor write FVendedor;
  end;



implementation

{ TMarca }


{
************************************* TCor *************************************
}
procedure TCor.SetNome(const Value: string);
begin
  FNome := Value;
end;

{ TModelo }


{
*********************************** TCidade ************************************
}
procedure TCidade.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TCidade.SetUF(const Value: string);
begin
  FUF := Value;
end;

{ TAcessorio }


{
************************************ TMarca ************************************
}
procedure TMarca.SetLogotipo(const Value: TPath);
begin
  FLogotipo := Value;
end;

procedure TMarca.SetNome(const Value: string);
begin
  FNome := Value;
end;

{ TCidade }


{ TEndereco }

{
********************************** TEndereco ***********************************
}
procedure TEndereco.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TEndereco.SetCEP(const Value: string);
begin
  FCEP := Value;
end;

procedure TEndereco.SetCidade(const Value: TCidade);
begin
  FCidade := Value;
end;

procedure TEndereco.SetLogradouro(const Value: string);
begin
  FLogradouro := Value;
end;

procedure TEndereco.SetNumero(const Value: string);
begin
  FNumero := Value;
end;

{ TCliente }

{
*********************************** TCliente ***********************************
}
constructor TCliente.Create;
begin
  inherited Create;
  FVeiculosProcurados := TObjectList.Create;
end;

destructor TCliente.Destroy;
begin
  FreeAndNil(FVeiculosProcurados);
  inherited;
end;

procedure TCliente.AddVeiculoProcurado(veiculo: TVeiculoProcurado);
begin
  FVeiculosProcurados.Add(veiculo);
end;

procedure TCliente.RemoveVeiculoProcurado(veiculo: TVeiculoProcurado);
begin
  FVeiculosProcurados.Remove(veiculo);
end;

procedure TCliente.SetCelular(const Value: string);
begin
  FCelular := Value;
end;

procedure TCliente.SetCPF(const Value: string);
begin
  FCPF := Value;
end;

procedure TCliente.SetDataCadastro(const Value: TDateTime);
begin
  FDataCadastro := Value;
end;

procedure TCliente.SetEndereco(const Value: TEndereco);
begin
  FEndereco := Value;
end;

procedure TCliente.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TCliente.SetRG(const Value: string);
begin
  FRG := Value;
end;

procedure TCliente.SetTelefone(const Value: string);
begin
  FTelefone := Value;
end;

procedure TCliente.SetVeiculosProcurados(const Value: TObjectList);
begin
  FVeiculosProcurados := Value;
end;

{
****************************** TVeiculoProcurado *******************************
}
procedure TVeiculoProcurado.SetValorMaximo(const Value: Currency);
begin
  FValorMaximo := Value;
end;

{
****************************** TVeiculoParaVenda *******************************
}
constructor TVeiculoParaVenda.Create;
begin
  inherited Create;
  FDespesas := TObjectList.Create;
end;

destructor TVeiculoParaVenda.Destroy;
begin
  FreeAndNil(FDespesas);
  inherited Destroy;
end;

procedure TVeiculoParaVenda.AddDespesa(despesa: TDespesa);
begin
  FDespesas.Add(despesa);
end;

function TVeiculoParaVenda.GetValorSugeridoVenda: Currency;
var
  x: Integer;
  TotalDespesas: Currency;
begin
  TotalDespesas:= 0;
  for x := 0 to FDespesas.Count - 1 do
  begin
    TotalDespesas := TotalDespesas + TDespesa(FDespesas[x]).Valor;
  end;
  result := (self.ValorEsperadoVenda + self.LucroEstimado) + TotalDespesas;
end;

procedure TVeiculoParaVenda.RemoveDespesa(despesa: TDespesa);
begin
  FDespesas.Remove(despesa);
end;

{ TConjuge }

{ TVeiculoBase }

{
*********************************** TModelo ************************************
}
procedure TModelo.SetMarca(const Value: TMarca);
begin
  FMarca := Value;
end;

procedure TModelo.SetNome(const Value: string);
begin
  FNome := Value;
end;

{ TCor }

{
********************************* TVeiculoBase *********************************
}
constructor TVeiculoBase.Create;
begin
  inherited Create;
  FAcessorios := TObjectList.Create;
end;

destructor TVeiculoBase.Destroy;
begin
  FreeAndNil(FAcessorios);
  inherited;
end;

procedure TVeiculoBase.AddAcessorio(acessorio: TAcessorio);
begin
  Acessorios.Add(acessorio);
end;

procedure TVeiculoBase.RemoveAcessorio(acessorio: TAcessorio);
begin
  Acessorios.Remove(acessorio);
end;

procedure TVeiculoBase.SetAnoFabricacao(const Value: Integer);
begin
  FAnoFabricacao := Value;
end;

procedure TVeiculoBase.SetAnoModelo(const Value: Integer);
begin
  FAnoModelo := Value;
end;

procedure TVeiculoBase.SetCombustivel(const Value: Integer);
begin
  FCombustivel := Value;
end;

procedure TVeiculoBase.SetCor(const Value: TCor);
begin
  FCor := Value;
end;

procedure TVeiculoBase.SetModelo(const Value: TModelo);
begin
  FModelo := Value;
end;

procedure TVeiculoBase.SetNroPortas(const Value: Integer);
begin
  FNroPortas := Value;
end;

{ TVeiculoProcurado }

{
********************************** TAcessorio **********************************
}
procedure TAcessorio.SetNome(const Value: string);
begin
  FNome := Value;
end;


{ TClasseBase }

{
********************************* TClasseBase **********************************
}
procedure TClasseBase.AfterConstruction;
begin
  FId := 0;
end;

procedure TClasseBase.SetId(const Value: Integer);
begin
  FId := Value;
end;

end.
