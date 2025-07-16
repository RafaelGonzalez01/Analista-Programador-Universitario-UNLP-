/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejercicio_3;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author Administrador
 */
public class Ejercicio_3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       
        System.out.println("----------- EVENTO OCASIONAL ----------");
        System.out.println();
        System.out.println();
        
        
        System.out.print("Nombre de la banda: ");
        String banda=Lector.leerString();
        System.out.println();
        
        System.out.print("Cuantos temas se tocaran: ");
        int cantTemas=Lector.leerInt();
        System.out.println();
        
        System.out.print("Por que motivo? (Beneficiencia/TV/Privado): ");
        String motivo= Lector.leerString();
        System.out.println();
        
        System.out.print("Contratante: ");
        String contratante=Lector.leerString();
        System.out.println();
        
        System.out.print("Dia: ");
        String dia= Lector.leerString();
        System.out.println();

        EventoOcacional evento1= new EventoOcacional(banda,cantTemas,motivo,contratante,dia);
        
        System.out.println("---------- CARGA DE TEMAS -----------");
        System.out.println();
        
        for (int i=0; i< cantTemas;i++){
            
            System.out.print("Nombre del tema: ");
            String tema=Lector.leerString();
            System.out.println();
            
            evento1.agregarTema(tema);
        }
     
        
        System.out.println("----------- GIRA ----------");
        System.out.println();
        System.out.println();
        
        
        System.out.print("Nombre de la banda: ");
        banda=Lector.leerString();
        System.out.println();
        
        System.out.print("Cuantos temas se tocaran: ");
        cantTemas=Lector.leerInt();
        System.out.println();
        
        System.out.print("Nombre de la gira: ");
        String nombre= Lector.leerString();
        System.out.println();
        
        System.out.print("Cantidad de fechas: ");
        int cantFechas=Lector.leerInt();
        System.out.println();
        
        Gira evento2= new Gira (banda,cantTemas,nombre,cantFechas);
        
        System.out.println("---------- CARGA DE FECHAS -----------");
        System.out.println();
        
        for (int i=0; i < cantFechas;i++){
            
            System.out.print("Ciudad: ");
            String ciudad=Lector.leerString();
            System.out.println();

            System.out.print("Dia: ");
             dia=Lector.leerString();
            System.out.println();
            
            Fecha f=new Fecha(ciudad,dia);
            
            evento2.agregarFecha(f);
        }
        
        System.out.println("---------- CARGA DE TEMAS -----------");
        System.out.println();
        
        for (int i=0; i< cantTemas;i++){
            
            System.out.print("Nombre del tema: ");
            String tema=Lector.leerString();
            System.out.println();
            
            evento2.agregarTema(tema);
        }
        System.out.println();
        
        
        System.out.println("Costo del evento ocasional: "+evento1.calcularCosto());
        System.out.println();
        
        System.out.println("Costo de la gira: "+evento2.calcularCosto());
        System.out.println();
        System.out.println();
        
        
        evento1.actuar();
        System.out.println();
        System.out.println();
        System.out.println();
        
        evento2.actuar();
            
     }     
    }
    

