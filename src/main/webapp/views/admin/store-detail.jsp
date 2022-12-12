<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<style>
th {
	width: 17rem;
}

table {
	font-size: 1.7rem !important;
}

</style>
<div class="col">
	<div class="row">
		<div class="col-md-12"
			style="display: flex; flex-direction: column; justify-content: center;">
			<div
				style="display: flex; align-items: center; margin-bottom: 4rem; flex-direction: column;">
				<c:set value="${store.cover}" var="coverUrl" />
				<c:choose>
					<c:when test="${fn:substring(coverUrl, 0, 4) == 'http' }">
						<c:url value="${store.cover}" var="storeCoverUrl"></c:url>

					</c:when>
					<c:otherwise>
						<c:url value="/image?fname=${store.cover}&fileFolder=Stores"
							var="storeCoverUrl"></c:url>

					</c:otherwise>
				</c:choose>
				<img width="100%" height="100%" "
					src="${storeCoverUrl}"">
			</div>
			<div
				style="display: flex; align-items: center; margin-bottom: 4rem; flex-direction: column;">
				<c:set value="${store.avatar}" var="avatarUrl" />
				<c:choose>
					<c:when test="${fn:substring(avatarUrl, 0, 4) == 'http' }">
						<c:url value="${store.avatar}" var="storeAvatarUrl"></c:url>

					</c:when>
					<c:otherwise>
						<c:url value="/image?fname=${store.avatar}&fileFolder=Stores"
							var="storeAvatarUrl"></c:url>

					</c:otherwise>
				</c:choose>
				<img width="200px" height="200px"
					style="border-radius: 50%; border: 2px solid coral;"
					src="${storeAvatarUrl}">
				<div style="font-weight: bold; margin-top: 1rem; font-size: 1.7rem">Store
					ID: ${store.storeId }</div>
			</div>

			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th style="text-align: left !important;">Store ID</th>
						<th style="text-align: left !important;">Cover</th>
						<th style="text-align: left !important;">Bio</th>
						<th style="text-align: left !important;">Name</th>
						<th style="text-align: left !important;">Slug</th>
						<th style="text-align: left !important;">Owner ID</th>
						<th style="text-align: left !important;">E-Wallet</th>
						<th style="text-align: left !important;">Store Level</th>
						<th style="text-align: left !important;">Point</th>
						<th style="text-align: left !important;">Commission ID</th>
						<th style="text-align: left !important;">Rating</th>
						<th style="text-align: left !important;">Created At</th>
						<th style="text-align: left !important;">Updated At</th>
						<th style="text-align: left !important;">Active Status</th>
						<th style="text-align: left !important;">Open Status</th>

					</tr>
				</thead>
				<tbody>
					<tr class="odd gradeX">
						<td>${store.storeId }</td>

						<td><c:set value="${store.cover}" var="coverUrl" /> <c:choose>
								<c:when test="${fn:substring(coverUrl, 0, 4) == 'http' }">
									<c:url value="${store.cover}" var="storeCoverUrl"></c:url>

								</c:when>
								<c:otherwise>
									<c:url value="/image?fname=${store.cover}&fileFolder=Stores"
										var="storeCoverUrl"></c:url>

								</c:otherwise>
							</c:choose> <img src="${storeCoverUrl}" width="100px" alt="${store.slug}"></td>
						<td>${store.bio}</td>
						<td>${store.name}</td>
						<td>${store.slug}</td>
						<td>${store.user.userId}</td>
						<td>${store.e_wallet}</td>
						<td>${store.storeLevel.storeLevelId}</td>
						<td>${store.point}</td>
						<td>${store.commission.commissionId}</td>
						<td>${store.rating}</td>
						<td>${store.createdAt}</td>
						<td>${store.updatedAt}</td>
						<td><c:if test="${store.isActive == false}">
								<span>Banned</span>
							</c:if> <c:if test="${store.isActive == true}">
								<span>Licensed</span>
							</c:if></td>
						<td><c:if test="${store.isOpen == true}">
								<span>Open</span>
							</c:if> <c:if test="${store.isOpen == false}">
								<span>Closed</span>
							</c:if></td>
					</tr>

				</tbody>
			</table>


		</div>
	</div>
</div>
<script type="text/javascript">
	$("table").each(function() {
		var $this = $(this);
		var newrows = [];
		$this.find("tr").each(function() {
			var i = 0;
			var e = true;
			$(this).find("td").each(function() {
				e = false;
				i++;
				if (newrows[i] === undefined) {
					newrows[i] = $("<tr></tr>");
				}
				newrows[i].append($(this));
			});
			if (e) {
				$(this).find("th").each(function() {
					i++;
					if (newrows[i] === undefined) {
						newrows[i] = $("<tr></tr>");
					}
					newrows[i].append($(this));
				});
			}
		});
		$this.find("tr").remove();
		$.each(newrows, function() {
			$this.append(this);
		});
	});
</script>