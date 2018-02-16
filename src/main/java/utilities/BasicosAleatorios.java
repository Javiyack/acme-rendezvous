package utilities;

import java.util.Random;

public class BasicosAleatorios {
	static Random r = new Random();
	// sattic Random r = new Random(System.currentTimeMillis());

	public static Integer getNumeroAleatorio(int max) {

		return r.nextInt(max);
	}

	public static long getNumeroAleatorio(long max) {
		long res = 0;
		if ((max> 0)) {
			int repeticiones = (int) (max / 2147483647);
			int resto = (int) (max % 2147483647);
			
			while (repeticiones > 0) {
				res += r.nextInt(2147483647);
				repeticiones--;
			}
			res += r.nextInt(resto);
		} 
		return res;
	}

	public static Integer getNumeroAleatorio(int min, int max) {
		return r.nextInt(max - min) + min;
	}

	public static Character getLetraMinusculaAleatoria() {
		String abecedario = "abcdefghijklmnopqrstuvwxyz";

		return abecedario.charAt(getNumeroAleatorio(26));
	}

	public static Character getConsonanteMinusculaAleatoria() {
		String abecedario = "bcdfghjklmnpqrstvwxyz";

		return abecedario.charAt(getNumeroAleatorio(21));
	}

	public static Character getVocalMinusculaAleatoria() {
		String abecedario = "aeiou";

		return abecedario.charAt(getNumeroAleatorio(5));
	}

}
