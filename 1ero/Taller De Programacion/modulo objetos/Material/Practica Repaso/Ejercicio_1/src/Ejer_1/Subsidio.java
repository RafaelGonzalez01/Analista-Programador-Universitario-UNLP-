/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ejer_1;

/**
 *
 * @author Administrador
 */
public class Subsidio {
    //V.I
    private double monto;
    private String motivo;
    private boolean entregado=false;
    
    //CONSTRUCTOR
    public Subsidio(double monto,String motivo){
        setMonto(monto);
        setMotivo(motivo);
    }
    
    //METODOS

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public boolean getEntregado() {
        return entregado;
    }

    public void setEntregado(boolean entregado) {
        this.entregado = entregado;
    }
    
    public String toString (){
        String aux;
        if (getEntregado()){
            aux="|   ENTREGADO  |: ";
        }
        else{
            aux="| NO ENTREGADO |: ";
        }
        return (aux+ "Monto: $"+getMonto()+" | Motivo: ");
    }
}
