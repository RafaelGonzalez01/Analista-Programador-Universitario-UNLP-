program ejercicio4;

type

cod_rubro = 1..8;

producto = record
	cod:integer;
	cod_rub:cod_rubro;
	precio:real;
end;

l_productos = ^nodo;

nodo = record
	dato: producto;
	sig: l_productos;
end;

rubros = array [1..8] of l_productos;

rubro_3 = array [1..30] of producto;


procedure leer_producto(var p:producto);

begin
	
	writeln('ingrese el codigo del producto: ');
	read (p.cod);
	writeln('ingrese el codigo de su rubro: ');
	read (p.cod_rub);
	writeln('ingrese el precio del producto: ');
	read (p.precio);
	
end;

procedure cargar_lista_ordeanda(var l:l_productos;p:producto);

var

	act: l_productos;
	ant: l_productos;
	nue: l_productos;
	
begin

	new(nue);
	nue^.dato:= p;
	act:= l;
	ant:= l;
	while ((act <> nil) and (p.cod > act^.dato.cod)) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (ant = act) then
		l:= nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure inicializar_vector(var v:rubros);

var

i:integer;

begin

	for i:= 1 to 8 do begin
		v[i]:=nil;
	end;

end;

procedure cargar(var v:rubros);

var

p:producto;

begin

leer_producto(p);
while (p.precio <> 0) do begin
	cargar_lista_ordeanda(v[p.cod_rub],p);
	leer_producto(p);
end;

end;

procedure mostrar_codigos(v:rubros);

var

i:integer;

begin

	for i:= 1 to 8 do begin
		writeln('los codigos de rubro: ',i,' son: ');
		while (v[i]<>nil) do begin
			writeln (v[i]^.dato.cod);
			v[i]:=v[i]^.sig;
		end;
	end;

end;

procedure productos_rubro_3(var DimL:integer; var v_3:rubro_3; v:rubros);

begin

DimL:=0;
while ((v[3] <> nil) and (DimL <29)) do begin
	DimL:= DimL + 1;
	v_3[DimL]:= v[3]^.dato;
	v[3]:= v[3]^.sig;
end;
	
end;

procedure leer_vector(v:rubro_3;DimL:integer);

var

i:integer;

begin

writeln('el precio de los productos del rubro 3 son: ');
for i:= 1 to DimL do begin
	writeln(v[i].precio)
end;

end;

function promedio(v:rubro_3;DimL:integer): real;

var

cant:real;
i: integer;

begin

cant:= 0;

for i:= 1 to DimL do begin
	cant:= cant + v[i].precio;
end;

promedio:= cant/DimL;

end;



procedure ordenar_vector_seleccion(v:rubros);

var

DimL: integer;
v_3:rubro_3;
i: integer;
j: integer;
pos: integer;
item: producto;

begin

productos_rubro_3(DimL,v_3,v);

for i:= 1 to DimL-1 do begin
	pos:= i;
	for j:= i+1 to DimL do 
		if (v_3[j].precio < v_3[pos].precio) then 
			pos:= j;
		item:= v_3[pos];
		v_3[pos]:= v_3[i];
		v_3[i]:= item;
	end;

leer_vector(v_3,DimL);	
writeln('el promedio de los precioes es de: ',promedio(v_3,DimL));

end;



var

v:rubros;

begin

inicializar_vector(v);
cargar(v);
mostrar_codigos(v);
ordenar_vector_seleccion(v);

end.
