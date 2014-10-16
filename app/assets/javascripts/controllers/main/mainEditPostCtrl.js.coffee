@EditPostCtrl = ($scope, $routeParams, $location, $q, postData) ->

  $scope.data =
    postData: postData.data
    currentPost:
      title: 'Loading...'
      description: ''

  $scope.data.postId = $routeParams.postId

  $scope.navNewPost = ->
    $location.url('/post/new')

  $scope.navHome = ->
    $location.url('/')
  $scope.viewPost = (postId) ->
    $location.url('/post/'+postId)
  # This will be run once the loadPosts successfully completes (or immediately
  # if data is already loaded)
  $scope.prepPostData = ->
    post = _.findWhere(postData.data.posts, { id: parseInt($scope.data.postId) })
    $scope.data.currentPost.title = post.title
    $scope.data.currentPost.description = post.description

  # Create promise to be resolved after posts load
  @deferred = $q.defer()
  @deferred.promise.then($scope.prepPostData)

  # Provide deferred promise chain to the loadPosts function
  postData.loadPosts(@deferred)

  $scope.navEditPost = ->
    $location.url('/post/edit')


@EditPostCtrl.$inject = ['$scope', '$routeParams', '$location', '$q', 'postData']