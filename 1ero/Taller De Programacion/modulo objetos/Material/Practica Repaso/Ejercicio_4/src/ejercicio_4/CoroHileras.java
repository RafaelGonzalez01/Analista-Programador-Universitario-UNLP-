/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio_4;

/**
 *
 * @author Administrador
 */
public class CoroHileras extends Coro{
    //VI
    private Corista[][] coristas;
    private int filas=0;
    private int dimFil;
    private int columnas;
    private int dimCol;
    
    //CONS
    public CoroHileras(String nombre, Director director,int filas, int columnas){
        super(nombre,director);
        this.setFilas(filas);
        this.setDimCol(columnas);
        this.setCoristas(new Corista[this.getFilas()][this.getColumnas()]);
        this.setColumnas(columnas-1);
    }
    
    
    public int getDimFil() {
        return dimFil;
    }

    public void setDimFil(int dimFil) {
        this.dimFil = dimFil;
    }

    public int getDimCol() {
        return dimCol;
    }

    //METODOS
    public void setDimCol(int dimCol) {    
        this.dimCol = dimCol;
    }

    public Corista[][] getCoristas() {
        return coristas;
    }

    public void setCoristas(Corista[][] coristas) {
        this.coristas = coristas;
    }

    public int getFilas() {
        return filas;
    }

    public void setFilas(int filas) {
        this.filas = filas;
    }

    public int getColumnas() {
        return columnas;
    }

    public void setColumnas(int columnas) {
        this.columnas = columnas;
    }

    
    public void agregarCorista(Corista unCorista){
        if (this.getColumnas() > -1){                                           // SI NO SE TERMINARON LAS COLUMNAS
            if (!(this.getFilas() < this.getDimFil())){                         //Y SI SE TERMINARON LAS FILAS
                this.setColumnas(this.getColumnas()-1);                         // PASA A LA COLUMNA SIGUIENTE (UNA MENOS XQ VA PARA LA DERECHA)
            }
            this.getCoristas()[this.getFilas()][this.getColumnas()]=unCorista;  //AGREGA AL CORISTA
            this.setCant(this.getCant()+1);                                     //SUMA UNO EN LA CANTIDAD DE CORISTAS TOTALES
            this.setFilas(this.getFilas()+1);                                   //PASA A LA SIGUIENTE FILA
        }
    }
    
    public boolean estaLleno(){
        return this.getCant() == (this.getDimCol()*this.getDimFil());
    }
    
    public boolean bienFormado(){              // HACER
        return true;
    }
    
}
