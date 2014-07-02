import ar.edu.libros.domain.Libro
import ar.edu.libros.homes.HomeLibrosImpl

class BootStrap {

	def init = { servletContext ->

		println "Generamos juego de datos de libros"
		// Genero el juego de datos
		HomeLibrosImpl.instance.agregarLibro(new Libro("Julio Cortázar", "Rayuela", "Alfaguara", 1965))
		HomeLibrosImpl.instance.agregarLibro(new Libro("Julio Cortázar",  "Octaedro", "Alfaguara", 1968))
		HomeLibrosImpl.instance.agregarLibro(new Libro("José Saramago",  "Ensayo sobre la ceguera", "Sudamericana", 1998))
		HomeLibrosImpl.instance.agregarLibro(new Libro("Jorge Asís",  "Flores robadas en los jardines de Quilmes", "Planeta", 1981))
		HomeLibrosImpl.instance.agregarLibro(new Libro("Osvaldo Bayer",  "La Patagonia Rebelde", "Galerna", 1972))
		HomeLibrosImpl.instance.agregarLibro(new Libro("Fyodor Dostoyevsky",  "Crimen y castigo", "Galerna", 1866))

	}
	def destroy = {
	}
}
