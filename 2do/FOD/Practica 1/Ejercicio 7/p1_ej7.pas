program p1_ej7;

const

	valor_alto = 9999;

type

	novela = record
		cod: integer;
		nombre: string;
		genero: string;
		precio: real;
	end;
	
	archivo = file of novela;
	texto = text;
	
procedure leer_novela(var reg: novela);
begin
	writeln('ingrese el codigo de la novela: ');
	read(reg.cod);
	writeln('ingrese el nombre de la novela: ');
	read(reg.nombre);
	writeln('ingrese el genero de la novela: ');
	read(reg.genero);
	writeln('ingrese el precio de la novela: ');
	read(reg.precio);
end;

procedure leerT(var arch:texto; var reg:novela);
begin
	if (not(EOF(arch))) then
		readln(arch,reg.cod,reg.precio,reg.genero);
		readln(arch,reg.nombre)
	else
		reg.cod := valor_alto;
end;

procedure cargar_archivo(var arch: archivo; var text: texto);
	reg: novela;
begin
	leerT(text,reg);
	while (reg.cod <> valor_alto) do begin
		writeln(arch,reg);
		leerT(text,reg);
	end;
end;

procedure
