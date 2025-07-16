program p2_19;

const

	valor_alto:= 999;
	dimF:= 50;
	
type
	
	dato_Familiar = record
		nombre:string;
		apellido:string;
		dni:integer;
	end;
	
	nacimiento = record
		nro_partida: integer;
		nombre: string;
		apellido: string;
		direccion: string;
		matricula: integer;
		datoMadre: dato_Familiar;
		datoPadro: dato_Familiar;
	end;
	
	fallecimiento = record
		nro_partida: integer;
		nombre: string;
		apellido: string;
		direccion: string;
		matricula: integer;
		hora: integer;
		fecha: string;
		lugar: string;
	end
	
	maestro = record
		nro_partida: integer;
		nombre: string;
		apellido: string;
		direccion: string;
		matricula: integer;
		datoMadre: dato_Familiar;
		datoPadro: dato_Familiar;
		fallecio = boolean;
		matricula: integer;
		hora: integer;
		fecha: string;
		lugar: string;
	end;
	
	archivo_maestro = file of mestro;
	archivo_detalleN = file of nacimiento;
	archivo_detalleF = file of fallecimiento;
	archivo_texto = file of text;
	
	vectorN = array [1..dimF] of archivo_detalleN;
	vectorF = array [1..dimF] of archivo_detalleF;
	
	vectorAN = array [1..dimF] of nacimiento;
	vectorAF = array [1..dimF] of fallecimiento;
	
procedure leerN(var archivoN:archivo_detalleN;var reg:nacimiento);
begin
	if (not EOF(archivoN)) then	
		read(archivoN,reg);
end;

procedure leerF(var archivoF:archivo_detalleF;var reg:nacimiento);
begin
	if(not(EOF(archivoF)) then
		read(archivoF,reg;
end;

procedure calcular_minimoN(var vec:vectorN;var vecA:vectorAN; var min: integer)
var
i: integer;
pos: integer;
begin
	for i := 1 to dimF do begin
		if (vecA[i].nro_partida < min.nro_partida) then begin
			min:= vecA[i];
			pos:= i;
		end;
		
	leer(vec[i],vecA[pos]);
end;

procedure calcular_minimoF(var vec:vectorF;var vecA:vectorAF; var min: integer)
var
i: integer;
pos: integer;
begin
	for i := 1 to dimF do begin
		if (vecA[i].nro_partida < min.nro_partida) then begin
			min:= vecA[i];
			pos:= i;
		end;
		
	leer(vec[i],vecA[pos]);
end;

procedure generar_maestro(var maestro:archivo_maestro;var vecN:vectorN ;var vecF:vectorF);
var
	vecNA:vectorAN;
	vecFA:vectorAF;
	aux: mestro;
	i: integer;
	minF: fallecimiento;
	minN: fallecimiento;
begin
	rewrite(maestro);
	for i:= 1 to dimF do begin
		reset(vecN[i]);
		leer(vecN[i],vecNA[i]);
		reset(vecF[i]);
		leer(vecF[i],vecFA[i]);
	end;
	minF.nro_partida:= valor_alto;
	minN.nro_partida:= valor_alto;
	calcular_minimoF(vecF,vecFA,minF);
	calcuar_minimoN(vecN,vecNA,minN);
	while( minN.nro_partida <> valor_alto) do begin
		if (minN.nro_partida = minF.nro_partida) then
			crear_archivo_maestro_igual(minF,minN,aux);
			calcular_minimoF(vecF,vecFA,minF);
		else 
			crear_maestro(minN,aux);
		write(maestro,aux);
		calcuar_minimoN(vecN,vecNA,minN);
	end;
		
					

		
		(*nro partida nacimiento, nombre, 
apellido, dirección detallada (calle, nro, piso, depto, ciudad), matrícula del médico, nombre y 
apellido de la madre, DNI madre, nombre y apellido del padre, DNI del padre y si falleció, 
además matrícula del médico que firma el deceso, fecha y hora del deceso y lugar. *)










