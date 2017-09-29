var app = angular.module('app').factory('homeFactory', ['$resource', '$http', function($resource, $http){
	return {
		getAllListing: function(){
			return $http.get("webapi/listing/getAllList");
		},
		categories: function(){
			return $http.get("webapi/listing/categories");
		},
		listData: function(id){
			return $http.get("webapi/listing/singleListData/"+ id);
		},
		listingData: function(mId,sId){
			return $http.get("webapi/listing/ListingData/"+ mId+"/"+sId);
		},
		listingDataByState: function(mId,sId,st){
			return $http.get("webapi/listing/ListingDataByState/"+ mId+"/"+sId+"/"+st);
		},
		listingDataByCountry: function(mId,sId,st,co){
			return $http.get("webapi/listing/ListingDataByCountry/"+ mId+"/"+sId+"/"+st+"/"+co);
		},
		mainCategories: function(){
			return $http.get("webapi/listing/mainCategory");
		},
		subCategories: function(mid){
			return $http.get("webapi/listing/subCategory/" + mid);
		},
		mainCategoryListData: function(mid){
			return $http.get("webapi/listing/mainCategoryListing/" + mid.split("+").join("-"));
		},
		ListDataByAddress: function(data){
			return $http.get("webapi/listing/getListingDataByAddress/" + data);
		},
		contact_vendor: function(val){
			return $http.post("webapi/contact/contactVendor", val);
		},
		Login: function(val){
        	return $http.post("webapi/vendor/login", val);
		},
		addRating: function(val){
			return $http.post("webapi/contact/addRating", val);
		},
		/*
		 * getRatingByMail: function(email){ return
		 * $http.get("webapi/contact/getRatingByEmail/"+ email); }
		 */
		allReviewsByList: function(id){
			return $http.get("webapi/contact/ratingByList/"+ id);
		},
		twitterOAuth: function(lid){
			return $http.get("webapi/contact/twitterOAuthURL/" + lid);
		},
		emailSubscribe: function(val){
			return $http.post("webapi/contact/subscribeMail", {"email" : val.email,"name" : val.name});
		},
		aboutData: function(){
			return $http.get("webapi/admin/getAboutData");
		},
		privacyData: function(){
			return $http.get("webapi/admin/getPrivacyData");
		},
		termsData: function(){
			return $http.get("webapi/admin/getTermsConditions");
		},
		contactUs: function(val){
			return $http.post("webapi/contact/contactus", val);
		},
		serviceData: function(){
			return $http.get("webapi/admin/getServices");
		},
		getListingAddress: function(){
			return $http.get("webapi/listing/getListingAddress");
		},
		getListingCity: function(){
			return $http.get("webapi/listing/getListingCity");
		},
		getListingState: function(){
			return $http.get("webapi/listing/getListingState");
		},
		getListingCountry: function(){
			return $http.get("webapi/listing/getListingCountry");
		},
		getAllKeywords: function(val){
			return $http.get("webapi/listing/getKeywords/"+val);
		}
	}
 }]);