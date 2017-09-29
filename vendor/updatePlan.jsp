<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String z = (String) request.getSession().getAttribute("vmail");
	if (z == null) {
%>
<script type="text/javascript">
	$(document).ready(function() {
		window.location.href = "login";
	});
</script>
<%
	}
%>
<%@ page import="java.util.*"%>
<%@ page import="java.security.*"%>
<%@ page import="java.io.*" %>
<%@page import="java.util.Properties"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
Properties prop = propertyConfig.getLangProperties(request,response);
%>
<%!public boolean empty(String s) {
		if (s == null || s.trim().equals(""))
			return true;
		else
			return false;
	}

	public String hashCal(String type, String str) {
		byte[] hashseq = str.getBytes();
		StringBuffer hexString = new StringBuffer();
		try {
			MessageDigest algorithm = MessageDigest.getInstance(type);
			algorithm.reset();
			algorithm.update(hashseq);
			byte messageDigest[] = algorithm.digest();

			for (int i = 0; i < messageDigest.length; i++) {
				String hex = Integer.toHexString(0xFF & messageDigest[i]);
				if (hex.length() == 1)
					hexString.append("0");
				hexString.append(hex);
			}

		} catch (NoSuchAlgorithmException nsae) {
		}

		return hexString.toString();
	}%>
<%
	Properties prop1 = propertyConfig.getPayUProperty();
	String merchant_key=prop1.getProperty("key");
	String salt=prop1.getProperty("salt");
	String base_url=prop1.getProperty("baseURL");
	String action1 = "";
	int error = 0;
	String hashString = "";

	Enumeration paramNames = request.getParameterNames();
	Map<String, String> params = new HashMap<String, String>();
	while (paramNames.hasMoreElements()) {
		String paramName = (String) paramNames.nextElement();

		String paramValue = request.getParameter(paramName);
		params.put(paramName, paramValue);
	}
	String txnid = "";
	if (empty(params.get("txnid"))) {
		Random rand = new Random();
		String rndm = Integer.toString(rand.nextInt()) + (System.currentTimeMillis() / 1000L);
		txnid = hashCal("SHA-256", rndm).substring(0, 20);
	} else
		txnid = params.get("txnid");
	String txn = "abcd";
	String hash = "";
	String hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";
	if (empty(params.get("hash")) && params.size() > 0) {
		if (empty(params.get("key")) || empty(params.get("txnid")) || empty(params.get("amount"))
				|| empty(params.get("firstname")) || empty(params.get("email")) || empty(params.get("phone"))
				|| empty(params.get("productinfo")) || empty(params.get("surl")) || empty(params.get("furl")))

			error = 1;
		else {
			String[] hashVarSeq = hashSequence.split("\\|");

			for (String part : hashVarSeq) {
				hashString = (empty(params.get(part)))
						? hashString.concat("")
						: hashString.concat(params.get(part));
				hashString = hashString.concat("|");
			}
			hashString = hashString.concat(salt);

			hash = hashCal("SHA-512", hashString);
			action1 = base_url.concat("/_payment");
		}
	} else if (!empty(params.get("hash"))) {
		hash = params.get("hash");
		action1 = base_url.concat("/_payment");
	}
%>

<script>
var hash='<%=hash%>';
	function submitPayuForm() {

		if (hash == '') {
			return;
		}
		var payuForm = document.forms.payuForm;
		payuForm.submit();
	}
</script>

<%
	String plan = (String) request.getSession().getAttribute("vPlan");
%>

