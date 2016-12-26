<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<html>
<head>
	<script type="text/javascript" src="jquery.min.js"></script>
	<script type="text/javascript" src="jquery.zclip.js"></script>
	<script type="text/javascript" src="jquery.jqGrid.min.js"></script>
	<script type="text/javascript" src="grid.locale-cn.js"></script>
</head>
<body>
<h2>Hello World!</h2>
<table id="listsg11" class=".table-bordered"></table> 
<div id="pagersg11"></div>

<script type="text/javascript">
	
	$(function(){
		pageInit();
	});
	
	function pageInit(){
		jQuery("#listsg11").jqGrid({
			url : "getData",
			datatype : "json",
			height : "auto",
			styleUI : "Bootstrap",
			colNames : ['姓名', '年龄','地址','连接'],
			colModel : [ 
				{name : "name", width : 50, align : "center"},
             	{name : "age", width : 200, align : "center"}, 
             	{name : "address", width : 50, align : "center"},
             	{name : "", width : 50, align : "center",formatter:copyBtn}
            ],
            caption :"专家新闻列表",
			autowidth:true,
	        pager : '#pagersg11',
			viewrecords : true,
			jsonReader : {
		        page: "page",
		        total: "total",
		        records: "records"
			},gridComplete:function(){
				$("td[title='点击复制连接']").each(function(){
					console.log("$(this):"+$(this))
					$(this).zclip({
						path:'ZeroClipboard.swf',
						copy :function(){
							return $(this).find("button").attr("data");
						}
					});
				});
			},beforeRequest:function(){
				console.log("发送请求前");
			},onCellSelect:function(rowid,iCol,cellcontent,e){
				//console.log(cellcontent);
				//console.log("rowid:"+rowid);
				//console.log("iCol:"+iCol);
			},ondblClickRow:function(rowid,iRow,iCol,e){
				//var row = $("#listsg11").getRowData(rowid);
				//console.log($(row));
				//$(row).addClass("zclip");
			}
		});
		jQuery("#listsg11").jqGrid("navGrid", "#pagersg11", {add : false, edit : false, del : false});		
	}
	
	
	function copyBtn(cellvalue, options, rowObject){
		var address = rowObject.address; 
		return '<button data="'+address+'" onclick="javascript:;" >点击复制连接</button>';
	}
	
</script>
</body>
</html>
