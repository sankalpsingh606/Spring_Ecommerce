<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/static/component/link.jsp"/>
</head>

<body>
	<jsp:include page="/WEB-INF/static/component/navbar.jsp"/>
	<section>
		<div class="container">
			<div class="row mt-5">
				<div class="col-md-4 offset-md-4">
					<div class="card">
				<jsp:include page="/WEB-INF/static/component/message.jsp"/>
						<div class="card-body">
							<h4 class="card-title text-center my-4">Login here </h4>
							<form action="login" method="post">
								<div class="form-group">
									<label for="email">Email address:</label> <input type="email"
										class="form-control" placeholder="Enter email"
										name="userEmail" autocomplete="off">
								</div>
								<div class="form-group">
									<label for="pwd">Password:</label> <input type="password"
										class="form-control" placeholder="Enter password"
										name="userPassword">
								</div>

								<div class="container text-center">
									<button type="submit" class="btn btn-outline-success">Login</button>
									<button type="submit" class="btn btn-outline-warning">Reset</button>

								</div>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>