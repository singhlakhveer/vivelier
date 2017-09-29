angular.module('app').controller('vendorCtrl',['$scope', '$state','$window','vendorFactory', '$location', '$stateParams',
    function($scope, $state, $window, vendorFactory, $location, $stateParams) {
	var init = function(){
		$scope.search = { hotelName: '', city: '', country: ''}; 
		$scope.advancePagination = [];
		$scope.vStatus = {};
		$scope.hotelId = {};
		$scope.user1 = {};
		$scope.featureList = [];
		$scope.keyword = '';
	};
		$scope.vendorProfile = function(email){  // vendor profile
			$scope.email = email;
			vendorFactory.profile($scope.email).then(function(response){
				if(response.data[0] == null){
					window.location.href = "login";
					$scope.login = "" ;
				} else {
					$("#img").hide();
					$scope.user.img = "images/vendor/"+response.data[0].image;
					$scope.firstname = response.data[0].first_name;
					$scope.vendor = response.data[0];
					$scope.address = response.data[0].address; 
					$scope.paymentStatus = response.data[0].vendorPaymentStatus; 
					$scope.customHtml = "<img src="+$scope.user.img+" class='img-circle' /> <span class='login-name' >" + $scope.firstname +"</span><span class='caret' />";
					$scope.dashboardVendorName = $scope.firstname + " " + response.data[0].last_name;
					$scope.dashboardVendorPlan = response.data[0].amount;
					$scope.vStatus = response.data[0].vendorPaymentStatus;
					vendorFactory.countHotels().then(function(response){
						$scope.dashboardTotalHotels = response.data[0].id;
					});
				}
			});
			}; // end vendor profile
			$scope.dashboardViewHotels = function(){
				if($scope.vStatus == "Active"){
					window.location.href = "vendor/search";
				} else if($scope.vStatus == "Expire"){
					window.location.href = "vendor/dashboard";
				}
			};
			$scope.sign_up = function(){  // vendor signup
				vendorFactory.signUp($scope.user).then(function(response){
					$scope.user1 = response.data;
					if(response.data != null){
						var options = { reload: false, inherit: true, notify: true };  
						$state.go('signup2', { success: $scope.user1 }, {});
					} else {
						window.location.href = "signup";
					}
				});
				$scope.user = "";
			}; // end vendor signup
			$scope.back_signup = function(){  // signup back click
				var options = { reload: false, inherit: true, notify: true };  
				$state.go('signup', { }, {});
			}; // end signup back
			$scope.signupMail = function(email){  // thankyou email
					$scope.email = email
					vendorFactory.thankyouEmail($scope.email).then(function(response){
					}); 
			};  // end thankyou email
			$scope.signupNewVendor = function(e){ // signup new vendor
				$scope.user = e;  
				var z = $scope.user.split("-");
				var aa = {"email":z[0],"first_name":z[1],"last_name":z[2],"phone":z[3],"amount":z[4]}
				vendorFactory.signUpVendor(aa).then(function(response){
				});
			}; // end signup new vendor
			$scope.vendorLogin = function(){  // vendor login
				vendorFactory.Login($scope.login).then(function(response){
        			if(response.data.val == "Success"){
        				window.location.href = 'vendor/dashboard';
        				$("#img").hide();
        			} else if(response.data.deactive == "deactive"){
        				$scope.deactive = true;
        				$scope.inval = false;
        				$("#img").hide();
        			} else if(response.data.inval == "inval"){
        				$scope.inval = true;
        				$scope.deactive = false;
        				$("#img").hide();
        			} else if(response.data.isLog == "isLog"){
        				$scope.isLog = true;
        				$scope.deactive = false;
        				$scope.inval = false;
        			}else {
        				$window.location.href = 'vendor/dashboard';
        			}
				});
				$scope.login = "" ; 
        	};  // end vendor login
        	$scope.logout = function(){
        		vendorFactory.vendor_logout().then(function(response){
        			if(response.data.val == "logout"){
        				window.location.href = 'http://localhost:8080/realestate/login';
        				 // window.location.href =
							// 'http://ec2-52-66-150-60.ap-south-1.compute.amazonaws.com:8080/vivelier/login';
        			}
        		});
        	};
        	$scope.forgotPass = function(){ // forgot password
	   			vendorFactory.forgotPassword($scope.email).then(function(response){
	   				if(response.data.val == "invalid"){
	   					$scope.inval1 = true;
	   					$scope.email = "";
	   				} else {
	   					$scope.suc1 = true;
	   					$scope.email = "";
	   				}
	   			});
	   		};  // end forgot password
        	$scope.profileUpdate = function(){  // profile update
        		vendorFactory.updateProfile($scope.vendor).then(function(response){
        			$scope.valid = "true";
        		});
        	}; // end profile update
        	$scope.passwordUpdate = function(){  // password update
        		if($scope.vendor.password == null || $scope.vendor.confirmPassword == null){
        			$scope.password = true;
        			$scope.confirmpassword = true;
        		}
        		else if($scope.vendor.password != $scope.vendor.confirmPassword){
        			$scope.vendor.inval = "Password dosen't match";
        			$scope.password = false;
        			$scope.confirmpassword = false;
        			$("#img").hide();
        		} else {
        			vendorFactory.updatePassword($scope.vendor).then(function(response){
        				$scope.valid = "true";
            			$scope.vendor = "";
            		});
        		}
        	}; // end password update
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
                objXhr.open("POST", "webapi/vendor/img");
                objXhr.send(data);
                objXhr.onreadystatechange = function (event) {
		            var xhr = event.target;
		            if (xhr.readyState === 4 && xhr.status === 200) {
		            	location.reload();
		            }
		        };
              // location.reload();
            };  // end image upload
            /*$scope.hotelList = function(){ // get all hotels
            	var limit = 0;
            	vendorFactory.getAllHotels(limit).then(function(response){
            		$scope.hotelsList = response.data;
            	});
            	$scope.page_No = 0;
            	$scope.pageNo = function(id){ // pagination click
            		 $scope.page_No = id.pgn;
            		 vendorFactory.getAllHotels($scope.page_No).then(function(response){
            			 $scope.hotelsList = response.data;
            		    	 
            			 vendorFactory.countHotels().then(function(response){
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
            	};// end pagination click
            }; // End get all hotels
*/            vendorFactory.countHotels().then(function(response){ // count  hotels
			var count = response.data[0].id;
			var totalRows = count/10;
			$scope.pagination = [];
			for(var i=1; i<=totalRows; i++){
			if(i<=10){
			$scope.pagination.push(i); 
			}
			}
			}); // end count hotels
            $scope.searchHotel = function(){ // search box
            	var limit = 0;
            	var search;
            	if($scope.vsearch == 'undefined' || $scope.vsearch.length === 0){
            		search = "Empty";
            		vendorFactory.getAllHotels(limit).then(function(response){
            			$scope.hotelsList = response.data;
            			$scope.page_No = 0;
						$scope.pageNo = function(id){ // pagination click
						$scope.page_No = id.pgn;
						vendorFactory.getAllHotels($scope.page_No).then(function(response){
						$scope.hotelsList = response.data;
						vendorFactory.countHotels().then(function(response){
						
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
            		});
            	}
            	vendorFactory.getHotelsByCountry(limit,$scope.vsearch).then(function(response){
            			/** ******************************* */
            		vendorFactory.getHotelsByCountry(limit,$scope.vsearch).then(function(response){
            				$scope.hotelsList = response.data;
            			});
            			/** ******************************* */
            		});
            };// end search box
            $scope.advanceSearch = function(){
          	  var searchData = $scope.advancesearch;
          	  $scope.vsearch = $scope.advancesearch;
          	  $scope.search.limit = 0;
          	  vendorFactory.advance_Search(searchData).then(function(response){
          		  	$(".planData").css({"display":"block"});
          			// ///////////////////////////////////////////////////////////
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
                // ////////////////////////////////////////////////////////////////////////
          		});
          	  $scope.advancesearch = {};
          	//$scope.advancesearch = {};
            };
            $scope.exportSearchHotels = function(){ // export search
            	 var val = [];
                 $(':checkbox:checked').each(function(i) {
                	 val[i] = $(this).val();
                 });
                 if(val.length == 0){
                	 $scope.exporthotels = true;
                 } else {
                	if($scope.vsearch == null || $scope.vsearch == ""){
                		vendorFactory.exportSearchHotels("empty").then(function(response){
                			window.location.href = response.data.val; 
                		});
                	} else {
                		vendorFactory.exportSearchHotels(val).then(function(response){
                			window.location.href = response.data.val;
                		});
                	} 
              }
            }; // end export search hotels data
            $scope.updatePlan = function(){ // update Vendor plan
            	window.location.href = "vendor/updatePlan";
            }; 
            $scope.planUpdate = function(e){
            	$scope.plan = e;
            	$scope.vendorPlan = $scope.plan; 
            	vendorFactory.profile($scope.email).then(function(response){
            		$scope.vendor = response.data[0];
            		if($scope.plan == "Preimum"){
            			$scope.vendor.amount = "20";
            		} else if($scope.plan == "Pro"){
            			$scope.vendor.amount = "10";
            		} else if($scope.plan == "Basic"){
            			$scope.vendor.amount = "5";
            		} else if($scope.plan == "Free"){
            			$scope.vendor.amount = "0";
            		}else if($scope.plan == "Standard 1 Yr"){
            			$scope.vendor.amount = "30";
            		} else if($scope.plan == "Standard 3 Yr"){
            			$scope.vendor.amount = "70";
            		} else if($scope.plan == "Featured 1 Yr"){
            			$scope.vendor.amount = "1000";
            		} else if($scope.plan == "Free List"){
            			$scope.vendor.amount = "1";
            		} 
            		vendorFactory.updateVendorPlan($scope.vendor).then(function(response){
            			$scope.user1 = response.data;
            		});
            		$(".planData").css({"display":"block"});
            	});
            };// end update Vendor plan
            $scope.thanksUpdatePlan = function(mail,plan){ // thanks update vendoe plan
            	$scope.vmail = mail;
            	$scope.vplan = plan;
            	var vendorPlan;
            	if($scope.vplan == 20){
            		vendorPlan = "Preimum"
            	} else if($scope.vplan == 10){
            		vendorPlan = "Pro"
            	} else if($scope.vplan == 5){
            		vendorPlan = "Basic"
            	}else if($scope.vplan == 0){
            		vendorPlan = "Free"
            	} else if($scope.vplan == 1){
        			vendorPlan = "Free List";
        		} else if($scope.vplan == 30){
            		vendorPlan = "Standard 1 Yr";
        		} else if($scope.vplan == 70){
        			vendorPlan = "Standard 3 Yr";
        		} else if($scope.vplan == 1000){
        			vendorPlan = "Featured 1 Yr";
        		} 
            	vendorFactory.thanksMail($scope.vmail,vendorPlan).then(function(response){
            	});
            }; // thanks update vendoe plan
          $scope.hotelsDetail = function(e){ // end Hotel Detail
        	  $scope.data = e;
        	  $scope.user.id  = $scope.data.hotel.id; 
        	  $state.go('vendor.detailHotel', { id: $scope.user.id }, {reload: false, inherit: true, notify: true});
          }; // end Hotel Detail
          $scope.hdetail = function(){
        	  $scope.vendorEmail = false;
        	  $scope.btnTXT = "Show";
        		  vendorFactory.getHotelById($stateParams.id).then(function(response){
        			  if(response.data == ""){
        				  window.location.href ="vendor/advanceSearch";
        			  }
        			  $scope.h = response.data[0];
        			  var ht = "";
        			  if(response.data[0].website.indexOf('http://') != 0){
        				  ht = "http://";
        			  } 
        			  $scope.website = "<a href='"+ht+response.data[0].website+"' target='_blank'>"+response.data[0].website+"</a>";
        			  $scope.email1 = "<a href='mailto:"+response.data[0].email1+"'>"+response.data[0].email1+"</a>";
        			  $scope.email2 = "<a href='mailto:"+response.data[0].email2+"'>"+response.data[0].email2+"</a>";
        			  for(var i=0; i<response.data[0].rating;i++){
        				  var rating = "<i class='fa fa-star' aria-hidden='true' style='color:#0A57C9;'></i>";
        				   $("#rating").append(rating);
        			  }
        		  });
        		  vendorFactory.getHotelImages($stateParams.id).then(function(response){
        			  $scope.images = response.data;
        			  var model = "";
        			  for(var i=0; i < response.data.length; i++){
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
          };
          $scope.showVendorEmail = function(){ // show vendor email
        	  $scope.vendorEmail = !$scope.vendorEmail;
        	  $scope.btnTXT = (($scope.btnTXT == "Show") ? 'Hide' : 'Show');
        	  }; // end show vendor email
          
          /** *************** FREE VENDORS ****************** */
          $scope.addFeatureList = function(){  // createfeaturelist
        	  if($scope.ad.feature == null || $scope.ad.feature.length <= 0) {
        		  $scope.error = true;
        	  } else {
        		  $scope.error = false;
              		$scope.featureList.push($scope.ad.feature);
              		$scope.ad.feature = "";
        	  }
      	}; // end create feature list
      	$scope.removeFeatureList = function(index){  // remove featurelist
      		$scope.id = index;
      		$scope.featureList.splice($scope.id, 1);
      	}// end remove feature list
     // Ad's image select
      	$scope.uploadAdImage = function(e){
      		$scope.error = false;
      		$scope.files = [];
      	    $scope.$apply(function () {
      	        // STORE THE FILE OBJECT IN AN ARRAY.
      	        for (var i = 0; i < e.length; i++) {
      	            $scope.files.push(e[i])
      	        }
      	    });
      	};
      	$scope.createAd = function(){ // create Ad
      		if($("#file").val() == ""){
      			$scope.error = true;
      		}
      		var z = ""; 
      		$('.dd').each(function(){
      			z += $(this).val()+"==";
      			 $scope.removeFeatureList($(this).val());
      		});
      		var data = new FormData();
      	    for (var i in $scope.files) {
      	    	data.append("file", $scope.files[i]);
          	    data.append("title", $scope.ad.title);
          	    data.append("description", $scope.ad.description);
          	    data.append("fList", z);
          	  data.append("vId", $scope.vendor.id);
      	    }
      	    // SEND FILE DETAILS TO THE API.
      	    var objXhr = new XMLHttpRequest();
      	    objXhr.open("POST", "webapi/freeVendors/createAd");
      	    objXhr.send(data);
      	    $scope.ad = "";
      	    $("#file").val('');
      	    window.location.href="Vendors/ads";
      	  $scope.getAds($scope.vendor.email); // get all ad's
      	}; // End create Ad
       $scope.getAds = function(e){ // get all ads
    	$scope.email = e;
    	   vendorFactory.getAllAds($scope.email).then(function(response){
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
       $scope.getADbyId = function(id){ // get ad by id
    	   $scope.id = id;
    	   $scope.user.id = $scope.id; 
    	   window.location.href = "Vendors/singleAd?id="+$scope.id;
       }; // End get ad by id
       $scope.singleAd = function(){
    	   var absUrl = $location.absUrl();
    	   var d = absUrl.split("?id=");
    	   if(d[1] == null){
    		   window.location.href = "Vendors/createAd";
    	   }
    	   vendorFactory.getSingleAd(d[1]).then(function(response){
    		   $scope.ad = response.data[0];
    		   $scope.ad.images = response.data[0].img;
    		   $scope.featureList1 = response.data[0].features; // feature list
    	   }); 
       };
       $scope.removeFeatureList1 = function(index){  // remove featurelist
     		$scope.id = index;
     		$scope.featureList1.splice($scope.id, 1);
     	}// end remove feature list
       $scope.updateAd = function(){ // update Ad
    	   var z = ""; 
     		$('.dd').each(function(){
     			z += $(this).val()+"==";
     		});
    	   vendorFactory.updateAd($scope.ad,z).then(function(response){
    		   if(response.data.val == "Success"){
    			   $scope.suc = true;
    		   }
    	   });
       }; // End update Ad
       $scope.removeAd = function(id){ // remove Ad
    	   $scope.id = id;
    	   $scope.user.id = $scope.id; 
       }; 
       $scope.deleteAd = function(){
    	   vendorFactory.removeAd($scope.user.id).then(function(response){
    		   location.reload(); 
    		   $scope.getAds();
    	   });
       };// End remove Ad
      	/** *************** END FREE VENDORS ****************** */  	
       /** ****************** Listing ****************** */
       $scope.getMainCategories = function(){ // get Main Categories
    	   vendorFactory.mainCategories().then(function(response){
   			$scope.mainCategoriez = response.data;
   		});
   	}; // End get Main Categories
   	$scope.getSubCategory = function(id){ // get sub category
   		$scope.categoryId = id;
   		if(($scope.categoryId == "--- Select ---") || ($scope.categoryId.length == "" )){
   			$(".subCategory").css({"display":"none"});
   		} else {
   			$(".subCategory").css({"display":"block"});
   			vendorFactory.subCategories($scope.categoryId.split(' ').join('-')).then(function(response){
   				$scope.subCategoriez = response.data;
   				$scope.mcategory = false;
   			});
   		}
   	}; // End get sub category
   	$scope.uploadListcoverImage = function(e){
   		$scope.files = [];
   	    $scope.$apply(function () {
   	        // STORE THE FILE OBJECT IN AN ARRAY.
   	        for (var i = 0; i < e.length; i++) {
   	            $scope.files.push(e[i])
   	        }
   	    });
   	 $scope.file = false;
   	};
   	$scope.addNewList = function(){ // Add new List
   		if($("#file").val() == ""){
   			$scope.file = true;
   		}else {
   			var data = new FormData();
       	    for (var i in $scope.files) {
       	        data.append("file", $scope.files[i]);
       	        data.append("vId", $scope.vendor.id);
       	        data.append("mCategory", $scope.list.mainCategory.split(' ').join('-'));	
               	data.append("sCategory", $scope.list.subCategory);
               	data.append("title", $scope.list.title);
               	data.append("url", $scope.list.url);
               	data.append("address", $scope.list.address);
               	data.append("city", $scope.list.city);
               	data.append("state", $scope.list.state);
               	data.append("country", $scope.list.country);
               	data.append("description", $scope.list.description);
       	    }
       	    // SEND FILE DETAILS TO THE API.
       	    var objXhr = new XMLHttpRequest();
       	   objXhr.open("POST", "webapi/listing/createNewList/");
       	    objXhr.send(data);
       	    $scope.valid = true;
       	    $scope.list = "";
       	    $("#file").val("");
   		}
   	}; // End add new List
   	$scope.getAllListing = function(e){ // get all listing
   		$scope.email = e;
   		vendorFactory.allListing($scope.email).then(function(response){
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
   	$scope.listEdit = function(id){ // list edit
   		$scope.id = id;
   		$scope.user.id = $scope.id; 
   	}; // End list edit
   	$scope.editList = function(){
   		/*
		 * if(d[1] == null){ window.location.href = "list/" }
		 */
   		vendorFactory.getListById($stateParams.id).then(function(response){
				$scope.list = response.data[0];
				var source = $("#some-template").html(); 
				var template = Handlebars.compile(source); 
				var data = { 
				    users: response.data[0]
				}; 
				$('#listimg').append(template(data));
			});
   	};
   	$scope.updateList = function(){ // update list
   		if($scope.list.mainCategory == null || $scope.list.mainCategory == "undefined"){
   			$scope.error = true;
   		} else {
   			$scope.error = false;
   		vendorFactory.listUpdate($scope.list).then(function(response){
   			if(response.data.val == "Done"){
   				$scope.suc = true;
   			}
   		});
   		}
   	}; // End update list
   	$scope.updateCoverImage = function(){ // update cover image
   		if($("#file").val() == ""){
   			$scope.coverImage = true;
   		} else {
   			var data = new FormData();
   		    for (var i in $scope.files) {
   		        data.append("file", $scope.files[i]);
   		        data.append("id", $scope.list.id);
   		    }
   		    // SEND FILE DETAILS TO THE API.
   		    var objXhr = new XMLHttpRequest();
   		    objXhr.open("POST", "webapi/listing/updateCoverImg/");
   		    objXhr.send(data);
   		 $state.go('vlisting.lstEdit', { id: $scope.list.id}, {reload: true, inherit: true, notify: true});
   		}
   	}; // End update cover image
   	$scope.removeList = function(id){ // remove list
  	   $scope.id = id;
  	   $scope.user.id = $scope.id; 
     }; 
     $scope.deleteList = function(){
    	 vendorFactory.removeList($scope.user.id).then(function(response){
    		 location.reload(); 
  		   $scope.getAds();
  	   });
     };// End remove list
   	/** ****************** End Listing ****************** */
     $scope.checkEmail = function(){ // check email
 		var ckEmail = $scope.form.email.$viewValue;
 		vendorFactory.emailCheck(ckEmail).then(function(response){
 			if(response.data.val == "1"){
 				$scope.ckemail = true;
 			} 
 		});
 	};
 	$scope.hideError = function(){
 		$scope.ckemail = false;
 	}; // end check email
    
 	$scope.getKeywords = function(){ //get keyword search
 		vendorFactory.getAllKeyWords($scope.keyword).then(function(response){
 			for(var i = 0; i < response.data.length; i++){
				$("#keyword option[value='"+response.data[i].title+"']").remove();
				$("#keyword").append("<option value='"+response.data[i].title+"'>");
			}  
 		});
     }; //end keyword search
     $scope.keywordSearch = function(){//submit keyword search
    	 	$state.go('vlisting.lstDetail', { id: $scope.keyword.split(' ').join('-').toLowerCase() }, {reload: false, inherit: true, notify: true});
     };// end submit keyword search
     $scope.listDetail = function(){  
    	 vendorFactory.listData($stateParams.id).then(function(response){
    		 console.log(response.data);
    		 $scope.h = response.data[0];
    		 $scope.img = "<img src='images/vendor/listing/59-60572458.jpg' width='100%'>";
			  var ht = "";
			  if(response.data[0].website.indexOf('http://') != 0){
				  ht = "http://";
			  } 
			  $scope.website = "<a href='"+ht+response.data[0].website+"' target='_blank'>"+response.data[0].website+"</a>";
			  $scope.phone = response.data[0].phone;
			  $scope.email1 = "<a href='mailto:"+response.data[0].email+"'>"+response.data[0].email+"</a>";
    	 });
     };
          init();
	}
]);