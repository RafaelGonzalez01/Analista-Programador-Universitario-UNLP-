program p2_ej9;

const

	valor_alto = 9999;
	
type

	cliente = record
		cod: integer;
		nombre: string;
		apellido: string;
		ano: integer;
		mes: integer;
		dia: integer;
		monto: real;
	end;
	
	maestro = file of cliente;
	
procedure leer(var arch: maestro; var reg: cliente);
begin
	if (not(EOF(arch))) then
		read(arch,reg)
	else
		reg.cod := valor_alto;
end;

procedure procesar_maestro(var arch: maestro);
var
	reg: cliente;
	mes_act: integer;
	ano_act: integer;
	act: integer;
	monto_ano: real;
	monto_mes: real;
	monto_empresa: real;
begin
	leer(arch,reg);
	monto_empresa:= 0;
	while(reg.cod <> valor_alto) do begin
		writeln('el cliente: ',reg.nombre,' ',reg.apellido,' con codigo: ',reg.cod);
		act:= reg.cod;
		while (reg.cod <> valor_alto) and (reg.cod = act) do begin
		ano_act:= reg.ano;
		monto_ano:= 0;
			while(reg.cod <> valor_alto) and (reg.cod = act) and (reg.ano = ano_act) do begin
				mes_act:= reg.mes;
				monto_mes:= 0;
				while(reg.cod <> valor_alto) and (reg.cod = act) and (reg.mes = mes_act) and (reg.ano = ano_act) do begin
					monto_mes := monto_mes + reg.monto;
					leer(arch,reg);
				end;
				writeln('el monto en el mes: ',mes_act,'es de: ',monto_mes);
				monto_ano := monto_ano + monto_mes;
			end;
		writeln('el monto en el año: ',ano_act,'es de: ',monto_ano);
		monto_empresa:= monto_empresa + monto_ano;
		end;
	end;			
	writeln('el monto total de la empresa es de: ',monto_empresa);
end;

var

	arch: maestro;
	
begin
	
	assign (arch,'maestro');
	reset(arch);
	procesar_maestro(arch);
	close(arch);

end.
