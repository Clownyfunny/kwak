@CreatePostCtrl = ($scope, $location, postData) ->

  $scope.data = postData.data
  postData.loadPosts(null)

  $scope.formData =
    newPostTitle: ''
    newPostDescription: ''

  $scope.navHome = ->
    $location.url('/')

  $scope.createPost = ->
    tampon=postData.createPost($scope.formData)
    console.log(tampon)
    if(tampon==true)
      $location.url('/')

  $scope.clearPost = ->
    $scope.formData.newPostTitle = ''
    $scope.formData.newPostDescription = ''


@CreatePostCtrl.$inject = ['$scope', '$location', 'postData']