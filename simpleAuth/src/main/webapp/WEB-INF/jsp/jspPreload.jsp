<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<c:set var="contextPath">${pageContext.request.contextPath}</c:set>
<!-- 全系統預載 將所有的需要的前端套件, 一次統一設定起來 -->

    <!-- Jquery Easy UI -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/js/jqueryEasyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/js/jqueryEasyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/js/jqueryEasyui/demo/demo.css">
	
	<script type="text/javascript" src="${contextPath}/resources/js/jqueryEasyui/jquery.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/jqueryEasyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/jqueryFileDownload/jquery.fileDownload.js"></script>
	<script type="text/javascript">
		// <![CDATA[
		// extend the textbox (and it's child combobox), let it can hide & show	
        $.extend($.fn.textbox.methods, {
            show: function(jq){
                return jq.each(function(){
                    $(this).next().show();
                })
            },
            hide: function(jq){
                return jq.each(function(){
                    $(this).next().hide();
                })
            },
            toggle : function(jq) {
                return jq.each(function(){
                    $(this).next().toggle();
                })
            }
        });
                
        // datagrid client side paging filter         
		function pagerFilter(data){
			if (typeof data.length == 'number' && typeof data.splice == 'function'){	// is array
				data = {
					total: data.length,
					rows: data
				}
			}
			var dg = $(this);
			var opts = dg.datagrid('options');
			var pager = dg.datagrid('getPager');
			pager.pagination({
				onSelectPage:function(pageNum, pageSize){
					opts.pageNumber = pageNum;
					opts.pageSize = pageSize;
					pager.pagination('refresh',{
						pageNumber:pageNum,
						pageSize:pageSize
					});
					dg.datagrid('loadData',data);
				}
			});
			if (!data.originalRows){
				data.originalRows = (data.rows);
			}
			var start = (opts.pageNumber-1)*parseInt(opts.pageSize);
			var end = start + parseInt(opts.pageSize);
			data.rows = (data.originalRows.slice(start, end));
			return data;
		};
		
		// EGAT datebox format : YYYY/MM/DD
        function egatFormatter(date){
            var y = date.getFullYear();
            var m = date.getMonth()+1;
            var d = date.getDate();
            return y+'/'+(m<10?('0'+m):m)+'/'+(d<10?('0'+d):d);
        }
        function egatParser(s){
            if (!s) return new Date();
            var ss = (s.split('/'));
            var y = parseInt(ss[0],10);
            var m = parseInt(ss[1],10);
            var d = parseInt(ss[2],10);
            if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
                return new Date(y,m-1,d);
            } else {
                return new Date();
            }
        }
        
      
		// ]]>
	</script>

 