function HelloCtrl($scope, $http) {
    $http.get('/greeting').
        success(function(data) {
            $scope.greeting = data;
        });
}
