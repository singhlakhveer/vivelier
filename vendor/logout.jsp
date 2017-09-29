<%
	HttpSession s = request.getSession(false);
	s.invalidate();
	if(s == null){
		%>
		<script type="text/javascript">
			window.location.href = "home-slider";
		</script>
		<%
	}

	/* Cookie cookie = null;
	Cookie[] ck = request.getCookies();
	for (int i = 0; i < ck.length; i++) {
		cookie = ck[i];
		cookie.setMaxAge(0);
	} */
%>
<script type="text/javascript">
			window.location.href = "home-slider";
		</script>