<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Ejemplo de Libros en Angular</title>
		<meta name="layout" content="main"/>
	</head>
	<body>
		<div ng-app="librosApp" ng-controller="TodosLosLibrosCtrl">
			
			<div class="filtro">
				<span class="buscarLibros">Buscar:</span> <input
					ng-model="libroBuscado" class="filtroLibros">
			</div>
		
			<table class="tablaLibros">
				<tr>
					<th>Titulo</th>
					<th>Autor</th>
				</tr>
				<tr ng-repeat="libro in libros | filter:libroBuscado">
					<td>{{libro.titulo}}</td>
					<td>{{libro.autor}}</td>
				</tr>
			</table>
			
		</div>
	</body>
</html>
