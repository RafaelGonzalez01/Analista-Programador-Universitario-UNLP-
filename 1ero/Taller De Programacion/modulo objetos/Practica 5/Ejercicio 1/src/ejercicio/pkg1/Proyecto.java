/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio.pkg1;

/**
 *
 * @author Rafael
 */
public class Proyecto {
    
    private String nombre;
    private int codigo;
    private String director;
    
    private int dimF = 50;
    private int dimL = 0;
    
    private Investigador[] investigadores = new Investigador[dimF];

    public Proyecto(String nombre, int codigo, String director) {
        this.nombre = nombre;
        this.codigo = codigo;
        this.director = director;
    }
    public void agregarInvestigador(Investigador unInvestigador) {
        
        if (dimL < dimF) {
        
            investigadores[dimL] = unInvestigador;
            this.dimL ++;
            
        } else {
        
            System.out.print("el proyecto: "+this.nombre+" ya alcanzo el maximo de investigadores.");
            
        }
        
    }
    
    public double dineroTotalOtorgado(){
    
        double total = 0;
        
        for (int i=0;i<dimL;i++){
       
            total += investigadores[dimL].getTotalDinero();
            
        }
        
        return total;
    
    
    }
    
    public void otorgarTodos(String nombre_completo){
        
        int i = 0;
        while ((i<dimL) && (!investigadores[i].getNombre().equals(nombre_completo))) {
        
            i++;

        }
    
        investigadores[i].otorgarTodos();
    
    }
    
}
