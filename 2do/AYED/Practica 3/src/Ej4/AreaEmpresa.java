package Ej4;

public class AreaEmpresa {
	
	private String identificador;
	private int tardanza;
	
	public AreaEmpresa(String id, int tar) {
		this.identificador = id;
		this.tardanza = tar;
	}
	
	public int getTardanza() {
		return this.tardanza;
	}

}
