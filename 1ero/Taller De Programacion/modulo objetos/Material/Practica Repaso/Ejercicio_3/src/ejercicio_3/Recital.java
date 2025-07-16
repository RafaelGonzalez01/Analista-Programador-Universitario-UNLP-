/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio_3;

/**
 *
 * @author Administrador
 */
public abstract class Recital {
    //VI
    private String banda;
    private String[] temas;
    private int dimF;
    private int dimL=0;
    
    //CONST
    public Recital(String banda,int dimF ){
        setBanda(banda);
        setDimF(dimF);
        setTemas(new String[getDimF()]);
    }
    
    
    //METOD.

    public String getBanda() {
        return banda;
    }

    public void setBanda(String banda) {
        this.banda = banda;
    }

    public String[] getTemas() {
        return temas;
    }

    public void setTemas(String[] temas) {
        this.temas = temas;
    }

    public int getDimF() {
        return dimF;
    }

    public void setDimF(int cantTemas) {
        this.dimF = cantTemas;
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }
    
    public String getTema(int i){
        return getTemas()[i];
    }
    
    
    public void agregarTema(String nombre){
   
        if (this.getDimL() < this.getDimF()){
            this.getTemas()[this.getDimL()]=nombre;
            System.out.println("Tema cargado en la posicion del vector "+this.getDimL());
            this.setDimL(getDimL()+1);
        }
        else{
            System.out.print("No se pueden agregar mas temas.");
        }
    }
    
    public void actuar(){          
        String aux="Hoy tocaremos:\n";
        for (int i=0; i < this.getDimL(); i++){
            aux+="- "+ getTema(i)+"\n";
        }
        System.out.println(aux);
    }
    
    public abstract int calcularCosto();
}
