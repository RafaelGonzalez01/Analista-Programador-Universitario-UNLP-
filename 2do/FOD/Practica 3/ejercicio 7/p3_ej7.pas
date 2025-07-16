program p3_ej7.pas;

const

	valor_alto = 9999;
	
type

	especie = record
		cod: integer;
		nombre: string;
		familia: string;
		descripcion: string;
		zona: string;
	end;
	
	arch_especie = file of especie;
	
procedure leer(var arch: arch_especie; var reg: especie);
begin
	if(not(EOF(arch))) then
		read(arch,reg)
	else
		reg.cod := valor_alto;
end;

procedure eliminar(var arch: arch_especie);
var
	reg_eliminar: integer;
	reg: especie;
	elimino: boolean;
begin
	reset(arch);
	writeln('ingrese el codigo de la especie a eliminar: ');
	readln(reg_eliminar);
	elimino:= false;
	leer(arch,reg);
	while(reg.cod<>valor_alto) and (not(elimino)) do begin
		if (reg.cod = reg_eliminar) then begin
			reg.cod := reg.cod *-1;
			seek(arch,filepos(arch)-1);
			write(arch,reg);
			elimino := true;
		end;
		leer(arch,reg);
	end;
end;

procedure compactar(var arch: arch_especie);
var
	pos_final: integer;
	pos_act: integer;
	reg: especie;
	aux: especie;
begin
	reset(arch);
	pos_final:= filesize(arch);
	leer(arch,reg);
	pos_act := 0;
	while (reg.cod <> valor_alto) and (pos_act < pos_final)do begin
		if (reg.cod < 0) then begin
			seek(arch,pos_final);
			leer(arch,aux);
			seek(arch,pos_final);
			write(arch,reg);
			seek(arch,pos_act);
			write(arch,aux);
			pos_final := pos_final -1;
		end;
		leer(arch,reg);
		pos_act:= pos_act + 1;
	end;
	seek(arch,pos_final);
	truncate(arch);
end;
	
			
			
			
			
			
			
	

