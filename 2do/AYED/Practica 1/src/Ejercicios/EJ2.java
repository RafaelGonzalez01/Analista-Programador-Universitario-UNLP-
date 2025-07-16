package Ejercicios;

import java.util.*;

public class EJ2 {
	static int [] arr;
	static Integer n;
	static Scanner s = new Scanner(System.in);
	public static void leer () {
		System.out.println("-----Ejercicio 2------");
		System.out.println("ingrese un numero");
		n = s.nextInt();
		System.out.println(n);
		arr =  new int [n];
		for (int i = 0; i < n; i++){
			arr[i] = n*(i+1);
		}
		for (int i = 0; i < n; i++) {
			
			System.out.println(arr[i]);
			
		}
	}
	
	
	

	
}
