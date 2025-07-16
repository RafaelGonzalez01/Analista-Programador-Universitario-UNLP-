program p3_7;

const 

	valor_alto = 9999

type

	ave = record
		cod: integer;
		nombre:string;
		familia: string;
		desc: string;
		zona: string;
	end;
	
	archivo_ave = file of ave;
	
procedure leer(var archivo: archivo_ave; var reg: ave);
begin
	if (not EOF(archivo)) then
		read(archivo,reg)
	else
		reg.cod := valor_alto;
end;
	
procedure eliminar_ave (var archivo: archivo_ave; cod: integer);
var
	reg: ave;
begin
	reset(archivo);
	leer(archivo,reg);
	while (reg.cod <> valor_alto and reg.cod <> cod) do
		leer(archivo,reg);
	if (reg.cod = cod) then begin
		reg.cod := reg.cod * - 1;
		seek(archivo,filepos(archivo)-1);
		write(archivo,reg);
	end;
	close(archivo)
end;

procedure compactar_archivo(var archivo: archivo_ave);
var
	reg: ave;
	pos: integer;
	ult_pos: integer;
begin
	ult_pos := filesize(archivo);
	while(not EOF(archivo)) do begin
		read(archivo,reg);
		if (reg.cod < 0) then begin
			pos:= filepos(archivo) - 1;
			seek(archivo,ult_pos);
			read(archivo,reg);
			seek(archivo,pos);
			write(archivo,reg);
			ult_pos:= ult_pos - 1;
		end;
	end;
	seek(archivo,ult_pos);
	truncate(archivo);
end;
