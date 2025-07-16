program p2_ej19;

const

	valor_alto = 9999;
	
type

	familiar = record
		nombre: string;
		apellido: string;
		dni: integer;
	end;
	
	fecha = record
		dia: integer;
		mes: integer;
		ano: integer;
	end;
	
	tiempo = record
		segundo: integer;
		minuto: integer;
		hora: integer;
	end;

	nacimiento = record
		nro: integer;
		nombre: string;
		apellido: string;
		direccion: string;
		matricula: integer;
		madre: familiar;
		padre: familiar;
	end;
	
	fallecimiento = record
		nro: integer;
		dni: integer;
		nombre: string;
		apellido: string;
		matricula: integer;
		fecha: fecha;
		hora: tiempo;
		lugar: string;
	end;
	
	arch_nacimiento = file of nacimiento;
	arch_fallecimiento = file of fallecimiento;
	
	vec_arch_nacimiento = array [1..50] of arch_nacimiento;
	vec_arch_fallecimiento = array [1..50] of arch_fallecimiento;
	
	vec_nacimiento = array [1..50] of nacimiento;
	vec_fallecimiento = array [1..50]  of fallecimiento;
	
	maestro = record
		nro: integer;
		nombre: string;
		apellido: string;
		direccion: string;
		matricula: integer;
		madre: familiar;
		padre: familiar;
		fallecio: boolean;
		matricula_fall: integer;
		fecha: fecha;
		hora: tiempo;
		lugar: string;
	end;
	
	arch_maestro = file of maestro;
		
procedure leerN(var arch: arch_nacimiento; var reg:nacimiento);
begin
	if (not(EOF(arch))) then
		read(arch,reg)
	else
		reg.nro := valor_alto;
end;

procedure leerF(var arch: arch_fallecimiento; var reg:fallecimiento);
begin
	if (not(EOF(arch))) then
		read(arch,reg)
	else
		reg.nro := valor_alto;
end;

procedure minimoN(var varch_nac: vec_arch_nacimiento; var v_nac: vec_nacimiento;var reg: nacimiento);
var
	i: integer;
	pos: integer;
begin
	for i:= 1 to 50 do begin
		if (v_nac[i].nro) < (reg.nro) then begin
			pos:= i;
			reg:= v_nac[pos];
		end;
	end;
	leerN(varch_nac[pos],v_nac[pos]);
end;

procedure minimoF(var varch_fall: vec_arch_fallecimiento; var v_fall: vec_fallecimiento;var reg: fallecimiento);
var
	i: integer;
	pos: integer;
begin
	for i:= 1 to 50 do begin
		if (v_fall[i].nro) < (reg.nro) then begin
			pos:= i;
			reg:=v_fall[pos];
		end;
	end;
	leerF(varch_fall[pos],v_fall[pos]);
end;

procedure generar_maestro(var varch_nac: vec_arch_nacimiento; var varch_fall: vec_arch_fallecimiento; var arch_mae: arch_maestro);
var
	v_nac: vec_nacimiento;
	v_fall: vec_fallecimiento;
	i: integer;
	regn: nacimiento;
	regf: fallecimiento;
	mae: maestro;
begin
	assign(arch_mae,'maestro');
	rewrite(arch_mae);
	
	for i:= 1 to 50 do begin
		reset(varch_nac[i]);
		reset(varch_fall[i]);
		leerN(varch_nac[i],v_nac[i]);
		leerF(varch_fall[i],v_fall[i]);
	end;
	regn.nro:= valor_alto;
	regf.nro:= valor_alto;
	
	minimoN(varch_nac,v_nac,regn);
	minimoF(varch_fall,v_fall,regf);
	while (regn.nro <> valor_alto) do begin
		while(regn.nro <> valor_alto) and (regn.nro <> regf.nro) do begin
			mae.nro:= regn.nro;
			mae.nombre:= regn.nombre;
			mae.apellido:= regn.apellido;
			mae.direccion:= regn.direccion;
			mae.matricula:= regn.matricula;
			mae.madre:= regn.madre;
			mae.padre:= regn.padre;
			write(arch_mae,mae);
			minimoN(varch_nac,v_nac,regn);
		end;
		if (reg.nro <> valor_alto) and (regn.nro = regf.nro) then begin
			mae.nro:= regn.nro;
			mae.nombre:= regn.nombre;
			mae.apellido:= regn.apellido;
			mae.direccion:= regn.direccion;
			mae.matricula:= regn.matricula;
			mae.madre:= regn.madre;
			mae.padre:= regn.padre;
			mae.fallecio:= true;
			mae.matricula_fall:= regf.matricula;
			mae.fecha:= regf.fecha;
			mae.hora:= regf.hora;
			mae.lugar:= regf.lugar;
			write(arch_mae,mae);
			minimoF(varch_fall,v_fall,regf);
		end;
	end;
	close(arch_mae);
end;	

var
	varch_nac: vec_arch_nacimiento;
	varch_fall: vec_arch_fallecimiento;
	arch_mae: arch_maestro;
	i: integer;
	texton: string;
	textof: string;
	numero: string;
begin
	texton := 'detalleN:';
	textof := 'detalleF:';
	for i:= 1 to 50 do begin
		Str(i, numero);
		texton:=texton+numero;
		textof:=textof+numero;
		assign(varch_nac[i],texton);
		assign(varch_fall[i],textof);
	end;
	
	generar_maestro(varch_nac,varch_fall,arch_mae);
	
	for i:= 1 to 50 do begin
		close(varch_nac[i]);
		close(varch_fall[i]);
	end;
end.
	



