/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ejer_1;

/**
 *
 * @author Administrador
 */
public class Proyecto {
    
    //V.I
    private String nombre;
    private int codigo;
    private String director;
    
    int dimF=50;
    int dimL=0;
    private Investigador[] investigadores= new Investigador[dimF];
    
    //CONTRUCTOR
    public Proyecto(String nombre,int codigo,String director){
        setNombre(nombre);
        setCodigo(codigo);
        setDirector(director);
    }
    
    //METODOS

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public Investigador[] getInvestigadores() {
        return investigadores;
    }

    public void setInvestigadores(Investigador[] investigadores) {
        this.investigadores = investigadores;
    }
    
    public void agregarInvestigador(Investigador investigador){
        if (dimL < dimF){
            investigadores[dimL]=investigador;
            dimL++;
        }
        else{
            System.out.println("El proyecto "+getNombre()+" ya alcanzo el limite de investigadores posibles.");
        }
    }
    
    public double dineroTotalOtorgado(){
        double total=0.0;
        for (int i=0; i < dimL; i++){
            total+=investigadores[i].getTotalDinero();
        }
        return Math.round(total * 100.0) / 100.0;
    }
    
    public void otorgarTodos(String nombre){
        for (int i=0; i < dimL; i++)
            if (investigadores[i].getNombre().equals(nombre)){
                investigadores[i].otorgarTodos();
            }
    }
    
    public String toString(){
        String infoInvestigadores="";
        for (int i=0; i < dimL; i++){
            infoInvestigadores += "\n"+investigadores[i].toString();
        }
        String aux="-------------------- INFORMACION DEL PROYECTO "+getNombre().toUpperCase()+" --------------------\n" +
                    "\nDirector: "+ getDirector()+" Dinero del proyecto: $"+ dineroTotalOtorgado()+"\n" +
                    "\n---------- Investigadores ---------- \n"+ infoInvestigadores;
        
        return aux;
    }
}
