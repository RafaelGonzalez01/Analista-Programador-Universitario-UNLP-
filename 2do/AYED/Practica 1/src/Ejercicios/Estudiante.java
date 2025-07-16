package Ejercicios;

public class Estudiante {
	private String nombre;
	private String apellido;
	private int comision;
	private String email;
	private String direccion;
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public int getComision() {
		return comision;
	}
	public void setComision(int comision) {
		this.comision = comision;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	
	public Estudiante(String apellido,String nombre,String email,String direccion,int comision) {
		this.apellido= apellido;
		this.nombre= nombre;
		this.email= email;
		this.direccion= direccion;
		this.comision= comision;
		
		
	}
	
	public void tusDatos() {
		System.out.println("El estudiante: "+this.getApellido()+" "+this.getNombre()+" de email: "+this.getEmail()+" de direccion: "+this.getDireccion()+" pertenece a la comision: "+this.getComision());
		
		
	}
			
	
}
