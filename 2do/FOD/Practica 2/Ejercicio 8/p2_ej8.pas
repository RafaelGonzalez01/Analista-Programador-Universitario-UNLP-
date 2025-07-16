program p2_ej8;

const

	valor_alto = 9999;
	dimF = 16;
	
type

	maestro = record
		cod_prov: integer;
		nom_prov: string;
		cant_hab: integer;
		cant_yer: real;
	end;
	
	detalle = record
		cod_prov: integer;
		cant_yer: real;
	end;
	
	archivo_maestro = file of maestro;
	archivo_detalle = file of detalle;
	
	
	vec_detalles = array [1..dimF] of archivo_detalle;
	vec_registros = array [1..dimF] of detalle;
	
procedure leerD(var arch: archivo_detalle; var reg: detalle);
begin
	if (not EOF(arch)) then
		read(arch,reg)
	else
		reg.cod_prov := valor_alto;
end;

procedure leerM(var arch: archivo_maestro; var reg: maestro);
begin
	if (not EOF(arch)) then
		read(arch,reg)
	else
		reg.cod_prov := valor_alto;
end;

procedure minimo(var vdet:vec_detalles; var vreg: vec_registros; var min: detalle)
var
	i: integer;
	pos: integer;
begin
	min.cod_prov := valor_alto;
	pos:= valor_alto;
	for i:= 1 to dimF do begin
			if ((vreg[i].cod_prov <> valor_alto)and(vreg[i].cod_prov < min.cod_prov)) do begin
				min := vreg[i];
				pos := i
			end;
	end;
	if (pos <> valor_alto) then begin
		leerD(vdet[pos],vreg[pos]);
	end;
end;

procedure recorrer_maestro(var maestro: archivo_maestro; var vdet:vec_detalles);
var
	i: integer;
	min: detalle;
	mae: maestro;
	vreg: vec_registros;
begin
	reset(maestro);
	for i:= 1 to dimF do begin
		reset(vdet[i]);
		leerD(vdet[i],vreg[i]);
	end;
	
	leerM(maestro,mae)
	minimo(vdet,vreg,min);
	
	while (min.cod_prov <> valor_alto) or (mae.cod_prov <> valor_alto) do begin
		if ()
		
		
		
		
		
		
	
