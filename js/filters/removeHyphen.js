var app = angular.module('app').filter('removeHyphen', function() {
    return function(string) {
    	return string.replace(/[-]/g,' ');       
    };
});