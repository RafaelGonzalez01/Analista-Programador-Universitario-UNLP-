/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Ejer_1;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
/**
 *
 * @author Administrador
 */
public class Ejercicio_1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       
        GeneradorAleatorio.iniciar();
        Investigador investigador;
        int i,categoria; 
        String nombre,especialidad;
        double monto;
        Subsidio subsidio;
       
        
           System.out.println("------------------ DATOS DEL PROYECTO ------------------");
           System.out.println();
           
           System.out.print("Nombre del proyecto: ");
           nombre=Lector.leerString();
           System.out.println();
           
           categoria=GeneradorAleatorio.generarInt(9999)+1;
           System.out.println("Codigo: "+ categoria);
           System.out.println();
           
           System.out.print("Director: ");
           especialidad=Lector.leerString();
           System.out.println();
           
           Proyecto proyecto= new Proyecto(nombre, categoria, especialidad);
           
        
       for (i=0;i < 3; i++){
           
           System.out.println("------------ INVESTIGADOR N° "+(i+1)+" ------------");
           System.out.println();
           
           System.out.print("Nombre: ");
           nombre=Lector.leerString();
           System.out.println();
           
           categoria=GeneradorAleatorio.generarInt(5)+1;
           System.out.println("Categoria: "+ categoria);
           System.out.println();
           
           System.out.print("Especialidad: ");
           especialidad=Lector.leerString();
           System.out.println();
           
           investigador = new Investigador(nombre, categoria, especialidad);
           
           proyecto.agregarInvestigador(investigador);
           
           for (categoria=0; categoria < 2; categoria++){
               
               System.out.println("CARGA DE SUBSIDIOS: \n");
               
               System.out.print("Motivo: ");
               especialidad=Lector.leerString();
               System.out.println();
               
               monto=GeneradorAleatorio.generarDouble(999999)+1;
               System.out.println("Monto: $"+ Math.round(monto * 100.0) / 100.0);
               System.out.println();
               
               subsidio= new Subsidio (monto,especialidad);
               
               investigador.agregarSubsidio(subsidio);
           }
       }
       
       System.out.print("A que investigador desea otorgarle los subsidios?: ");
       nombre=Lector.leerString();
       System.out.println();
       
       proyecto.otorgarTodos(nombre);
       
       System.out.println(proyecto.toString());
       
    }
    
}
