<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.security.*"%>

<%!public boolean empty(String s) {
		if (s == null || s.trim().equals("")) {
			return true;
		} else {
			return false;
		}
	}%>
<%!public String hashCal(String type, String str) {
		byte[] hashseq = str.getBytes();
		StringBuffer hexString = new StringBuffer();
		try {
			MessageDigest algorithm = MessageDigest.getInstance(type);
			algorithm.reset();
			algorithm.update(hashseq);
			byte messageDigest[] = algorithm.digest();

			for (int i = 0; i < messageDigest.length; i++) {
				String hex = Integer.toHexString(0xFF & messageDigest[i]);
				if (hex.length() == 1) {
					hexString.append("0");
				}
				hexString.append(hex);
			}

		} catch (NoSuchAlgorithmException nsae) {
		}

		return hexString.toString();
	}%>
<%
	String merchant_key = "gtKFFx";
	String salt = "eCwWELxi";
	String action1 = "";
	String base_url = "https://test.payu.in";
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
	} else {
		txnid = params.get("txnid");
	}
	String txn = "abcd";
	String hash = "";
	String hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";
	if (empty(params.get("hash")) && params.size() > 0) {
		if (empty(params.get("key")) || empty(params.get("txnid")) || empty(params.get("firstname"))
				|| empty(params.get("amount")) || empty(params.get("email")) || empty(params.get("phone"))) {
			error = 1;
			System.out.print("<h1>asd</h1>");
		} else {
			String[] hashVarSeq = hashSequence.split("\\|");

			for (String part : hashVarSeq) {
				hashString = (empty(params.get(part))) ? hashString.concat("")
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


<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
	ng-include="'front/header.jsp'"></nav>

<div id="content" class="ng-scope">
	<div class="bg-white">
		<div class="container">
			<div class="page-section">
				<div data-scrollable="" tabindex="1"
					style="overflow-y: hidden; outline: none;">

					<div class="form-section">
						<form id="contact-form" ng-submit="sign_up()" name="form"
							novalidate>
							<input type="hidden" name="key"
								ng-init="user.key = '<%=merchant_key%>'"
								ng-value="<%=merchant_key%>" /> <input type="hidden"
								name="hash" ng-init="user.hash = '<%=hash%>'"
								ng-value="<%=hash%>" /> <input type="hidden" name="txnid"
								ng-init="user.txnid = '<%=txnid%>'" /> <input type="hidden"
								name="productinfo" ng-model="user.productinfo" /> <input
								type="hidden" name="surl" ng-model="user.surl" /> <input
								type="hidden" name="furl" />

							<div class="controls">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="form_name">Firstname *</label> <input
												id="form_name" type="text" name="name"
												ng-model="user.first_name" class="form-control"
												placeholder="Please enter your firstname *">

										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="form_lastname">Lastname *</label> <input
												id="form_lastname" type="text" name="surname"
												ng-model="user.last_name" class="form-control"
												placeholder="Please enter your lastname *">

										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label for="form_email">Email *</label> <input
												id="form_email" type="email" name="email"
												class="form-control" placeholder="Please enter your email *"
												ng-model="user.email" required="required">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="form_phone">Phone</label> <input id="form_phone"
												type="tel" name="phone" class="form-control"
												ng-model="user.phone" placeholder="Please enter your phone">
										</div>
									</div>

									<div class="col-md-12">
										<div class="form-group">
											<label for="form_phone">Vender Plan</label>
										</div>
									</div>
									<div class="col-md-4">
										<label class="radio-inline"> <input type="radio"
											name="amount" ng-model="user.amount" class="radio-inline"
											value="5"> $5 Basic
										</label>

									</div>
									<div class="col-md-4">
										<label class="radio-inline"> <input type="radio"
											name="amount" ng-model="user.amount" class="radio-inline"
											value="10"> $10 Pro
										</label>
									</div>
									<div class="col-md-4">
										<label class="radio-inline"> <input type="radio"
											name="amount" ng-model="user.amount" class="radio-inline"
											value="20"> $20 Preimum
										</label>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-12">
										<input type="submit" class="btn btn-success btn-send"
											value="Sign Up">
									</div>
								</div>
							</div>

						</form>
					</div>
				</div>

			</div>
		</div>
	</div>


	<section class="footer-section" ng-include='"front/footer.jsp"'>
	</section>

</div>
<!-- // END #content -->

<!-- Footer -->
<footer class="footer">
	<strong>Global Hotels Directory</strong>  &copy;2015
</footer>
<!-- // Footer -->
