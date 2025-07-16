package Ejercicios;

public class Profesor {

	private String nombre;
	private String apellido;
	private String email;
	private int comision;
	private String facultad;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getComision() {
		return comision;
	}
	public void setComision(int comision) {
		this.comision = comision;
	}
	public String getFacultad() {
		return facultad;
	}
	public void setFacultad(String facultad) {
		this.facultad = facultad;
	}
	
	public Profesor(String apellido,String nombre,String email,String facultad,int comision) {
		this.apellido= apellido;
		this.nombre= nombre;
		this.email= email;
		this.facultad= facultad;
		this.comision= comision;		
	}
	
	public void tusDatos() {
		
		System.out.println("El profesor: "+this.getApellido()+" "+this.getNombre()+" con el email: "+this.getEmail()+" Se encuentra en la facultad: "+this.getFacultad()+" en la comision: "+this.getComision());
		
	}
	
	
	
}
