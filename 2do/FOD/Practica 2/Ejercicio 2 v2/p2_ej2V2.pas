program p2_ejV2;

const

	valor_alto = 999;

type

	producto = record
		cod: integer;
		nombre: string;
		precio: real;
		stockAct: integer;
		stocDisp: integer;
	end;
	
	venta = record
		cod: integer;
		cant: integer;
	end;
	
	archivo_maestro = file of producto;
	
	archivo_detalle = file of venta;
	
	archivo_texto = file of text;
	
procedure leer_detalle(var detalle: archivo_detalle; var auxD:venta);
begin
	if(not EOF(detalle)) then
		read(detalle,auxD)
	else
		auxD.cod:= valor_alto;
end;
	
procedure actualizar_maestro(var detalle: archivo_detalle;var maestro: archivo_maestro);
var
	auxD:venta;
	auxM:producto;
	codigo_actual: integer;
begin
	reset(detalle);
	reset(maestro);
	leer_detalle(detalle,auxD);
	while (auxD.cod <> valor_alto) do begin
		codigo_actual:= auxD.cod;
		read(maestro,auxM);
		while (codigo_actual <> auxM.cod) do
			read(maestro,auxM);
		seek(maestro,filePos(maestro)-1);
		write(maestro,auxD);
	end;
end;

procedure listar(var maestro: archivo_maestro;var texto: archivo_texto);
begin
end;

var
	maestro: archivo_maestro;
	detalle: archivo_detalle;
	texto: archivo_texto;
begin
	actualizar_maestro(detalle,maestro);
	listar(maestro,texto);
end.
