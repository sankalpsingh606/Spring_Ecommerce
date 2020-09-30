<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%-- <c:choose>
	<c:when test="${sessionScope.current_user == null}">
		<c:set var="message" scope="session"
			value="You are not logged in !! Login first" />
		<c:redirect url="loginPage" />
	</c:when>
	<c:otherwise>
		<c:if test="${sessionScope.current_user.getUserType()=='normal'}">
			<c:set var="message" scope="session"
				value="You are not admin ! Do not access this Page!" />
			<c:redirect url="loginPage" />
		</c:if>
	</c:otherwise>
</c:choose>
 --%>
 

<!DOCTYPE html>
<html>

<head>
<title>Page Title</title>
<jsp:include page="/WEB-INF/static/component/link.jsp"/>
</head>

<body>
<jsp:include page="/WEB-INF/static/component/navbar.jsp"/>
	<h1>This is admin Panel</h1>
	<!-- container start -->
	<div class="container  admin">
		<div class="contanier-fluid mt-3">
			<jsp:include page="/WEB-INF/static/component/message.jsp"/>
		</div>
		<!-- first row  start-->
		<div class="row mt-3">

			<!-- first card -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="cantainer">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="static/image/team.png" alt="Card image">
						</div>
						<h1>${userList.size()}</h1>
						<h1 class="text-uppercase text-muted">user</h1>
					</div>
				</div>
			</div>
			<!-- first card end -->

			<!-- second card -->
			<div class="col-lg-4 col-md-4 col-12">
				<div class="card ">

					<div class="card-body text-center">
						<div class="cantainer">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="static/image/backend.png" alt="Card image">
						</div>
						<h1>${categoryList.size()}</h1>
						<h1 class="text-uppercase text-muted">category</h1>
					</div>
				</div>
			</div>
			<!-- second card end -->

			<!-- third card -->
			<div class="col-lg-4 col-md-4 col-12">
				<div class="card ">

					<div class="card-body text-center">
						<div class="cantainer">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="static/image/buy.png" alt="Card image">
						</div>
						<h1>${productList.size()}</h1>
						<h1 class="text-uppercase text-muted">Product</h1>
					</div>
				</div>
			</div>
			<!-- third card end -->


			<!-- first row  end-->
		</div>

		<!-- row start -->
		<div class="row mt-3">

			<!-- first card -->
			<div class="col-lg-6 col-md-6 col-12">
				<div class="card" data-toggle="modal" data-target="#myModal">

					<div class="card-body text-center">
						<div class="cantainer">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="static/image/add.png" alt="Card image">
						</div>
						<h1>476</h1>
						<h1 class="text-uppercase text-muted">Add Category</h1>
					</div>
				</div>
			</div>
			<!-- first card end -->

			<!-- second card -->
			<div class="col-lg-6 col-md-6 col-12">
				<div class="card" data-toggle="modal" data-target="#product">

					<div class="card-body text-center">
						<div class="cantainer">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="static/image/buy.png" alt="Card image">
						</div>
						<h1>476</h1>
						<h1 class="text-uppercase text-muted">Add Product</h1>
					</div>
				</div>
			</div>
			<!-- second card end-->

			<!-- row end -->
		</div>


		<!-- container end -->
	</div>









	<!-- The category Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog  modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header custom-bg text-white">
					<h4 class="modal-title">Fill Category Details</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="addCategory" method="post">
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="Enter category title" name="categoryTitle"
								autocomplete="off">
						</div>
						<div class="form-group">

							<textarea style="height: 150px" class="form-control"
								name="categoryDescription"
								placeholder="Enter Category description"></textarea>
						</div>
						<!-- Modal footer -->
						<div class="modal-footer">

							<button type="submit" class="btn btn-primary">Submit</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>

					</form>
				</div>

			</div>
		</div>
	</div>
	<!-- The category Modal end -->


	<!-- The Product Modal -->
	<div class="modal fade" id="product">
		<div class="modal-dialog  modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header custom-bg text-white">
					<h4 class="modal-title">Fill Prosuct Details</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="addProduct" method="post" enctype="multipart/form-data">
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="Enter product title" name="pTitle">
						</div>
						<div class="form-group">

							<textarea style="height: 150px" class="form-control" name="pDesc"
								placeholder="Enter product description"></textarea>
						</div>
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="Enter product price" name="pPrice">
						</div>
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="Enter product discount" name="pDiscount">
						</div>
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="Enter product quanity" name="pQuanity">
						</div>


						<div class="form-group">
							<select name="catId" id="" class="form-control">
								<c:forEach items="${categoryList}" var="cat">
									<option value="${cat.categoryId}">${cat.categoryTitle}</option>
								</c:forEach>
							</select>
						</div>

						<div class="form-group">
							<input type="file" class="form-control"
								placeholder="Enter category title" name="pPhoto"
								required="required">
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">

							<button type="submit" class="btn btn-primary">Add product</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>

					</form>
				</div>

			</div>
		</div>
	</div>
<!-- <div id="toast"> This is our custom Toast text </div> -->
</body>

</html>