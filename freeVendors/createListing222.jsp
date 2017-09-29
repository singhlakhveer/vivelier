<%@ page import="java.util.*" %>
<%@ page import="java.security.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.util.Properties"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
Properties prop = propertyConfig.getLangProperties(request,response);
%>
<%!
public boolean empty(String s)
	{
		if(s== null || s.trim().equals(""))
			return true;
		else
			return false;
	}
%>
<%!
	public String hashCal(String type,String str){
		byte[] hashseq=str.getBytes();
		StringBuffer hexString = new StringBuffer();
		try{
		MessageDigest algorithm = MessageDigest.getInstance(type);
		algorithm.reset();
		algorithm.update(hashseq);
		byte messageDigest[] = algorithm.digest();
            
		
		for (int i=0;i<messageDigest.length;i++) {
			String hex=Integer.toHexString(0xFF & messageDigest[i]);
			if(hex.length()==1) hexString.append("0");
			hexString.append(hex);
		}
			
		}catch(NoSuchAlgorithmException nsae){ }
		
		return hexString.toString();
	}
%>
<% 	
	Properties prop1 = propertyConfig.getPayUProperty();
	String merchant_key=prop1.getProperty("key");
	String salt=prop1.getProperty("salt");
	String base_url=prop1.getProperty("baseURL");
	String action1 ="";
	int error=0;
	String hashString="";
	
 
	
	Enumeration paramNames = request.getParameterNames();
	Map<String,String> params= new HashMap<String,String>();
    	while(paramNames.hasMoreElements()) 
	{
      		String paramName = (String)paramNames.nextElement();
      
      		String paramValue = request.getParameter(paramName);
		params.put(paramName,paramValue);
	}
	String txnid ="";
	if(empty(params.get("txnid"))){
		Random rand = new Random();
		String rndm = Integer.toString(rand.nextInt())+(System.currentTimeMillis() / 1000L);
		txnid=hashCal("SHA-256",rndm).substring(0,20);
	}
	else
		txnid=params.get("txnid");
	String txn="abcd";
	String hash="";
	String hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";
	if(empty(params.get("hash")) && params.size()>0)
	{
		if( empty(params.get("key"))
			|| empty(params.get("txnid"))
			|| empty(params.get("amount"))
			|| empty(params.get("firstname"))
			|| empty(params.get("email"))
			|| empty(params.get("phone"))
			|| empty(params.get("productinfo"))
			|| empty(params.get("surl"))
			|| empty(params.get("furl"))	)
			
			error=1;
		else{
			String[] hashVarSeq=hashSequence.split("\\|");
			
			for(String part : hashVarSeq)
			{
				hashString= (empty(params.get(part)))?hashString.concat(""):hashString.concat(params.get(part));
				hashString=hashString.concat("|");
			}
			hashString=hashString.concat(salt);
			
			 hash=hashCal("SHA-512",hashString);
			action1=base_url.concat("/_payment");
		}
	}
	else if(!empty(params.get("hash")))
	{
		hash=params.get("hash");
		action1=base_url.concat("/_payment");
	}
		
%>

<script>
var hash='<%= hash %>';
function submitPayuForm() {
	
	if (hash == ''){
		return;
	}	
      var payuForm = document.forms.payuForm;
      payuForm.submit();
    }
</script>
<style>
p {
	font-weight: normal;
}
</style>
<body>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
		ng-include="'front/header.jsp'"></nav>

	<div id="content" class="ng-scope">
		<div class="bg-white">
			<div class="container" ng-controller="freeVendorCtrl">
				<div class="page-section">
					<div data-scrollable="" tabindex="1"
						style="overflow-y: hidden; outline: none;">

						<div class="form-section">
							<div class="controls">
								<div class="row">
								<div class="col-md-6">
										<div class="form-group">
											<label for="form_name"><%=prop.getProperty("contactPerson")%> </label>
											<p data-ng-bind="userData.firstname" ></p>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="form_name"><%=prop.getProperty("companyName")%> </label>
											<p data-ng-bind="userData.companyName" ></p>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="form_name"><%=prop.getProperty("phone")%> </label>
											<p data-ng-bind="userData.phone" ></p>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="form_name"><%=prop.getProperty("email")%> </label>
											<p data-ng-bind="userData.email" ></p>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="form_name"><%=prop.getProperty("title")%> </label>
											<p data-ng-bind="userData.title" ></p>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="form_lastname"><%=prop.getProperty("vendorPlan")%></label>
											<p ng-if="userData.amount == '1000.0' " > <%=prop.getProperty("featured1")%> </p>
											<p ng-if="userData.amount == '70.0' " > <%=prop.getProperty("standard3")%> </p>
											<p ng-if="userData.amount == '30.0' " > <%=prop.getProperty("standard1")%> </p>
											<p ng-if="userData.amount == '1.0' " > <%=prop.getProperty("free")%> </p>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="form_lastname"><%=prop.getProperty("description")%></label>
											<p data-ng-bind="userData.description" ></p>
										</div>
									</div>
									
								</div>
								<br>
								<div class="row">
									<div class="col-md-6">
										<input type="button" ng-click="back_createList();" class="btn btn-primary btn-send"
											value="<%=prop.getProperty("back")%>">
									</div>
									<div class="col-md-6">
										<form action="https://test.payu.in/_payment" method="post" name="payuForm">
										  <input type="hidden" name="key" ng-value="userData.key" />
										  <input type="hidden" name="hash" ng-value="userData.hash" />
										  <input type="hidden" name="txnid" ng-value="userData.txnid" />
								          <input type="hidden" name="amount" ng-value="userData.amount" value="<%= (empty(params.get("amount"))) ? "" : params.get("amount") %>" />
								          <input type="hidden" name="firstname" id="firstname" ng-value="userData.firstname" value="<%= (empty(params.get("firstname"))) ? "" : params.get("firstname") %>" />
								          <input type="hidden" name="email" id="email" ng-value="userData.email" value="<%= (empty(params.get("email"))) ? "" : params.get("email") %>" />
								          <input type="hidden" name="phone" ng-value="userData.phone" value="<%= (empty(params.get("phone"))) ? "" : params.get("phone") %>" />
								          <input type="hidden" name="productinfo" value="<%= (empty(params.get("productinfo"))) ? "Test" : params.get("productinfo") %>"  />
								          <input type="hidden" name="surl" ng-value="userData.surl" value="<%= (empty(params.get("surl"))) ? "" : params.get("surl") %>" />
								          <input type="hidden" name="furl" ng-value="userData.furl" value="<%= (empty(params.get("furl"))) ? "" : params.get("furl") %>" />
											
												
											<input type="submit" class="btn btn-primary btn-send" value="<%=prop.getProperty("confirm")%>" />
										</form>
									</div>
								</div>
							</div>
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
		<strong><%=prop.getProperty("page_title")%></strong>  &copy;2015
	</footer>
	<!-- // Footer -->
</body>