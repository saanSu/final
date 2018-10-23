<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div
	class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
	<h1 class="h2">GROUPWARE</h1>
	<div class="btn-toolbar mb-2 mb-md-0">
		<div class="btn-group mr-2">
			<button class="btn btn-sm btn-outline-secondary">${sessionScope.user.NAME }</button>
			<button class="btn btn-sm btn-outline-secondary">${sessionScope.user.DNAME }
				${sessionScope.user.PNAME }</button>
		</div>
		<button class="btn btn-sm btn-outline-secondary dropdown-toggle">
			<span data-feather="calendar"></span> ${sessionScope.userId }
		</button>
	</div>
</div>

<h4>Change Password</h4>
<form action="${pageContext.servletContext.contextPath }/private/modify.do" method="post" >
	<div class="form-group row">
		<label for="opass" class="col-sm-2 col-form-label">Old Password</label>
		<div class="col-sm-8">
			<input type="password"  class="form-control" name="opass"
				id="opass" />
		</div>
	</div>
	<div class="form-group row">
		<label for="npass" class="col-sm-2 col-form-label">New Password</label>
		<div class="col-sm-8">
			<input type="password"  class="form-control" name="npass"
				id="npass" />
		</div>
	</div>
	<div class="form-group row">
		<label for="npassC" class="col-sm-2 col-form-label">Password Confirm</label>
		<div class="col-sm-8">
			<input type="password"  class="form-control" name="npassC"
				id="npassC" />
		</div>
	</div>
	<button type="submit" class="btn btn-primary">Submit</button>
</form>