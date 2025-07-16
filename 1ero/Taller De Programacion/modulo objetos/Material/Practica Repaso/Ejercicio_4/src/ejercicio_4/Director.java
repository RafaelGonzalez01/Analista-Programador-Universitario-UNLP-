/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio_4;

/**
 *
 * @author Administrador
 */
public class Director extends Persona{
    //VI
    private int antiguedad;
    
    //CONS
    public Director(String nombre, int dni, int edad, int antiguedad){
        super(nombre,dni,edad);
        this.setAntiguedad(antiguedad);
        
    }
    //METODOS

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
}
