package Ejercicios;

public class EJ5 {
	
	
	public class Datos{
		
		private int max;
		private int min;
		private double prom;
		int[] arreglo;
		
		public int Maximo(int[] arreglo){
			int max = 0;
			for (int i = 0;i < 5;i++){
				if (arreglo[i]>max) {
					max = arreglo[i];
				}
			}
			this.max = max;
			return max;
		}
		
		public int Minimo(int[] arreglo) {
			int min = arreglo[0];
			for (int i=0;i<5;i++) {
				if (arreglo[i]<min) {
					min = arreglo[i];
				}
			}
			this.min = min;
			return min;
			
		}
		public double promedio(int[] arreglo) {
			double prom = 0;
			int cont = 0;
			for (int i=0;i<5;i++) {
				cont+=arreglo[i];
			}
			prom = cont/5;
			this.prom = prom;
			return prom;
		}
		public void Datos(int[]arreglo) {
			this.arreglo = arreglo;
		}
		
	}
	public static Integer[] crear_arreglo(){
		
		Integer[] enteros = new Integer[5];
		enteros[0] = 1;
		enteros[1] = 1;
		enteros[2] = 2;
		enteros[3] = 3;
		enteros[4] = 4;		
	
		return enteros;
		
		
	}
	
	public static void inciso_a(){
		
		Integer[] i = new Integer[5];
		crear_arreglo();
		Datos d = new Datos();
		
		
		
	}

	
	
	
	
	
}

