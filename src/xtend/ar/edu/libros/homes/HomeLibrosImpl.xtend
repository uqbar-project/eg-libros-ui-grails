package ar.edu.libros.homes

import ar.edu.libros.domain.Libro
import java.util.ArrayList
import java.util.List

class HomeLibrosImpl implements HomeLibros {

	List<Libro> libros

	/** singleton **/
	static HomeLibrosImpl instance

	private new() {
		libros = new ArrayList<Libro>
	}

	static def getInstance() {
		if(instance == null) {
			instance = new HomeLibrosImpl()
		}
		instance
	}

	/** fin singleton **/
	
	override agregarLibro(Libro libro) {
		libro.id = new Long(this.ultimoIdUtilizado.longValue + 1)
		libros.add(libro)
	}
	
	def int getUltimoIdUtilizado() {
		if (libros.isEmpty) {
			return 1
		}
		return libros.sortBy [ -it.id ].toList.get(0).id.intValue
	}

	override actualizarLibro(Libro libroActualizado) {
		libroActualizado.validar
		if (libroActualizado.id == null) {
			this.agregarLibro(libroActualizado)
		} else {
			this.doActualizarLibro(libroActualizado)
		}
	}

	def doActualizarLibro(Libro libroActualizado) {
		val unLibro = this.getLibro(libroActualizado.id).copy
		unLibro.actualizarCon(libroActualizado)
	}

	override eliminarLibro(Libro libro) {
		libros.remove(this.getLibro(libro.id))
	}

	override getLibro(Long id) {
		libros.findFirst[libro|libro.id.equals(id)]
	}

	override getLibros(Libro libroBusqueda) {
		libros.filter[libro|libro.matchea(libroBusqueda)].toList.map [ it.copy ]
	}

}
