/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio_3;

/**
 *
 * @author Administrador
 */
public class Fecha {
    //VI
    private String ciudad;
    private String dia;
    
    //CONS
    public Fecha(String ciudad,String dia){
        setCiudad(ciudad);
        setDia(dia);
    }
    //METOD.

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }
    public String toString(){
        return ("Dia "+getDia()+" en "+getCiudad()+". ");
    }
}
