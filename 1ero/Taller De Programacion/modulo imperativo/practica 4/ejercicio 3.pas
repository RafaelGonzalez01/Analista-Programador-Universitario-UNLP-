program ejercicio3.pas;

type


	producto = record
		cod_prod: integer;
		cant: integer;
		total: real;
	end;
	
	venta = record
		cod_venta: integer;
		cod_prod: integer;
		cant: integer;
		precio: real;
	end;
	
	a_productos = ^nodo;
	
	nodo = record
		dato: producto;
		HI: a_productos;
		HD: a_productos;
	end;
	
procedure leer_venta(var v:venta);
begin
	writeln('ingrese el codigo de la venta: ');
	readln(v.cod_venta);
	if (v.cod_venta <> - 1) then begin
		writeln('ingrese el codigo del producto: ');
		readln(v.cod_prod);
		writeln('ingrese el precio del producto: ');
		readln(v.precio);
		writeln('ingrese la cantidad vendida: ');
		readln(v.cant);
	end;
end;

procedure crear_producto(var p:producto; v:venta);
begin
	p.cod_prod:= v.cod_prod;
	p.cant:= v.cant;
	p.total:= (v.cant * v.precio);
end;

procedure agregar_venta(var p:producto; v:venta);
begin
	p.cant:= p.cant + v.cant;
	p.total:= p.total + (v.cant * v.precio);
end;

procedure agregar_arbol(var a:a_productos; v:venta);
var
	nue: a_productos;
begin
	if ( a = nil) then begin
		new(nue);
		crear_producto(nue^.dato,v);
		nue^.HI:= nil;
		nue^.HD:= nil;
		a:= nue;
	end
	else begin
		if ( v.cod_prod = a^.dato.cod_prod ) then
			agregar_venta(a^.dato,v)
		else
			if ( v.cod_prod < a^.dato.cod_prod ) then
				agregar_arbol(a^.HI,v)
			else
				agregar_arbol(a^.HD,v);
	end;
end;

procedure cargar_arbol(var a:a_productos);
var
	v: venta;
begin
	a:= nil;
	leer_venta(v);
	while ( v.cod_venta <> - 1 ) do begin
		agregar_arbol(a,v);
		leer_venta(v);
	end;
end;

procedure imprimir_producto(p:producto);
begin
	writeln('el producto de codigo: ',p.cod_prod,' tiene un total de: ',p.cant,' de ventas, reacaudando un total de: ',p.total:5:5);
end;

procedure imprimir_arbol(a:a_productos);
begin
	if ( a <> nil ) then begin
		imprimir_arbol(a^.HI);
		imprimir_producto(a^.dato);
		imprimir_arbol(a^.HD);
	end;
end;

function mayor_ventas(a:a_productos;var act:integer): integer;
begin
	if ( a <> nil ) then begin
		if ( a^.HI <> nil ) then
			mayor_ventas:= mayor_ventas(a^.HI,act);
		if ( a^.HD <> nil ) then
			mayor_ventas:= mayor_ventas(a^.HD,act);	
		if ( act < a^.dato.cant ) then begin
			act:= a^.dato.cant;
			mayor_ventas:= a^.dato.cod_prod;		
		end;
	end;
end;

procedure imprimir_mayor_ventas(a:a_productos);
var
	act: integer;
begin
	act:= 0;
	writeln('mayor ventas es: ',mayor_ventas(a,act));
end;

function cant_menor (a:a_productos;x:integer):integer;
begin
	if ( a = nil ) then
		cant_menor:= 0
	else begin
		if (a^.dato.cod_prod > x) then
			cant_menor:= cant_menor(a^.HI,x) + cant_menor(a^.HD,x) + 1
		else
			cant_menor:= cant_menor(a^.HI,x) + cant_menor(a^.HD,x);
	end;
end;

function monto_total(a:a_productos;inf:integer;sup:integer):real;
begin
	if ( a = nil) then
		monto_total:= 0
	else begin
		if  ( a^.dato.cod_prod >= sup ) then
			monto_total:= monto_total(a^.HI,inf,sup)
		else
			if ( a^.dato.cod_prod <= inf ) then
			monto_total:= monto_total(a^.HD,inf,sup)
		else
			monto_total:= a^.dato.total + monto_total(a^.HD,inf,sup);
	end;
end;

var
	a: a_productos;
	x:integer;
	inf:integer;
	sup:integer;
begin
	cargar_arbol(a);
	imprimir_arbol(a);
	imprimir_mayor_ventas(a);
	writeln('ingrese el codigo que desea buscar mayores: ');
	readln(x);
	writeln(cant_menor(a,x));
	writeln('ingrese el codigo inferior para buscar: ');
	readln(inf);
	writeln('ingrese el codigo superior para buscar: ');
	readln(sup);
	writeln('el monto total entre esos dos codigos es de: ',monto_total(a,inf,sup):5:5);
end.

	
