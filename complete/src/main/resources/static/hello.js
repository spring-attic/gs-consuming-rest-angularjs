function Hello($scope, $http) {
    $http.get('/greeting').
        success(function(data) {
            $scope.greeting = data;
        });
}
