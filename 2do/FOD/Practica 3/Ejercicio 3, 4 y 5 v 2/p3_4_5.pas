program p3_4_5;

type

	reg_flor = record 
		nombre: String[45]; 
		codigo: integer; 
	end;
	 
	tArchFlores = file of reg_flor;
	
procedure agregarFlor (var a: tArchFlores ; nombre: string; codigo:integer);
var
	reg: reg_flor;
	cabecera: reg_flor;
begin
	reg.nombre:= nombre;
	reg.codigo:= codigo;
	reset(a);
	read(a,cabecera);
	if (cabecera.codigo < 0) then begin
		seek(a,cabecera.codigo * -1);
		read(a,cabecera);
		seek(a,filepos(a)-1);
		write(a,reg);
		seek(a,0);
		write(a,cabecera);
	end 
	else 
	seek(a,filesize(a));
	write(a,reg);
	close(a);
end;

//listar omitiendo flores eliminadas

procedure eliminarFlor (var a: tArchFlores; flor:reg_flor); 
var
	cabecera: reg_flor;
	aux: reg_flor;
	encontro: boolean;
begin	
	reset(a);
	encontro := false;
	read(a,cabecera);
	while (not(EOF(archivo)) and not(encontro)) do begin
		read(a,aux);
		if (aux.nombre = flor.nombre and aux.codigo = flor.codigo) then begin
			encontro := true;
			seek(a,filepos(a)-1);
			write(a,cabecera);
			seek(a,0);
			aux.cod := aux.cod * -1;
			write(a,aux);
		end;
	end;
end;
