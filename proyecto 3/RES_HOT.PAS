 program TV4;
 uses App, Objects, Menus, Drivers, Views, MsgBox, crt;
 const
   {cmAyuda = 100;    Una orden que vamos a crear }
   Indiv = 101;   { Y otra }
   Acomp = 102; 
   Grupo = 103;	
   Capacidad = 20;
   Capacidad_a = 20;
   Capacidad_g = 20;
	
 type Programa = object (TApplication)
     procedure InitStatusLine; virtual;
     procedure InitMenuBar; virtual;
     procedure HandleEvent(var Suceso: TEvent); virtual;
 end;
 type
     Individual = record
        cedula: string;
        nombre: string;
        email: string;
        Telefono: string;
 end;

type
     Acompanante = record
        Cedula_a: string;
        nombre_a: string;
        email_a:string;
        Telefono_a: string;
 end;

type
     Grupo_r = record
        Cedula_g: string;
        nombre_g: string;
        email_g:string;
        Telefono_g: string;

 end;

var

  Prog: Programa;

  Cliente: array[1..capacidad] of Individual;  { Los datos }
  Acomp_a: array[1..capacidad_a] of acompanante;
  grupo_a: array[1..capacidad_g] of grupo_r;
    Cantidad_c: integer;       { Cantidad de clientes }
    Cantidad_a: integer;
    Cantidad_g: integer;
    terminado: boolean; 


  habitaciones : text;
  nombre_hab : string;
  precio: real;
  tipo: string;
  tipo_f: integer;
  sw_a: integer;
  sw_g: integer;
  Adultos : integer;
  Menores : integer;
  ced_c : string;

  
procedure Programa.InitStatusLine;
 var
   R: TRect;               { Rectángulo de pantalla }
 begin
   GetExtent(R);           { Miramos cuando ocupa }
   R.A.Y := R.B.Y - 1;     { Nos quedamos la línea inferior }
   New(StatusLine,
     Init(R,NewStatusDef(0, $FFFF,
       NewStatusKey('~Alt-S~ Salir', kbAltS, cmQuit,nil),
     nil)));
end;

 procedure Programa.InitMenuBar;
 var
   R: TRect;
 begin
   GetExtent(R);
   R.B.Y := R.A.Y + 1;
   MenuBar := New(PMenuBar, Init(R, NewMenu(
     NewSubMenu('Nuevo Cliente', hcNoContext, NewMenu(
       NewItem('Individual', '', kbnoKey, Indiv, hcNoContext,
       NewItem('Acompanado', '', kbnoKey, Acomp, hcNoContext,
       NewItem('Grupo/Familia', '', kbnoKey, Grupo, hcNoContext,
       NewItem('~S~alir', 'Alt-S', kbAltS, cmQuit, hcNoContext,
       nil))))),

     nil))));
 end;
procedure calculo_i;
var
resp:char;
cant:integer;
montocalculado: real;
begin
repeat
    write('Desea realizar una reserva de esta habitacion? (s/n)');
    readln(resp);

    if (resp = 's') or (resp = 'S') then
    begin

      write('Ingrese el numero de dias:');
      readln(cant);

      montocalculado := precio * cant;
      clrscr;
      writeln('Los Datos de su Reservacion son los siguientes:');
      writeln(' ');
      Writeln('Datos del Cliente');
      Writeln(' ');
      Writeln('Cedula: ',cliente[cantidad_c].cedula);
      Writeln('Nombre y Apellido: ',cliente[cantidad_c].nombre);
      Writeln('Telefono: ',cliente[cantidad_c].Telefono);
      Writeln('Correo: ',cliente[cantidad_c].email);
      writeln(' '); 
      Writeln('Cantidad dias estadia: ',cant);
      Writeln('Tipo de Habitacion: ', tipo);
      Writeln('Precio por Noche: ', precio:0:2);
      Writeln(' ');
      writeln('El monto a cancelar por su reservacion: ', montocalculado:0:2);

    end;
    writeln(' ');
    write('Desea realizar otra reservacion?(s/n)');
      readln(resp);
      until (resp = 'n') or (resp = 'N');
 end;

