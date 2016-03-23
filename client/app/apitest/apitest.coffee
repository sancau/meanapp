angular.module 'apitest', [
    'restangular'
    'ui.router'
]

.config [
    '$stateProvider'
    'RestangularProvider'

    ($stateProvider, RestangularProvider) ->
        
        $stateProvider
            .state 'apitest',
                url: '/'
                views:
                    'main':
                        controller: 'ApiTestCtrl'
                        templateUrl: 'apitest/view.jade'
                data: 
                    pageTitle: 'API TEST'

        RestangularProvider
            .setBaseUrl 'http://localhost:3000'
]

.factory 'NoteRestangular', [
        'Restangular'
        (Restangular) ->
            Restangular.withConfig (RestangularConfigurer) ->
                RestangularConfigurer.setRestangularFields {
                    id: '_id'
                }           
]

.factory 'Note', [
    'NoteRestangular'
    (NoteRestangular) ->
        NoteRestangular.service('note')
]