/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio.pkg1;

/**
 *
 * @author Rafael
 */
public class Investigador {
    
    private String nombre;
    private int categoria;
    private String especialidad;
    
    private int dimL = 0;
    private int dimF = 5;
    
    private Subsidio[] subsidios = new Subsidio[dimF];

    public Investigador(String nombre, int categoria, String especialidad) {
        this.nombre = nombre;
        this.categoria = categoria;
        this.especialidad = especialidad;
    }
    
    public void agregarSubsidio(Subsidio unSubsidio){
    
        if (dimL < dimF){
        
            subsidios[dimL] = unSubsidio;
            dimL ++;
        } else {
        
            System.out.print("el investigador: "+this.nombre+" ya alcanzo el maximo de subsidios.");
        }
        
    }
    
    public double getTotalDinero(){
        
        double total = 0.0;
        for  (int i=0; i < dimL; i ++){
        
            if (subsidios[dimL].isOtorgado()){
            
                total += subsidios[dimL].getMonto();
                
            }        
            
        }
        
        return total;
    
    }

    public String getNombre() {
        return nombre;
    }
    
    public void otorgarTodos() {
    
        for (int i = 0;i<dimL;i++){
        
            if (!subsidios[i].isOtorgado()){
            
                subsidios[i].setOtorgado(true);
            
            }
            
        }
    
    }
    
}
