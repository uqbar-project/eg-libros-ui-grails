package ar.edu.libros.domain

import ar.edu.libros.exceptions.BusinessException
import java.util.Date

class Libro implements Cloneable {
	
	@Property Long id
	@Property String autor
	@Property String titulo
	@Property String editorial
	@Property Integer anioPublicacion
	
	new() {
		autor = ""
		titulo = ""
		editorial = ""
	}
	
	new(String autor, String titulo, String editorial, Integer anioPublicacion) {
		this.autor = autor
		this.titulo = titulo
		this.editorial = editorial
		this.anioPublicacion = anioPublicacion	
	}
	
	override toString() {
		titulo
	}
	
	def void validar() {
		if (autor == null) {
			throw new BusinessException("autor", "Debe completar el autor")
		}
		if (titulo == null) {
			throw new BusinessException("titulo", "Debe completar el título")
		}
		if (editorial == null) {
			throw new BusinessException("editorial", "Debe completar la editorial")
		}
		if (anioPublicacion == null) {
			throw new BusinessException("anioPublicacion", "Debe completar el año de publicación")
		}
		if (anioPublicacion != null && anioPublicacion > new Date().year) {
			throw new BusinessException("anioPublicacion", "El año de publicación no puede ser posterior al año actual") 
		}
	}
	
	def actualizarCon(Libro libro) {
		this.autor = libro.autor
		this.titulo = libro.titulo
		this.editorial = libro.editorial
		this.anioPublicacion = libro.anioPublicacion
	}
	
	def matchea(Libro libro) {
		matcheaAutor(libro) || matcheaTitulo(libro)
	}
	
	def matcheaTitulo(Libro libro) {
		libro.titulo == null || titulo.contains(libro.titulo)
	}
	
	def matcheaAutor(Libro libro) {
		libro.autor == null || autor.contains(libro.autor)
	}

	def Libro copy() {
		super.clone as Libro
	}	
	
}