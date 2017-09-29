var app = angular.module('app').factory('freeVendorFactory', ['$resource', '$http', function($resource, $http){
	return {
		addNewVendor: function(val){
			return $http.post("webapi/freeVendors/", val);	
		},
		countries: function(){
			return $http.get("webapi/listing/country");
		},
		mainCategories: function(){
			return $http.get("webapi/listing/mainCategory");
		},
		subCategories: function(id){
			return $http.get("webapi/listing/subCategory/" + id);
		},
		thanksListing: function(val){
			return $http.post("webapi/listing/listCreate", val);
		},
		emailCheck: function(val){
			return $http.get("webapi/contact/checkEmail/"+val);
		}
	}
}]);