
# Actualización de Libros en Grails

<img src="https://cloud.githubusercontent.com/assets/4549002/18517870/40a22aee-7a74-11e6-99e0-211e44d7bacf.png" width="100px;" height="100px;"/>
<br/>
<img src="video/demo.gif" width="80%" height="80%"/>

## Explicación

Se encuentra en [este apunte](https://docs.google.com/document/d/1g9Q7TxWU5hJu6_V8r63eSCek1EC1PCTL-f310XzDANE/edit#heading=h.z0vrvi6xk0zu)
donde se cuenta la navegación entre

* la pantalla de búsqueda
* y la edición/consulta de un libro

## Consideraciones

* Antes que nada [instalar el plugin de Xtend](http://uqbar-wiki.org/index.php?title=Integraci%C3%B3n_Grails_con_Xtend)
* Para el branch **master**
 * el objeto de dominio está en Xtend
 * también el repositorio (objeto de acceso a datos)
 * los controllers y las vistas son propias de Grails
* Para el branch **angular**
 * muestra cómo se integra Grails con una tecnología RIA como AngularJS
 * los libros se obtienen de un servicio REST que devuelve libros como JSON
 * en el cliente se utiliza un filtro de AngularJS
 * los objetos de dominio Libro están hechos en Xtend 

## Versiones actuales

* Grails 2.4.2
* en un entorno GGTS 3.6.0
* con Twitter Boostrap 3.2.0
* con Xtend 2.10.0 

