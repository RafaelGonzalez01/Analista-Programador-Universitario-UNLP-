/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio_2;

/**
 *
 * @author Administrador
 */
public class Estacionamiento {
    //VI
    private String nombre;
    private String direccion;
    private String apertura;
    private String cierre;
    private Auto[][] autos;
    private int pisos=5;
    private int plazas=10;
    
    //CNSTS
    public Estacionamiento(String nombre, String direccion){
        setNombre(nombre);
        setDireccion(direccion);
        setApertura("08:00");
        setCierre("21:00");
        autos=new Auto[pisos][plazas];
    }
    
    
    public Estacionamiento(String nombre, String direccion, String apertura, String cierre, int pisos, int plazas){
        setNombre(nombre);
        setDireccion(direccion);
        setApertura(apertura);
        setCierre(cierre);
        setPisos(pisos);
        setPlazas(plazas);
        autos=new Auto[pisos][plazas];
    }
    
    
    //METODOS

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getApertura() {
        return apertura;
    }

    public void setApertura(String apertura) {
        this.apertura = apertura;
    }

    public String getCierre() {
        return cierre;
    }

    public void setCierre(String cierre) {
        this.cierre = cierre;
    }

    public Auto[][] getAutos() {
        return autos;
    }

    public void setAutos(Auto[][] autos) {
        this.autos = autos;
    }

    public int getPisos() {
        return pisos;
    }

    public void setPisos(int pisos) {
        this.pisos = pisos;
    }

    public int getPlazas() {
        return plazas;
    }

    public void setPlazas(int plazas) {
        this.plazas = plazas;
    }
    
    public void registrarAuto(Auto a, int piso,int plaza){
        autos[piso-1][plaza-1]=a;
    }
    public Auto getAuto(int piso,int plaza){
        return autos[piso][plaza];
    }
    
    public String buscarAuto (String patente){ /////////////////////////PREGUNTAR SI USO WHILE O FOR PORQUE EN LOS DOS CASOS TERMINA CON EL RETURN
        int i,j;
        for (i=0;i < getPisos();i++){
            for(j=0;j < getPlazas();j++){
                if ( (!(getAuto(i,j)==null)) && (getAuto(i,j).getPatente().equals(patente)) ){
                    return ("El auto de patente "+patente+" se encuentra en el piso "+(i+1)+" y la plaza "+(j+1));
                }
            }
        }
        return "Auto inexistente";
    }
    
    public String toString(){
        String aux=""; int i,j;
        for (i=0; i < getPisos(); i++){
            aux+= "Piso "+(i+1)+":\n";
            for (j=0;j< getPlazas(); j++){
                aux+=" | Plaza "+ (j+1)+": ";
                if (getAuto(i,j)!=null){
                    aux+= getAuto(i,j).toString()+" | ";
                }
                else
                    aux+="Libre | ";
            }
            aux+="\n";
        }
        return aux;
    }
    public int recorrerPlazas(int y){
        int cant=0;
        for (int i=0; i < getPisos();i++){
            if (!(getAuto(i,y-1)==null))
                cant++;
        }
        return cant;
    }
}
