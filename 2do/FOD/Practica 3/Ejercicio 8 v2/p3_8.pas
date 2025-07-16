program p3_8;

const

	valor_alto = 9999;
	
type

	str = string[20];
	
	distribucion = record
		nombre: str;
		ano: integer;
		numero: integer;
		cant: integer;
		desc: str;
	end;
	
	archivo_distribucion = file of distribucion;
	
procedure leer(var archivo:archivo_distribucion; var reg:distribucion);
begin
	if(not(EOF(archivo))) then
		read(archivo,reg)
	else
		reg.numero := valor_alto;
end;

procedure leer_distribucion(var reg: distribucion);
begin
	writeln('ingrese el nombre de la distribucion: ');
	read(reg.nombre);
	writeln('ingrese el año de la distribucion: ');
	read(reg.ano);
	writeln('ingrese el numero de la distribucion: ');
	read(reg.numero);
	writeln('ingrese la cantidad de desarolladores: ');
	read(reg.cant);
	writeln('ingrese la descripcion de la distribucion: ');
	read(reg.desc);
end;

procedure crear_maestro(var archivo:archivo_distribucion);
var
	reg: distribucion;
begin
	rewrite(archivo);
	reg.numero:= 0;
	write(archivo,reg);
	writeln('se ingresaran distribuciones hasta que se ingrese una con el codigo := 9999');
	while(reg.numero <> valor_alto) do begin
		leer_distribucion(reg);
		write(archivo,reg);
	end;
	close(archivo);
end;
	
function buscar_distribucion(var archivo: archivo_distribucion; nombre: str): integer;
var
	reg: distribucion;
	pos: integer;
begin
	reset(archivo);
	leer(archivo,reg);
	while((reg.numero <> valor_alto) and (reg.nombre <> nombre)) do begin
		leer(archivo,reg);
	end;
	if (reg.nombre = nombre) then
		pos:= filepos(archivo) - 1
	else
		pos:= -1;
	close(archivo);
	buscar_distribucion:= pos;
end;

procedure alta_distribucion(var archivo: archivo_distribucion; reg: distribucion);
var
	cabecera: distribucion;
begin
	if buscar_distribucion(archivo,reg.nombre) <> -1 then
		writeln('ya existe la distribucion.')
	else begin
		reset(archivo);
		leer(archivo,cabecera);
		if cabecera.numero < 0 then begin
			seek(archivo,cabecera.numero * -1);
			read(archivo,cabecera);
			seek(archivo,filepos(archivo) - 1);
			write(archivo,reg);
			seek(archivo,0);
			write(archivo,cabecera);
		end
		else begin
			seek(archivo,filesize(archivo));
			write(archivo,reg);
		end;
		close(archivo);
	end;
end;

procedure baja_distribucion(var archivo: archivo_distribucion; nombre: str);
var
	reg: distribucion;
	eliminado: distribucion;
	pos: integer;
begin
	pos := buscar_distribucion(archivo,nombre);
	if pos = -1 then
		writeln('distribucion no existente')
	else begin
		reset(archivo);
		leer(archivo,reg);
		seek(archivo,pos);
		read(archivo,eliminado);
		seek(archivo,pos);
		write(archivo,reg);
		seek(archivo,0);
		eliminado.numero := eliminado.numero * - 1;
		write(archivo,eliminado);
		close(archivo);
	end;
end;
