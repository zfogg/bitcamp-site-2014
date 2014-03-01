bitcamp = angular.module("bitcampApp")

  .controller "RegisterCtrl", ($scope, $rootScope, $location) ->
    $rootScope.api_messages = []

    $scope.email    = ""
    $scope.password = ""
    $scope.confirm  = ""

    $rootScope.apiErr = (name, errObj) ->
      if errObj[name]
        m = "#{name} #{errObj[name][errObj[name].length-1]}"
        console.log m
        m
      else false

    null

  .controller "RegisterCtrl_1", ($rootScope, $scope, $http, colors, $cookieStore, $state) ->
    $rootScope.navBubbles = [true, false, false, false]
    $rootScope.bodyCSS["background-color"] = colors["green-light"]

    if $cookieStore.get "auth"
      $state.go "register.two"
    else
      $state.go "main"

    $scope.register = ->
      $scope.emailErr    = ""
      $scope.passwordErr = ""
      $http.post("/api/register", {
        email:    $scope.email
        password: $scope.password
        confirm:  $scope.confirm
      })
        .success (data) ->
          $rootScope.api_messages = []
          $scope.email    = ""
          $scope.password = ""
          $scope.confirm  = ""
          console.log data
          null
        .error (err) ->
          $rootScope.api_messages = []
          $scope.emailErr    = $rootScope.apiErr "email", err
          $scope.passwordErr = $rootScope.apiErr "password", err


  .controller "RegisterCtrl_2", ($rootScope, colors, $cookieStore, $state) ->
    $rootScope.navBubbles = [true, true, false, false]
    $rootScope.bodyCSS["background-color"] = colors["blue-light"]

    unless $cookieStore.get "auth"
      $state.go "main"

  .controller "RegisterCtrl_3", ($rootScope, colors, $cookieStore, $state) ->
    $rootScope.navBubbles = [true, true, true, false]
    $rootScope.bodyCSS["background-color"] = colors["orange-dark"]

    unless $cookieStore.get "auth"
      $state.go "main"

  .controller "RegisterCtrl_4", ($rootScope, colors, $cookieStore, $state) ->
    $rootScope.navBubbles = [true, true, true, true]
    $rootScope.bodyCSS["background-color"] = colors["blue-darker"]

    unless $cookieStore.get "auth"
      $state.go "main"
