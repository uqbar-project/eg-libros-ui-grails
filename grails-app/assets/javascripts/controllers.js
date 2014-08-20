'use strict';
console.log("controllers.js");

/* Controllers */
//angular.module('librosApp', []).controller('TodosLosLibrosCtrl', function ($scope) {
//	$scope.libros = [
//		{'titulo': 'The design of every day things', 'autor': 'Don Norman'},
//		{'titulo': 'El nombre del viento', 'autor': 'Patrik Rufus'},
//		{'titulo': 'Game of Thrones', 'autor': 'R.R. Martin'}
//	];
angular.module('librosApp', []).controller('TodosLosLibrosCtrl', function ($scope, $http) {
	$http.get('libro/list').
    success(function(data, status, headers, config) {
      $scope.libros = data;
    }).
    error(function(data, status, headers, config) {
      // log error
    });
});
  
  
