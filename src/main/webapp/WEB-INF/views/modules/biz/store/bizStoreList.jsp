<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>门店管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/biz/store/bizStore/">门店列表</a></li>
		<shiro:hasPermission name="biz:store:bizStore:edit"><li><a href="${ctx}/biz/store/bizStore/form">门店添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="bizStore" action="${ctx}/biz/store/bizStore/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>名店名称：</label>
				<form:input path="storeName" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>手机号码：</label>
				<form:input path="storeMobile" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>门店地址：</label>
				<form:input path="address" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>编号</th>
				<th>门店账户</th>
				<th>名店名称</th>
				<th>手机号码</th>
				<th>门店地址</th>
				<th>创建时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="biz:store:bizStore:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="bizStore">
			<tr>
				<td><a href="${ctx}/biz/store/bizStore/form?id=${bizStore.id}">
					${bizStore.id}
				</a></td>
				<td>
					${bizStore.storeAccount}
				</td>
				<td>
					${bizStore.storeName}
				</td>
				<td>
					${bizStore.storeMobile}
				</td>
				<td>
					${bizStore.address}
				</td>
				<td>
					<fmt:formatDate value="${bizStore.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${bizStore.remarks}
				</td>
				<shiro:hasPermission name="biz:store:bizStore:edit"><td>
    				<a href="${ctx}/biz/store/bizStore/form?id=${bizStore.id}">修改</a>
					<a href="${ctx}/biz/store/bizStore/delete?id=${bizStore.id}" onclick="return confirmx('确认要删除该门店吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>