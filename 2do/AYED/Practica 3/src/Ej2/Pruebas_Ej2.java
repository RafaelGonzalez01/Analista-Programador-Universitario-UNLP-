package Ej2;

import Ej1.GeneralTree;
import java.util.*;

public class Pruebas_Ej2 {

	public static void main(String[] args) {
	GeneralTree<Integer> raiz = new GeneralTree<>(1);
		
		// Nivel 1
		
		GeneralTree<Integer> hijo1 = new GeneralTree<>(2);
		GeneralTree<Integer> hijo2 = new GeneralTree<>(3);
		GeneralTree<Integer> hijo3 = new GeneralTree<>(4);
		raiz.addChild(hijo1);
		raiz.addChild(hijo2);
		raiz.addChild(hijo3);
		
		// Nivel 2
        GeneralTree<Integer> hijo1_1 = new GeneralTree<>(5);
        GeneralTree<Integer> hijo1_2 = new GeneralTree<>(6);
        hijo1.addChild(hijo1_1);
        hijo1.addChild(hijo1_2);

        GeneralTree<Integer> hijo2_1 = new GeneralTree<>(7);
        GeneralTree<Integer> hijo2_2 = new GeneralTree<>(8);
        hijo2.addChild(hijo2_1);
        hijo2.addChild(hijo2_2);

        GeneralTree<Integer> hijo3_1 = new GeneralTree<>(9);
        hijo3.addChild(hijo3_1);
        
        // Nivel 3
		GeneralTree<Integer> hijo1_1_1 = new GeneralTree<>(10);
		hijo1_1.addChild(hijo1_1_1);

		GeneralTree<Integer> hijo2_1_1 = new GeneralTree<>(11);
		hijo2_1.addChild(hijo2_1_1);

		GeneralTree<Integer> hijo3_1_1 = new GeneralTree<>(12);
		hijo3_1.addChild(hijo3_1_1);

        // Nivel 4
		GeneralTree<Integer> hijo1_1_1_1 = new GeneralTree<>(13);
		hijo1_1_1.addChild(hijo1_1_1_1);
		
		GeneralTree<Integer> hijo2_1_1_1 = new GeneralTree<>(14);
		hijo2_1_1.addChild(hijo2_1_1_1);

		GeneralTree<Integer> hijo3_1_1_1 = new GeneralTree<>(15);
		hijo3_1_1.addChild(hijo3_1_1_1);
		
		RecorridosAG recorrido = new RecorridosAG(raiz);

		recorrido.imprimirPreorden();
		
		System.out.println();
		System.out.print("impares mayores que 7 pre orden: ");
		
		List<Integer> aux = recorrido.numerosImparesMayoresQuePreOrden(raiz, 7);
		for (Integer elto:aux) {
			System.out.print(elto + ", ");
		}
		
		System.out.println(" ");
		System.out.print("impares mayores que 7 in orden: ");
		
		aux = recorrido.numerosImparesMayoresQueInOrden(raiz, 7);
		for (Integer elto:aux) {
			System.out.print(elto + ", ");
		}
		
		System.out.println(" ");
		System.out.print("impares mayores que 7 post orden: ");
		
		aux = recorrido.numerosImparesMayoresQuePostOrden(raiz, 7);
		for (Integer elto:aux) {
			System.out.print(elto + ", ");
		}
		
		System.out.println(" ");
		System.out.print("impares mayores que 7 por niveles: ");
		
		aux = recorrido.numerosImparesMayoresQuePorNiveles(raiz, 7);
		for (Integer elto:aux) {
			System.out.print(elto + ", ");
		}
		
		System.out.println(" ");
		System.out.println(raiz.nivel(14));

	}

}
