program p1_ej6;

const
	
	valor_alto = 9999;

type
	
	str = string[20];

	celular = record
		cod: integer;
		nombre: str;
		desc: string;
		marca: str;
		precio: real;
		stock_min: integer;
		stock_disp: integer;
	end;
	
	archivo_celular = file of celular;
	archivo_texto = text;
	
procedure convertirCelular(var txt: archivo_texto;var reg: celular);
begin
	readln(txt,reg.cod,reg.precio,reg.marca);
	readln(txt,reg.stock_disp,reg.stock_min,reg.desc);
	readln(txt,reg.nombre);
end;
	
procedure leer(var txt:archivo_texto; var reg:celular);
begin
	if(not(EOF(txt))) then
		convertirCelular(txt,reg)
	else
		reg.cod := valor_alto;
end;

procedure leer_archivo(var arch: archivo_celular; var reg:celular);
begin
	if(not(EOF(arch))) then
		read(arch,reg)
	else
		reg.cod := valor_alto;
end;
	
procedure cargar_archivo(var arch: archivo_celular;var txt: archivo_texto);
var
	reg: celular;
	text: string;
begin
	writeln('ingrese el nombre del archivo a crear: ');
	readln(text);
	assign(arch,text);
	rewrite(arch);
	reset(txt);
	while (not(EOF(txt))) do begin
		convertirCelular(txt,reg);
		write(arch,reg);
	end;
end;

procedure listar_stock_minimo(var text: archivo_texto);
var
	reg:celular;
begin
	leer(text,reg);
	while (reg.cod <> valor_alto) do begin
		if (reg.stock_disp < reg.stock_min) then begin
			writeln('celular con stock minimo menor al stock disponible: ');
			writeln('codigo: ',reg.cod,', nombre: ',reg.nombre);
			writeln('descripcion: ',reg.desc);
			writeln('marca: ',reg.marca,', precio: ',reg.precio,', stock minimo: ',reg.stock_min,', stock disponible: ',reg.stock_disp);
		end;
		leer(text,reg);
	end;
end;

procedure listar_desc_igual(var arch: archivo_texto);
var
	reg: celular;
	texto: string;
begin
	writeln('ingrese la descripcion que desea buscar: ');
	readln(texto);
	leer(arch,reg);
	while (reg.cod <> valor_alto) do begin
		if (reg.desc = texto) then begin
			writeln('celular con descripcion igual a la ingresada: ');
			writeln('codigo: ',reg.cod,', nombre: ',reg.nombre);
			writeln('descripcion: ',reg.desc);
			writeln('marca: ',reg.marca,', precio: ',reg.precio,', stock minimo: ',reg.stock_min,', stock disponible: ',reg.stock_disp);
		end;
		leer(arch,reg);
	end;
end;

procedure exportar_archivo(var arch: archivo_celular; var txt: archivo_texto);
var
	reg: celular;
begin
	rewrite(txt);
	while (not(EOF(arch))) do begin
		read(arch,reg);;
		writeln(txt,reg.cod, reg.precio, reg.marca);
		writeln(txt,reg.stock_disp, reg.stock_min,reg.desc);
		writeln(txt,reg.nombre);
	end;
end;

procedure leer_celular(var reg:celular);
begin
	writeln('ingrese el codigo del celular: ');
	readln(reg.cod);
	if (reg.cod <> 0) then begin
		writeln('ingrese el precio del celular: ');
		readln(reg.precio);
		writeln('ingrese la marca del celular: ');
		readln(reg.marca);
		writeln('ingrese el stock disponible del celular: ');
		readln(reg.stock_disp);
		writeln('ingrese el stock minimo del celular: ');
		readln(reg.stock_min);
		writeln('ingrese la descripcion del celular: ');
		readln(reg.desc);
		writeln('ingrese el nombre del celular: ');
		readln(reg.nombre);
	end;
end;

procedure agregar(var arch: archivo_texto);
var
	reg: celular;
begin
	reset(arch);
	append(arch);
	writeln('se ingresaran celulares hasta que se lea uno con codigo 0.');
	leer_celular(reg);
	writeln(arch);
	while (reg.cod <> 0) do begin
		writeln(arch,reg.cod, reg.precio, reg.marca);
		writeln(arch,reg.stock_disp, reg.stock_min,reg.desc);
		writeln(arch,reg.nombre);
		leer_celular(reg);
	end;
end;

procedure modificar_stock(var arch: archivo_celular);
var
	reg: celular;
	cod: integer;
begin
	writeln('ingrese el codigo del celular a modificar el stock: ');
	readln(cod);
	leer_archivo(arch,reg);
	while (reg.cod <> valor_alto) do begin
		if (reg.cod = cod) then begin
			writeln('ingrese el stock del celular: ');
			readln(cod);
			reg.stock_disp := cod;
			seek(arch,filepos(arch)-1);
			write(arch,reg);
			reg.cod := valor_alto;
		end;
	end;
end;

procedure sin_stock(var arch: archivo_celular);
var
	reg: celular;
	archivoT: archivo_texto;
begin
	assign(archivoT,'SinStock.txt');
	rewrite(archivoT);
	leer_archivo(arch,reg);
	while (reg.cod <> valor_alto) do begin
		if (reg.stock_disp = 0) then begin
			
		end;
	end;
end;

procedure imprimir_menu();
begin
	writeln('ingrese uno de los siguientes numeros para ejecutar su funcion: ');
	writeln('0: cerrar el programa');
	writeln('1: cargar archivo desde texto');
	writeln('2: listar en pantalla celulares con stock menor al stock minimo');
	writeln('3: listar en pantalla celulares con una descripcion igual a la ingresada');
	writeln('4: exportar el archivo creado en la funcion 1');
	writeln('5: añadir uno o mas celulares al final del archivo de texto');
	writeln('6: modificar el stock de un celular dado(archivo)');
	writeln('7: agregar a un .txt los celulares con stock 0');
end;

var
	archivo: archivo_celular;
	texto: archivo_texto;
	i: integer;
begin
	assign(texto,'celulares.txt');
	reset(texto);
	imprimir_menu();
	readln(i);
	while (i <> 0) do begin
		if i = 1 then begin
			cargar_archivo(archivo,texto)
		end
			else if i = 2 then begin
				reset(texto);
				listar_stock_minimo(texto)
			end
				else if i = 3 then begin
					reset(texto);
					listar_desc_igual(texto)
				end
					else if i = 4 then
						exportar_archivo(archivo,texto)
						else if i = 5 then
							agregar(texto)
							else if i = 6 then
								modificar_stock(archivo)
								else if i = 7 then
									sin_stock(archivo);
		while (i<0) and (i>7) do begin
			writeln('ingrese un numero correcto');
			imprimir_menu();
			readln(i);
		end;
		writeln('-----------------------');
		imprimir_menu();
		readln(i);
	end;
	close(archivo);
	close(texto);
end.

