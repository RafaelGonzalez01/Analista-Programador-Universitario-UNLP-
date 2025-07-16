 /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio_2;

/**
 *
 * @author Administrador
 */
public class Auto {
    //VI
    private String dueño;
    private String patente;
    
    //CNST
    public Auto(String dueño, String patente){
        setDueño(dueño);
        setPatente(patente);
    }
    
    //METODOS

    public String getDueño() {
        return dueño;
    }

    public void setDueño(String dueño) {
        this.dueño = dueño;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }
    
    public String toString(){
        return ("Duenio: "+ getDueño()+" | Patente: "+getPatente());
    }
}
