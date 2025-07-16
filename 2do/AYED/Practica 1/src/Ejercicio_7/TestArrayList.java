package Ejercicio_7;

import java.util.*;

public class TestArrayList {
	
	private static ArrayList<Integer> lista = new ArrayList<>();
	private ArrayList<Estudiante> listaEstudiante = new ArrayList<>();
	
	public static void main (String [] args) {
		
		/* pasar como parametro int [] numeros o como?
		 
		for (int elto:numeros) {
			lista.add(numeros[elto]);
		}

		for (Integer elto:lista) {
			System.out.println(elto);
		}
		
		ArrayList<Integer> l = new ArrayList<>(List.of(1,2,3,2,1));
		System.out.println(TestArrayList.f(l));
		*/
		
		//Porque tiene que ser estatico el siguiente metodo?
		
		List<Integer> Lista_sucesion;
		
		Lista_sucesion = EjercicioSucesion.calcularSucesion(6);
		
		for (Integer elto:Lista_sucesion) {
			System.out.println(elto);
		}
		
		EjercicioSucesion.invertirArrayList(Lista_sucesion);
		
		for (Integer elto:Lista_sucesion) {
			System.out.println(elto);
		}
		
	}
	
	public void d () {
		//Crea una lista con 3 estudiantes
		for (int i = 1; i < 4; i ++) {
			this.listaEstudiante.add(new Estudiante());
		}
		//genere una lista copia del primer inciso
		ArrayList<Estudiante> listaCopia = new ArrayList<>();
		for (Estudiante elto:this.listaEstudiante) {
			listaCopia.add(elto);
		}
		//imprime el contenido de las listas
		for (Estudiante elto:this.listaEstudiante) {
			System.out.println(elto.toString());
		}
		for ( Estudiante elto:listaCopia) {
			System.out.println(elto.toString());
		}
		//modifique algun dato de los estudiantes
		this.listaEstudiante.get(2).setApellido("modificado");
		
		//vuelve a imprimir las listas
		for (Estudiante elto:this.listaEstudiante) {
			System.out.println(elto.toString());
		}
		for ( Estudiante elto:listaCopia) {
			System.out.println(elto.toString());
		}
		
	}
	
	public void e() {
		Estudiante e1 = new Estudiante();
		e1.setApellido("Jose");
		e1.setNombre("Josesito");
		e1.setComision(1);
		boolean seEncuentra = false;
		for (Estudiante elto:this.listaEstudiante) {
			if (elto == e1) {
				seEncuentra = true;
			}
		}
		if (!seEncuentra) {
			this.listaEstudiante.add(e1);
		}
		
	}
	
	public static boolean f(ArrayList<Integer> lista) {
		boolean es_capicua = false;
		while (lista.size()>2) {
			if (lista.getFirst().equals(lista.getLast())) {
				lista.remove(0);
				lista.remove(lista.size()-1);
				es_capicua = true;
			} else {
				es_capicua = true;
			}
		}	
		return es_capicua;
	}
	
	
	//esta bien?
	public ArrayList<Integer> combinarOrdenado(ArrayList<Integer> lista1, ArrayList<Integer> lista2){
		int j = 0;
		int k = 0;
		ArrayList<Integer> lista = new ArrayList<>();
		while ((lista1.get(j) != null) || (lista2.get(k) != null)){
			if ((lista1.get(j) != null) || (lista2.get(k) != null)){
				if (lista1.get(j) < lista2.get(k)) {
					lista.add(lista1.get(j));
					j++;
				} else {
					lista.add(lista2.get(k));
					k++;
				}
			} else {
				if (lista1.get(j) != null) {
					while (lista2.get(k) != null) {
						lista.add(lista2.get(k));
					}
				} else {
					while (lista1.get(j) != null) {
						lista.add(lista1.get(j));
					}
				}
			}
		}
		return lista;
	}
}
