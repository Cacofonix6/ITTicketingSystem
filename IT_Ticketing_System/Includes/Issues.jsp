<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<h1>All Issues</h1>
	<c:choose>
		<c:when test="${not empty allIssues}">
			${fn:length(allIssues)} Results
			<c:forEach var="status" items="${statusList}">
				<table class="issueTable ${issue}">
				<tr><th colspan="2">${status}</th></tr>
				<tr>					
					<td class="empty" colspan="2"></td>
				</tr>
				<c:forEach var="issue" items="${allIssues}">
					<c:if test="${issue.status == status}">

						<tr>					
							<td id="issueElement" class="issueTitle ${status}" colspan="2">
								<form action="${pageContext.request.contextPath}/controller" name="issueForm" method="POST">
									<input type="hidden" name="issueID" value="${issue.issueID}" />
									<input type="submit" value="${issue.title}" />
								</form>						
							</td>
						</tr>
						<tr>					
							<td id="issueElement" class="issueDate ${status}">
								
								<fmt:formatDate type = "both" dateStyle = "medium" timeStyle = "short" value = "${issue.reportedDateTime}" />
															
							</td>
							<td class="issueStatus ${status}">
								
								<c:out value="${issue.status}"/>
								
							</td>
						</tr>
						<tr>					
							<td id="issueElement" class="issueDescription ${status}" colspan="2">
								
								<c:out value="${issue.description}"/>
									
							</td>
						</tr>
						<tr>					
							<td id="issueElement" class="empty ${status}" colspan="2"></td>
						</tr>
					</c:if>    
				</c:forEach>
				</table>
			</c:forEach>
		</c:when>    
		<c:otherwise>
			There are no issues at this time.
		</c:otherwise>
	</c:choose>


