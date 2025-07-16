program p2_ej7;

const

	valor_alto = 9999;
	
type

	str = string[25];

	reg_maestro = record
		cod: integer;
		apellido: str;
		nombre: str;
		cant_aprobadas: integer;
		cant_finales: integer;
	end;
	
	reg_cursadas = record
		cod: integer;
		cod_materia: integer;
		ano: integer;
		result: boolean;
	end;
	
	reg_finales = record
		cod: integer;
		cod_materia: integer;
		fecha: str;
		nota: integer;
	end;
	
	archivo_maestro = file of reg_maestro;
	
	detalle_cursadas = file of reg_cursadas;
	
	detalle_finales = file of reg_finales;
	
procedure LeerM(var archivo: archivo_maestro; var maestro: reg_maestro);
begin
	if (not EOF(archivo)) then
		read(archivo, maestro)
	else
		maestro.cod := valor_alto;
end;

procedure leerC(var cursadas:detalle_cursadas; var reg: reg_cursadas);
begin
	if (not EOF(cursadas)) then
		read(cursadas,reg)
	else
		reg.cod := valor_alto;
end;

procedure leerF(var finales: detalle_finales; var reg: reg_finales);
begin
	if (not EOF(finales)) then
		read(finales,reg)
	else
		reg.cod := valor_alto;
end;

procedure procesar_cursada(var maestro: archivo_maestro; cur: reg_cursadas;var mae:reg_maestro);
begin
	if (mae.cod <> cur.cod) then begin
		while (mae.cod <> cur.cod) do
			leerM(maestro,mae);
		seek(maestro,filepos(maestro)-1);
	end;
	if (cur.result = true) then begin
		mae.cant_aprobadas := mae.cant_aprobadas + 1;
		write(maestro,mae);
		seek(maestro,filepos(maestro)-1);
	end;
end;

procedure procesar_final(var maestro: archivo_maestro; fin: reg_finales;var mae: reg_maestro);
begin
	if (mae.cod <> fin.cod) then begin
		while (mae.cod <> fin.cod) do
			leerM(maestro,mae);
		seek(maestro,filepos(maestro)-1);
	end;
	if (fin.nota >= 4) then begin
		mae.cant_finales := mae.cant_finales + 1;
		write(maestro,mae);
		seek(maestro,filepos(maestro)-1);
	end;
end;
		
procedure actualizar_maestro(var maestro: archivo_maestro; var cursadas:detalle_cursadas; var finales: detalle_finales);
var
	cur: reg_cursadas;
	fin: reg_finales;
	mae: reg_maestro;
	termino_cursadas: boolean;
	termino_finales: boolean;
begin
	reset(maestro);
	reset(cursadas);
	reset(finales);
	
	leerC(cursadas,cur);
	leerF(finales,fin);
	termino_cursadas := cur.cod = valor_alto;
	termino_finales := fin.cod = valor_alto;
	
	leerM(maestro,mae);
	seek(maestro,0);
	
	while ((not termino_cursadas) or (not termino_finales)) do begin
		if ((not termino_cursadas) or (not termino_finales)) then begin
			if (cur.cod < fin.cod) then begin
				procesar_cursada(maestro,cur,mae);
				leerC(cursadas,cur);
				termino_cursadas := cur.cod = valor_alto;
			end
			else begin
				procesar_final(maestro,fin,mae);
				leerF(finales,fin);
				termino_finales := fin.cod = valor_alto;
			end;
		end
		else begin
			if (not termino_cursadas) then begin
				procesar_cursada(maestro,cur,mae);
				leerC(cursadas,cur);
				termino_cursadas := cur.cod = valor_alto;
			end
			else begin
				if (not termino_finales) then begin
					procesar_final(maestro,fin,mae);
					leerF(finales,fin);
					termino_finales := fin.cod = valor_alto;
				end
			end;
		end;
	end;
	close(maestro);
	close(finales);
	close(cursadas);
end;
				
