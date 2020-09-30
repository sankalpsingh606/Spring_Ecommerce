
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/static/component/link.jsp" /><!--  
<link rel="stylesheet" href="static/css/style.css"> -->
</head>
<body>
	<jsp:include page="/WEB-INF/static/component/navbar.jsp" />
	<jsp:include page="/WEB-INF/static/component/message.jsp" />
	
	<div class="container-fluid">
		<div class="row mt-3 mx-3">
			<div class="col-md-2">
				<ul class="list-group">
					<a href="categoryWisePorduct?category=all"
						class="list-group-item list-group-item-action active">All
						Category</a>
					<c:forEach items="${categoryList}" var="cat">
						<a href="categoryWisePorduct?category=${cat.categoryId}"
							class="list-group-item list-group-item-action">${cat.categoryTitle}</a>
					</c:forEach>
				</ul>
			</div>

			<div class="col-md-10">
				<div class="row">
					<div class="col-md-12">
						<div class="card-columns">

							<c:forEach items="${productList}" var="p">
								<div class="card p-2 ">
									<div class="container text-center">
										<img src="static/image/product/${p.pPhoto}"
											class="card-img-top"
											style="max-height: 200px; max-width: 100%; width: auto;"
											alt="no image">
									</div>
									<div class="card-body">
										<h5 class="card-title">${p.pTitle}</h5>
										<p class="card-text">${Helper.get10words(p.pDesc)}</p>

										<h4 style="font-size: 15px !important;">
											<span id="discount-lable">&#8377;${p.pPrice}</span>,${p.pDiscount }%
											off
										</h4>

									</div>
									<!-- card footer -->
									<div class="card-footer bt text-center">

										<%--  <button type="submit" class="btn custom-bg text-white"
											onclick="addTocart(${p.pId})">Add
											to Cart</button>  --%>
										 <a class="btn custom-bg text-white" href="cart?id=${p.pId}&action=ordernow">Add to Cart</a> 
										<button type="submit" class="btn btn-outline-success">&#8377;
											${p.getProductDiscount()}/-</button>


									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<c:if test="${productList.size()==0}">

					<h2>No item in this Category</h2>

				</c:if>

			</div>
		</div>


	</div>

</body>
</html>