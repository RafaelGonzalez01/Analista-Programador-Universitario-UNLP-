program p2_ej6;

const

	valor_alto = 9999;
	dimF = 10;
	
type

	str = string[20];
	
	municipio = record
		cod_localidad: integer;
		cod_cepa: integer;
		cant_activos: integer;
		cant_nuevos: integer;
		cant_recuperados: integer;
		cant_fallecidos: integer;
	end;
	
	ministerio = record
		cod_localidad: integer;
		nombre_localidad: str;
		cod_cepa: integer;
		nombre_cepa: str;
		cant_activos: integer;
		cant_nuevos: integer;
		cant_recuperados: integer;
		cant_fallecidos: integer;
	end;
	
	archivo_detalle = file of municipio;
	archivo_maestro = file of ministerio;
	
	vec_detalles = array [1..dimF] of archivo_detalle;
	vec_reg = array [1..dimF] of municipio; 	

procedure leerD(var archivo:archivo_detalle;var reg:municipio);
begin
	if (not(EOF(archivo))) then
		read(archivo,reg)
	else
		reg.cod_localidad := valor_alto;
end;

procedure leerM(var maestro: archivo_maestro, rmae: ministerio);
begin
	if (not(EOF(maestro))) then
		read(maestro,rmae);
	else
		reg.cod_localidad := valor_alto;
end;

procedure calcular_minimo(var vdetalles:vec_detalles; var vreg:vec_reg; var min: municipio);
var
	i:integer;
	pos:integer;
begin
	min.cod_localidad:= valor_alto;
	pos:= valor_alto;
	for i:= 1 to dimF do begin
		if ((vreg[i].cod_localidad <> valor_alto) and (vreg[i].cod_localidad < min)) then begin
			min := vreg[i];
			pos:= i;
		end
		else begin
				if (vreg[i].cod_localidad = min.cod_localidad) then begin
					if (vreg[i].cod_cepa < vreg[pos].cod_cepa) then
						min:= min[i];
						pos:= i;
				end;
		end;
	end;
	if (pos <> valor_alto) then
		leerD(vdetalles[pos],vreg[pos]);
end;		

procedure actualizar_maestro(var maestro:archivo_maestro;var detalles:vec_detalles);
var
	vreg : vec_reg;
	rmae: ministerio;
	rdet: municipio;
	i: integer;
begin
	reset(maestro);
	for i:= 1 to dimF do 
		reset(detalles[i]):
		leerD(detalles[i],vreg[i]);
	calcular_minimo(detalles,vreg,rdet);
	while (rdet.cod_localidad <> valor_alto) do begin
		rmae.cod_localidad:= rdet.cod_localidad;
		rmae.cant_fallecidos := 0;
		rmae.cant_fallecidos := 0;
		while (rdet.cod_localidad = rmae.cod_localidad) do begin		
			rmae.cant_fallecidos := rmae.cant_fallecidos + rdet.rmae.cant_fallecidos;
			rmae.cant_recuperados := rmae.cant_recuperados + rdet.rmae.cant_recuperados;
			rmae.cant_activos := rdet.cant_activos;
			rmae.cant_recuperados := rdet.cant_recuperados;
			calcular_minimo(detalles,vreg,rdet);
		end;
		escribir_maestro(maestro,rmae);
	end;
	for i:= 1 to dimF do
		close(detalles[i]);
	close(maestro);
end;

procedure escribir_maestro(var maestro:archivo_maestro; rmae: ministerio)
var
	aux: ministerio;
begin
	leerM(maestro,aux);
	while (aux.cod_localidad <> rmae.cod_localidad) do 
		leerM(maestro,aux);
	if (aux.cod_localidad = rmae.cod_localidad) then begin
		seek(maestro,filepos(maestro)-1);
		aux.cant_fallecidos := aux.cant_fallecidos + rmae.cant_fallecidos;
		aux.cant_recuperados := aux.cant_recuperados + rmae.cant_recuperados:
		aux.cant_activo:= rmae.cant_activos;
		aux.cant_recuperados:= rmae.cant_recuperados;
		write(maestro,aux);
	end;
end;
				 
procedure mas_50(var maestro: archivo_maestro);
var
	reg: ministerio;
begin
	leerM(maestro,reg);
	while()
			
	
	
