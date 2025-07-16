program p3_3;

const 
	
	valor_alto = 9999;

type
	
	novela = record
		cod : integer;
		genero : string;
		nombre : string;
		duracion : string;
		director : string;
		precio : real;
	end;
	
	archivo_novela = file of novela;
	
	novelas = file of text;
	
procedure leer_novela(var reg:novela);
begin
	writeln('ingrese el codigo de la novela: ');
	read(reg.cod);
	writeln('ingrese el genero de la novela: ');
	read(reg.genero);
	writeln('ingrese el nombre de la novela: ');
	read(reg.nombre);
	writeln('ingrese la duracion de la novela: ');
	read(reg.duracion);
	writeln('ingrese el director de la novela: ');
	read(reg.director);
	writeln('ingregas el precio de la novela: ');
	read(reg.precio);
end;

procedure cargar_archivo(var archivo: archivo_novela);
var
	aux: novela;
begin
	//como era esto?, hay que ingresar el nombre por teclado
	assign (archivo,'novelas');
	rewrite(archivo);
	
	//creo la cabecera y la escribo en el archivo
	aux.cod := 0;
	write(archivo,aux);
	
	writeln('se ingresaran novelas hasta una con el codigo 9999');
	leer_novela(aux);
	write(archivo,aux);
	while (aux.cod <> valor_alto) do begin
		leer_novela(aux);
		write(archivo,aux);
	end;
	
	close(archivo);
end;

procedure alta_novela(var archivo: archivo_novela);
var
	cabecera: novela;
	reg: novela;
	reg_aux: novela;
begin
	reset(archivo);
	leer_novela(reg);
	
	read(archivo,cabecera);
	//puede no conciderar mas de un eliminado
	if (cabecera.cod < 0) then begin
		seek(archivo,cabecera.cod * -1);
		read(archivo,reg_aux);
		seek(archivo,filepos(archivo)-1);
		write(archivo,reg);
		seek(archivo,0);
		write(archivo,reg_aux);
	end
	else
		seek(archivo,filesize(archivo));
	
	close(archivo);
end;
	
procedure modificar_novela(var archivo: archivo_novela);
var
	reg: novela;
	cod: integer;
	encontro: boolean;
begin
	reset(archivo);
	
	encontro := false;
	writeln('ingrese el codigo de la novela a modificar: ');
	read(cod);
	while (not EOF(archivo) and not(encontro)) do begin
		read(archivo,reg);
		//si encuentro modifico
		if (reg.cod = cod) then begin
			writeln('ingrese el nuevo nombre de la novela a modificar: ');
			read(reg.nombre);
			seek(archivo,filepos(archivo)-1);
			write(archivo,reg);
			encontro:= true;
		end;
	end;
	if (encontro = false) then
		writeln('no se pudo encontrar la novela.');
	close(archivo);
end;

procedure eliminar_novela(var archivo: archivo_novela);
var
	cabecera: novela;
	reg: novela;
	cod: integer;
	encontro: boolean;
begin
	writeln('ingrese el codigo de la novela a eliminar: ');
	read(cod);
	
	reset(archivo);
	read(archivo,cabecera);
	encontro:= false;
	
	while(not(EOF(archivo)) and not(encontro)) do begin
		read(archivo,reg);
		if (reg.cod = cod) then begin
			encontro := true;
			reg.cod := filepos(archivo) -1 * -1;
			seek(archivo,filepos(archivo) - 1);
			write(archivo,cabecera);
			seek(archivo,0);
			write(archivo,reg);
		end;
	end;
	close(archivo);
end;

procedure crear_texto(var archivo: archivo_novela);
begin
//implementar
end;

begin

end.
