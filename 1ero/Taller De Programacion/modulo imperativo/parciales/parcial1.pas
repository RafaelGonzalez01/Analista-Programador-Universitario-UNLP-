program parcial_1.pas;

type

	diagnostico = 1..15;
	m = 0..12;

	atencion = record
		dni: integer;
		mes:m;
		cod: diagnostico;
	end;

	atenciones = record
		mes:m;
		cod: diagnostico;
	end;
	
	l_atenciones = ^nodo1;

	nodo1 = record
		dato: atenciones;
		sig: l_atenciones;
	end;
	
	paciente = record
		dni: integer;
		cant: integer;
		l: l_atenciones;
	end;
	
	a_pacientes = ^nodo2;

	nodo2 = record
		dato: paciente;
		HI: a_pacientes;
		HD: a_pacientes;
	end;
	
	cant_atenciones = array[diagnostico] of integer;

procedure leer_atencion( var a:atencion );
begin
	writeln('ingrese el mes de la atencion: ');
	readln(a.mes);
	if ( a.mes <> 0 ) then begin
		writeln('ingrese el dni del paciente: ');
		readln(a.dni);
		writeln('ingrese el codigo de la atencion: ');
		readln(a.cod);
	end;
end;

procedure inicializar_vector(var v:cant_atenciones);
var
	i:integer;
begin
	for i:= 1 to 15 do
		v[i]:= 0;
end;

procedure agregar_lista(var l:l_atenciones;a:atencion);
var
	nue: l_atenciones;
begin
	new(nue);
	nue^.dato.mes := a.mes;
	nue^.dato.cod := a.cod;
	nue^.sig:= l;
	l:= nue;	
end;

procedure agregar_arbol(var a: a_pacientes;info: atencion);
begin
	if (a = nil) then begin
		new(a);
		a^.dato.dni:= info.dni;
		a^.dato.cant:= 1;
		a^.HI:= nil;
		a^.HD:= nil;
		a^.dato.l:= nil;
		agregar_lista(a^.dato.l,info);
	end
	else
		if ( a^.dato.dni = info.dni ) then begin
			a^.dato.cant := a^.dato.cant + 1;
			agregar_lista(a^.dato.l,info);
		end
		else
			if ( info.dni < a^.dato.dni ) then
				agregar_arbol(a^.HI,info)
			else
				agregar_arbol(a^.HD,info);
end;

procedure agregar_vector(var v:cant_atenciones; info:integer);
begin
	v[info]:= v[info] + 1;
end;

procedure cargar_datos(var a: a_pacientes; var v:cant_atenciones);
var
	info:atencion;
begin
	leer_atencion(info);
	while (info.mes <> 0) do begin
		agregar_arbol(a,info);
		agregar_vector(v,info.cod);
		leer_atencion(info);	
	end;
end;

function punto_b (a:a_pacientes;dni1,dni2,x:integer): integer;
begin
	if ( a = nil ) then
		punto_b:= 0	
	else begin 
		if ( a^.dato.dni < dni1 ) then
			punto_b:=punto_b(a^.HD,dni1,dni2,x)
		else
			if ( a^.dato.dni > dni2 ) then
				punto_b:=punto_b(a^.HI,dni1,dni2,x)
			else
			if ( a^.dato.cant > x ) then
				punto_b:= punto_b(a^.HD,dni1,dni2,x) + punto_b(a^.HI,dni1,dni2,x) + 1
			else
				punto_b:= punto_b(a^.HD,dni1,dni2,x) + punto_b(a^.HI,dni1,dni2,x);
	end;	
end;

function punto_c (v: cant_atenciones; i : integer): integer;
begin
	if ( i > 15 ) then
		punto_C:= 0
	else
		if ( v[i] = 0 ) then
			punto_c:= punto_c(v,i+1) + 1
		else
			punto_c:= punto_c(v,i+1);		
end;

var

	a: a_pacientes;	
	v: cant_atenciones;
	dni1: integer;
	dni2: integer;
	x: integer;
	
begin
	inicializar_vector(v);
	a:=nil;
	cargar_datos(a,v);	
	writeln('ingrese el dni inferior: ');
	readln(dni1);
	writeln('ingrese el dni superior: ');
	readln(dni2);
	writeln('ingrese la cantidad de antenciones que debe tenr: ');
	readln(x);
	writeln('la cantidad de pacientes con mas de: ',x,' atenciones entre el dni: ',dni1,' y el dni: ',dni2,' es de: ',punto_b(a,dni1,dni2,x));
	writeln('la cantidad de atenciones que fueron 0: ',punto_c(v,1));
end.
		
		
		
		
	



	