procedure calculo_a;
var
resp:char;
cant:integer;
ubic: integer;
montocalculado: real;
begin
repeat
    write('Desea realizar una reserva de esta habitacion? (s/n)');
    readln(resp);

    if (resp = 's') or (resp = 'S') then
    begin

      write('Ingrese el numero de dias:');
      readln(cant);
      ubic := cantidad_a - 1 ;
      montocalculado := precio * cant;
      clrscr;
      
      writeln('Los Datos de su Reservacion son los siguientes:');
      writeln(' ');
      Writeln('Datos del Cliente');
      Writeln(' ');
      Writeln('Cedula: ',Acomp_a[ubic].cedula_a);
      Writeln('Nombre y Apellido: ',Acomp_a[ubic].nombre_a);
      Writeln('Telefono: ',Acomp_a[ubic].Telefono_a);
      Writeln('Correo: ',Acomp_a[ubic].email_a);
      writeln(' '); 
       
      Writeln('Datos del Acompanante');
      Writeln('Cedula: ',Acomp_a[cantidad_a].cedula_a);
      Writeln('Nombre y Apellido: ',Acomp_a[cantidad_a].nombre_a);
      Writeln('Telefono: ',Acomp_a[cantidad_a].Telefono_a);
      writeln(' '); 
  
      Writeln('Cantidad dias estadia: ',cant);
      Writeln('Tipo de Habitacion: ', tipo);
      Writeln('Precio por Noche: ', precio:0:2);
      Writeln(' ');
      writeln('El monto a cancelar por su reservacion: ', montocalculado:0:2);

    end;
    writeln(' ');
    write('Desea realizar otra reservacion?(s/n)');
      readln(resp);
      until (resp = 'n') or (resp = 'N');
 end;

procedure calculo_g;
var
resp:char;
cant:integer;
montocalculado: real;
ubic_c : integer;
ubic_m : integer;
ubic_men : integer;
g : integer;
gm : integer;
begin
repeat
    write('Desea realizar una reserva de esta habitacion? (s/n)');
    readln(resp);

    if (resp = 's') or (resp = 'S') then
    begin 

      write('Ingrese el numero de dias:');
      readln(cant);
      montocalculado := precio * cant;
      clrscr;

      writeln('Los Datos de su Reservacion son los siguientes:');
      writeln(' ');
      Writeln('Datos del Cliente');

      ubic_c:= cantidad_g - (adultos+menores);
      writeln('Cedula   ','Nombre y Apellido       ','Telefono   ','Correo');
      WriteLn(grupo_a[ubic_c].cedula_g,'      ',grupo_a[ubic_c].nombre_g,'    ',grupo_a[ubic_c].telefono_g,
      '       ',grupo_a[ubic_c].email_g);
      writeln(' ');

      if (adultos > 0) then
      begin
      g:=1;
      Writeln('Datos integrantes Grupo Adultos');
      writeln('Cedula   ','Nombre y Apellido       ','Telefono   ','Correo');
      ubic_m := ubic_c + 1;

      while g <= adultos do
      begin
        inc(g);
        WriteLn(grupo_a[ubic_m].cedula_g,'   ',grupo_a[ubic_m].nombre_g,'   ',
        grupo_a[ubic_m].telefono_g,'   ',grupo_a[ubic_m].email_g);
        ubic_m := ubic_m + 1;
      end;
      end;
      if (menores > 0) then
      begin
        gm:=1;
        writeln(' ');
        Writeln('Datos integrantes Grupo Menores');
        writeln('Edad   ','Nombre y Apellido       ');
        ubic_men := adultos + 2;

         while gm <= menores do
         begin
          inc(gm);
          WriteLn(grupo_a[ubic_men].cedula_g,'   ',grupo_a[ubic_men].nombre_g);
          ubic_men := ubic_men + 1;
         end;

      end;

      Writeln('Cantidad dias estadia: ',cant);
      Writeln('Tipo de Habitacion: ', tipo);
      Writeln('Precio por Noche: ', precio:0:2);
      Writeln(' ');
      writeln('El monto a cancelar por su reservacion: ', montocalculado:0:2);

   end;
    writeln(' ');
    write('Desea realizar otra reservacion?(s/n)');
      readln(resp);
      until (resp = 'n') or (resp = 'N');
 end;



