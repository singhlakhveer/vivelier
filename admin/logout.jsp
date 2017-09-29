<%
	HttpSession s = request.getSession(false);
	s.invalidate();

	Cookie cookie = null;
	Cookie[] ck = request.getCookies();
	for (int i = 0; i < ck.length; i++) {
		cookie = ck[i];
		cookie.setMaxAge(0);
	}
%>

<script>
$(document).ready(function(){
	window.location.href = "admin/login";
});
</script>