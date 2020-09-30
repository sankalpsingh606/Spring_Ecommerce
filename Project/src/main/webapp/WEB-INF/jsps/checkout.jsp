<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page isELIgnored="false" %>
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
			<div class="col-md-6">
				<div class="card">
				<h3 class="card-title text-white text-center custom-bg" >Your Selected Items</h3>
					<div class="card-body">
						
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Item Name</th>
									<th scope="col">Price</th>
									<th scope="col">Quantity</th>
									<th scope="col">Total Price</th>
									<th scope="col">Action</th>
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
										<td><a class="btn btn-danger btn-sm"
											href="deleteToCart?id=${it.p.pId}">Remove</a></td>

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
			<div class="col-md-6">
				<div class="card">
					<h3 class="card-title text-white text-center custom-bg" >Your details for Order</h3>
					<div class="card-body">
						<form action="order" method="post"
							>
							<div class="form-group">
								<input type="email" class="form-control"
									value="${user.userEmail}" placeholder="Enter the e-mail" name="email">
							</div>
							<div class="form-group">
								<input type="text" class="form-control"
								value="${user.userName}"	placeholder="Enter the name" name="name">
							</div>
							
							<div class="form-group">
								<input type="text" class="form-control"
								value="${user. userPhone}"	placeholder="Enter the name" name="contact">
							</div>
							<div class="form-group">

								<textarea style="height: 150px" class="form-control"
								value="${user. userAddress}" name="address" placeholder="Enter the address">${user. userAddress}</textarea>
							</div>


							<!-- Modal footer -->
							<div class="card-footer text-center">

								<button type="submit" class="btn btn-outline-success">Order Now
									</button>
								<a class="btn btn-outline-primary" href="hello">Continue Shopping </a></div>

						</form>

					</div>
				</div>

			</div>
		</div>
	</div>


</body>
</html>