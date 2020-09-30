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
				<div class="card">
					<h3 class="card-title text-white text-center custom-bg">Your
						Order Details</h3>
					<div class="card-body">

						<c:if test="${sessionScope.order != null}">
							<h5 class="card-title">Name = ${sessionScope.order.name}</h5>
							<h5 class="card-title">Email = ${sessionScope.order.email}</h5>
							<h5 class="card-title">Contact =
								${sessionScope.order.contact}</h5>
							<h5 class="card-title">Address =
								${sessionScope.order.address}</h5>
						</c:if>

						<table class="table">
							<thead>
								<tr>
									<th scope="col">Item Name</th>
									<th scope="col">Price</th>
									<th scope="col">Quantity</th>
									<th scope="col">Total Price</th>
								</tr>
							</thead>
							<c:set var="s" value="0" />
							<tbody>
								<c:forEach var="it" items="${sessionScope.cart}">
									<c:set var="s"
										value="${s + it.p.getProductDiscount() * it.quantity}" />
									<tr>
										<td>${it.p.pTitle}</td>
										<td>${it.p.getProductDiscount()}</td>
										<td>${it.quantity}</td>
										<td>${it.p.getProductDiscount() * it.quantity}</td>
									</tr>
								</c:forEach>
								<tr>
									<td colspan='5' class='text-right font-weight-bold'>Total
										Price : ${s}</td>
								</tr>
							</tbody>
						</table>

					</div>
					<div class="card-footer text-center">

						<a class="btn btn-outline-danger" href="orderCancel">Order
							Cancel </a><button class="btn btn-outline-success" data-toggle="modal" data-target="#myModal">Payment Now</button>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>