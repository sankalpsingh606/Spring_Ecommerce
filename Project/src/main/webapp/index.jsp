<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:redirect url="hello"></c:redirect>
<!-- 
<form action="addProduct" method="post" enctype="multipart/form-data">
<input type="file" name="image" >
<input type="submit" name="image" value="submit" >
</form> -->
	<%-- <div class="modal fade" id="product">
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
 --%>