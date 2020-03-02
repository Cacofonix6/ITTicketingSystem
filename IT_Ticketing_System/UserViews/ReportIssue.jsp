<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Report Issue</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/mainStyle.css">
		<script src="${pageContext.request.contextPath}/static/Main.js"></script>
		<script src="${pageContext.request.contextPath}/static/responsiveLeftNav.js"></script>	
	</head>
		<body>
		
		<div class="title">			
			<h1>Report Issue</h1>
		</div>
		<div class="titlenav">
			<a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="responsiveLeftNav()">&#9776;</a>	
				<a class="logOff" href="${pageContext.request.contextPath}/controller">Log off</a>
			<div class="userDetails">Welcome ${userLoggedIn.firstName} ${userLoggedIn.surname}</div>
		</div>

		<div class="rows">
			<!-- Left Nav bar -->
			<div class="col left" id="leftNavBar">
				<jsp:include page="/Includes/Navigation.jsp" />
			</div>

			<div class="col middle" id="mainBody">
				<form action="${pageContext.request.contextPath}/controller" method="POST" name="issueForm" id="issueForm">
					<table class="tableWithBorder">
						<tr><th>Title</th><td><input type="text" name="Title"></td></tr>
						<tr><th>Description</th><td><input type="text" name="Description"></td></tr>
						<tr><th>Category</th><td><select name="Category">
							<div class="default"><option value="0">Select a Category</option></div>
							<c:forEach items="${categoryList}" var="cat">
								<option value="${cat.category}">${cat.category}</option>
							</c:forEach>
						</select></td></tr>
						<script type="text/javascript">
									$('issueForm').ready(function () {
										$('#SubCategory').bind('change', function(){
											var elements = $('div.container').children().hide();
											var value = $(this).val();
						
											if (value.length) {
												elements.filter('.' + value).show();
											} else {
												elements.filter('default').show();
											}
										}).trigger('change');
									});
								</script>
						<tr><th>Sub Category</th><td><select name="SubCategory" id="SubCategory">
							<div class="container"></div>
							<div class="default"><option value="0">Select a Category</option></div>
							<c:forEach items="${categoryList}" var="cat">
							<div class="${cat}">
								<c:forEach items="${cat.subCategories}" var="subCat">
									<option value="${subCat}">${subCat}</option>
								</c:forEach>
							</div>
							</c:forEach>
						</select></td></tr>
						<tr><th>Submit</th><td><input type="submit" name="submitIssue" value="Submit new issue"></td></tr>
					</table>
				</form>
			</div>	

			<div class="col right">
				<jsp:include page="/Includes/Maintenance.jsp" />	 
			</div>
			

		</div>		
	</body>
</html>