procedure descr_hab;
var
opcion : integer;
linea: string;
begin
repeat
    clrscr;
    writeln('Reservacion por Tipo de Habitacion:');
    writeln('1. Family Room');
    writeln('2. Sencilla');
    writeln('3. Doble');
    writeln('4. Suite');
    writeln('5. Volver a Menu');
    write('Seleccione una opcion: ');
    readln(opcion);

    case opcion of
      1: begin
          nombre_hab := 'c:\fichero\famil.txt';
          precio:= 200;
          tipo:= 'Family Room';
          assign(habitaciones, nombre_hab);
          reset(habitaciones);                (* Lo abrimos para leer datos *)
          while not eof(habitaciones) do
           begin
            readLn( habitaciones, linea );    (* Leemos una linea *)
            writeLn( linea );            (* Y la mostramos *)
           end;
            close( habitaciones );
           readln;
          if tipo_f = 1 then
          begin
          calculo_i;
	  end;
          if tipo_f = 2 then
          begin
          calculo_a;
          end;
         if tipo_f = 3 then
          begin
          calculo_g;
          end;

         end;

      2: begin
          nombre_hab := 'c:\fichero\senc.txt';
          precio:= 60;
          tipo:= 'Sencilla';
          assign(habitaciones, nombre_hab);
          reset(habitaciones);                (* Lo abrimos para leer datos *)
          while not eof(habitaciones) do
           begin
            readLn( habitaciones, linea );    (* Leemos una linea *)
            writeLn( linea );            (* Y la mostramos *)
           end;
            close( habitaciones );
           readln;
	  if tipo_f = 1 then
          begin
          calculo_i;
	  end;
          if tipo_f = 2 then
          begin
          calculo_a;
          end;
          if tipo_f = 3 then
          begin
          calculo_g;
          end;


         end;
      3: begin
          nombre_hab := 'c:\fichero\DOBLE.txt';
          precio:= 120;
          tipo:= 'Doble';
          assign(habitaciones, nombre_hab);
          reset(habitaciones);                (* Lo abrimos para leer datos *)
          while not eof(habitaciones) do
           begin
            readLn( habitaciones, linea );    (* Leemos una linea *)
            writeLn( linea );            (* Y la mostramos *)
           end;
            close( habitaciones );
           readln;
          if tipo_f = 1 then
          begin
          calculo_i;
	  end;
          if tipo_f = 2 then
          begin
          calculo_a;
          end;
          if tipo_f = 3 then
          begin
          calculo_g;
          end;


         end;
      4: begin
          nombre_hab := 'c:\fichero\SUITE.txt';
	  precio:=300;
          Tipo:= 'Suite';
          assign(habitaciones, nombre_hab);
          reset(habitaciones);                (* Lo abrimos para leer datos *)
          while not eof(habitaciones) do
           begin
            readLn( habitaciones, linea );    (* Leemos una linea *)
            writeLn( linea );            (* Y la mostramos *)
           end;
            close( habitaciones );
           readln;
          if tipo_f = 1 then
          begin
          calculo_i;
	  end;
          if tipo_f = 2 then
          begin
          calculo_a;
          end;
          if tipo_f = 3 then
          begin
          calculo_g;
          end;


         end;

      5: {writeln('Saliendo...');}
    else
      writeln('Opcion no valida. Intente nuevamente.');
      readln;
    end;
  
  until opcion = 5;
end;


procedure CargarCliente;
var
    fichero: file of individual;
    i: integer;
begin
    assign(fichero, 'cliente.txt');
    {$I-} 
    reset(fichero);
    {$I+}
    if ioResult <> 0 then  
        WriteLn('No había fichero de datos. Se creará.')
    else
    begin
        cantidad_c := filesize(fichero);
        for i := 1 to cantidad_c do
            Read(fichero, cliente[i]);
        close(fichero);
    end;
