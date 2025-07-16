program p2_ej5;

uses sysutils;

const

	valor_alto = 999;
	dimF = 5;

type 
	
	fecha = record
		dia: integer;
		mes: integer;
		ano: integer;
	end;
	
	info = record
		cod: integer;
		fecha: fecha;
		tiempo: integer;
	end;
	
	archivo = file of info;
	
	vecDetalles = array [1..dimF] of archivo;
	
	vecReg = array[1..dimF] of info; 
	
procedure Leer(var detalle:archivo;var aux:info);
begin
	if (not EOF(detalle)) then
		read(detalle,aux)
	else
 		aux.cod := valor_alto;
end;

procedure CalcularMinimo(vReg: vecReg;var min:info;var vDetalles:vecDetalles);
var
	i:integer;
	pos:integer;
begin
	min.cod:= valor_alto;
	for i:= 1 to 5 do begin 
		if (min.cod > vReg[i].cod) then begin
			min:= vReg[i];
			pos:= i;
		end
	end;
	Leer(vDetalles[pos],vReg[pos]);
end;

function es_Igual (f1:fecha;f2:fecha): boolean;
begin
	es_Igual:= (f1.dia = f2.dia) and (f1.mes = f2.mes) and (f1.ano = f2.ano);
end;

procedure crear_maestro(var maestro:archivo;var vDetalles:vecDetalles);
var
	vReg:vecReg;
	min: info;
	i: integer;
	auxInfo:info;
begin
	rewrite(maestro);
	for i:= 1 to dimF do begin
		reset(vDetalles[i]);
		Leer(vDetalles[i],vReg[i]);
	end;
	CalcularMinimo(vReg,min,vDetalles);
	while (min.cod <> valor_alto) do begin
		auxInfo := min;
		while (min.Cod = auxInfo.cod) do begin
			auxInfo.tiempo:= 0;
			while (min.cod = auxInfo.cod) and (es_Igual(min.fecha,auxInfo.fecha)) do begin
				auxInfo.tiempo := auxInfo.tiempo + min.tiempo;
				CalcularMinimo(vReg,min,vDetalles);
			end;
			write(maestro,auxInfo);
		end;
	end;
end;

var
	maestro:archivo;
	vDetalles:vecDetalles;
	i: integer;
begin
	assign(maestro,'/var/log');
	for i:= 1 to 5 do
		assign(vDetalles[i],'detalle'+IntToStr(i));
	crear_maestro(maestro,vDetalles);
	close(maestro);
	for i:= 1 to 5 do
		close(vDetalles[i]);
end.
