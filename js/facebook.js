window.fbAsyncInit = function() {
	FB.init({
		appId : '201685876945016',
		oauth : true,
		status : true, // check login status
		cookie : true, // enable cookies to allow the server to access the
						// session
		xfbml : true
	// parse XFBML
	});

};

function fb_login() {
	FB.login(function(response) {

		if (response.authResponse) {
			console.log('Welcome!  Fetching your information.... ');
			// console.log(response); // dump complete info
			access_token = response.authResponse.accessToken; // get access
																// token
			user_id = response.authResponse.userID; // get FB UID
			var fields = [ 'name', 'email' ].join(',');
			FB.api('/me', {
				fields : fields
			}, function(response) {
				user_email = response.email; // get user email
				// you can store this data into your database
				if (response.email != null || response.email != "")
					document.cookie = "fmail="
							+ encodeURIComponent(response.email);
				var absUrl = window.location.href;
				var aa = absUrl.split('/');
				//var d = absUrl.split("id=");
				window.location.href = "reviews/" + aa[5];
//				location.reload(true);
			});

		} else {
			// user hit cancel button
			console.log('User cancelled login or did not fully authorize.');
		}
	}, {
		scope : 'public_profile,email'
	});
}
(function() {
	var e = document.createElement('script');
	e.src = document.location.protocol + '//connect.facebook.net/en_US/all.js';
	e.async = true;
	document.getElementById('fb-root').appendChild(e);
}());


/* share */
(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.8&appId=201685876945016";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