end;

procedure GrabarCliente;
var
    fichero: file of individual;
    i: integer;
begin
    assign(fichero, 'cliente.txt');
    {$I-} 
    rewrite(fichero);
    {$I+}
    if ioResult <> 0 then  
        WriteLn('No se pudo Guardar')
    else
    begin
        for i := 1 to cantidad_c do
            Write(fichero, cliente[i]);
        close(fichero);
    end;
tipo_f := 1;
descr_hab;
end;

procedure NuevoCliente;
begin
    if (cantidad_c < capacidad) then
    begin
        inc(cantidad_c);
        clrscr;
        WriteLn('Datos del Cliente');

	Write('Introduzca la cedula: ');
        ReadLn(cliente[cantidad_c].cedula);

        Write('Introduzca el nombre: ');
        ReadLn(cliente[cantidad_c].nombre);

        Write('Introduzca el correo electrónico: ');
        ReadLn(cliente[cantidad_c].email);

        Write('Introduzca el Numero de Telefono: ');
        ReadLn(cliente[cantidad_c].telefono);

         WriteLn;
         GrabarCliente;
     end
     else
            WriteLn('Base de datos llena');

end;

procedure CargarAcomp;
var
    fichero: file of Acompanante;
    i: integer;
begin
    assign(fichero, 'Acompan.txt');
    {$I-}
    reset(fichero);
    {$I+}
    if ioResult <> 0 then  
        WriteLn('No había fichero de datos. Se creará.')
    else
    begin
        cantidad_c := filesize(fichero);
        for i := 1 to cantidad_c do
            Read(fichero, Acomp_a[i]);
        close(fichero);
    end;
end;

procedure GrabarAcomp;
var
    fichero: file of Acompanante;
    i: integer;
begin
    assign(fichero, 'Acompan.txt');
    {$I-} 
    rewrite(fichero);
    {$I+}
    if ioResult <> 0 then  
        WriteLn('No se pudo Guardar')
    else
    begin
        for i := 1 to cantidad_c do
            Write(fichero, Acomp_a[i]);
        close(fichero);
    end;

if sw_a =1 then
begin
tipo_f := 2;
descr_hab;
end;
end;

procedure NuevoAcomp;
begin
    if (cantidad_a < capacidad) then
    begin
        inc(cantidad_a);
        clrscr;
        WriteLn('Datos del Cliente');

	Write('Introduzca la cedula: ');
        ReadLn(Acomp_a[cantidad_a].cedula_a);

        Write('Introduzca el nombre: ');
        ReadLn(Acomp_a[cantidad_a].nombre_a);

        Write('Introduzca el correo electronico: ');
        ReadLn(Acomp_a[cantidad_a].email_a);

        Write('Introduzca el Numero de Telefono: ');
        ReadLn(Acomp_a[cantidad_a].telefono_a);

         WriteLn;
         GrabarAcomp;
     end
     else
            WriteLn('Base de datos llena');

if (cantidad_a < capacidad) then
    begin
        inc(cantidad_a);
        clrscr;
        WriteLn('Datos del Acompanante');

	Write('Introduzca la cedula: ');
        ReadLn(Acomp_a[cantidad_a].cedula_a);

        Write('Introduzca el nombre: ');
        ReadLn(Acomp_a[cantidad_a].nombre_a);

        Write('Introduzca el Numero de Telefono: ');
        ReadLn(Acomp_a[cantidad_a].telefono_a);

         WriteLn;
	 sw_a := 1;
         GrabarAcomp;

     end
     else
            WriteLn('Base de datos llena');
end;
procedure CargarGrupo;
var
    fichero: file of grupo_r;
    i: integer;
begin
    assign(fichero, 'Grupo_f.txt');
    {$I-}
    reset(fichero);
    {$I+}
    if ioResult <> 0 then
        WriteLn('No había fichero de datos. Se creará.')
    else
    begin
        cantidad_c := filesize(fichero);
        for i := 1 to cantidad_c do
            Read(fichero, grupo_a[i]);
        close(fichero);
    end;
