program p3_ej6;

const

	valor_alto = 9999;
	
type

	prenda = record
		cod: integer;
		desc: string;
		colores: string;
		tipo: string;
		stock: integer;
		precio: real;
	end;
	
	obsoleta = record
		cod: integer;
	end;
	
	arch_obsoleta = file of obsoleta;
	arch_prenda = file of prenda;

procedure  leerM(var arch: arch_prenda; var reg: prenda);
begin
	if(not(EOF(arch))) then
		read(arch,reg)
	else
		reg.cod := valor_alto;
end;

procedure  leerD(var arch: arch_obsoleta; var reg: obsoleta);
begin
	if(not(EOF(arch))) then
		read(arch,reg)
	else
		reg.cod := valor_alto;
end;

procedure bajas(var archM: arch_prenda; var archD: arch_obsoleta);
var
	det: obsoleta;
	mae: prenda;
	encontro: boolean;
begin
	reset(archD);
	leerD(archD,det);
	while(det.cod <> valor_alto) do begin
		reset(archM);
		leerM(archM,mae);
		encontro:= false;
		while (det.cod <> mae.cod) and (mae.cod <> valor_alto) and (not(encontro)) do begin
			if (det.cod = mae.cod) then begin
				mae.stock := mae.stock *-1;
				seek(archM,filepos(archM)-1);
				write(archM,mae);
				mae.cod := valor_alto;
				encontro:= true;
			end;
			leerM(archM,mae);
		end;
		leerD(archD,det);
	end;
end;

procedure efectivizar_bajas(var archM: arch_prenda);
var
	mae: prenda;
	nue_arch: arch_prenda;
begin
	assign(nue_arch,'auxiliar');
	rewrite(nue_arch);
	reset(archM);
	leerM(archM,mae);
	while (mae.cod <> valor_alto) do begin
		if (mae.stock >= 0) then
			write(nue_arch,mae);
		leerM(archM,mae);
	end;
	close(archM);
	close(nue_arch);
	rename(archM,'maestro_old');
	rename(nue_arch,'maestro');
end;
		
	
	
	
	
