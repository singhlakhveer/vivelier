var app = angular.module('app').factory('adminFactory', ['$resource', '$http', function($resource, $http){ 
	return {
		Login: function(val){
			return $http.post("webapi/admin/login", val);
		},
		admin_logout: function(){
			return $http.get("webapi/admin/logout");
		},
		profile: function(email){
			return $http.get("webapi/admin/" + email);
		},
		updateProfile: function(val){
			return $http.put("webapi/admin/" + val.id , val); 
		},
		updatePassword: function(val){
			return $http.put("webapi/admin/" + val.id , val); 
		},
		getVendorsList: function(){
			return $http.get("webapi/admin/vendors"); 
		},
		getVendorsListByPlan: function(plan){
			return $http.get("webapi/admin/vendorsByPlan/"+plan);
		},
		getVendorById: function(id){ 
			return $http.get("webapi/admin/vendors/" + id);
		},
		resetVendorPassword: function(val){
			return $http.put("webapi/admin/vendor/" + val.id , val); 
		},
		deactive: function(id){
			return $http.put("webapi/admin/vendor/deactivate/" + id);
		},
		activate: function(id){
			return $http.put("webapi/admin/vendor/activate/" + id);
		},
		databaseBackup: function(){
			return $http.get("webapi/admin/backupDatabase");
		},
		getCityOrCountry: function(val){
			return $http.get("webapi/admin/hotels/" + val);
		},
		exportHotelDetailsInCSV: function(data){
			return $http.post("webapi/admin/hotels/" + data);
		},
		getAllHotels: function(limit){
			return $http.get("webapi/admin/allHotels/" + limit);
		},
		countHotels: function(){
			return $http.get("webapi/admin/countHotels");  
		},
		getHotelById: function(id){
			return $http.get("webapi/admin/hotel/" + id); 
		},
		update_hotel_detail: function(val){
			return $http.put("webapi/admin/hotel/" + val.id, val);
		},
		addNewHotel: function(val){
			return $http.post("webapi/admin/addNewHotels", val);
		},
		deleteHotel: function(id){
			return $http.delete("webapi/admin/deleteHotel/"+id);
		},
		getGalleryImages: function(id) {
			return $http.get("webapi/admin/hotelGallery/" + id);
		},
		getCountry: function(){
			return $http.get("webapi/admin/countries");
		},
		countHotelsBySearch: function(data){
			return $http.get("webapi/admin/getHotelsBySearch/" + data);
		},
		getHotelsByCountry: function(limit,country){
			return $http.get("webapi/admin/getHotelByCountry/" +limit+"/"+ country);
		},
		countvendors: function(){
			return $http.get("webapi/admin/countVendors");
		},
		getHotelImages: function(hotelId){
			return $http.get("webapi/admin/hotelImages/" + hotelId)
		},
		getAllAds: function(email){
			return $http.get("webapi/freeVendors/getAllAds/" + email); 
		},
		removeAd: function(id){
			return $http.delete("webapi/freeVendors/deleteAd/"+id);
		},
		allListing: function(email){
			return $http.get("webapi/listing/allListing/"+email);
		},
		removeList: function(id){
			return $http.delete("webapi/listing/removeList/"+id);
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
		getContactUsList: function(){
			return $http.get("webapi/contact/allContactUsList");
		},
		serviceData: function(){
			return $http.get("webapi/admin/getServices");
		},
		deleteContactUs: function(id){
			return $http.delete("webapi/contact/removeContactUs/"+id);
		}
	}
}]);