///////////////////////////////////////////////////////////////////////////////
// Main Module
///////////////////////////////////////////////////////////////////////////////	
angular.module('mainModule', [])
  .controller('mainController', ['$scope', '$http', 'jsonFilter', function ($scope, $http, jsonFilter){
    $scope.headerMsg = 'Angular JS - Http Service';

    var logResult = function(str, data, status, headers, config){
      return str + '\n'
        + '****************************************\n'
        + 'status: ' + status + '\n'
        + '****************************************\n'
        + 'headers: ' + jsonFilter(headers()) + '\n'
        + '****************************************\n'
        + 'config: ' + jsonFilter(config) + '\n'
        + '****************************************\n'
        + 'data: ' + data + '\n';
    };

    // Simplet Get
    $scope.simpleGetResult = '';

    $scope.simpleGetFn = function(success){
      var url = $scope.baseUrl + ((success) ? '/simple' : '/non-exist');
      console.log('URL => '+url);

      $http.get(url)
        .success(function(data, status, headers, config){
          $scope.simpleGetResult = 'Okay';
        })
        .error(function(data, status, headers, config){
          $scope.simpleGetResult = logResult("GET FAILURE", data, status, headers, config);
        });
    };
  }])