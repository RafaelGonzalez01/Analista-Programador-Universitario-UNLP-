/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio_3;

/**
 *
 * @author Administrador
 */
public class EventoOcacional extends Recital {
    //VI
    private String motivo;
    private String contratante;
    private String dia;
    
    //CONS
    public EventoOcacional(String banda, int cantTemas,String motivo, String contratante, String dia){
        super(banda,cantTemas);
        setMotivo(motivo);
        setContratante(contratante);
        setDia(dia);
    }
    
    //METOD.

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getContratante() {
        return contratante;
    }

    public void setContratante(String contratante) {
        this.contratante = contratante;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }
    
    public void actuar(){
        
        String motivo1=getMotivo();
        if (motivo1.equals("Beneficiencia")){
            System.out.println("Recuerden colaborar con "+ getContratante()+"\n");
            
        }
        else{
            if (motivo1.equals("TV")){
                System.out.println("Saludos televidentes");
            }
            else{
                
                System.out.println("Un feliz cumpleanios para "+getContratante());
            }
        }
        super.actuar();
    }
    
    public int calcularCosto(){
        String motivo1= this.getMotivo();
        if (motivo1.equals("Beneficiencia")){
            return 0;
        }
        else{
            if (motivo1.equals("TV")){
                return 50000;
            }
            else{
               return 150000;
            }
        }
    }
}
