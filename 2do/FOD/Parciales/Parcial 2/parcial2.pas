program parcial2;

const
	
	valor_alto = 9999;
	
type

	maestro = record
	 cod: integer;
	 nombre: string;
	 cant_jug: integer;
	 cant_gan: integer;
	 cant_emp: integer;
	 cant_perd: integer;
	 cant_pun: integer;
	end;
	
	fecha = record
		dia: integer;
		mes: integer;
		ano: integer;
	end;
	
	partido = record
		cod: integer;
		fecha: integer;
		cant_pun: integer;
		cod_rival: integer;
	end;
	
	arch_partido = file of partido;
	arch_maestro = file of maestro;
	
	varch_partido = array[1..12] of arch_partido;
	vreg_partido = array[1..12] of partido;
	
procedure leerD(var arch: arch_partido;var reg: partido);
begin
	if(not(EOF(arch))) then
		read(arch,reg)
	else
		reg.cod := valor_alto;
end;

procedure leerM(var arch: arch_maestro;var reg: maestro);
begin
	if(not(EOF(arch))) then
		read(arch,reg)
	else
		reg.cod := valor_alto;
end;

procedure minimo(var varch: varch_partido; var vreg: vreg_partido; var reg: partido);
var
	i: integer;
	pos: integer;
begin
	reg.cod:= valor_alto;
	pos := -1;
	for i:= 1 to 12 do begin
		if (vreg[i].cod < reg.cod) then begin
			pos:= i;
			reg:= vreg[pos];
		end;
	end;
	if (pos <> -1) then
		leerD(varch[pos],vreg[pos]);
end;

procedure cargar_merge(var merge: arch_maestro; var varch: varch_partido; var max_cod: integer; var max_pun: integer);
var
	i:integer;
	vreg: vreg_partido;
	reg: partido;
	mer: maestro;
	pun_act: integer;
	cod_act: integer;
	texto: string;
begin
	writeln('ingrese el nombre de archivo merge:');
	readln(texto);
	assign(merge,texto);
	rewrite(merge);

	for i:= 1 to 12 do begin
		reset(varch[i]);
		leerD(varch[i],vreg[i]);
	end;
	minimo(varch,vreg,reg);
	max_pun:= 0;
	
	while (reg.cod <> valor_alto) do begin
		mer.cod := reg.cod;
		cod_act := reg.cod;
		mer.cant_pun:= 0;
		mer.cant_jug:= 0;
		mer.cant_gan:= 0;
		mer.cant_emp:= 0;
		mer.cant_perd:= 0;
		pun_act:= 0;
		while (mer.cod = reg.cod) do begin
			mer.cant_jug:= mer.cant_jug + 1;
			mer.cant_pun:= mer.cant_pun + reg.cant_pun;
			if (reg.cant_pun = 3) then
				mer.cant_gan:= mer.cant_gan + 1
			else
				if (reg.cant_pun = 1) then
					mer.cant_emp := mer.cant_emp + 1
				else
					mer.cant_perd:= mer.cant_perd + 1;
			minimo(varch,vreg,reg);
		end;
		pun_act := mer.cant_pun;
		if (pun_act > max_pun) then begin
			max_pun := pun_act;
			max_cod := cod_act;
		end;
		write(merge,mer);
	end;
	
	for i:= 1 to 12 do begin
		close(varch[i]);
	end;
	
end;		

procedure actualizar_maestro(var maestro: arch_maestro; var merge: arch_maestro; varch: varch_partido);
var
	regmae: maestro;
	regmer: maestro;
	texto: string;
	max_cod: integer;
	max_pun: integer;
	
begin

	cargar_merge(merge,varch,max_cod,max_pun);

	writeln('ingrese el nombre de archivo maestro:');
	readln(texto);
	assign(maestro,texto);
	
	leerM(merge,regmer);
	leerM(maestro,regmae);
	while (regmer.cod <> valor_alto) do begin
		while(regmae.cod <> valor_alto) and (regmae.cod <> regmer.cod) do begin
			leerM(maestro,regmae);
		end;
		if(regmae.cod = regmer.cod) then begin
			regmae.cant_jug := regmae.cant_jug + regmer.cant_jug;
			regmae.cant_gan:= regmae.cant_gan + regmer.cant_gan;
			regmae.cant_emp:= regmae.cant_emp + regmer.cant_emp;
			regmae.cant_perd:= regmae.cant_perd + regmer.cant_perd;
			regmae.cant_pun:= regmae.cant_pun + regmer.cant_pun;
			seek(maestro,filepos(maestro)-1);
			write(maestro,regmae);
			if (regmae.cod = max_cod) then
				writeln('el equipo que mas puntos saco durante el año es: ',regmae.nombre,' con: ',max_pun,' puntos.');
		end;
		leerM(merge,regmer);
	end;
	
	close(maestro);
end;

procedure iniciarvarch(var varch: varch_partido);
var
	i: integer;
	texto: string;
	numero: string;
begin
	texto := 'mes';
	for i:= 1 to 12 do begin
		Str(i, numero);
		assign(varch[i],texto + numero);
	end;
end;

var
	merge: arch_maestro;
	mae: arch_maestro;
	varch: varch_partido;
begin
	iniciarvarch(varch);
	actualizar_maestro(mae,merge,varch);
	close(merge);
end.
