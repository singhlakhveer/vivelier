var app = angular.module('app').controller('homeCtrl',['$scope', '$state', 'homeFactory', '$stateParams','$location',
    function ($scope, $state, homeFactory, $stateParams,$location) {
	 var init = function(){
		 $scope.search = {};
		 };
	 init();
$scope.getList = function(){ // get all List
		homeFactory.getAllListing().then(function(response){
			 /*$scope.imgList = response.data;
			$scope.img=[];*/
			for(var i = 0; i < response.data.length; i ++){
			var dat = "<div class='item'>" +
							"<div class='panel panel-default relative'>" +
								"<div class='cover hover overlay margin-none'>" +
								"<img src='images/vendor/listing/"+response.data[i].mainImage+"' class='mg-responsive imgReg'>" +
									"<a href='list/"+response.data[i].title.toLowerCase().split(' ').join('-')+"' class='overlay overlay-full overlay-bg-black overlay-hover'>" +
											"<span class='v-center'>" +
												"<span class='btn btn-circle btn-white'><i class='fa fa-eye'></i></span>" +
											"</span>" +
									"</a>" +
							"</div>" +
  							"<div class='panel-body name'>" +
  								"<a href='list/"+response.data[i].title.toLowerCase().split(' ').join('-')+"'><h4 class='margin-v-0-5'>"+response.data[i].title+"</h4></a>" +
  							"</div>" +
						"</div>" +
				"</div>";
			$('#listImg').append(dat);
			}
	});
	}; // End get all List
	$scope.getMainCategoriez = function(){ // get all categories
		homeFactory.categories().then(function(response){
			var z = "";
			var i=0;
			var current_Cat = "";
			var j = 0;
			var img = "";
			for(var i=0;i < response.data.length; i++){
			if(current_Cat!=response.data[i].categoryName){
				if(i==0){
					z +="<div class='category-outer'>";
				}
				if(i!=0){
					 z += "</div></div>";
				}
			 if((j%4)=='0' && j>=4){
				 z += "</div><div class='category-outer'>";
			 }
			 j++;
				current_Cat =response.data[i].categoryName ;
				if(response.data[i].categoryName == "Attorneys"){
					img = "attorny.png";
				} else if(response.data[i].categoryName == "Design and Development"){
					img = "design.png";
				} else if(response.data[i].categoryName == "Education"){
					img = "education.png";
				} else if(response.data[i].categoryName == "Food Beverage"){
					img = "food.png";
				} else if(response.data[i].categoryName == "Human Resources"){
					img = "human.png";
				} else if(response.data[i].categoryName == "Investment"){
					img = "investment.png";
				} else if(response.data[i].categoryName == "Management"){
					img = "managment.png";
				} else if(response.data[i].categoryName == "Marketing"){
					img = "marketing.png";
				} else if(response.data[i].categoryName == "Security"){
					img = "security.png";
				} else if(response.data[i].categoryName == "Suppliers & Equipements A"){
					img = "supplier.png";
				} else if(response.data[i].categoryName == "Suppliers & Equipements B"){
					img = "supplier.png";
				} else if(response.data[i].categoryName == "Technology"){
					img = "robot.png";
				} else if(response.data[i].categoryName == "Hotel Operations and Maintaince"){
					img = "Hotel-Operations-and-Maintaince.png";
				} else if(response.data[i].categoryName == "Guestroom Essential"){
					img = "Guestroom.png";
				} else if(response.data[i].categoryName == "Hotel Furnishing"){
					img = "Furnishing.png";
				} else if(response.data[i].categoryName == "Kitchen Equipments"){
					img = "Kitchen-Equipments.png";
				}
				 	z += "<div class='category-bg'><div class='category-list'>" +
				 			"<h3><img src='images/images/"+img+"' class='img-responsive'><a href='listing/cate-"+response.data[i].categoryName.toLowerCase().split(' ').join('-')+"'><span class='category-title'>"+response.data[i].categoryName+"</span></a></h3>";
			   }
				 z +="<p><a href='listing/cate-"+response.data[i].categoryName.toLowerCase().split(' ').join('-')+"/sub-"+response.data[i].subCategoryName.toLowerCase().split(' ').join('-')+"'>"+response.data[i].subCategoryName+"</a></p>"; 
				if(i==(response.data.length-1)){
			 z += "</div></div></div>";
				 }
			}
			$('#categoryList').html(z);
		});
	};// End get all categories
	$scope.getSingleListData = function(){ // get Single list
		homeFactory.listData($stateParams.id.split(' ').join('-')).then(function(response){
			if(response.data[0] == null){
				window.location.href="404";
			} else {
				$scope.listData = response.data[0]; 
				$scope.listImg = "<img src='images/vendor/listing/"+response.data[0].mainImage+"' width='100%' >";
				var url = response.data[0].website;
				$scope.website = "<a href='"+url+"' target='_blank'>"+response.data[0].website+"</a>";
				$scope.email1 = "<a href='mailto:"+response.data[0].email+"'>"+response.data[0].email+"</a>";
				
				$scope.share = "Share on <a href='http://www.facebook.com/share.php?u="+window.location.href+"&title="+response.data[0].title+"' target='_blank'> <img src='images/images/fbshare.png'></a>" +
						"<a href='http://twitter.com/intent/tweet?status="+response.data[0].title+" "+window.location.href+"' target='_blank'> <img src='images/images/tweet.png'></a>";
				
			}
		});
	};  // End get Single list
	$scope.getListing = function(){ // get listing
		console.log($stateParams);
		var subCategory = $stateParams.sc;
		var state = $stateParams.st;
		var country = $stateParams.co;
		if(subCategory == null || subCategory == 'undefined' || subCategory == '' && state == null || state == 'undefined' || state == '' && country == null || country == 'undefined' || country == ''){
			homeFactory.mainCategoryListData($stateParams.mc.split('-').join(' ')).then(function(response){
				if(response.data == ""){
					$scope.error = "<h1 class='center'>Sorry no data found :(</h1>";
					$scope.err = false;
				} else {
				var source = $("#some-template").html(); 
				var template = Handlebars.compile(source); 
				var data = { users: response.data }; 
				$('#listing').append(template(data));
   	    $scope.gap = 5;
   	    $scope.filteredItems = [];
   	    $scope.groupedItems = [];
   	    $scope.itemsPerPage = 10;
   	    $scope.pagedItems = [];
   	    $scope.currentPage = 0;
   	    $scope.items = response.data; 
   	    var searchMatch = function (haystack, needle) {
   	        if (!needle) { return true;}
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
   	    $scope.search();
   	    $scope.err = true;
			}
			});
		} else if(state == null || state == 'undefined' || state == '' && country == null || country == 'undefined' || country == ''){
			homeFactory.listingData($stateParams.mc.split(' ').join('-'),$stateParams.sc.split(' ').join('-')).then(function(response){
				if(response.data == ""){
					$scope.error = "<h1 class='center'>Sorry no data found :(</h1>";
					$scope.err = false;
				} else {
				var source = $("#some-template").html(); 
			var template = Handlebars.compile(source); 
			var data = { users: response.data }; 
			$('#listing').append(template(data));
			   // /////////////////////////////////////////////////////////
			$scope.gap = 5;
			$scope.filteredItems = [];
			$scope.groupedItems = [];
			$scope.itemsPerPage = 10;
			$scope.pagedItems = [];
			$scope.currentPage = 0;
			$scope.items = response.data; 
			var searchMatch = function (haystack, needle) {
			if (!needle) { return true;}
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
			$scope.search();
			$scope.err = true;
			}
			// ////////////////////////////////////////////////////////////////////////
			});
		} else if(country == null || country == 'undefined' || country == ''){
			homeFactory.listingDataByState($stateParams.mc.split(' ').join('-'),$stateParams.sc.split(' ').join('-'),$stateParams.st.split(' ').join('-')).then(function(response){
				if(response.data == ""){
					$scope.error = "<h1 class='center'>Sorry no data found :(</h1>";
					$scope.err = false;
				} else {
				var source = $("#some-template").html(); 
			var template = Handlebars.compile(source); 
			var data = { users: response.data }; 
			$('#listing').append(template(data));
			   // /////////////////////////////////////////////////////////
			$scope.gap = 5;
			$scope.filteredItems = [];
			$scope.groupedItems = [];
			$scope.itemsPerPage = 10;
			$scope.pagedItems = [];
			$scope.currentPage = 0;
			$scope.items = response.data; 
			var searchMatch = function (haystack, needle) {
			if (!needle) { return true;}
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
			$scope.search();
			$scope.err = true;
			}
			// ////////////////////////////////////////////////////////////////////////
			});
		} else {
			homeFactory.listingDataByCountry($stateParams.mc.split(' ').join('-'),$stateParams.sc.split(' ').join('-'),$stateParams.st.split(' ').join('-'),$stateParams.co.split(' ').join('-')).then(function(response){
				if(response.data == ""){
					$scope.error = "<h1 class='center'>Sorry no data found :(</h1>";
					$scope.err = false;
				} else {
				var source = $("#some-template").html(); 
			var template = Handlebars.compile(source); 
			var data = { users: response.data }; 
			$('#listing').append(template(data));
			   // /////////////////////////////////////////////////////////
			$scope.gap = 5;
			$scope.filteredItems = [];
			$scope.groupedItems = [];
			$scope.itemsPerPage = 10;
			$scope.pagedItems = [];
			$scope.currentPage = 0;
			$scope.items = response.data; 
			var searchMatch = function (haystack, needle) {
			if (!needle) { return true;}
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
			$scope.search();
			$scope.err = true;
			}
			// ////////////////////////////////////////////////////////////////////////
			});
		}
	}; // end get listing
	$scope.getMainCategories = function(){ // get main categories
		
		homeFactory.mainCategories().then(function(response){
			$scope.categoriez = response.data; 
		});
	};// End get main categories
	$scope.getSubCategory = function(e){ // get sub category
		$scope.sid = e;
		homeFactory.subCategories($scope.sid.split(' ').join('-')).then(function(response){
			$scope.subCate = response.data;
		});
	}; // End get sub category
	$scope.filterCategories = function(){ // Filter listing data
		/*
	 * var mainCategory = $scope.mCategory; var subCategory =
	 * $scope.address; if(subCategory == undefined){
	 * window.location.href =
	 * "listing/cate-"+$scope.mCategory.split('
	 * ').join('-'); } else if(mainCategory == undefined){
	 * window.location.href =
	 * "listing/adder-"+$scope.subCategory.split('
	 * ').join('-'); } else { $state.go('ListingFilter', {
	 * mc: $scope.mCategory.split(' ').join('-'), sc:
	 * $scope.address.split(',').join('-') }, {reload: true,
	 * inherit: true, notify: true}); }
	 */
		var url_ar = [];
		if(($scope.search != {})){
			if($scope.search.category !== undefined){
				url_ar.push("cate-"+$scope.search.category.toLowerCase().split(" ").join('+'));
			} 
			if($scope.search.city !== undefined){      	   			
				var t = $scope.search.city.toLowerCase();
				url_ar.push("adder-"+t.split(" ").join('+'));
			}
			if($scope.search.state !== undefined){      	   			
				var t = $scope.search.state.toLowerCase();
				url_ar.push("state-"+t.split(" ").join('+'));
			}
			if($scope.search.country !== undefined){      	   			
				var t = $scope.search.country.toLowerCase();
				url_ar.push("country-"+t.split(" ").join('+'));
			}
		}        	   			
		switch (url_ar.length) {        	   		    
	    case 1:        	   		        
	        $state.go("ListingFilterMC", { mc:url_ar[0]}, { reload: true, inherit: true, notify: true });
	        break;
	    case 2:        	   		    	
	    	$state.go("ListingFilter", { mc:url_ar[0], sc: url_ar[1]}, { reload: true, inherit: true, notify: true });
	        break;
	    case 3:        	   		    	
	    	$state.go("ListingFilterByState", { mc:url_ar[0], sc: url_ar[1], st: url_ar[2]}, { reload: true, inherit: true, notify: true });
	        break;
	    case 4:
	    	$state.go("ListingFilterByCountry", { mc:url_ar[0], sc: url_ar[1], st: url_ar[2], co: url_ar[3] }, { reload: true, inherit: true, notify: true });
	        break;
		}
	}; // End Filter listing data
	$scope.contactVendor = function(){ // contact vendor by hotel
		if($scope.contact == ""){
			$scope.name = true;
			$scope.title = true;
			$scope.email = true;
			$scope.description = true;
		} else {
			var z = {"listId" : $scope.listData.id, "vEmail" : $scope.listData.email};
			$.extend( true, $scope.contact, z);
			var val = JSON.stringify( $scope.contact );
			homeFactory.contact_vendor(val).then(function(response){
				if(response.data.val == "Done"){
					$scope.suc = true;
					$scope.contact = "";
				}	
			});
		}	
	}; // end contact vendor by hotel
	$scope.reviewLogin = function(){ // create Review login
		homeFactory.Login($scope.login).then(function(response){
			if(response.data.val == "Success"){
				console.log($stateParams);
				window.location.href = 'reviews/'+$stateParams.id;
				document.cookie = "vmail="+$scope.login.email;
			} else if(response.data.deactive == "deactive"){
			$scope.inval = true;
			$scope.login = "";
		} else if(response.data.inval == "inval"){
			$scope.inval = true;
			$scope.login = "";
		} else {
			window.location.href = 'reviews';
		}
		});
	};// End create Review login
	$scope.addReviewBySession = function(){
		window.location.href = 'reviews/'+$stateParams.id;
	};
	$scope.addReview = function(){
		var absUrl = $location.absUrl();
		if($scope.review == null){
			$scope.rating = true;
			$scope.title = true;
			$scope.description = true;
		} else {
			var z = {"listName" : $stateParams.id};
			$.extend( true, $scope.review, z);
			var val = JSON.stringify( $scope.review );
			homeFactory.addRating(val).then(function(response){
				window.location.href = "list/"+$stateParams.id;
			});
			$scope.rating = false;
			$scope.title = false;
			$scope.description = false;
			$scope.review = "";
		}
	};
	$scope.reviewSignUp = function(){
		location.reload(false);
		window.location.href = 'signup';
	};
	$scope.getSingleListReviews = function(){ // get singlelist all reviews
		homeFactory.allReviewsByList($stateParams.id.split('-').join(' ')).then(function(response){
		$scope.comments = response.data;
		$scope.gap = 5;
    $scope.filteredItems = [];
    $scope.groupedItems = [];
    $scope.itemsPerPage = 10;
    $scope.pagedItems = [];
    $scope.currentPage = 0;
    $scope.items = response.data; 
    var z="";
    var aa1="";
    var t=0;
    var avg="";
   for(z=0; z < response.data.length; z++){
	   aa1 =response.data[z].rating;
	   t += parseInt(aa1);
	   avg = t/response.data.length
   }
   for(var i=1; i <= avg; i++){
	 var stars = "<i class='fa fa-star' aria-hidden='true'></i>";
	  $("#stars").append(stars);
   }
  if(avg > 0){
	  $("#avg").append("("+avg+")");
	 } else {
		$("#avg").append("No Rating");
	 }
    var searchMatch = function (haystack, needle) {
        if (!needle) { return true;}
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
    $scope.search();
		});
	}; // end single list all reviews
	$scope.getNumber = function(e){
		$scope.n = e;
		var z = [];
		for(var i=1; i<=$scope.n; i++){
			z.push(i);
		}
		return z;
	};
	$scope.twitterOAth = function(){
		homeFactory.twitterOAuth($stateParams.id).then(function(response){
			window.location.href = response.data.val;
		});
	};
	$scope.searchList = function(){        	   			
		/*
	 * if($scope.mCategory == null || $scope.mCategory ==
	 * "undefined"){
	 * $(".select2-container").css('border','1px solid
	 * red'); } else { console.log($scope.mCategory.split('
	 * ').join('-')); console.log($scope.sCategory.split('
	 * ').join('-')); window.location.href =
	 * "listing/"+$scope.mCategory.split('
	 * ').join('-')+"/"+$scope.sCategory.split('
	 * ').join('-'); }
	 */        	   			
		/*
	 * if($scope.search.category != undefined){
	 * homeFactory.mainCategoryListData($scope.search.category).then(function(response){
	 * var url; if(response.data.length == 0){ url =
	 * "no-data"; } else if(response.data.length > 0){ var
	 * mCategory = response.data[0].categoryName; url =
	 * mCategory.split(' ').join('-');
	 * //console.log(response.data); } console.log(url);
	 * //var mCategory = response.data[0].categoryName;
	 * //window.location.href = "listing/"+url; }); } else
	 * if($scope.search.address != undefined){
	 * homeFactory.ListDataByAddress($scope.search.address).then(function(response){
	 * console.log(response.data); var mCategory =
	 * response.data[0].categoryName;
	 * 
	 * //$state.go('listing', {mc:$scope.search.address }, {
	 * reload: true, inherit: true, notify: true });
	 * 	
	 * window.location.href =
	 * "listing/"+$scope.search.address; }); }
	 */
		var url_ar = [];
		if(($scope.search != {})){
			if($scope.search.category !== undefined){
				url_ar.push("cate-"+$scope.search.category.toLowerCase().split(" ").join('+'));
			} 
			if($scope.search.city !== undefined){      	   			
				var t = $scope.search.city.toLowerCase();
				url_ar.push("adder-"+t.split(" ").join('+'));
			}
			if($scope.search.state !== undefined){      	   			
				var t = $scope.search.state.toLowerCase();
				url_ar.push("state-"+t.split(" ").join('+'));
			}
			if($scope.search.country !== undefined){      	   			
				var t = $scope.search.country.toLowerCase();
				url_ar.push("country-"+t.split(" ").join('+'));
			}
		}        	   			
		switch (url_ar.length) {        	   		    
	    case 1:        	   		        
	        $state.go("ListingFilterMC", { mc:url_ar[0]}, { reload: true, inherit: true, notify: true });
	        break;
	    case 2:        	   		    	
	    	$state.go("ListingFilter", { mc:url_ar[0], sc: url_ar[1]}, { reload: true, inherit: true, notify: true });
	        break;
	    case 3:        	   		    	
	    	$state.go("ListingFilterByState", { mc:url_ar[0], sc: url_ar[1], st: url_ar[2]}, { reload: true, inherit: true, notify: true });
	        break;
	    case 4:
	    	$state.go("ListingFilterByCountry", { mc:url_ar[0], sc: url_ar[1], st: url_ar[2], co: url_ar[3] }, { reload: true, inherit: true, notify: true });
	        break;
		}
	};
	$scope.subscribeEmail = function(){
		if($scope.sub == undefined){
			$scope.msg = "<div class='alert alert-danger alert-dismissable fade in'>"+
						    "Please enter your <strong>Name</strong> and <strong>Email</strong> "+
						  "</div>";
		} else {
			homeFactory.emailSubscribe($scope.sub).then(function(response){
				console.log(response.data);
				if(response.data.val == "1"){
					$scope.msg = "<div class='alert alert-danger alert-dismissable fade in'>"+
								    "You are already <strong>subscribed</strong>. "+
							  "</div>";
				}else if(response.data.val == "Done"){
				$scope.msg = "<div class='alert alert-success alert-dismissable fade in'>"+
							    "Your are email is successfully <strong>subscribed.</strong>"+
						  "</div>";
				}
			});
			$scope.sub = "";
		}
	};
	$scope.getAboutDataInFront = function(){
		homeFactory.aboutData().then(function(response){
			$scope.bindAboutData = response.data; 
		});
	};
	$scope.getprivacyDataInFront = function(){ // get privacy policy
		homeFactory.privacyData().then(function(response){
			$scope.bindPrivacyData = response.data; 
		});
	}; // end get privacy policy
	$scope.getTermsConditionsInFront = function(){ // get privacy policy
		homeFactory.termsData().then(function(response){
			$scope.bindTermsData = response.data; 
		});
	}; // end get terms and conditions
	$scope.getServicesDataInFront = function(){ // get Services
		homeFactory.serviceData().then(function(response){
			$scope.bindServicesData = response.data; 
		});
	};// end get Services
	$scope.contactUs = function(){ // contact us
		homeFactory.contactUs($scope.contact).then(function(response){
			$state.go('contactus', { }, { reload: false, inherit: true, notify: true });
			$scope.contactMsg = true;
			$scope.contact = "";
		});
	}; // end contact us
	$scope.getAddresss = function(){
		homeFactory.getListingAddress().then(function(response){
			$scope.address = response.data;
		});
	};
	$scope.getCity = function(){
		homeFactory.getListingCity().then(function(response){
			$scope.citz = response.data;
		});
	};
	$scope.getState = function(){
		homeFactory.getListingState().then(function(response){
			$scope.state = response.data;
		});
	};
	$scope.getCountry = function(){
		homeFactory.getListingCountry().then(function(response){
			$scope.country = response.data;
		});
	};
	$scope.getKeywords = function(){// get keywords
		homeFactory.getAllKeywords($scope.keyword).then(function(response){
			for(var i = 0; i < response.data.length; i++){
				$("#keyword option[value='"+response.data[i].title+"']").remove();
				$("#keyword").append("<option value='"+response.data[i].title+"'>");
			}
		});
	};// end keywords
	$scope.keywordSearch = function(){ // search keyword
		console.log($scope.keyword);
		window.location.href = "listing/title-"+$scope.keyword.split(' ').join('-').toLowerCase();
	};// end search keyword
}
]);