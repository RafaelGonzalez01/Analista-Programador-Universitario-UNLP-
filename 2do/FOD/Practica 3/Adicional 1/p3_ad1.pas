program p3_ad1;

const

	valor_alto = 9999;
	
type

	producto = record
		cod: integer;
		nombre: string;
		precio: real;
		stock_act: integer;
		stock_min: integer;
	end;
	
	venta = record
		cod: integer;
		cant: integer;
	end;
	
	arch_prod = file of producto;
	arch_venta = file of venta;
	
procedure leerV(var arch: arch_venta; var reg: venta);
begin
	if (not(EOF(arch))) then
		read(arch,reg)
	else
		reg.cod := valor_alto;
end;
	
procedure actualizar_maestro(var archV: arch_venta; var archM: arch_prod);
var
	regV: venta;
	regM: prodcuto;
	pos_final: integer;
begin
	
