
<div class="st-container">

	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
		ng-include="'front/header.jsp'"></nav>

	<!-- Sidebar component with st-effect-1 (set on the toggle button within the navbar) -->
	<aside
		class="sidebar left sidebar-size-2 sidebar-offset-0 sidebar-skin-dark sidebar-visible-desktop"
		id=sidebar-menu data-type=collapse ng-include='"vendor/sidebar.jsp"'>
	</aside>

	<!-- sidebar effects OUTSIDE of st-pusher: -->
	<!-- st-effect-1, st-effect-2, st-effect-4, st-effect-5, st-effect-9, st-effect-10, st-effect-11, st-effect-12, st-effect-13 -->

	<!-- content push wrapper -->
	<div class="st-pusher">

		<!-- sidebar effects INSIDE of st-pusher: -->
		<!-- st-effect-3, st-effect-6, st-effect-7, st-effect-8, st-effect-14 -->

		<!-- this is the wrapper for the content -->
		<div class="st-content">

			<!-- extra div for emulating position:fixed of the menu -->
			<div class="st-content-inner" id="content" data-scrollable
				data-ng-init="vendorProfile">
				<div class="container-fluid" style="text-align: center;">
					<div class="page-section" style="height: 330px;">
						<h1>Thanks for Free Sign Up</h1>
						<p>We will send your password your email.Please check it and
							enjoy</p>
					</div>
				</div>
			</div>

		</div>

	</div>
	<!-- /st-content-inner -->

</div>
<!-- /st-content -->
<section class="footer-section" ng-include='"front/footer.jsp"'>
</section>
<!-- /st-pusher -->

<!-- Footer -->
<footer class="footer">
	<strong>Global Hotels Directory</strong> &copy;2015
</footer>
<!-- // Footer -->