program p3_2;

type

	asistente = record
		nro : integer;
		apellido : string;
		nombre : string;
		email : string;
		tel : integer;
		dni : integer;
	end;
	
	archivo_asistente = file of asistente;

procedure leer_asistente(var reg: asistente);
begin
	writeln('Ingrese el nro de asistente: ');
	read(reg.nro);
	writeln('Ingrese el apellido de asistente: ');
	read(reg.apellido);
	writeln('Ingrese el nombre de asistente: ');
	read(reg.nombre);
	writeln('Ingrese el email de asistente: ');
	read(reg.email);
	writeln('Ingrese el telefono de asistente: ');
	read(reg.tel);
	writeln('Ingrese el dni de asistente: ');
	read(reg.dni);
end;

procedure cargar_archivo(var archivo : archivo_asistente);
var
	reg: asistente;
	i: integer;
begin
	rewrite(archivo);
	for i:= 0 to 15 do begin
		leer_asistente(reg);
		write(archivo,reg);
	end;
end;

procedure eliminacion_logica(var archivo: archivo_asistente);
var
	log: string;
	reg: asistente;
begin
	reset(archivo);
	log := '@';
	while (not(EOF(archivo))) do begin
		read(archivo,reg);
		if (reg.nro < 1000) then begin
			seek(archivo,filepos(archivo)-1);
			reg.apellido := log + reg.apellido;
			write(archivo,reg);
		end;
	end;
end;

var
	archivo: archivo_asistente;
begin
	cargar_archivo(archivo);
	eliminacion_logica(archivo);
end.
