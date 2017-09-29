angular.module('app').factory('vendorFactory', ['$resource', '$http', function($resource, $http){ 
	return {
		profile: function(email){
			return $http.get("webapi/vendor/" + email);
		},
		Login: function(val){
        	return $http.post("webapi/vendor/login", val);
		},
		vendor_logout: function(){
			return $http.get("webapi/vendor/logout");
		},
		forgotPassword: function(email){
			return $http.post("webapi/vendor/forgotPassword", {"email" : email});
		},
		updateProfile: function(val){
			return $http.put("webapi/vendor/" + val.id , val); 
		},
		updatePassword: function(val){
			return $http.put("webapi/vendor/" + val.id , val);
		},
		signUp: function(val){
			return $http.post("webapi/vendor/", val); 
		},
		profilePicUpload: function(file, email){
			return $http.put("webapi/vendor/img/" + email,file); 
		},
		thankyouEmail: function(email){
			return $http.get("webapi/vendor/signup/" + email);
		},
		countHotels: function(){
			return $http.get("webapi/admin/countHotels");  
		},
		getAllHotels: function(limit){
			console.log(limit);
			return $http.get("webapi/admin/allHotels/" + limit);
		},
		countHotelsBySearch: function(data){
			return $http.get("webapi/admin/getHotelsBySearch/" + data);
		},
		getHotelsByCountry: function(limit,country){
			return $http.get("webapi/admin/getHotelByCountry/" +limit+"/"+ country);
		},
		exportSearchHotels: function(val){
			console.log(val);
			return $http.get("webapi/vendor/exportHotelSearch/" + val);
		},
		updateVendorPlan: function(val){
			return $http.post("webapi/vendor/updateVendorPlan", val);
		},
		thanksMail: function(mail, vendorPlan){
			return $http.get("webapi/vendor/mailForVendorPlan/" + mail+"/"+vendorPlan);
		},
		getHotelById: function(id) {
			return $http.get("webapi/admin/hotel/" + id);
		},
		advance_Search: function(attrs){
			return $http.post("webapi/vendor/getHotelsBySearch", attrs);
		},
		getHotelImages: function(hotelId){
			return $http.get("webapi/admin/hotelImages/" + hotelId)
		},
		signUpVendor: function(val){
			return $http.post("webapi/vendor/signUpVendor", val);
		},
		getAllAds: function(email){
			return $http.get("webapi/freeVendors/getAllAds/" + email); 
		},
		getSingleAd: function(id){
			return $http.get("webapi/freeVendors/getSingleAd/"+id);
		},
		updateAd: function(val,list){
			return $http.put("webapi/freeVendors/updateAd/"+val.id+"/"+list,val);
		},
		removeAd: function(id){
			return $http.delete("webapi/freeVendors/deleteAd/"+id);
		},
		mainCategories: function(){
			return $http.get("webapi/listing/mainCategory");
		},
		subCategories: function(id){
			return $http.get("webapi/listing/subCategory/" + id);
		},
		allListing: function(email){
			return $http.get("webapi/listing/allListing/"+email);
		},
		getListById: function(id){
			return $http.get("webapi/listing/getList/"+id);
		},
		listUpdate: function(val){
			return $http.put("webapi/listing/updateList",val);
		},
		removeList: function(id){
			return $http.delete("webapi/listing/removeList/"+id);
		},
		emailCheck: function(val){
			return $http.get("webapi/contact/checkEmail/"+val);
		},
		getAllKeyWords: function(val){
			return $http.get("webapi/listing/getVendorListKeywords/"+val);
		},
		listData: function(val){
			return $http.get("webapi/listing/singleListData/"+ val);
		}
	}
}]);