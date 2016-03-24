apiTestCtrl =  ($scope, Note) -> 
    
    $scope.title = "Testing MEAN stack application"

    $scope.notes = Note.getList().$object

angular.module 'apitest'
    .controller 'ApiTestCtrl', [       
        '$scope'
        'Note'

        apiTestCtrl
]
