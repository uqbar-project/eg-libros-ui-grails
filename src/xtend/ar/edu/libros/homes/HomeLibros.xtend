package ar.edu.libros.homes

import ar.edu.libros.domain.Libro
import java.util.List

interface HomeLibros {
	
	def void agregarLibro(Libro libro)
	def void actualizarLibro(Libro libro)
	def void eliminarLibro(Libro libro)
	def Libro getLibro(Long id)
	def List<Libro> getLibros(Libro libroBusqueda)
	
}