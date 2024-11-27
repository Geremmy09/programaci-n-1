program BingoGame;

uses
  SysUtils, Math;

const
  numerodebingo = 75;
  cartaporjugador = 1;
  Marcador = -1;

type
  TBingotarjeta = array[1..5, 1..5] of Integer;

var
  Bingotarjeta: TBingotarjeta;
  DrawnNumbers: array[1..numerodebingo] of Boolean;
  RandomNumber, i, j: Integer;
  result: Boolean;

procedure InitializeBingotarjeta(var Card: TBingotarjeta);
var
  NumberSet: array[1..numerodebingo] of Integer;
  ColStart: Integer;
begin
  Randomize;

  for i := 1 to numerodebingo do
    NumberSet[i] := i;

  for j := 1 to 5 do
  begin
    ColStart := (j - 1) * 15 + 1;
    for i := 1 to 5 do
    begin
      if (j = 3) and (i = 3) then
        Card[i, j] := 0 // 0 para espacio libre
      else
      begin
        repeat
          RandomNumber := Random(15) + ColStart;
        until (NumberSet[RandomNumber] <> 0);

        Card[i, j] := RandomNumber;
        NumberSet[RandomNumber] := 0;
      end;
    end;
  end;
end;

procedure DrawRandomNumber(var Number: Integer);
begin
  repeat
    Number := Random(numerodebingo) + 1;
  until not DrawnNumbers[Number];
  DrawnNumbers[Number] := True;
end;

procedure MarkCard(var Card: TBingotarjeta; Number: Integer);
begin
  for i := 1 to 5 do
    for j := 1 to 5 do
      if Card[i, j] = Number then
        Card[i, j] := Marcador;
end;

function CheckWinner(Card: TBingotarjeta): Boolean;
var
  i, j: Integer;
begin
  // Comprobar filas
  for i := 1 to 5 do
  begin
    if (Card[i, 1] = Marcador) and (Card[i, 2] = Marcador) and
       (Card[i, 3] = Marcador) and (Card[i, 4] = Marcador) and
       (Card[i, 5] = Marcador) then
      Exit(True);
  end;

  // Comprobar columnas
  for j := 1 to 5 do
  begin
    if (Card[1, j] = Marcador) and (Card[2, j] = Marcador) and
       (Card[3, j] = Marcador) and (Card[4, j] = Marcador) and
       (Card[5, j] = Marcador) then
      Exit(True);
  end;

  // Comprobar diagonales
  if (Card[1, 1] = Marcador) and (Card[2, 2] = Marcador) and
     (Card[3, 3] = Marcador) and (Card[4, 4] = Marcador) and
     (Card[5, 5] = Marcador) then
    Exit(True);

  if (Card[1, 5] = Marcador) and (Card[2, 4] = Marcador) and
     (Card[3, 3] = Marcador) and (Card[4, 2] = Marcador) and
     (Card[5, 1] = Marcador) then
    Exit(True);

  Result := False;
end;

begin
  InitializeBingotarjeta(Bingotarjeta);

  // Mostrar la tarjeta de Bingo
  Writeln('tu tarjeta de bingo:');
  for i := 1 to 5 do
  begin
    for j := 1 to 5 do
    begin
      if Bingotarjeta[i, j] = Marcador then
        Write(' X ')
      else if Bingotarjeta[i, j] = 0 then
        Write(' * ')
      else
        Write(Format(' %2d ', [Bingotarjeta[i, j]]));
    end;
    Writeln;
  end;

  repeat
    DrawRandomNumber(RandomNumber);
    Writeln('numero sorteado: ', RandomNumber);
    MarkCard(Bingotarjeta, RandomNumber);

    if CheckWinner(Bingotarjeta) then
    begin
      Writeln('Bingo!');
      Break;
    end;

    Sleep(1000); // Pausa un momento
  until False;

end.
