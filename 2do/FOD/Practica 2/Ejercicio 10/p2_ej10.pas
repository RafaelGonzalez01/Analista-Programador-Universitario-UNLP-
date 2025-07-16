program p2_ej10;


const

	valor_alto = 9999;
	
type

	
	mesa = record
		cod_prov:integer;
		cod_loc: integer;
		num: integer;
		cant: integer;
	end;
	
	maestro = file of mesa;
	
procedure leer(var arch:maestro; var reg:mesa);
begin
	if(not(EOF(arch))) then
		read(arch,reg)
	else
		reg.cod_prov := valor_alto;
end;

procedure contabilizar(var arch:maestro);
var
	reg: mesa;
	prov_act: integer;
	loc_act: integer;
	cant_loc: integer;
	cant_prov: integer;
	cant_total: integer;
begin
	reset(arch);
	leer(arch,reg);
	cant_total:= 0;
	while (reg.cod_prov <> valor_alto) do begin
		prov_act:= reg.cod_prov;
		cant_prov:= 0;
		writeln('Codigo de Provincia: ',prov_act);
		writeln('Codigo de Localidad | Total de votos');
		while (reg.cod_prov = prov_act) do begin
			cant_loc:= 0;
			loc_act := reg.cod_loc;
			while (reg.cod_prov = prov_act) and (reg.cod_loc = loc_act) do begin
				cant_loc := cant_loc + reg.cant;
				leer(arch,reg);
			end;
			writeln('      ',loc_act,'      |      ',cant_loc);
			cant_prov:= cant_prov + cant_loc;
		end;
		writeln('total de votos Provincia: ',cant_prov);
		cant_total:= cant_total + cant_prov;
	end;
	writeln('total general de votos: ',cant_total);
end;

procedure imprimir (var arch: maestro);
var
	reg: mesa;
begin
	reset(arch);
	leer(arch,reg);
	while(reg.cod_prov <> valor_alto) do begin
		writeln('porv:',reg.cod_prov,'loc:',reg.cod_loc,'cant:',reg.cant);
		leer(arch,reg);
	end;
end;

var
	arch: maestro;
begin
	assign(arch,'maestro');
	imprimir(arch);
	contabilizar(arch);
	close(arch);
end.
		
