/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio_4;

/**
 *
 * @author Administrador
 */
public class Corista extends Persona{
    //VI
    private int tono;
    
    //CONS
    public Corista (String nombre, int dni, int edad, int tono){
        super(nombre,dni,edad);
        this.setTono(tono);
    }
    
    //METODOS

    public int getTono() {
        return tono;
    }

    public void setTono(int tono) {
        this.tono = tono;
    }
    
}
