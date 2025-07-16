program ejercicio3.pas;

type

indice = -1..20;

v_numeros = array [indice] of integer;

procedure cargar_vector(var v:v_numeros);


var

i:integer;

begin

for i:= 1 to 20 do
	v[i]:= random(1550-300) + 300;
	
end;

procedure ordenar_vector_insercion(var v:v_numeros);
var

actual:integer;
i,j: indice;
Diml: indice;

begin

Diml:= 20;

for i:= 2 to Diml do begin
	actual:= v[i];
	j:= i -1;
	while (j > 0) and (v[j] > actual)  do begin
		v[j+1]:= v[j];
		j:= j - 1;
	end;
	v[j+1]:= actual;
end;

end;

Procedure busquedaDicotomica (v: v_numeros; ini,fin: indice; dato:integer; var pos: indice);
var
	medio: integer;
begin

	pos:= -1;
	medio:= (ini + fin) div 2;
	while (v[medio] <> dato) and (ini<=fin) do begin
		if (dato < v[medio]) then
			fin:= medio - 1
		else
			if (dato > v[medio]) then
				ini:= medio + 1;
		medio:=(ini + fin) div 2;
	end;
	if (v[medio] = dato) then
		pos:= medio;
end;

var
	v:v_numeros;
	i:integer;
	x:integer;
	pos:indice;
begin
	cargar_vector(v);
	for i:= 1 to 20 do
		writeln(v[i]);
	writeln('-------------');
	ordenar_vector_insercion(v);
	for i:= 1 to 20 do
		writeln(v[i]);
	writeln('-------------');
	writeln('ingrese el numero a buscar: ');
	readln(x);
	busquedaDicotomica(v,1,20,x,pos);
	writeln(pos);
	
end.