<div class="st-container" data-ng-controller="vendorCtrl"
	data-ng-init="vendorProfile('<%=z%>');">

	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
		ng-include='"vendor/header.jsp"'></nav>
	<!-- Sidebar component with st-effect-1 (set on the toggle button within the navbar) -->
	<aside
		class="sidebar left sidebar-size-2 sidebar-offset-0 sidebar-skin-dark sidebar-visible-desktop"
		id=sidebar-menu data-type=collapse
		data-ng-include='"vendor/sidebar.jsp"'></aside>
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
				<div class="container-fluid">
					<div
						ng-if="vendor.amount == '5' || vendor.amount == 'Basic' || vendor.amount == '10' || vendor.amount == 'Pro' || vendor.amount == '20' || vendor.amount == 'Preimum'">
						
						<div class="columns1" ng-mouseover="planUpdate('Basic');">
							<ul class="price">
								<li class="header"><%=prop.getProperty("basic")%> <%
									if (plan.equals("Basic")) {
										out.print("<br><span style='font-size:12px'>(Active Plan)</span>");
									}
								%>
								</li>
								<li class="grey">$ 5 / Month</li>
								
								<!-- <li ><button class="btn btn-primary">Update</button></li> -->
								<li>
									<form action="https://test.payu.in/_payment" method="post"
										name="payuForm">
										<input type="hidden" name="key" ng-value="user1.key" /> <input
											type="hidden" name="hash" ng-value="user1.hash" /> <input
											type="hidden" name="txnid" ng-value="user1.txnid" /> <input
											type="hidden" name="amount" ng-value="user1.amount"
											value="<%=(empty(params.get("amount"))) ? "" : params.get("amount")%>" />
										<input type="hidden" name="firstname" id="firstname"
											ng-value="user1.firstname"
											value="<%=(empty(params.get("firstname"))) ? "" : params.get("firstname")%>" />
										<input type="hidden" name="email" id="email"
											ng-value="user1.email"
											value="<%=(empty(params.get("email"))) ? "" : params.get("email")%>" />
										<input type="hidden" name="phone" ng-value="user1.phone"
											value="<%=(empty(params.get("phone"))) ? "" : params.get("phone")%>" />
										<input type="hidden" name="productinfo"
											value="<%=(empty(params.get("productinfo"))) ? "Test" : params.get("productinfo")%>" />
										<input type="hidden" name="surl" ng-value="user1.surl"
											value="<%=(empty(params.get("surl"))) ? "" : params.get("surl")%>" />
										<input type="hidden" name="furl" ng-value="user1.furl"
											value="<%=(empty(params.get("furl"))) ? "" : params.get("furl")%>" />
										<input type="submit" class="button" value="<%=prop.getProperty("updatePlan")%>" />
									</form>
								</li>
							</ul>
						</div>
						<div class="columns1" ng-mouseover="planUpdate('Pro');">
							<ul class="price">
								<li class="header" style="background-color: #26A69A"><%=prop.getProperty("pro")%> <%
									if (plan.equals("Pro")) {
										out.print("<br><span style='font-size:12px'>(Active Plan)</span>");
									}
								%></li>
								<li class="grey">$ 10 / Month</li>
								
								<li>
									<form action="https://test.payu.in/_payment" method="post"
										name="payuForm">
										<input type="hidden" name="key" ng-value="user1.key" /> <input
											type="hidden" name="hash" ng-value="user1.hash" /> <input
											type="hidden" name="txnid" ng-value="user1.txnid" /> <input
											type="hidden" name="amount" ng-value="user1.amount"
											value="<%=(empty(params.get("amount"))) ? "" : params.get("amount")%>" />
										<input type="hidden" name="firstname" id="firstname"
											ng-value="user1.firstname"
											value="<%=(empty(params.get("firstname"))) ? "" : params.get("firstname")%>" />
										<input type="hidden" name="email" id="email"
											ng-value="user1.email"
											value="<%=(empty(params.get("email"))) ? "" : params.get("email")%>" />
										<input type="hidden" name="phone" ng-value="user1.phone"
											value="<%=(empty(params.get("phone"))) ? "" : params.get("phone")%>" />
										<input type="hidden" name="productinfo"
											value="<%=(empty(params.get("productinfo"))) ? "Test" : params.get("productinfo")%>" />
										<input type="hidden" name="surl" ng-value="user1.surl"
											value="<%=(empty(params.get("surl"))) ? "" : params.get("surl")%>" />
										<input type="hidden" name="furl" ng-value="user1.furl"
											value="<%=(empty(params.get("furl"))) ? "" : params.get("furl")%>" />
										<input type="submit" class="button" value="<%=prop.getProperty("updatePlan")%>" />
									</form>
								</li>
							</ul>
						</div>
						<div class="columns1" ng-mouseover="planUpdate('Preimum');">
							<ul class="price">
								<li class="header"><%=prop.getProperty("premium")%> <%
									if (plan.equals("Preimum")) {
										out.print("<br><span style='font-size:12px'>(Active Plan)</span>");
									}
								%></li>
								<li class="grey">$ 20 / Month</li>
								
								<li>
									<form action="https://test.payu.in/_payment" method="post"
										name="payuForm">
										<input type="hidden" name="key" ng-value="user1.key" /> <input
											type="hidden" name="hash" ng-value="user1.hash" /> <input
											type="hidden" name="txnid" ng-value="user1.txnid" /> <input
											type="hidden" name="amount" ng-value="user1.amount"
											value="<%=(empty(params.get("amount"))) ? "" : params.get("amount")%>" />
										<input type="hidden" name="firstname" id="firstname"
											ng-value="user1.firstname"
											value="<%=(empty(params.get("firstname"))) ? "" : params.get("firstname")%>" />
										<input type="hidden" name="email" id="email"
											ng-value="user1.email"
											value="<%=(empty(params.get("email"))) ? "" : params.get("email")%>" />
										<input type="hidden" name="phone" ng-value="user1.phone"
											value="<%=(empty(params.get("phone"))) ? "" : params.get("phone")%>" />
										<input type="hidden" name="productinfo"
											value="<%=(empty(params.get("productinfo"))) ? "Test" : params.get("productinfo")%>" />
										<input type="hidden" name="surl" ng-value="user1.surl"
											value="<%=(empty(params.get("surl"))) ? "" : params.get("surl")%>" />
										<input type="hidden" name="furl" ng-value="user1.furl"
											value="<%=(empty(params.get("furl"))) ? "" : params.get("furl")%>" />
										<input type="submit" class="button" value="<%=prop.getProperty("updatePlan")%>" />
									</form>
								</li>
							</ul>
						</div>
					</div>
					<div
						ng-if="vendor.amount == '30' || vendor.amount == 'Standard 1 Yr' || vendor.amount == '70' || vendor.amount == 'Standard 3 Yr' || vendor.amount == '1000' || vendor.amount == 'Featured 1 Yr' || vendor.amount == '1' || vendor.amount == 'Free List'">
						<div class="columns" ng-mouseover="planUpdate('Free List');">
							<ul class="price">
								<li class="header" style="background-color: #26A69A"><%=prop.getProperty("free")%> <%
									if (plan.equals("Free List")) {
										out.print("<br><span style='font-size:12px'>(Active Plan)</span>");
									}
								%></li>
								<li class="grey">$ 0 / year</li>
								
								<li>
									<form action="" ui-sref="vendor.thankyou" method="post"
										name="payuForm">
										<input type="submit" class="button" value="<%=prop.getProperty("updatePlan")%>" />
									</form>
								</li>
							</ul>
						</div>
						<div class="columns" ng-mouseover="planUpdate('Standard 1 Yr');">
							<ul class="price">
								<li class="header"><%=prop.getProperty("standard1")%> <%
									if (plan.equals("Standard 1 Yr")) {
										out.print("<br><span style='font-size:12px'>(Active Plan)</span>");
									}
								%></li>
								<li class="grey">$ 30 / year</li>
								
								<!-- <li ><button class="btn btn-primary">Update</button></li> -->
								<li>
									<form action="https://test.payu.in/_payment" method="post"
										name="payuForm">
										<input type="hidden" name="key" ng-value="user1.key" /> <input
											type="hidden" name="hash" ng-value="user1.hash" /> <input
											type="hidden" name="txnid" ng-value="user1.txnid" /> <input
											type="hidden" name="amount" ng-value="user1.amount"
											value="<%=(empty(params.get("amount"))) ? "" : params.get("amount")%>" />
										<input type="hidden" name="firstname" id="firstname"
											ng-value="user1.firstname"
											value="<%=(empty(params.get("firstname"))) ? "" : params.get("firstname")%>" />
										<input type="hidden" name="email" id="email"
											ng-value="user1.email"
											value="<%=(empty(params.get("email"))) ? "" : params.get("email")%>" />
										<input type="hidden" name="phone" ng-value="user1.phone"
											value="<%=(empty(params.get("phone"))) ? "" : params.get("phone")%>" />
										<input type="hidden" name="productinfo"
											value="<%=(empty(params.get("productinfo"))) ? "Test" : params.get("productinfo")%>" />
										<input type="hidden" name="surl" ng-value="user1.surl"
											value="<%=(empty(params.get("surl"))) ? "" : params.get("surl")%>" />
										<input type="hidden" name="furl" ng-value="user1.furl"
											value="<%=(empty(params.get("furl"))) ? "" : params.get("furl")%>" />
										<input type="submit" class="button" value="<%=prop.getProperty("updatePlan")%>" />
									</form>
								</li>
							</ul>
						</div>
						<div class="columns" ng-mouseover="planUpdate('Standard 3 Yr');">
							<ul class="price">
								<li class="header" style="background-color: #26A69A"><%=prop.getProperty("standard3")%> <%
									if (plan.equals("Standard 3 Yr")) {
										out.print("<br><span style='font-size:12px'>(Active Plan)</span>");
									}
								%>
								</li>
								<li class="grey">$ 70 / year</li>
								
								<li>
									<form action="https://test.payu.in/_payment" method="post"
										name="payuForm">
										<input type="hidden" name="key" ng-value="user1.key" /> <input
											type="hidden" name="hash" ng-value="user1.hash" /> <input
											type="hidden" name="txnid" ng-value="user1.txnid" /> <input
											type="hidden" name="amount" ng-value="user1.amount"
											value="<%=(empty(params.get("amount"))) ? "" : params.get("amount")%>" />
										<input type="hidden" name="firstname" id="firstname"
											ng-value="user1.firstname"
											value="<%=(empty(params.get("firstname"))) ? "" : params.get("firstname")%>" />
										<input type="hidden" name="email" id="email"
											ng-value="user1.email"
											value="<%=(empty(params.get("email"))) ? "" : params.get("email")%>" />
										<input type="hidden" name="phone" ng-value="user1.phone"
											value="<%=(empty(params.get("phone"))) ? "" : params.get("phone")%>" />
										<input type="hidden" name="productinfo"
											value="<%=(empty(params.get("productinfo"))) ? "Test" : params.get("productinfo")%>" />
										<input type="hidden" name="surl" ng-value="user1.surl"
											value="<%=(empty(params.get("surl"))) ? "" : params.get("surl")%>" />
										<input type="hidden" name="furl" ng-value="user1.furl"
											value="<%=(empty(params.get("furl"))) ? "" : params.get("furl")%>" />
										<input type="submit" class="button" value="<%=prop.getProperty("updatePlan")%>" />
									</form>
								</li>
							</ul>
						</div>
						<div class="columns" ng-mouseover="planUpdate('Featured 1 Yr');">
							<ul class="price">
								<li class="header"><%=prop.getProperty("featured1")%> <%
									if (plan.equals("Featured 1 Yr")) {
										out.print("<br><span style='font-size:12px'>(Active Plan)</span>");
									}
								%></li>
								<li class="grey">$ 1000 / year</li>
								
								<li>
									<form action="https://test.payu.in/_payment" method="post"
										name="payuForm">
										<input type="hidden" name="key" ng-value="user1.key" /> <input
											type="hidden" name="hash" ng-value="user1.hash" /> <input
											type="hidden" name="txnid" ng-value="user1.txnid" /> <input
											type="hidden" name="amount" ng-value="user1.amount"
											value="<%=(empty(params.get("amount"))) ? "" : params.get("amount")%>" />
										<input type="hidden" name="firstname" id="firstname"
											ng-value="user1.firstname"
											value="<%=(empty(params.get("firstname"))) ? "" : params.get("firstname")%>" />
										<input type="hidden" name="email" id="email"
											ng-value="user1.email"
											value="<%=(empty(params.get("email"))) ? "" : params.get("email")%>" />
										<input type="hidden" name="phone" ng-value="user1.phone"
											value="<%=(empty(params.get("phone"))) ? "" : params.get("phone")%>" />
										<input type="hidden" name="productinfo"
											value="<%=(empty(params.get("productinfo"))) ? "Test" : params.get("productinfo")%>" />
										<input type="hidden" name="surl" ng-value="user1.surl"
											value="<%=(empty(params.get("surl"))) ? "" : params.get("surl")%>" />
										<input type="hidden" name="furl" ng-value="user1.furl"
											value="<%=(empty(params.get("furl"))) ? "" : params.get("furl")%>" />
										<input type="submit" class="button" value="<%=prop.getProperty("updatePlan")%>" />
									</form>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /st-content-inner -->
	</div>
	<!-- /st-content -->
<!-- /st-pusher -->
<!-- Footer -->
<footer class="footer">
	<strong><%=prop.getProperty("page_title")%></strong> &copy;2015
</footer>
<!-- // Footer -->
</div>