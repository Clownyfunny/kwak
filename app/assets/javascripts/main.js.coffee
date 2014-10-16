# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require_self
#= require_tree ./services/global
#= require_tree ./services/main
#= require_tree ./filters/global
#= require_tree ./filters/main
#= require_tree ./controllers/global
#= require_tree ./controllers/main
#= require_tree ./directives/global
#= require_tree ./directives/main

#Creates new Angular module called 'Kwak'
Kwak = angular.module('Kwak', ['ngRoute'])

#Sets up routing
Kwak.config(['$routeProvider', ($routeProvider) ->

	#Route for create post
	$routeProvider.when('/post/new', { templateUrl: '../assets/mainCreatePost.html.erb', controller: 'CreatePostCtrl' } )

	#Route for category
	$routeProvider.when('/category', { templateUrl: '../assets/mainCategory.html.erb', controller: 'CategoryCtrl' } )

	#Route for view on post
	$routeProvider.when('/post/:postId', { templateUrl: '../assets/mainPost.html.erb', controller: 'PostCtrl' } )

	#Route for edit a post
	$routeProvider.when('/post/edit/:postId', { templateUrl: '../assets/mainEditPost.html.erb', controller: 'EditPostController'})

	#Default
	$routeProvider.otherwise({ templateUrl: '../assets/mainIndex.html.erb', controller : 'IndexCtrl' } )

])

Kwak.config(["$httpProvider", (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])