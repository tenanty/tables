<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<script type="text/javascript"
	src="${ctx}/static/datatables/js/jquery.js"></script>
<script type="text/javascript"
	src="${ctx}/static/datatables/js/jquery.dataTables.js"></script>
<script type="text/javascript">
	var table = null;
	jQuery(document).ready(function() {
		 table = $('#example').DataTable({
			 	sAjaxSource : "${ctx}/data/1.json",
			 	bDeferRender:true,
			 	stateSave:true,
				aoColumns : [ {
					"title" : "客户名",
					"data" : "name",
					"visible": true
				}, {
					"title" : "公司",
					"data" : "position"
				}, {
					"title" : "职务",
					"data" : "start_date"
				}, {
					"title" : "地址",
					"data" : "salary"
				},{
					"title":"操作",
					"data": null,
					"mRender":function(data, type, full){
						var render = "<button  onclick=a('/admin/Article/edit?Id=" + data.salary + "') class='update'>修改</button>";
						render+= "<button  onclick=d('/admin/Article/edit?Id=" + data.salary + "') class='delete'>删除</button>";
						return render;
					},
					"width":"10%",
					"sortable":false
				}]		 
		 }
		 );
		 /* $('#example tbody').on( 'click', '.update', function () {
			 	console.log("update......");
			 	console.log($(this).parents('tr'));
			 	console.log(table.row( $(this).parents('tr') ));
			 	console.log(table.row( $(this).parents('tr') ).data());
			 	console.log(table.row( $(this).parents('tr') ).data().name);
		        var data = table.row( $(this).parents('tr') ).data();
		        alert( data.name +"'s salary is: "+ data.salary );
		    } ); */
		 
		 /* $('#example tbody').on( 'click', '.delete', function () {
			 	console.log("delete......");
			 	console.log($(this).parents('tr'));
			 	console.log(table.row( $(this).parents('tr') ));
			 	console.log(table.row( $(this).parents('tr') ).data());
			 	console.log(table.row( $(this).parents('tr') ).data().name);
			 	table.row( $(this).parents('tr') ).data().name = "xxxxxx";
			 	
			 	table.row( $(this).parents('tr') ).draw(false);
			 	
			 	if(confirm("是否删除该条记录？")){
			 		console.log("选择删除......");
			 	}else{
			 		console.log("未选择删除......");
			 	}
		        var data = table.row( $(this).parents('tr') ).data();
		        alert( data.name +"'s salary is: "+ data.salary );
		    } ); */
	});
		 function a(param){
			 console.log("update......");
			 console.log(param);
		 }
		 function d(param){
			 console.log("delete......");
			 console.log(param);
		 }
</script>
<link href="${ctx}/static/datatables/css/jquery.dataTables.css"
	type="text/css" rel="stylesheet" />
</head>
<body>

	<p>
		<a href="javascript:void(0)" id="delete">Delete selected row</a>
	</p>
	<table id="example" class="display" cellspacing="0" width="100%">
	</table>
</body>
</html>
