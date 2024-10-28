program Boletos_teleferico;
uses crt;
{declaracion de variables publicas}
var var_tramo, var_estacion: integer;
var total_ventas :real;
var Nombre, Apellido : string;
var estacion, Cantidad_boleto_general, Cantidad_boleto_3eraedad: integer;
var cedula: real;
var Cantidad_boleto_ninos, Cantidad_boleto_menores, acumulador_temporal: integer;
Var edad : integer;
var total_pagar : real;
var total_boletos, total_boletos_vendidos, boletos_disponible_viaje: integer;
var boletos_general_vendidos, boletos_3eraeda_vendidos, boletos_ninos_vendidos : integer;
var boletos_menores_vendidos : integer;
{declaracion de constantes publicas}
const
precio_boleto_general = 20;
precio_boleto_3eraedad = 12;
precio_boleto_ninos = 12;
cantidad_maxima = 60;
{procedimiento para seleccionar estacion}
procedure estacion_;
begin
writeln ('Seleccione una estación');
     writeln('     1.- Barinitas ');
     writeln('     2.- La Montaña ');
     writeln('     3.- La Aguada ');
     writeln('     4.- Loma Redonda ');
     writeln('     5.- Pico Espejo ');
     write('Opcion estacion: ');
readln (var_estacion);
end;
{procedimiento para seleccionar tramo}
procedure tramo_;

begin
writeln ('Seleccione un Tramo');
     writeln('     1.- Barinitas - La Montaña ');
     writeln('     2.- La Montaña - La Aguada ');
     writeln('     3.- La Aguada - Loma Redonda ');
     writeln('     4.- Loma Redonda - Pico Espejo ');
     write('Opcion Tramo: ');
readln (var_tramo);

end;
{procedimiento para seleccionar cantidad de boletos por tipos}
procedure cantidades;
begin
write ('Cantidad de Boletos Generales: ');
            readln (Cantidad_boleto_general);
            write ('Cantidad de Boletos 3era Edad: ');
            readln (Cantidad_boleto_3eraedad);
            write ('Cantidad de Boletos Niños: ');
            readln (Cantidad_boleto_ninos);
            acumulador_temporal := Cantidad_boleto_general + Cantidad_boleto_ninos + Cantidad_boleto_3eraedad;
end;
{procedimiento para llamar menu}
procedure menu;
var opcion : integer;
begin

writeln ('Seleccione una opción.');
        writeln ('    1.- Comprar boletos');
        writeln ('    2.- Ver Sistema');
        writeln ('    3.- Salir');
        write ('Opción: ');
        readln (opcion);

  if (opcion < 1) or (opcion > 3) then {validacion de opciones de menu}
    begin
    Writeln ('Introdujo una opción invalida. Introduzca una nueva opción');
    menu;
    end;
        if (opcion >=1) and (opcion <=3) then
        begin
            if opcion = 1 then
            begin
            acumulador_temporal := 0;
            clrscr;
            Writeln('Venta de Boletos');
            writeln('----------------');
            writeln('  ');
            write ('Nombre: ');
            readln (nombre);
            write ('Apellido: ');
            readln (Apellido);
            write ('cedula: ');
            readln (cedula);
            estacion_;
            tramo_;
            cantidades;

            if acumulador_temporal > cantidad_maxima then

            begin
            writeln('Cupo Maximo 60 personas. Introduzca una Cantidad Menor');
            acumulador_temporal := 0;
            writeln(' ');
            cantidades;
            end;


            if acumulador_temporal < cantidad_maxima then
            begin
                if Cantidad_boleto_ninos > 0 then
                begin
                write ('     Edad Pasajero Niño: ');
                readln (Edad);
                end;

                If edad <=3 then
                begin
                    Cantidad_boleto_menores:=1;
                    cantidad_boleto_ninos := cantidad_boleto_ninos - Cantidad_boleto_menores;
                    if (var_estacion = 5) and (var_tramo =4)then
                    begin
                        repeat
                        writeln('Los menores de 3 años solo pueden subir hasta Loma Redonda');
                        estacion_;
                        tramo_;
                        until (var_estacion < 5) and (var_tramo <4)
                    end;

                end;
{calculo de totales por tipos de boletos y ventas}
    total_pagar := (Cantidad_boleto_general*precio_boleto_general) + (Cantidad_boleto_3eraedad*precio_boleto_3eraedad) + (Cantidad_boleto_ninos*precio_boleto_ninos);
    writeln('Su total a pagar es : ', total_pagar:10:2);

    total_ventas := total_ventas + total_pagar;
    total_boletos := Cantidad_boleto_general+Cantidad_boleto_3eraedad+Cantidad_boleto_ninos+Cantidad_boleto_menores;
    boletos_general_vendidos := boletos_general_vendidos + Cantidad_boleto_general;
    boletos_3eraeda_vendidos := boletos_3eraeda_vendidos + Cantidad_boleto_3eraedad;
    boletos_ninos_vendidos := boletos_ninos_vendidos + Cantidad_boleto_ninos;
    boletos_menores_vendidos := boletos_menores_vendidos + Cantidad_boleto_menores;
    total_boletos_vendidos := total_boletos_vendidos + total_boletos;
    boletos_disponible_viaje := cantidad_maxima - total_boletos_vendidos;

    write('Presione una tecla para volver a Menú');
    readkey;
    clrscr;
    menu;

end;
   end;
    if opcion = 2 then{activar opcion ver sistema}
    begin
    clrscr;

    writeln('Cantidad de Boletos Disponibles Viaje Actual:', boletos_disponible_viaje:13);
    writeln('  ');

    writeln('Relación de Boletos Vendidos');
    writeln('----------------------------');
    writeln('Cantidad de Boletos General Vendidos: ', boletos_general_vendidos:10);
    writeln('Cantidad de Boletos 3era. edad Vendidos: ', boletos_3eraeda_vendidos:7);
    writeln('Cantidad de Boletos niños Vendidos: ', boletos_ninos_vendidos:12);
    writeln('Cantidad de Boletos menores Vendidos: ', boletos_menores_vendidos:10);
    writeln('  ');
    writeln('Cantidad Total de Boletos Vendidos:', total_boletos_vendidos:13);
    writeln('  ');

    writeln('Relación de Ventas ($)');
    writeln('------------------------');
    writeln('Total ventas ($):', total_ventas:10:2);
    writeln('  ');
    writeln('Presione una tecla para volver a Menú.');
    readkey;
    clrscr;
    menu;
    end;

        if opcion = 3 then{activar opcion salir}
        begin
        halt(0);
        end;

end;
end;

begin
menu;
end.
