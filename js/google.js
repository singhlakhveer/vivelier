function login() {
	var myParams = {
		'clientid' : '260074708977-b92nndeh2qc3mu67vv5943vge8ja98tt.apps.googleusercontent.com',
		'cookiepolicy' : 'single_host_origin',
		'callback' : 'loginCallback',
		'approvalprompt' : 'force',
		'scope' : 'https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/plus.profile.emails.read'
	};
	gapi.auth.signIn(myParams);
}

function loginCallback(result) {
	if (result['status']['signed_in']) {
		var request = gapi.client.plus.people.get({
			'userId' : 'me'
		});
		request.execute(function(resp) {
			console.log(resp.emails[0].value);
			document.cookie = "gmail="
				+ encodeURIComponent(resp.emails[0].value);
			var absUrl = window.location.href;
//			var d = absUrl.split("id=");
			var aa = absUrl.split('/');
			window.location.href = "reviews/" + aa[5];
			//location.reload(false);
		});
	}

}
function onLoadCallback() {
	gapi.client.setApiKey('AIzaSyBddN1zPlzAEwWB1BHQRxp3MslRJ3WeoP8');
	gapi.client.load('plus', 'v1', function() {
	});
}

(function() {
	var po = document.createElement('script');
	po.type = 'text/javascript';
	po.async = true;
	po.src = 'https://apis.google.com/js/client.js?onload=onLoadCallback';
	var s = document.getElementsByTagName('script')[0];
	s.parentNode.insertBefore(po, s);
})();