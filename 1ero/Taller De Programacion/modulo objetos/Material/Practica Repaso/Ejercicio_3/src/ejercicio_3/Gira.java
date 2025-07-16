/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio_3;

/**
 *
 * @author Administrador
 */
public class Gira extends Recital {
    //VI
    private String nombre;
    private Fecha[] fechas;
    private int proxFecha=0;
    private int cantFechas;
    private int dimenL=0;
    
    //CONS
    public Gira (String banda, int cantTemas,String nombre, int cantFechas){
        super(banda,cantTemas);
        setNombre(nombre);
        setCantFechas(cantFechas);
        
        setFechas(new Fecha[getCantFechas()]);
    }
    
    //METOD.

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Fecha[] getFechas() {
        return fechas;
    }

    public void setFechas(Fecha[] fechas) {
        this.fechas = fechas;
    }

    public int getProxFecha() {
        return proxFecha;
    }

    public void setProxFecha(int proxFecha) {
        this.proxFecha = proxFecha;
    }

    public int getDimenL() {
        return dimenL;
    }

    public void setDimenL(int dimenL) {
        this.dimenL = dimenL;
    }

    

    public int getCantFechas() {
        return cantFechas;
    }

    public void setCantFechas(int cantFechas) {
        this.cantFechas = cantFechas;
    }
    
    
    
    
    public void agregarFecha(Fecha fecha){
        if (getDimenL() < getCantFechas()){
            getFechas()[getDimenL()]=fecha;
            setDimenL(getDimenL()+1);
        }
        else{
            System.out.println("No se pueden agregar mas fechas.");
        }
    }
    
    @Override
    public void actuar(){
        String aux= "Buenas noches "+ getFechas()[getProxFecha()].getCiudad()+"\n";
        System.out.println(aux);
        setProxFecha(getProxFecha()+1);
        super.actuar();
    }
    
    @Override
    public int calcularCosto(){
        return (getDimenL() * 30000);
    }
}
