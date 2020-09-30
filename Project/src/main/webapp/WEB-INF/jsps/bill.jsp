<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionScope.current_user == null}">
	<c:set var="message" scope="session"
		value="You are not logged in !! Login first" />
	<c:redirect url="loginPage" />
</c:if>
<c:set var="user" scope="session" value="${sessionScope.current_user}" />




<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="/WEB-INF/static/component/link.jsp" />
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/static/component/navbar.jsp" />



	<div class="container">
		<div class="row mt-4">
			<div class="col-md-10">
			
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Item Name</th>
								</tr>
							</thead>
							<c:set var="s" value="0" />
							<tbody>
								<c:forEach var="it" items="${sessionScope.cart}">
									<c:set var="s"
										value="${s + it.p.getProductDiscount() * it.quantity}" />
									<tr>
										<td>${it.p.pTitle}</td>
									</tr>
								</c:forEach>
								<tr>
									<td colspan='5' class='text-right font-weight-bold'>Total
										Price : ${s}</td>
								</tr>
							</tbody>
						</table>
			
			</div>
		</div>
	</div>
</body>
</html>