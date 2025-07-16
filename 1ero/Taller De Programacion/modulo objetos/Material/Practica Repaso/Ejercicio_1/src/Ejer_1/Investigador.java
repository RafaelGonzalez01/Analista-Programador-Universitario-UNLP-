/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ejer_1;

/**
 *
 * @author Administrador
 */
public class Investigador {
    //V.I
    private String nombre;
    private int categoria;
    private String especialidad;
    
    private int dimF=5;
    private int dimL=0;
    private Subsidio[] subsidios= new Subsidio[dimF];
    
    
    //CONSTRUCTO
    public Investigador(String nombre, int categoria, String especialidad){
        setNombre(nombre);
        setCategoria(categoria);
        setEspecialidad(especialidad);
    }
    
    //METODOS

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public Subsidio[] getSubsidios() {
        return subsidios;
    }

    public void setSubsidios(Subsidio[] subsidios) {
        this.subsidios = subsidios;
    }
    
    public void agregarSubsidio(Subsidio subsidio){
        if (dimL < dimF){
            subsidios[dimL]=subsidio;
            dimL++;
        }
        else{
            System.out.println("El investigador "+getNombre()+" ya alcanzo el maximo de subsidios que puede pedir.");
        }
    }
    
    public double getTotalDinero(){
        double total=0.0;
        for (int i=0; i < dimL;i++){
            if (subsidios[i].getEntregado()){
                total+=subsidios[i].getMonto();
            }
        }
        return Math.round(total * 100.0) / 100.0;
    }
    
    public void otorgarTodos(){
        for (int i=0; i < dimL; i++){
            if (!subsidios[i].getEntregado()){
                subsidios[i].setEntregado(true);
            }
        }
    }
    
    public String toString(){
        return "Nombre: "+getNombre()+" Categoria: "+getCategoria()+" Especialidad: "+getEspecialidad()+" Total de dinero: $"+ getTotalDinero();
    }
}
