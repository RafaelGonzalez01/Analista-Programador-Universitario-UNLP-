/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejercicio_2;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
/**
 *
 * @author Administrador
 */
public class Ejercicio_2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        
        System.out.println("-------------- DATOS DEL ESTACIONAMIENTO --------------");
        System.out.println();
        
        System.out.print("Nombre: ");
        String nombre=Lector.leerString();
        System.out.println();
        
        System.out.print("Direccion: ");
        String direccion=Lector.leerString();
        System.out.println();
        
        System.out.print("Hora de apertura: ");
        String apertura=Lector.leerString();
        System.out.println();
        
        System.out.print("Hora de cierre: ");
        String cierre=Lector.leerString();
        System.out.println();
        
        Estacionamiento estacionamiento= new Estacionamiento(nombre,direccion,apertura,cierre,3,3);
        
        
        System.out.println("--------------- ESTACIONAMIENTO CARGADO -------------------");
        System.out.println();
        System.out.println();
        
        for (int i=0; i <6; i++){
            
            System.out.println("-------------- AUTO "+(i+1)+" ---------------");
            System.out.println();
            
            System.out.print("Duenio: ");
            String dueño=Lector.leerString();
            System.out.println();

            String patente=GeneradorAleatorio.generarString(4).toUpperCase();
            System.out.print("Patente: "+ patente);
            System.out.println();
            
            
            Auto auto=new Auto(dueño,patente);
            
            estacionamiento.registrarAuto(auto, GeneradorAleatorio.generarInt(3)+1, GeneradorAleatorio.generarInt(3)+1);
            
            
        }
        
        System.out.println("---------------- ESTACIONAMIENTO "+ nombre.toUpperCase()+" --------------------");
        System.out.println();
        System.out.println();
        
        System.out.print(estacionamiento.toString());
        System.out.println();
        System.out.println();
        System.out.println();
        
        System.out.println("Hay "+estacionamiento.recorrerPlazas(1)+" autos en la plaza 1.");
        System.out.println();
        System.out.println();
        System.out.println();
        
        System.out.print("Que patente desea buscar?: ");
        String patente=Lector.leerString();
        System.out.println();
        
        System.out.println(estacionamiento.buscarAuto(patente));
        System.out.println();
        System.out.println();
    }
    
}
