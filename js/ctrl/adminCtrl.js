var app = angular.module('app').controller('adminLoginCtrl',['$scope', '$state', '$timeout','adminFactory', '$location','$stateParams',
    function ($scope, $state, $timeout, adminFactory, $location,$stateParams) {
	$scope.vendorList = [];    
	var init = function(){
		$scope.contactUsID;
	};
	init();
	$scope.adminProfile = function(email){  // admin profile
		$scope.email = email;
		 adminFactory.profile($scope.email).then(function(response){ 
			if(response.data[0] == null){
				window.location.href = "admin/login";
			} else {
			$scope.firstname = response.data[0].firstName;
			$scope.user.img = "images/admin/"+response.data[0].img;
			$scope.admin = response.data[0];
			$scope.customAdminHtml = "<img src="+$scope.user.img+" class='img-circle' /> <span class='login-name' >" + $scope.firstname +"</span><span class='caret' />";
			adminFactory.countHotels().then(function(response){
				$scope.dashboardTotalHotels = response.data[0].id;
			});
			adminFactory.countvendors().then(function(response){
				$scope.dashboardTotalVendor = response.data[0].id;
			});
		 }
		});
	}; // end admin profile
	$scope.adminLogin = function(){  // admin login
		adminFactory.Login($scope.adminlogin).then(function(response){
			if(response.data.val == "Success"){
				window.location.href = 'admin/dashboard';
			} else if(response.data.val != "Success"){
				$scope.inval = true;
			} else {
				$window.location.href = 'admin/dashboard';
			}
		});
		$scope.adminlogin = ""; 
	};  // end admin login
	$scope.alogout = function(){
		adminFactory.admin_logout().then(function(response){
			if(response.data.val == "logout"){
				 window.location.href = 'http://localhost:8080/realestate/';
				// window.location.href =
				// 'http://ec2-52-66-150-60.ap-south-1.compute.amazonaws.com:8080/vivelier/';
			}
		});
	};
	$scope.profileUpdate = function(){  // profile update
		adminFactory.updateProfile($scope.admin).then(function(response){
			$scope.valid = "true";
		});
	}; // end profile update
	$scope.passwordUpdate = function(){
		if($scope.admin.password == null || $scope.admin.confirmPassword == null){
			$scope.password = true;
			$scope.confirmpassword = true;
		}
		else if($scope.admin.password != $scope.admin.confirmPassword){
			$scope.admin.inval = "Password dosen't match";
			$scope.password = false;
			$scope.confirmpassword = false;
		} else {
			adminFactory.updatePassword($scope.admin).then(function(response){
    			$scope.valid = "true";
    			$scope.admin = "";
    		});
		}
	}; // end password update
	$scope.getAllVendors = function(){
	adminFactory.getVendorsList().then(function(response){  
		$scope.vendorList = response.data;
		$scope.vendorStatus = response.data.status;
		
		 $scope.gap = 5;
   	    $scope.filteredItems = [];
   	    $scope.groupedItems = [];
   	    $scope.itemsPerPage = 10;
   	    $scope.pagedItems = [];
   	    $scope.currentPage = 0;
   	    $scope.items = response.data; 
   	    var searchMatch = function (haystack, needle) {
   	        if (!needle) {
   	            return true;
   	        }
   	        return haystack.toLowerCase().indexOf(needle.toLowerCase()) !== -1;
   	    };
   	    // init the filtered items
   	    $scope.search = function () {
   	    	$scope.filteredItems = $scope.items;
   	        $scope.currentPage = 0;
   	        // now group by pages
   	        $scope.groupToPages();
   	    };
   	    // calculate page in place
   	    $scope.groupToPages = function () {
   	        $scope.pagedItems = [];
   	        for (var i = 0; i < $scope.filteredItems.length; i++) {
   	            if (i % $scope.itemsPerPage === 0) {
   	            	$scope.pagedItems[Math.floor(i / $scope.itemsPerPage)] = [ $scope.filteredItems[i] ];
   	            } else {
   	                $scope.pagedItems[Math.floor(i / $scope.itemsPerPage)].push($scope.filteredItems[i]);
   	            }
   	        }
   	    };
   	    $scope.range = function (size,start, end) {
   	        var ret = [];        
   	        if (size < end) {
   	            end = size;
   	            if(start>$scope.gap)
   	            start = size-$scope.gap;
   	        }
   	        for (var i = start; i < end; i++) {
   	            ret.push(i);
   	        }        
   	        return ret;
   	    };
   	    $scope.prevPage = function () {
   	        if ($scope.currentPage > 0) {
   	            $scope.currentPage--;
   	        }
   	    };
   	    $scope.nextPage = function () {
   	        if ($scope.currentPage < $scope.pagedItems.length - 1) {
   	            $scope.currentPage++;
   	        }
   	    };
   	    $scope.setPage = function () {
   	        $scope.currentPage = this.n;
   	    };
   	    // functions have been describe process the data for display
   	    $scope.search();
		
	}); // end get vendors list
};
$scope.getPlan = function(e){ // get vndors by plan
	$scope.plan = e;
	if($scope.plan == "All"){
		$scope.getAllVendors();
	} else {
		adminFactory.getVendorsListByPlan($scope.plan).then(function(response){
    		$scope.vendorList = response.data; 
    		$scope.gap = 5;
       	    $scope.filteredItems = [];
       	    $scope.groupedItems = [];
       	    $scope.itemsPerPage = 10;
       	    $scope.pagedItems = [];
       	    $scope.currentPage = 0;
       	    $scope.items = response.data; 
       	    var searchMatch = function (haystack, needle) {
       	        if (!needle) {
       	            return true;
       	        }
       	        return haystack.toLowerCase().indexOf(needle.toLowerCase()) !== -1;
       	    };
       	    // init the filtered items
       	    $scope.search = function () {
       	    	$scope.filteredItems = $scope.items;
       	        $scope.currentPage = 0;
       	        // now group by pages
       	        $scope.groupToPages();
       	    };
       	    // calculate page in place
       	    $scope.groupToPages = function () {
       	        $scope.pagedItems = [];
       	        for (var i = 0; i < $scope.filteredItems.length; i++) {
       	            if (i % $scope.itemsPerPage === 0) {
       	            	$scope.pagedItems[Math.floor(i / $scope.itemsPerPage)] = [ $scope.filteredItems[i] ];
       	            } else {
       	                $scope.pagedItems[Math.floor(i / $scope.itemsPerPage)].push($scope.filteredItems[i]);
       	            }
       	        }
       	    };
       	    $scope.range = function (size,start, end) {
       	        var ret = [];        
       	        if (size < end) {
       	            end = size;
       	            if(start>$scope.gap)
       	            start = size-$scope.gap;
       	        }
       	        for (var i = start; i < end; i++) {
       	            ret.push(i);
       	        }        
       	        return ret;
       	    };
       	    $scope.prevPage = function () {
       	        if ($scope.currentPage > 0) {
       	            $scope.currentPage--;
       	        }
       	    };
       	    $scope.nextPage = function () {
       	        if ($scope.currentPage < $scope.pagedItems.length - 1) {
       	            $scope.currentPage++;
       	        }
       	    };
       	    $scope.setPage = function () {
       	        $scope.currentPage = this.n;
       	    };
       	    // functions have been describe process the data for display
       	    $scope.search();
    	});
	}
}; // end get vndors by plan
	$scope.vendorEdit = function(id){  // edit vendor
		$scope.id = id;
		$scope.user.id = id;
	}; // end edit vendor
	$scope.getVendorById = function(){  // vendor
			adminFactory.getVendorById($stateParams.id).then(function(response){
				if(response.data[0] == null){
					window.location.href = "admin/vendors";
				} else {
					$scope.user = response.data[0];
					$scope.user.img = "images/vendor/"+response.data[0].image;
        			$scope.customHtml = "<img src="+$scope.user.img+" class='img-circle' /> <span class='login-name' >" + $scope.firstname +"</span><span class='caret' />";
				}
			});
	}; // vendor
	$scope.vendorDeactive = function(id){ // deactivate vendor
		$scope.id = id;
		adminFactory.deactive($scope.id).then(function(response){
			location.reload();
		});
	}; // end deactivate vendor
	$scope.vendorActive = function(){ // activate vendor
			adminFactory.getVendorById($scope.user.id).then(function(response){
				adminFactory.activate(response.data[0].id).then(function(response){
					window.location.href = "admin/vendors";
				});
    		});
	}; // end activate vendor
	$scope.dbBackup = function(){  // database backup
		adminFactory.databaseBackup().then(function(response){
			window.location.href = response.data.val;
		});
	}; // end database backup
	$scope.reset = function(){
			adminFactory.getVendorById($scope.user.id).then(function(response){
				if(response.data[0] == null){
					window.location.href = "admin/vendors";
				} else {
					adminFactory.resetVendorPassword(response.data[0]).then(function(response){
						$scope.valid = true;
						$scope.suc1 = true;
					});
				}
			});
	};
	$scope.changeCityCountry = function(){ // select export type changeCityCountry
			if($scope.selectedItem == ""){
				$scope.select = false;
			} else {
				$scope.select = true;
				adminFactory.getCityOrCountry($scope.selectedItem).then(function(response){
					$scope.names = response.data;
					// angular.element(document.querySelector("#exportHotel")).addClass("selectpicker");
    			});
			}
	}; // end select export type changeCityCountry
	$scope.exportHotelDetails = function(){ // export hotel details in .csv file
		if($scope.selectedItemData == undefined){
			$scope.select = false;
		} 
		else {
			var data = $scope.selectedItem + "=" + $scope.selectedItemData;
			adminFactory.exportHotelDetailsInCSV(data.split(" ").join("-")).then(function(response){
				
				window.location.href = response.data.val;
				$scope.valid = true;
				$scope.hotel = "Exported";
			});
		}
	}; // end export hotel details in .csv file
	/** ********** Import CSV File***************** */
	$scope.csvFile = function(e){
		$scope.files = [];
        $scope.$apply(function () {
            // STORE THE FILE OBJECT IN AN ARRAY.
            for (var i = 0; i < e.length; i++) {
                $scope.files.push(e[i])
            }
        });
	};
	$scope.uploadCSVFile = function(){
		// FILL FormData WITH FILE DETAILS.
	    var data = new FormData();
	    for (var i in $scope.files) {
	        data.append("file", $scope.files[i]);
	    }
	    // SEND FILE DETAILS TO THE API.
	    var objXhr = new XMLHttpRequest();
	    objXhr.open("POST", "webapi/admin/hotels/");
	    objXhr.send(data);
	    $scope.hotel = "Imported";
	};
	$scope.getAboutData = function(){ // get about data
		adminFactory.aboutData().then(function(response){
			$scope.about = response.data;
    	});
	}; // end about data
	$scope.getPrivacyData = function(){ // privacy data
		adminFactory.privacyData().then(function(response){
			$scope.privacy = response.data;
    	});
	}; // end privacy data
	$scope.getTermsData = function(){ // terms and conditions
		adminFactory.termsData().then(function(response){
			$scope.terms = response.data;
    	});
	}; // terms and conditions
	$scope.getServicesData = function(){ // service data
		adminFactory.serviceData().then(function(response){
			$scope.services = response.data;
    	});
	}; // end service data
	$scope.allContactUsList = function(){ // all contact us list
		adminFactory.getContactUsList().then(function(response){
			$scope.gap = 5;
      	    $scope.filteredItems = [];
      	    $scope.groupedItems = [];
      	    $scope.itemsPerPage = 50;
      	    $scope.pagedItems = [];
      	    $scope.currentPage = 0;
      	    $scope.items = response.data; 
      	    var searchMatch = function (haystack, needle) {
      	        if (!needle) {
      	            return true;
      	        }
      	        return haystack.toLowerCase().indexOf(needle.toLowerCase()) !== -1;
      	    };
      	    // init the filtered items
      	    $scope.search = function () {
      	    	$scope.filteredItems = $scope.items;
      	        $scope.currentPage = 0;
      	        // now group by pages
      	        $scope.groupToPages();
      	    };
      	    // calculate page in place
      	    $scope.groupToPages = function () {
      	        $scope.pagedItems = [];
      	        for (var i = 0; i < $scope.filteredItems.length; i++) {
      	            if (i % $scope.itemsPerPage === 0) {
      	                $scope.pagedItems[Math.floor(i / $scope.itemsPerPage)] = [ $scope.filteredItems[i] ];
      	            } else {
      	                $scope.pagedItems[Math.floor(i / $scope.itemsPerPage)].push($scope.filteredItems[i]);
      	            }
      	        }
      	    };
      	    $scope.range = function (size,start, end) {
      	        var ret = [];        
      	        if (size < end) {
      	            end = size;
      	            if(start>$scope.gap)
      	            start = size-$scope.gap;
      	        }
      	        for (var i = start; i < end; i++) {
      	            ret.push(i);
      	        }        
      	        return ret;
      	    };
      	    $scope.prevPage = function () {
      	        if ($scope.currentPage > 0) {
      	            $scope.currentPage--;
      	        }
      	    };
      	    $scope.nextPage = function () {
      	        if ($scope.currentPage < $scope.pagedItems.length - 1) {
      	            $scope.currentPage++;
      	        }
      	    };
      	    $scope.setPage = function () {
      	        $scope.currentPage = this.n;
      	    };
      	    // functions have been describe process the data for display
      	    $scope.search();
    	});
	}; // end get all contact us list
	/** ********** End Import CSV File***************** */
	// image upload
	$scope.uploadFile = function(e){
		$scope.files = [];
        $scope.$apply(function () {
            // STORE THE FILE OBJECT IN AN ARRAY.
            for (var i = 0; i < e.length; i++) {
                $scope.files.push(e[i])
            }
        });
	};
	// NOW UPLOAD THE FILES.
    $scope.uploadFiles = function (email) {
    	$scope.email = email;
        // FILL FormData WITH FILE DETAILS.
        var data = new FormData();
        for (var i in $scope.files) {
            data.append("file", $scope.files[i]);
            data.append("email", $scope.email);
        }
        // SEND FILE DETAILS TO THE API.
        var objXhr = new XMLHttpRequest();
        objXhr.open("POST", "webapi/admin/img");
        objXhr.send(data);
        objXhr.onreadystatechange = function (event) {
            var xhr = event.target;
            console.log(xhr);
            if (xhr.readyState === 4 && xhr.status === 200) {
            	location.reload();
            }
        };
    };  // end image upload
	
    $scope.hotelList = function(){ // get all hotels
    	var limit = 0;
    	adminFactory.getAllHotels(limit).then(function(response){
    		$scope.hotelsList = response.data;
    	});
    	adminFactory.countHotels().then(function(response){ // count hotels
		var count = response.data[0].id;
		var totalRows = count/10;
		$scope.pagination = [];
		for(var i=1; i<=totalRows; i++){
		if(i<=5){
		$scope.pagination.push(i); 
		}
		}
		}); // end count hotels
    	$scope.page_No = 0;
    	$scope.pageNo = function(id){ // pagination click
    		  $scope.page_No = id.pgn;
    		adminFactory.getAllHotels($scope.page_No).then(function(response){
        		$scope.hotelsList = response.data;
        		adminFactory.countHotels().then(function(response){
            		var count = response.data[0].id;
            		var totalRows = count/10;
            		$scope.pagination = [];
            		var curPage; 
            		curPage = $scope.page_No;
            		var numberofprvious_page = 2;
            		var numberofnxt_page = 2;
            		var firstRow = 1;
            		var lastRow = totalRows;
            		for(var i=1; i<=totalRows; i++){
            			if((i >= (curPage-numberofprvious_page)) && (i<=(curPage+numberofnxt_page))){
            				$scope.pagination.push(i);
            			} 
            		}
            	});
        	});
    	};
    	adminFactory.countHotels().then(function(response){ // count hotels
    		var count = response.data[0].id;
    		var totalRows = count/10;
    		$scope.pagination = [];
    		for(var i=1; i<=totalRows; i++){
    			if(i<=5){
    				$scope.pagination.push(i); 
    			}
    		}
    	}); // end count hotels
    }; // end get all hotels
    $scope.addHotel = function(){ // add new Hotel
    	window.location.href = "admin/hotel";
    	if($scope.hotel != null){
    		adminFactory.addNewHotel($scope.hotel).then(function(response){
    			if(response.data.val == "Done"){
        			$scope.valid = true;
        		}
    		});
    	}
    }; // add new Hotel
   $scope.deleteHotel = function(id){ // delete hotel
	   $scope.id = id;
	   $scope.user.id = id;
   };
   $scope.deleteHotelById = function(){
	   console.log($scope.user.id);
	   adminFactory.deleteHotel($scope.user.id).then(function(response){
		   if(response.data.val == "Done"){
			   location.reload(false);
		   }
	   });
   }; // end delete hotel
    $scope.uploadGalleryImages = function(e){ // select gallery images
    	$scope.files = [];
        $scope.$apply(function () {
            // STORE THE FILE OBJECT IN AN ARRAY.
            for (var i = 0; i < e.length; i++) {
                $scope.files.push(e[i])
            }
        });
    }; // end select gallery images
    $scope.addGallery = function () { // upload gallery images
        // FILL FormData WITH FILE DETAILS.
        var data = new FormData();
        var objXhr = new XMLHttpRequest();
        for (var i in $scope.files) {
            data.append("file", $scope.files[i]);
            data.append("id", $scope.hotel.id);
            data.append("url", $scope.hotel.url);
            // SEND FILE DETAILS TO THE API.
            objXhr.open("POST", "webapi/admin/addGallery");
            objXhr.send(data);
            objXhr.onreadystatechange = function (event) {
            	var xhr = event.target;
            	console.log(xhr);
            	if (xhr.readyState === 4 && xhr.status === 200) {
            		location.reload();
            		 $scope.validGallery = true;
            	}
            };
        }
        $scope.hotel.file = "";
        $scope.hotel.url = "";
    };  // end upload gallery images
    $scope.hotelEdit = function(id){ // hotel edit
    	$scope.id = id;
    	$scope.user.id = id;
    }; // end hotel edit
    $scope.hotelById = function(){ // hotel detail by id
        	adminFactory.getHotelById($stateParams.id).then(function(response){
        		$scope.hotel = response.data[0];
        	});
        	adminFactory.getHotelImages($stateParams.id).then(function(response){
     			  $scope.images = response.data;
        		var model = "";
     			for(var i=0; i < response.data.length; i++ ){
     				var img = "<li class='hImg' data-toggle='modal' data-target='#myModal'>" +
     						"<img src='images/admin/hotels/"+response.data[i].images+"' class='hotelImg' style='height: 100px;width:100px;'>" +
     						"</li>";
     				$('#hotelimg').append(img);
     				model += "<div class='item ";
         			if(i==0){
         			model +="active";
         			}
         			model +="'>";
         			model +="<img src='images/admin/hotels/"+response.data[i].images+"' class='hotelImg'>" +
     						"<div class='carousel-caption'></div>" +
     						"</div>" ;
     				$('.itm').append(model);
     				model = "";
     			}  
     		  });
    }; // end hotel detail by id
    $scope.updateHotel = function(){ // update hotel
    	adminFactory.update_hotel_detail($scope.hotel).then(function(response){
    		if(response.data.val == "Done"){
    			$scope.valid = true;
    		}
    	});
    }; // end update hotel
    $scope.searchHotel = function(){ // search box
    	var limit = 0;
    	var search ;
    	if($scope.search == 'undefined' || $scope.search.length === 0){
        	adminFactory.getAllHotels(limit).then(function(response){
        		$scope.hotelsList = response.data;
        	});
        	adminFactory.countHotels().then(function(response){ // count hotels
			var count = response.data[0].id;
			var totalRows = count/10;
			$scope.pagination = [];
			for(var i=1; i<=totalRows; i++){
				if(i<=10){
					$scope.pagination.push(i); 
				}
			}
			}); // end count hotels
        	$scope.page_No = 0;
        	$scope.pageNo = function(id){ // pagination click
        		  $scope.page_No = id.pgn;
        		adminFactory.getAllHotels($scope.page_No).then(function(response){
            		$scope.hotelsList = response.data;
            		adminFactory.countHotels().then(function(response){
                		var count = response.data[0].id;
                		var totalRows = count/10;
                		$scope.pagination = [];
                		var curPage; 
                		curPage = $scope.page_No;
                		var numberofprvious_page = 2;
                		var numberofnxt_page = 2;
                		var firstRow = 1;
                		var lastRow = totalRows;
                		for(var i=1; i<=totalRows; i++){
                			if((i >= (curPage-numberofprvious_page)) && (i<=(curPage+numberofnxt_page))){
                				$scope.pagination.push(i);
                			} 
                		}
                	});
            	});
        	};
    	} 
    		adminFactory.getHotelsByCountry(limit,$scope.search).then(function(response){
    			/** ******************************* */
    			adminFactory.getHotelsByCountry(limit,$scope.search).then(function(response){
    				$scope.hotelsList = response.data;
    				var totalRows = response.data.length;
					$scope.pagination = [];
					var curPage; 
					curPage = $scope.page_No;
					var numberofprvious_page = 2;
					var numberofnxt_page = 2;
					for(var i=1; i<=totalRows; i++){
						  if((i >=
						  (curPage-numberofprvious_page)) &&
						  (i<=(curPage+numberofnxt_page))){ 
							  $scope.pagination.push(i);
						  }
					}
    			});
    			$scope.page_No = 0;
    			$scope.pageNo = function(id){ // pagination click
    				$scope.page_No = id.pgn;
    				adminFactory.getHotelsByCountry($scope.page_No,$scope.search).then(function(response){
    					$scope.hotelsList = response.data;
    					adminFactory.countHotelsBySearch($scope.search).then(function(response){
    						var count = response.data[0].id;
    						var totalRows = count/10;
    						$scope.pagination = [];
    						var curPage; 
    						curPage = $scope.page_No;
    						var numberofprvious_page = 2;
    						var numberofnxt_page = 2;
    						for(var i=1; i<=totalRows; i++){
								  if((i >=
								  (curPage-numberofprvious_page)) &&
								  (i<=(curPage+numberofnxt_page))){ 
									  $scope.pagination.push(i);
								  }
    						}
    					});
    				});
    			};// end pagination click
    			/** ******************************* */
    		});
    };// end search box
    $scope.viewAllAds = function(e){ // get all ads
    	$scope.email = e;
    	   adminFactory.getAllAds($scope.email).then(function(response){
    		 $scope.gap = 5;
    		 $scope.filteredItems = [];
    		 $scope.groupedItems = [];
    		 $scope.itemsPerPage = 10;
    		 $scope.pagedItems = [];
    		 $scope.currentPage = 0;
    		 $scope.items = response.data; 
    		 var searchMatch = function (haystack, needle) {
    		 if (!needle) {
    		     return true;
    		 }
    		 return haystack.toLowerCase().indexOf(needle.toLowerCase()) !== -1;
    		 };
    		 $scope.search = function () {
    		 $scope.filteredItems = $scope.items;
    		 $scope.currentPage = 0;
    		 $scope.groupToPages();
    		 };
    		 $scope.groupToPages = function () {
    		 $scope.pagedItems = [];
    		 for (var i = 0; i < $scope.filteredItems.length; i++) {
    		     if (i % $scope.itemsPerPage === 0) {
    		 	$scope.pagedItems[Math.floor(i / $scope.itemsPerPage)] = [ $scope.filteredItems[i] ];
    		     } else {
    		 	$scope.pagedItems[Math.floor(i / $scope.itemsPerPage)].push($scope.filteredItems[i]);
    		     }
    		 }
    		 };
    		 $scope.range = function (size,start, end) {
    		 var ret = []; 
    		 if (size < end) {
    		     end = size;
    		     if(start>$scope.gap)
    		     start = size-$scope.gap;
    		 }
    		 for (var i = start; i < end; i++) {
    		     ret.push(i);
    		 }        
    		 return ret;
    		 };
    		 $scope.prevPage = function () {
    		 if ($scope.currentPage > 0) {
    		     $scope.currentPage--;
    		 }
    		 };
    		 $scope.nextPage = function () {
    		 if ($scope.currentPage < $scope.pagedItems.length - 1) {
    		     $scope.currentPage++;
    		 }
    		 };
    		 $scope.setPage = function () {
    		 $scope.currentPage = this.n;
    		 };
    		 $scope.search();
    	   });
       }; // End get all ads
       $scope.removeAd = function(id){ // remove Ad
    	   $scope.id = id;
    	   $scope.user.id = $scope.id; 
       }; 
       $scope.deleteAd = function(){
    	   adminFactory.removeAd($scope.user.id).then(function(response){
    		   location.reload(); 
    		   $scope.getAds();
    	   });
       };// End remove Ad
       $scope.getAllListing = function(e){ // get all listing
      		$scope.email = e;
      		adminFactory.allListing($scope.email).then(function(response){
  			// ///////////////////////////////////////////////////////////
       	    $scope.gap = 5;
       	    $scope.filteredItems = [];
       	    $scope.groupedItems = [];
       	    $scope.itemsPerPage = 10;
       	    $scope.pagedItems = [];
       	    $scope.currentPage = 0;
       	    $scope.items = response.data; 
       	    var searchMatch = function (haystack, needle) {
       	        if (!needle) {
       	            return true;
       	        }
       	        return haystack.toLowerCase().indexOf(needle.toLowerCase()) !== -1;
       	    };
       	    // init the filtered items
       	    $scope.search = function () {
       	    	$scope.filteredItems = $scope.items;
       	        $scope.currentPage = 0;
       	        // now group by pages
       	        $scope.groupToPages();
       	    };
       	    // calculate page in place
       	    $scope.groupToPages = function () {
       	        $scope.pagedItems = [];
       	        for (var i = 0; i < $scope.filteredItems.length; i++) {
       	            if (i % $scope.itemsPerPage === 0) {
       	                $scope.pagedItems[Math.floor(i / $scope.itemsPerPage)] = [ $scope.filteredItems[i] ];
       	            } else {
       	                $scope.pagedItems[Math.floor(i / $scope.itemsPerPage)].push($scope.filteredItems[i]);
       	            }
       	        }
       	    };
       	    $scope.range = function (size,start, end) {
       	        var ret = [];        
       	        if (size < end) {
       	            end = size;
       	            if(start>$scope.gap)
       	            start = size-$scope.gap;
       	        }
       	        for (var i = start; i < end; i++) {
       	            ret.push(i);
       	        }        
       	        return ret;
       	    };
       	    $scope.prevPage = function () {
       	        if ($scope.currentPage > 0) {
       	            $scope.currentPage--;
       	        }
       	    };
       	    $scope.nextPage = function () {
       	        if ($scope.currentPage < $scope.pagedItems.length - 1) {
       	            $scope.currentPage++;
       	        }
       	    };
       	    $scope.setPage = function () {
       	        $scope.currentPage = this.n;
       	    };
       	    // functions have been describe process the data for display
       	    $scope.search();
             // ////////////////////////////////////////////////////////////////////////
  			});
      	}; // End get all listing
      	$scope.removeList = function(id){ // remove Ad
     	   $scope.id = id;
     	   $scope.user.id = $scope.id; 
        }; 
        $scope.deleteList = function(){
     	   adminFactory.removeList($scope.user.id).then(function(response){
     		   location.reload(); 
     		   $scope.getAds();
     	   });
        };// End remove Ad
        $scope.deleteContact = function(id){ // delete contact us list
        	$scope.id = id;
        	$scope.contactUsID = $scope.id; 
        };// end delete contact us list
        $scope.confirmDeleteContact = function(){ 
        	console.log($scope.contactUsID);
        	adminFactory.deleteContactUs($scope.contactUsID).then(function(response){
        		location.reload();
      	   });
        };
	}
]);