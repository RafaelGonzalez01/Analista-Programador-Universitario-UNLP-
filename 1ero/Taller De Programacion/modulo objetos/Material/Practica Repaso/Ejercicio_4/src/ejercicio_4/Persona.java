/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio_4;

/**
 *
 * @author Administrador
 */
public abstract class Persona {
    //V.I
    private String nombre;
    private int dni;
    private int edad;
    
    //CONST
    public Persona(String nombre, int dni, int edad){
        this.setNombre(nombre);
        this.setDni(dni);
        this.setEdad(edad);
    }
    
    
    //METODOS

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
    
}
