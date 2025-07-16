program p3_ej4;

const
	
	valor_alto = 9999;
	
type

	reg_flor = record 
		nombre: String[45]; 
		codigo: integer; 
	end;
	 
	tArchFlores = file of reg_flor;
	
procedure leer(var arch: tArchFlores; var reg: reg_flor);
begin
	if(not(EOF(arch))) then
		read(arch,reg)
	else
		reg.codigo := valor_alto;
end;

procedure agregarFlor (var a: tArchFlores ; nombre: string; codigo:integer);
var
	reg : reg_flor;
	cabecera : reg_flor;
begin
	reset(a);
	leer(a,cabecera);
	reg.nombre:= nombre;
	reg.codigo:= codigo;
	if (cabecera.codigo < 0) then begin
		seek(a,cabecera.codigo*-1);
		read(a,cabecera);
		seek(a,filepos(a)-1);
		write(a,reg);
		seek(a,0);
		write(a,cabecera);
	end
	else begin
		seek(a,filesize(a));
		write(a,reg);
	end;
	close(a);
end;

procedure listar(var a: tArchFlores );
var
	reg: reg_flor;
begin
	reset(a);
	leer(a,reg);
	while (reg.codigo <> valor_alto) do begin
		if (reg.codigo > 0) then begin
			writeln('codigo: ',reg.codigo,'nombre: ',reg.nombre);
		end;
		leer(a,reg);
	end;
	close(a);
end;
		
procedure eliminarFlor (var a: tArchFlores; flor:reg_flor);
var
	reg: reg_flor;
	cabecera: reg_flor;
	encontro: boolean;
	pos_borrar: integer;
begin
	reset(a);
	leer(a,cabecera);
	reg:= cabecera;
	encontro:= false;
	while(reg.codigo <> valor_alto) and (not(encontro)) and (reg.codigo > 0) do begin
		if(reg.codigo = flor.codigo) then begin
			seek(a,filepos(a)-1);
			write(a,cabecera);
			cabecera.codigo:= filepos(a)*-1;
			seek(a,0);
			write(a,cabecera);
			encontro:= true;
		end;
		leer(a,reg);
	end;
	close(a);
end;
