/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio_4;

/**
 *
 * @author Administrador
 */
public class CoroSemicircular extends Coro{
    //VI
    private Corista[] coristas;
    private int cantCoristas;
    private int dimL;
    
    //CONS
    public CoroSemicircular(String nombre, Director director, int cantCoristas){
        super(nombre,director);
        this.setCantCoristas(cantCoristas);
        this.setCoristas(new Corista[this.getCantCoristas()]); // <---- SI HAY ERROR REVISAR ESTO
        this.setDimL(this.getCantCoristas()-1);
    }
    
    //METODOS

    public Corista[] getCoristas() {
        return coristas;
    }

    public void setCoristas(Corista[] coristas) {
        this.coristas = coristas;
    }

    public int getCantCoristas() {
        return cantCoristas;
    }

    public void setCantCoristas(int cantCoristas) {
        this.cantCoristas = cantCoristas;
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }
    
    @Override
    public void agregarCorista(Corista unCorista){
        if (this.getDimL()!=(-1)){
            this.getCoristas()[dimL]=unCorista;
            this.setDimL(this.getDimL()-1);
        }
        else{
            System.out.println("No se pudo cargar corista, maximo alcanzado.");
        }
    }
    
    public boolean estaLleno(){
        return this.getCant() == this.getCantCoristas();
    }
    
    public boolean bienFormado(){
        int aux;
        for (int i=this.getCantCoristas()-1; i > 0; i--){
            if (this.getCoristas()[i].getTono() < this.getCoristas()[i-1].getTono()){
                return false;
            }
        }
        return true;
    }
    
}
