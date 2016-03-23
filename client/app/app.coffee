###
    Source: app.coffee 
    Project: 
    Description: Main application module
    Author: Alexander Tatchin | github.com/sancau
###

angular.module 'app', [
    'ui.router'
    
    # cached templates module compiled (jade>html) by grunt process
    # stored in ../js/app-views.js
    'app.views'
]
.config [
    '$stateProvider'
    '$urlRouterProvider'
    
    ($stateProvider, $urlRouterProvider) ->
        $urlRouterProvider.otherwise '/'
]

.controller 'AppCtrl', [
        '$location'
        '$state'
        '$scope'
    
        ($location, $state, $scope) ->
            vm = this
            
            # initial index page title    
            vm.pageTitle = 'Index Page Title'
            
            # page title depends on current state
            $scope.$on '$stateChangeSuccess', (event, toState, toParams, fromState, fromParams) ->
                if angular.isDefined toState.data.pageTitle
                    vm.pageTitle = "#{toState.data.pageTitle}"
            
            return vm
    ]
