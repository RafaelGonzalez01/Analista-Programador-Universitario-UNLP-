program p3_ej8;

const

	valor_alto = 9999;
	
type

	distribucion = record
		nombre: string;
		ano: integer;
		num: integer;
		cant: integer;
		desc: string;
	end;
	
	arch_distribucion = file of distribucion;
	
procedure leer(var arch: arch_distribucion; var reg: distribucion);
begin
	if (not(EOF(arch))) then
		read(arch,reg)
	else
		reg.num := valor_alto;
end;
	
function buscardistribucion(var arch: arch_distribucion; nombre: string): integer;
var
	reg: distribucion;
	encontro: boolean;
begin
	reset(arch);
	leer(arch,reg);
	encontro:= false;
	while(reg.num <> valor_alto) and (not(encontro)) do begin
		if (reg.nombre = nombre) then begin
			encontro:= true;
			if (reg.cant > 0) then begin
				buscardistribucion:= filepos(arch)-1;
				writeln('se econtro el archivo en la posicion: ',buscardistribucion);
			end
			else
				writeln('el archivo se encuentra eliminado.');
		end;
		leer(arch,reg);
	end;
	if (not(encontro)) then
		buscardistribucion:= -1;
end;

procedure altadistribucion(var arch: arch_distribucion; nue: distribucion);
var
	cabecera: distribucion;
begin
	if buscardistribucion(arch,nue.nombre) <> -1 then
		writeln('ya existe la distribucion')
	else begin
		reset(arch);
		leer(arch,cabecera);
		if (cabecera.cant < 0) then begin
			seek(arch,cabecera.cant*-1);
			read(arch,cabecera);
			seek(arch,filepos(arch)-1);
			write(arch,nue);
			seek(arch,0);
			write(arch,cabecera);
		end
		else begin
			seek(arch,filesize(arch));
			write(arch,nue);
		end;
		writeln('archivo agregado correctamente');
	end;
end;

procedure bajadistribucion(var arch: arch_distribucion; baja: string);
var
	cabecera: distribucion;
	nue: distribucion;
	pos: integer;
begin
	pos:= buscardistribucion(arch,baja);
	if pos = -1 then
		writeln('no se encuentra la distribucion')
	else begin
		reset(arch);
		leer(arch,cabecera);
		seek(arch,pos);
		leer(arch,nue);
		nue.cant := pos*-1;
		seek(arch,filepos(arch)-1);
		write(arch,cabecera);
		seek(arch,0);
		write(arch,nue);
	end;
end;
		
		
		
		
		
			
	
