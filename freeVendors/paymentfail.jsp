<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Properties"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
	Properties prop = propertyConfig.getLangProperties(request, response);
%>
<%
	session.invalidate();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=prop.getProperty("page_title")%></title>

<!-- Bootstrap -->
<!-- <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"> -->
<!-- <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet"> -->
</head>
<body>
	<section class="banner">
		<div>
			<jsp:include page="/front/header.jsp"></jsp:include>
			<div id="content" class="ng-scope">
				<div class="bg-white">
					<div class="container">
						<div class="page-section"
							style=" margin-top:150px; text-align: center;">
							<h1>Sorry ! Your payment is failed.</h1>
							<p class="lead">Please retry after some time.</p>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="/front/footer.jsp"></jsp:include>
		</div>
	</section>
</body>
</html>