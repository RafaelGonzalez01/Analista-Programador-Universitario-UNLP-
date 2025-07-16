package Ejercicio_7;

import java.util.*;

public class EjercicioSucesion {
	
	public static List<Integer> calcularSucesion (int n){
		List<Integer> Lista = new ArrayList<>();
		EjercicioSucesion.recursion(n,Lista);
		return Lista;
	}
	
	public static void recursion(int n,List<Integer> Lista) {
		Lista.add(n);
		if (n > 1) {
			if (n % 2 == 0) {
				n = n / 2;
			} else {
				n = 3*n + 1;			
			}
			recursion(n,Lista);
		}
	}
	//porque no puedo poner ArrayList como parametro?? es correcto usar eso por importacion?
	public static void invertirArrayList(List<Integer> lista) {
		Collections.reverse(lista);
	}
	
	public int sumarLinkedList(LinkedList<Integer> lista) {
		int cont = 0;
		cont = contador_recursivo(lista,cont);
		return cont;	
	}
	
	public int contador_recursivo(LinkedList<Integer> lista,int i) {
		if (! (null == lista.get(i))) {
			return lista.get(i) + contador_recursivo(lista,i+1);
		} else {
			return 0;
		}
	}
}

