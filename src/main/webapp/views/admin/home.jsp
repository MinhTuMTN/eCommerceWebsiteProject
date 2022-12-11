<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>


<div class="row">
	<div class="container">
		<%-- <div class="row mt-2 md-2">
			<div class="col-md-6 float-right">
				<a class="button-81" role="button"
					href="<c:url value="/admin/add-commission"/>">Add New Commission</a>
			</div>
		</div> --%>
		<h3>Total: ${totalUsers} users</h3>
		<a
			href="<c:url value="/admin/statistics"/>"
			class="button-81" role="button"> <i class="fa fa-line-chart"></i>Show statistics</a>
	</div>
</div>