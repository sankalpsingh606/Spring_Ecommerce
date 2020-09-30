
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Modal -->
<div class="modal fade" id="cart" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header custom-bg text-white">
				<h5 class="modal-title " id="exampleModalLabel">Your Cart</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<jsp:include page="/WEB-INF/static/component/message.jsp" />
				<c:choose>
					<c:when test="${sessionScope.cart !=null}">


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
					</c:when>
					<c:otherwise>
						<h2>Cart does not have any item</h2>
					</c:otherwise>
				</c:choose>


				<%-- <c:forEach var="it" items="${sessionScope.cart}">
 
 <c:out value="${it.p.pTitle}"></c:out>
 
 </c:forEach>
  --%>
			</div>
			<c:choose>
				<c:when test="${sessionScope.cart !=null}">
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<a href="checkout" class="btn btn-primary checkout-btn">Checkout</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary checkout-btn"
							disabled="disabled">Checkout</button>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>



<!-- The Modal -->
<div class="modal fade" id="myModal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header custom-bg text-white">


				<div class="row ">
					<h3 class="text-center">Payment Details</h3>
					<img class="img-fluid"
						src="http://www.prepbootstrap.com/Content/images/shared/misc/creditcardicons.png">
				</div>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>



			<!-- Modal body -->
			<form action="payment" method="post">
				<div class="modal-body">

					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label>CARD NUMBER</label>
								<div class="input-group mb-2">
									<input type="text" class="form-control"
										placeholder="Valid Card Number"  name="cardNumber"/>
									<div class="input-group-prepend">
										<div class="input-group-text">
											<span class="input-group-addon"><span
												class="fa fa-credit-card"></span></span>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-7 col-md-7">
							<div class="form-group">
								<label><span class="hidden-xs">EXPIRATION</span><span
									class="visible-xs-inline">EXP</span> DATE</label> <input type="text"
								name="validity"	class="form-control" placeholder="MM / YY" />
							</div>
						</div>
						<div class="col-xs-5 col-md-5 float-xs-right">
							<div class="form-group">
								<label>CV CODE</label> <input type="tel" class="form-control"
								name="cvc"	placeholder="CVC" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label>CARD OWNER</label> <input type="text"
								name="cardName"	class="form-control" placeholder="Card Owner Names" />
							</div>
						</div>
					</div>


				</div>
				<!-- Modal footer -->
				<div class="modal-footer text-center">
					<button type="submit" class="btn btn-outline-success">Submit</button>
					
				</div>
			</form>
		</div>
	</div>
</div>
