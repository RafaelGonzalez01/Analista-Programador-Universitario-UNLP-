program p2_ej5;

const

	valor_alto = 9999;
	
type
	
	fecha = record
		dia: integer;
		mes: integer;
		ano: integer;
	end;
	
	log = record
		cod: integer;
		fecha: fecha;
		tiempo: integer;
	end;
	
	maestro = record
		cod: integer;
		fecha: fecha;
		tiempo_total: integer;
	end;
	
	arch_maestro = file of maestro;
	
	detalles = file of log;
	
	array_detalles = array [1..5] of detalles;
	
	array_log = array [1..5] of log;
	
procedure leer (var arch: detalles; var reg: log);
begin
	if (not(EOF(arch))) then
		read(arch,reg)
	else
		reg.cod := valor_alto;
end;

procedure minimo (var reg_detalles: array_detalles; var reg_log: array_log; var min: log);
var
	i: integer;
	pos: integer;
begin
	for i := 1 to 5 do begin
		if reg_log[i].cod < min.cod then begin
			min:= reg_log[i];
			pos:= i;
		end;
	end;
	leer(reg_detalles[pos],reg_log[pos]);
end;

procedure generar_maestro (var reg_detalles: array_detalles; var maestro: arch_maestro);
var
	reg_log: array_log;
	i: integer;
	reg: log;
	reg_mae: maestro;
	act: integer;
	fech : fecha;
begin

	assign(maestro,'maestro');
	rewrite(maestro);
	
	for i:= 1 to 5 do begin
		reset(reg_detalles[i]);
		leer(reg_detalles[i],reg_log[i]);
	end;
	
	minimo (reg_detalles,reg_log,reg);
	while (reg.cod <> valor_alto) do begin
		act:= reg.cod;
		reg_mae.cod := act;
		while (reg.cod <> valor_alto) and (reg.cod = act) do begin
			fech:= reg.fecha;
			reg_mae.fecha := fech;
			reg_mae.tiempo_total := 0; 
			while (reg.cod <> valor_alto) and (reg.cod = act) and (reg.fecha.dia = fech.dia) and (reg.fecha.mes = fech.mes) and (reg.fecha.ano = fech.ano) do begin
				reg_mae.tiempo_total:= reg_mae.tiempo_total + reg.tiempo;
				minimo(reg_detalles,reg_log,reg);
			end;
			write(maestro,reg_mae);
		end;		
	end;
	
	close(maestro);
	
end;

var

	reg_detalles : array_detalles;
	amaestro: arch_maestro;
	i: integer;

begin

	assign(reg_detalles[1],'detale 1');
	assign(reg_detalles[2],'detale 2');
	assign(reg_detalles[3],'detale 3');
	assign(reg_detalles[4],'detale 4');
	assign(reg_detalles[5],'detale 5');
	
	
	generar_maestro(reg_detalles,amaestro);
	
	for i:= 1 to 5 do begin
		close(reg_detalles[i]);
	end;

end.
