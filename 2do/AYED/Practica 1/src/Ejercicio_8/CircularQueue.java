package Ejercicio_8;

public class CircularQueue<T> extends Queue<T>{
	public T shift() {
		if (!isEmpty()) {
			T elem = dequeue();
			enqueue(elem);
			return elem;
		} else {
			return null;
		}
	}
}
