<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
  <c:if test="${message != null}">
	<div class="alert alert-success alert-dismissible fade show"
		role="alert">
		<strong>${message}</strong>
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<c:remove var="message" scope="session" />
</c:if>
 
 
