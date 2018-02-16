package utilities;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
/*
import domain.Category;
import domain.Trip;
*/
public class TreeBuilder {

	
	
	/** 
	 * Devuenve una cadena html que representa una lista jerarquica
	 * de la coleccion pasada como parametro,
	 * con raiz en nodo pasado como parametro.
	 * 
	 * @param categories
	 * @return 
	 */
/*
	public static String jspTree(Collection<Category> categories, Integer parentNode) {
		String res = "";
		for (Category category : categories) {
			if (category.getParent().getId() == parentNode) {
				// lista.add category

				res += "<li><a onclick=\"setCategoria('" + category.getName()+"', " + category.getId() + ")\">" + category.getName()
						+ "</a><ul>" + jspTree(categories, category.getId());
				res += "</ul> </li>";

			}
		}

		return res;
	}
	
	
	public static Collection<Category> deepSearchCategories(Collection<Category> categories, Category parentNode){
		Collection<Category> res = new ArrayList<Category>();
		for (Category category : categories) {
			if (category.getParent() == parentNode) {
				// lista.add category
				res.add(category);
				res.addAll(deepSearchCategories(categories, category));
				

			}
		}

		return res;
	}
	public static Collection<Category> deepSearchCategoriesPorNiveles(Collection<Category> categories, Category parentNode){
		List<Category> res = new ArrayList<Category>();
		List<Category> aux = (List<Category>) deepSearchCategories(categories, parentNode);
		res.add(parentNode);
		res.addAll(searchSons(aux, parentNode));
		aux.removeAll(res);
		res.addAll(deepSearchCategoriesPorNiveles(aux, res));
		
		res = reverseList(res);
		return res;
	}
	public static Collection<Category> deepSearchCategoriesPorNiveles(Collection<Category> categories, Collection<Category> acumuladas){
		List<Category> res = new ArrayList<Category>(acumuladas);
		List<Category> aux = new ArrayList<Category>(categories);
		for (Category category : acumuladas) {
			res.addAll(searchSons(aux,category));
			
		}
		aux.removeAll(res);
		if(aux.size()>0)
			res.addAll(deepSearchCategoriesPorNiveles(aux, res));
		
		return res;
	}
	
	
	public static Collection<Category> searchSons(Collection<Category> categories, Category parentNode){
		Collection<Category> res = new ArrayList<Category>();
		for (Category category : categories) {
			if (category.getParent() == parentNode) {
				// lista.add category
				res.add(category);
			}			
		}

		return res;
	}
	
	public static List<Category> reverseList(List<Category> lista){
		List<Category>  res = new ArrayList<>();
		for(int i=1; i <= lista.size(); i++){
			res.add(lista.get(lista.size()-i));
		}
		return res;
	}

	*/
}
