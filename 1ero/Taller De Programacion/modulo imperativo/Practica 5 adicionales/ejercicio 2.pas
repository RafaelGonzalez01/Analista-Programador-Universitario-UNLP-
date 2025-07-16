program ejercicio2.pas;

type

string15 = string[15];

auto = record
	patente: integer;
	ano: integer;
	marca:string15;
	modelo: string15;
end;

lista_autos = ^nodo1;

nodo1 = record
	dato: auto;
	sig: lista_autos;
end;

arbol_marcas = ^nodo2;

nodo2 = record
	dato: lista_autos;
	marca:  string15;
	HI: arbol_marcas;
	HD: arbol_marcas;
	
end;

arbol_autos = ^nodo3;

nodo3 = record
	dato:auto;
	HI:arbol_autos;
	HD:arbol_autos;
end;


procedure leer_auto(var a:auto);
begin
	writeln('ingrese la marca del auto: ');
	readln(a.marca);
	if (a.marca <> 'zzz') then begin
		writeln('ingrese la patente del auto: ');
		read(a.patente);
		writeln('ingrese el ano del auto: ');
		readln(a.ano);
		writeln('ingrese el modelo del auto: ');
		readln(a.modelo);
	end;
end;

procedure cargar_lista_ordeanda(var l: lista_autos;a:auto);

var

	act: lista_autos;
	ant: lista_autos;
	nue: lista_autos;
	
begin

	new(nue);
	nue^.dato:= a;
	act:= l;
	ant:= l;
	while ((act <> nil) and (a.patente > act^.dato.patente)) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (ant = act) then
		l:= nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
	
end;

procedure agregar_arbol_marcas(var l:arbol_marcas;a:auto);
var
nue:arbol_marcas;
begin
	if (l = nil) then begin
		new (nue);
		nue^.marca := a.marca;
		nue^.dato := nil;
		cargar_lista_ordeanda(nue^.dato,a);
		l := nue;
	end
	else begin
		if (l^.marca = a.marca) then
			cargar_lista_ordeanda(l^.dato,a)
		else
			if (a.marca < l^.marca) then
				agregar_arbol_marcas(l^.HI,a)
			else
				agregar_arbol_marcas(l^.HD,a);
			
		
    end;
end;

procedure cargar_arbol_marcas(var l:arbol_marcas);

var

a:auto;

begin

l:=nil;
leer_auto(a);
while (a.marca <> 'zzz') do begin
	agregar_arbol_marcas(l,a);
	leer_auto(a);
end;

end;

procedure imprimir_lista_autos(l:lista_autos);
begin

if (l <> nil) then begin
	writeln	('patente: ',l^.dato.patente);
	writeln	('ano: ',l^.dato.ano);
	writeln	('modelo: ',l^.dato.modelo);
	writeln('------------------');
	imprimir_lista_autos(l^.sig);
end;
end;

procedure imprimir_arbol_marcas(l:arbol_marcas);

begin

if l <> nil then begin
	if (l^.HI <> nil) then 
		imprimir_arbol_marcas(l^.HI);
	writeln('los autos de la marca: ',l^.marca,' son: ');
	imprimir_lista_autos(l^.dato);
	if (l^.HD <> nil) then
		imprimir_arbol_marcas(l^.HD);
end;
end;

procedure agregar_arbol_autos(var l:arbol_autos;a:auto);
var

nue: arbol_autos;

begin

if ( l = nil) then begin
	new(nue);
	nue^.dato := a;
	nue^.HI := nil;
	nue^.HD := nil;
	l:=nue;
end 
	else
		if (a.patente <= l^.dato.patente) then
			agregar_arbol_autos(l^.HI,a)
		else
			agregar_arbol_autos(l^.HD,a);
end;

procedure cargar_arbol_autos(var l:arbol_autos);

var

a:auto;

begin

l:= nil;
leer_auto(a);
while(a.marca <> 'zzz') do begin
	agregar_arbol_autos(l,a);
	leer_auto(a);
end;
end;



procedure imprimir_arbol_autos(l:arbol_autos);

begin

if l <> nil then begin
	if (l^.HI <> nil) then 
		imprimir_arbol_autos(l^.HI);
	writeln('patente: ',l^.dato.patente,', ');
	if (l^.HD <> nil) then
		imprimir_arbol_autos(l^.HD);
end;
end;

function contador_arbol_autos(l:arbol_autos; m:string15): integer;

begin

contador_arbol_autos:=0;
if l <> nil then begin
	if (l^.HI <> nil) then 
		contador_arbol_autos:= contador_arbol_autos + contador_arbol_autos(l^.HI,m);
	if (l^.dato.marca = m) then
		contador_arbol_autos:=contador_arbol_autos + 1;
	if (l^.HD <> nil) then
		contador_arbol_autos:= contador_arbol_autos + contador_arbol_autos(l^.HD,m);
end;
end;

procedure arbol_autos_marca_contador(l:arbol_autos);
var
m:string15;
begin

writeln('ingrese una marca para contar: ');
read(m);
writeln('la cantidad de autos de marca: ',m,' son de: ',contador_arbol_autos(l,m),'.');

end;

function contador_lista_marcas(l:lista_autos):integer;
begin

contador_lista_marcas:=0;
while (l <> nil) do begin
	contador_lista_marcas:= contador_lista_marcas + 1;
	l:= l^.sig
end;

end;


function contador_arbol_marcas(l:arbol_marcas; m:string15): integer;

begin

{if l <> nil then begin
	if (l^.HI <> nil) then 
		contador_arbol_marcas(l^.HI,m);
	if (l^.marca = m) then
		contador_arbol_marcas:= contador_lista_marcas(l^.dato);
	if (l^.HD <> nil) then
		contador_arbol_marcas(l^.HD,m);
end;}

if (l<>nil) then begin
	while ((l^.HI <> nil) or (l^.marca <> m)) do
			l:= l^.HI;
	while ((l^.HD <> nil) or (l^.marca <> m)) do
			l:= l^.HD;
	if (l^.marca = m) then
		contador_arbol_marcas:= contador_lista_marcas(l^.dato);
end;
	
end;

procedure arbol_marcas_marca_contador(l:arbol_marcas);
var
m:string15;
begin

writeln('ingrese una marca para contar: ');
read(m);
writeln('la cantidad de autos de marca: ',m,' son de: ',contador_arbol_marcas(l,m),'.');

end;

procedure autos_fabricacion(var l2:arbol_autos;l1: arbol_autos);
begin

if (l1<>nil) then begin

	while (l1^.HI <> nil) do
			l1:= l1^.HI;
	while (l1^.HD <> nil) do
			l1:= l1^.HD;
			
end;

end;



var

L1: arbol_autos;
L2: arbol_marcas;
lista_fabricacion: arbol_autos;

begin

cargar_arbol_autos(L1);
arbol_autos_marca_contador(L1);
cargar_arbol_marcas(L2);
arbol_marcas_marca_contador(L2);

end.

{falta incisio d e y f}
	




