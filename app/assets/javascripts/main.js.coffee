# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require_self
#= require_tree ./services/main
#= require_tree ./filters/main
#= require_tree ./controllers/main
#= require_tree ./directives/main

#Creates new Angular module called 'Kwak'
Kwak = angular.module('Kwak', ['ngRoute'])

#Sets up routing
Kwak.config(['$routeProvider', ($routeProvider) ->

	#Route for add post
	$routeProvider.when('/post/new', { templateUrl: '../assets/mainCreatePost.html', controller: 'CreatePostCtrl' } )

	#Route for category
	$routeProvider.when('/category', { templateUrl: '../assets/mainCategory.html', controller: 'CategoryCtrl' } )

	#Route for '/post'
	$routeProvider.when('/post/:postId', { templateUrl: '../assets/mainPost.html', controller: 'PostCtrl' } )

	#Default
	$routeProvider.otherwise({ templateUrl: '../assets/mainIndex.html', controller : 'IndexCtrl' } )

])

Kwak.config(["$httpProvider", (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])