program practica1_3;

uses
	SysUtils;
type

	empleado = record
		num:integer;
		apellido:string;
		nombre:string;
		edad:integer;
		dni:integer;
	end;
	empleados = file of empleado;
	
procedure imprimir(x:empleado);

begin

	writeln('apelldio: ',x.apellido,', nombre: ',x.nombre,', numero: ',x.num,', edad: ',x.edad,', dni: ',x.dni);

end;
	
procedure buscar_por_apellido(x:string;var y:empleados);
var
	e_actual: empleado;
begin
	
	
	seek(y,0);	
	while (not EOF(y)) do begin
		read(y,e_actual);
		if (e_actual.apellido = x) then
			imprimir(e_actual);
	end;

end;

procedure buscar_por_nombre(x:string;var y:empleados);
var
	e_actual: empleado;
begin
	
	seek(y,0);	
	while (not EOF(y)) do begin
		read(y,e_actual);
		if (e_actual.nombre = x) then
			imprimir(e_actual);
	end;

end;

procedure i(var archivo:empleados);

var

	x: string;
	y: integer;

begin

	writeln('ingrese 1: si quiere buscar un empleado por apellido o 2: si quiere buscar un empleado por nombre: ');
	readln(y);
	if y = 1 then begin
		writeln('ingrese el apellido del empleado a buscar: ');
		readln(x);
		buscar_por_apellido(x,archivo)
	end
	else
		if y = 2 then begin
			writeln('ingrese el nombre del empleado a buscar: ');
			readln(x);
			buscar_por_nombre(x,archivo);
		end
		else
			writeln('numero incorecto');

end;

procedure ii(var archivo:empleados);
var
	actual:empleado;
begin
	seek(archivo,0);
	while (not EOF(archivo)) do begin
		read(archivo,actual);
		imprimir(actual);
	end;
end;

procedure iii(var archivo:empleados);
var
	actual:empleado;
begin
	seek(archivo,0);
	while (not EOF(archivo)) do begin
		read(archivo,actual);
		if (actual.edad > 70) then
			imprimir(actual);
	end;
end;

procedure agregar_empleado(var archivo:empleados);
var
	actual:empleado;
	x: empleado;
begin
	seek(archivo,0);
	writeln('ingrese el apellido del nuevo empleado: ');
	readln(x.apellido);
	writeln('ingrese el nombre del empleado: ');
	readln(x.nombre);
	writeln('ingrese el numero del empleado: ');
	readln(x.num);
	writeln('ingrese la edad del empleado: ');
	readln(x.edad);
	writeln('ingrese el dni del empleado: ');
	readln(x.dni);
	write(archivo,x);
	read(archivo,actual);
	while (not EOF(archivo)) and (x.num <> actual.num) do begin
		read(archivo,actual);
	end;
	if (EOF(archivo) and (x.num <> actual.num)) then
		write(archivo,x);			
end;
	
function menu_1:integer;
var
	x:integer;
begin
	x:= -1;
	while ((x > 6) or (x < 0)) do begin
		writeln('0: cerrar programa y guardar datos 1: ingresar empleados 2:busqueda de empleados');
		writeln('3:mostrar todos los empleados 4: busqueda mayores a 70 5: ingresar un empleado nuevo');
		writeln('6: modificar la edad de un empleado');
		readln(x);
	end;
	menu_1:= x;
end;

procedure modificar_edad(var archivo:empleados);
var
	num: integer;
	apellido: string;
	actual:empleado;
	edad: integer;
begin
	writeln('ingrese el numero del empleado: ');
	readln(num);
	writeln('ingrese el apellido del empleado: ');
	readln(apellido);
	seek(archivo,0);
	read(archivo,actual);
	while (not EOF(archivo)) and ((actual.num <> num) or (actual.apellido <> apellido)) do begin
		read(archivo,actual);
	end;
	if ((num = actual.num) and (apellido = actual.apellido)) then begin
		writeln('ingrese la nueva edad del empleado: ');
		read(edad);
		actual.edad:=edad;
		seek(archivo,filepos(archivo)-1);
		write(archivo,actual);
	end
	else
		writeln('no se encontro el empleado');
end;
	
procedure exportar_todos_empleados(var archivo:empleados);
var

begin
	
		
end;
	
var

	archivo_em : empleados;
	x : empleado;
	y: string;
	indice: integer;

begin

	writeln('ingrese el nombre del archivo');
	readln(y);
	if not FileExists(y) then begin
		assign(archivo_em,y);
		rewrite(archivo_em);
	end
	else begin
		assign(archivo_em,y);
		reset(archivo_em);
		indice:= -1;
	end;
	while indice <> 0 do begin
		indice:= menu_1;
		if (indice = 1) then begin
			seek(archivo_em,filesize(archivo_em));
			writeln('se ingresaran empleados hasta ingresar el que tenga apellido fin, ingrese el apellido del primer empleado: ');
			readln(x.apellido);
			while (x.apellido <> 'fin') do begin
				writeln('ingrese el nombre del empleado: ');
				readln(x.nombre);
				writeln('ingrese el numero del empleado: ');
				readln(x.num);
				writeln('ingrese la edad del empleado: ');
				readln(x.edad);
				writeln('ingrese el dni del empleado: ');
				readln(x.dni);
				write(archivo_em,x);
				writeln('ingrese el apellido del siguiente empleado: ');
				readln(x.apellido);
			end;
		end
		else
			if (indice = 2) then
				i(archivo_em)
			else
				if (indice = 3) then
					ii(archivo_em)
				else
					if (indice = 4) then
						iii(archivo_em)
				else
					if (indice = 5) then
						agregar_empleado(archivo_em)
				else
					if (indice = 6) then
						modificar_edad(archivo_em);
					
	end;
	
	close(archivo_em);
	
end.
