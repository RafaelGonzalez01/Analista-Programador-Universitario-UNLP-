program p3_6;

type

	prenda = record
		cod_prenda: integer;
		descripcion : string;
		colores: string;
		tipo_prenda: string;
		stock: string;
		precio_unitario: real;
	end;
	
	archivo_prenda = file of prenda;
	
	archivo_codigos = file of integer;
	
	//baja logica por stock
	
procedure bajas_obsoletas(var archivo: archivo_prenda; codigos : archivo_codigos);
var
	cod: integer;
begin
	reset(codigos);
	while (not(EOF(codigos))) do begin
		read(codigos,cod);
		baja_archivo(archivo,cod);
	end
	close(codigos);
end;

procedure baja_archivo(var archivo: archivo_prenda; cod:integer);
var
	aux: prenda;
	encontro: boolean;
begin
	reset(archivo);
	encontro := false;
	//sin cabecera?
	while (not(EOF(archivo)) and not(encontro)) do begin
		read(archivo,aux);
		if aux.cod_prenda = cod then begin
			aux.stock := aux.stock * -1;
			seek(archivo,filepos(archivo)-1);
			write(cabecera);
			seek(archivo,0);
			write(archivo,aux);
			encontro := true;
		end:
	end;
	close(archivo);
end;

procedure efectivizar_bajas(var archivo_maestro: archivo_prenda; nuevo_maestro: archivo_prenda);
var
	aux:prenda;
begin
	reset(archivo_maestro);
	reset(nuevo_maestro);
	while(not(EOF(archivo_maestro))) do begin
		read(archivo_maestro,aux);
		if aux.stock >= 0 then
			write(nuevo_maestro,aux);
	end;
	close(archivo_maestro);
	close(nuevo_maestro);
end;

// Al finalizar este proceso de compactación del archivo, se deberá renombrar el archivo nuevo con el nombre del archivo maestro original.

