<% session.invalidate(); %>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
	ng-include="'front/header.jsp'"></nav>

<div id="content" class="ng-scope">
	<div class="bg-white">
		<div class="container">
			<div class="page-section" style="height: 330px;text-align: center;">
				<h1>Sorry ! Your payment is failed.</h1>
				<p class="lead">Please retry after some time.</p>
			</div>
		</div>
	</div>

	<section class="footer-section" ng-include='"front/footer.jsp"'>
	</section>
</div>
<!-- Footer -->
<footer class="footer">
	<strong>Global Hotels Directory</strong>  &copy;2015
</footer>
<!-- // Footer -->
