var app = angular.module('app').controller('freeVendorCtrl',['$scope', '$state', 'freeVendorFactory', '$stateParams',
    function ($scope, $state, freeVendorFactory, $stateParams) {
	var init = function(){
		$scope.app.settings.htmlClass = 'hide-sidebar top-navbar ls-bottom-footer-fixed';
		$scope.userData =  ($stateParams.success || {});
	};
	init();
	$scope.user = [];
	$scope.freeSignup = function(){ // Free vendor sign up
			freeVendorFactory.addNewVendor($scope.user1).then(function(response){
			});
			window.location.href = "Vendors/thankyou";
		}; // End Free vendor sign up
	$scope.getCountries = function(){ // get all countries
		freeVendorFactory.countries().then(function(response){
			$scope.countriez = response.data.countries;
		});
	}; // End get all countries
	$scope.getMainCategories = function(){ // get Main Categories
		freeVendorFactory.mainCategories().then(function(response){
			$scope.mainCategoriez = response.data;
		});
	}; // End get Main Categories
	$scope.getSubCategory = function(id){ // get sub category
		$scope.categoryId = id;
		if(($scope.categoryId == "--- Select ---") || ($scope.categoryId.length == "" )){
			$(".subCategory").css({"display":"none"});
		} else {
			$(".subCategory").css({"display":"block"});
			freeVendorFactory.subCategories($scope.categoryId).then(function(response){
				$scope.subCategoriez = response.data;
				$scope.mcategory = false;
			});
		}
	}; // End get sub category
	$scope.uploadListMainImage = function(e){ // Select list main image
		$scope.files = [];
	    $scope.$apply(function () {
	        for (var i = 0; i < e.length; i++) {
	            $scope.files.push(e[i])
	        }
	    });
	}; // End list main image
	$scope.createListing = function(){ // Create Listing
		if($scope.listUser.mainCategory == "--- Select ---" || $scope.listUser.mainCategory == null){$scope.mcategory = true;}
		else {$scope.mcategory = false;}
		if($scope.listUser.subCategory == null){$scope.scategory = true;}
		else {$scope.scategory = false;}
		if($scope.listUser.listPlan == "--- Select ---" || $scope.listUser.listPlan == 0){$scope.listPlan = true;}
		else {$scope.listPlan = false;}
		if($("#file").val() == "")
			$scope.mImage = true;
		if($scope.listUser.countries == null)
			$scope.country = true;
		 var data = new FormData();
		    var objXhr = new XMLHttpRequest();
		    for (var i in $scope.files) {
		        data.append("file", $scope.files[i]);
		        data.append("mcategory", $scope.listUser.mainCategory);
		        data.append("scategory", $scope.listUser.subCategory);
		        data.append("listPlan", $scope.listUser.listPlan);
		        data.append("title", $scope.listUser.title);
		        data.append("cn", $scope.listUser.companyName);
		        data.append("cp", $scope.listUser.contactPerson);
		        data.append("address", $scope.listUser.address);
		        data.append("city", $scope.listUser.city);
		        data.append("state", $scope.listUser.state);
		        data.append("country", $scope.listUser.countries);
		        data.append("phone", $scope.listUser.phone);
		        data.append("fax", $scope.listUser.fax);
		        data.append("email", $scope.listUser.email);
		        data.append("website", $scope.listUser.website);
		        data.append("description", $scope.listUser.description);
		        objXhr.open("POST", "webapi/listing/createListing", true);
		        objXhr.send(data);
		        objXhr.onreadystatechange = function (event) {
		            var xhr = event.target;
		            if (xhr.readyState === 4 && xhr.status === 200) {
		            	var z = JSON.parse(xhr.responseText);
		            	$scope.user = JSON.parse(xhr.responseText);
		            	console.log($scope.user.amount);
		            	var options = { reload: false, inherit: true, notify: true };  
		            	if($scope.user.amount == "1.0"){
		            		window.location.href="Vendors/thanks";
		            	} else {
		            		$state.go('freeVendors.createListing2', { success: $scope.user }, {});
		            	}
		            }
		        };
		    }
	}; // End create Listing
	$scope.getSubCate = function(){ // sub category
		$scope.scategory = false;
	};// End sub category
	$scope.chgCountry = function(){
		$scope.country = false;
	};
	$scope.getLstPlan = function(){
		$scope.listPlan = false;
	};
	$scope.back_createList = function(){
		window.location.href = "Vendors/createListing";
	};
	$scope.listThanks = function(e){
		$scope.data = e;
		var z = $scope.data;
		var d = z.split("&");
		var dat = "{\"mainCategory\": " + d[0] + ",\"subCategory\": " + d[1]
		+ ",\"mainImage\": \"" + d[2] + "\",\"signupPlan\": " + d[3]
		+ ",\"title\": \"" + d[4] + "\",\"companyName\": \"" + d[5]
		+ "\",\"contactPerson\": \"" + d[6] + "\",\"address\": \"" + d[7]
		+ "\",\"phone\": \"" + d[8] + "\",\"fax\": \"" + d[9] + "\",\"email\": \""
		+ d[10] + "\",\"website\": \"" + d[11] + "\",\"description\": \""
		+ d[12] + "\",\"city\":\""+d[13]+"\",\"state\":\""+d[14]+"\",\"country\":\""+d[15]+"\"}";
		
		freeVendorFactory.thanksListing(dat).then(function(response){
		});
	};
	$scope.checkEmail = function(){
		var ckEmail = $scope.form.email.$viewValue;
		freeVendorFactory.emailCheck(ckEmail).then(function(response){
			if(response.data.val == "1"){
				$scope.ckemail = true;
			} 
		});
	};
	$scope.hideError = function(){
		$scope.ckemail = false;
	};
	}
]);