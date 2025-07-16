program ejercicio2.pas;

type

lista_numeros = ^nodo;

nodo = record
	dato:integer;
	sig: ^nodo;
end;

procedure agregar_adelante(var l: lista_numeros;n: integer);

var

nue: lista_numeros;

begin

new(nue);
nue^.dato:= n;
if (l = nil) then
	nue^.sig:=nil
else
	nue^.sig:= l;
l:= nue;
	
end;

procedure aleatorio(var l:lista_numeros);

var

n:integer;

begin

	n:= (random(101) + 100);
	if (n <> 100) then begin
		agregar_adelante(l,n);
		aleatorio(l);
	end;
	

end;

procedure imprimir(l:lista_numeros);

begin

if(l <> nil) then begin
	writeln(l^.dato);
	imprimir(l^.sig);
end;

end;

procedure imprimir_contrario(l:lista_numeros);

begin

if(l <> nil) then begin
	imprimir_contrario(l^.sig);
	writeln(l^.dato);
end;
	
end;

function minimo(l: lista_numeros): integer;
var 

act:integer;

begin

minimo:= l^.dato;
if (l^.sig<>nil) then begin
	act:= minimo(l^.sig);
		if minimo > act then
			minimo:= act;
	end;
end;

function se_encuentra(l: lista_numeros;n: integer): boolean;

var 

act:boolean;

begin

se_encuentra:= false;
if (l^.sig<>nil) then begin
	act:= se_encuentra(l^.sig,n);
	se_encuentra:=  ((l^.dato = n) or (act = true))
	end;

end;




var

l: lista_numeros;
n:integer;

begin

randomize;
aleatorio(l);
imprimir(l);
writeln('/');
imprimir_contrario(l);
writeln('/');
writeln(minimo(l));
writeln('/');
read(n);
writeln(se_encuentra(l,n));

end.