end;

procedure GrabarGrupo;
var
    fichero: file of grupo_r;
    i: integer;
begin
    assign(fichero, 'Grupo_f.txt');
    {$I-}
    rewrite(fichero);
    {$I+}
    if ioResult <> 0 then
        WriteLn('No se pudo Guardar')
    else
    begin
        for i := 1 to cantidad_c do
            Write(fichero, grupo_a[i]);
        close(fichero);
    end;

if sw_g = 1 then
begin
tipo_f := 3;
descr_hab;
end;
end;

procedure NuevoGrupo;
var
c_a : integer;
c_m : integer;

begin
c_a:=0;
c_m:=0;
    if (cantidad_g < capacidad) then
    begin
        inc(cantidad_g);
        clrscr;

        WriteLn('Datos del Cliente');

	Write('Introduzca la cedula: ');
        ReadLn(grupo_a[cantidad_g].cedula_g);

        Write('Introduzca el nombre: ');
        ReadLn(grupo_a[cantidad_g].nombre_g);

        Write('Introduzca el correo electronico: ');
        ReadLn(grupo_a[cantidad_g].email_g);

        Write('Introduzca el Numero de Telefono: ');
        ReadLn(grupo_a[cantidad_g].telefono_g);

        Write('Cantidad Adultos Grupo: ');
        Readln(adultos);
 
        Write('Cantidad Menores Grupo: ');
        Readln(Menores);
         
         WriteLn;
         {ced_c := grupo_a[cantidad_g].cedula_g;}
         GrabarGrupo;
     end
     else
            WriteLn('Base de datos llena');

if (cantidad_g < capacidad) then
    begin
       If (adultos>0) then
         begin
         repeat   
          inc(cantidad_g);
           clrscr;
           WriteLn('Datos Adultos');


	    Write('Introduzca la cedula: ');
            ReadLn(grupo_a[cantidad_g].cedula_g);

            Write('Introduzca el nombre: ');
            ReadLn(grupo_a[cantidad_g].nombre_g);

            Write('Introduzca el Numero de Telefono: ');
            ReadLn(grupo_a[cantidad_g].telefono_g);

            WriteLn;
            inc(c_a);
            GrabarGrupo;
           until c_a = adultos;
        end;
          if (c_a = adultos) and (menores = 0) then
          begin
          sw_g := 1;
          GrabarGrupo;
          end
            else
              GrabarGrupo;
       end
     else
            WriteLn('Base de datos llena');

if (cantidad_g < capacidad) then
    begin
       If (menores>0) then
         begin
         repeat   
          inc(cantidad_g);
           clrscr;
           WriteLn('Datos Menores');


	    Write('Introduzca la edad: ');
            ReadLn(grupo_a[cantidad_g].cedula_g);

            Write('Introduzca el nombre: ');
            ReadLn(grupo_a[cantidad_g].nombre_g);

            WriteLn;
            inc(c_m);
            GrabarGrupo;
           until c_m = menores;
        end;
          if c_m = menores then
          begin
          sw_g := 1;
          GrabarGrupo;
          end
       end
     else
            WriteLn('Base de datos llena');
end;

procedure fichero_indiv;
begin
Nuevocliente;
end;

procedure fichero_Acomp;
begin
sw_a:=0;
NuevoAcomp;
end;

procedure fichero_grupo;
begin
sw_g:=0;
NuevoGrupo;
end;


procedure Programa.HandleEvent(var Suceso: TEvent);
 var
   R: TRect;
 begin
   inherited HandleEvent(Suceso);
   if Suceso.What = evCommand then
     case Suceso.Command of
      Indiv:
       begin
       fichero_indiv;
       end;
      Acomp:
       begin
       fichero_acomp;
       end;
       Grupo:
       begin
       fichero_grupo;
       end;

     end; 
 end;
 begin
   sw_a := 0;
   Prog.Init;
   Prog.Run;
   Prog.Done;
 end.
