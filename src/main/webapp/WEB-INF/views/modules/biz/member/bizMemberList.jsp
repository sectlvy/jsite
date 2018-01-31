<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>会员管理</title>
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
		<li class="active"><a href="${ctx}/biz/member/bizMember/">会员列表</a></li>
		<shiro:hasPermission name="biz:member:bizMember:edit"><li><a href="${ctx}/biz/member/bizMember/form">会员添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="bizMember" action="${ctx}/biz/member/bizMember/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>昵称：</label>
				<form:input path="nickName" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>账户：</label>
				<form:input path="accountNo" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>创建时间：</label>
				<input name="beginCreateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${bizMember.beginCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endCreateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${bizMember.endCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
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
				<th>昵称</th>
				<th>账户</th>
				<th>余额 单位分</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="biz:member:bizMember:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="bizMember">
			<tr>
				<td><a href="${ctx}/biz/member/bizMember/form?id=${bizMember.id}">
					${bizMember.id}
				</a></td>
				<td>
					${bizMember.nickName}
				</td>
				<td>
					${bizMember.accountNo}
				</td>
				<td>
					${bizMember.amount}
				</td>
				<td>
					<fmt:formatDate value="${bizMember.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${bizMember.remarks}
				</td>
				<shiro:hasPermission name="biz:member:bizMember:edit"><td>
    				<a href="${ctx}/biz/member/bizMember/form?id=${bizMember.id}">修改</a>
					<a href="${ctx}/biz/member/bizMember/delete?id=${bizMember.id}" onclick="return confirmx('确认要删除该会员吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>