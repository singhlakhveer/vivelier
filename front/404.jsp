<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%
	int z = (Integer) response.getStatus();
	if (z == 404) {
		out.print("<script>window.location.href='http://localhost:8080/realestate/404'</script>");
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="description" content="">
<meta name="keywords" content="">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section class="signup-section">
		<div class="container">
			<div class="row">
				<div class="center">
					<h1>404</h1>
					<p class="lead">Page Not Found.</p>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
