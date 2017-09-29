<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Properties"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
	Properties prop = propertyConfig.getLangProperties(request, response);
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
	<div>
		<jsp:include page="header.jsp"></jsp:include>
		<section class="listing-detail" id="content">
			<div id="content" class="ng-scope">
				<div class="bg-white">
					<div class="container">
						<div class="page-section"
							style="text-align: center;">
							<h1><%=prop.getProperty("fail")%></h1>
							<p class="lead"><%=prop.getProperty("retry")%></p>
						</div>
					</div>
				</div>
			</div>
		</section>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>