unit ClasseBaseTest;

interface

uses TestFramework, ModelU, SysUtils;

type

  TClasseBaseTest = class(TTestCase)
  protected
    FClasseBase: TClasseBase;
    procedure SetUp; override;
    procedure TearDown; override;
  published
    [test]
    procedure testValorDefaultId;
  end;

implementation

{ TClasseBaseTest }

procedure TClasseBaseTest.SetUp;
begin
  inherited;
  FClasseBase := TClasseBase.Create
end;

procedure TClasseBaseTest.TearDown;
begin
  inherited;
  FreeAndNil(FClasseBase);
end;

procedure TClasseBaseTest.testValorDefaultId;
begin
  Check(FClasseBase.Id = 0,'Id deveria ser 0');
end;

initialization
  RegisterTest('Modelo/Entidades/TClasseBase', TClasseBaseTest.Suite);


end.
