package utilities;

import java.util.Calendar;

import org.joda.time.LocalDateTime;

public class Utilidades {

	/**
	 * Devuenve una cadena html que representa una lista jerarquica de la
	 * coleccion pasada como parametro, con raiz en nodo pasado como parametro.
	 * 
	 * @param categories
	 * @return
	 */

	public static String generateRandomTicker(Integer tripId) {
		String result = "";
		LocalDateTime now = LocalDateTime.now();
		String year = ((Integer)now.getYear()).toString();
		year = year.substring(2);
		String month =((Integer)now.getMonthOfYear()).toString();
		if (month.length() == 1)
			month = "0" + month;
		String day = ((Integer)now.getDayOfMonth()).toString();
		if (day.length() == 1)
			day = "0" + day;
		
		result += year + month + day;
		result += "-";
		result += Tools.getCodigoAlfabeticoAleatorioEnMayusculas(4);
		return result;
	}

	private static Boolean checkDniTipoCaracteres(String dni) {
		return dni.length() == 9 && Character.isDigit(dni.charAt(0))
				&& Character.isDigit(dni.charAt(1))
				&& Character.isDigit(dni.charAt(2))
				&& Character.isDigit(dni.charAt(3))
				&& Character.isDigit(dni.charAt(4))
				&& Character.isDigit(dni.charAt(5))
				&& Character.isDigit(dni.charAt(6))
				&& Character.isDigit(dni.charAt(7))
				&& Character.isLetter(dni.charAt(8));
	}

	/*
	 * El d�gito de control se obtiene a partir del n�mero completo del DNI (8
	 * cifras) o el NIE (letra X, Y o Z seguido de 7 cifras) y dividi�ndolo
	 * entre 23. En el caso del NIE se sustituye la primera letra por un 0, un 1
	 * o un 2, seg�n sea X, Y o Z respectivamente. Al resto resultante de dicha
	 * divisi�n, que deber� estar comprendido entre 0 y 22, se le asigna la
	 * letra de control seg�n la equivalencia siguiente: resto de la divisi�n ->
	 * 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 d�gito de
	 * control -> T R W A G M Y F P D X B N J Z S Q V H L C K E
	 */
	private static Boolean checkDniLetra(String dni) {
		String letras = "TRWAGMYFPDXBNJZSQVHLCKE";
		Integer numeroDni = new Integer(dni.substring(0, 8));
		return dni.charAt(8) == letras.charAt(numeroDni % 23);
	}
}