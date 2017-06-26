<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<!-- 
    程式範本說明
    1.範本名稱:Report Criteria page
    2.說　　明:提供user於畫面上做資料篩選，點選按鈕即時產生報表
    3.效能基準:
    4.適用資料量: 建議要列舉適當查詢條件減少一次抓取全部資料回來 
    5.環境基準:  
  @author 291020(Vivian Tseng)  
  History:
     2017/04/24 first release
 -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login here</title>
<%@ include file="../jspPreload.jsp"%>
</head>
<body>

	<form id="ff" method="POST">
	    
	    
	    
	
		<div id="northPannel" style="height: 190px;">
		
		<div class="easyui-panel" title="${fn:escapeXml(pgmInfo.grpName)}&#92;${fn:escapeXml(pgmInfo.subGrp1)}&#92;${fn:escapeXml(pgmInfo.subGrp2)}"
	         style="width: 100%; max-width: 100%; padding: 30px 60px;">
				
			<table>
	           <tr>
	          	  <td>Report Name</td>
	              <td>${fn:escapeXml(pgmInfo.pgmName)}</td>
	           </tr>   
	           <tr>
	           <td>Report Description</td>
	           <td>${fn:escapeXml(pgmInfo.pgmDesc)}</td>   
	           </tr>
	          
	        </table>
		</div>
		
			<div class="easyui-panel" title="Search Filter"
				style="width: 100%; max-width: 100%; padding: 30px 60px;">
				<table>
					<tr>
						<td>start date:</td>
						<td><input class="easyui-datebox" id="s_date" name="s_date"
							style="width: 100%;"
							data-options="formatter:egatFormatter,parser:egatParser, required:true">
						</td>
					</tr>
					<tr>
						<td>end date:</td>
						<td><input class="easyui-datebox" id="e_date" name="e_date"
							style="width: 100%;"
							data-options="formatter:egatFormatter,parser:egatParser, required:true">
						</td>
					</tr>

					<tr>
						<td>Release Station:</td>
						<td><input class="easyui-textbox" id="station" name="station"
							style="width: 100%;" data-options="required:true"></td>
					</tr>

					<tr>
						<td>Output Type:</td>
						<td><select id="outputType" name="outputType"
							class="easyui-combobox"
							data-options="panelHeight:60,required:true" style="width: 100px;">

								<option value="PDF">PDF</option>
								<option value="EXCEL">EXCEL</option>
						</select></td>
					</tr>

					<tr>
						<td>Data:</td>
						<td><select id="dataType" name="dataType"
							class="easyui-combobox"
							data-options="panelHeight:60,required:true" style="width: 100px;">

								<option value="crosstab">Cross Tab</option>
								<option value="row">Row Data</option>
						</select></td>
					</tr>

				</table>
			</div>
			<div style="text-align: left; padding: 5px 0">
				<a id="printBtn" name="printBtn" href="javascript:void(0)"
					class="easyui-linkbutton" onclick="" style="width: 80px">Print</a>
				<a id="resetBtn" name="resetBtn" href="javascript:void(0)"
					class="easyui-linkbutton" onclick="" style="width: 80px">Reset</a>
			</div>
		
		
		<div id="sourthPannel" data-options="region:'south',split:true"  style="height: 190px;">

 		Additional information: 
 		<table>
                <tr>
                <td>Owner User</td>
                <td>
                    <a href="${fn:escapeXml(pgmInfo.userURL)}" class="easyui-linkbutton" data-options="iconCls:'icon-help'">${fn:escapeXml(pgmInfo.userName)}</a>
                </td>
                
                
                
                </tr>
                <tr>
                <td>It</td>
                <td>
                    <a href="${fn:escapeXml(pgmInfo.itURL)}" class="easyui-linkbutton" data-options="iconCls:'icon-help'">${fn:escapeXml(pgmInfo.itName)}</a>
                </td>
                </tr>
        </table>      
 		
 		</div>
			
		</div>

        
        

	</form>
	<script type="text/javascript">
		// <![CDATA[
		var httpDispatcher = '${contextPath}';
		var appForm = $('#ff');
		var errorMsg = '${errorMsg}';
		var msg = '${msg}';

		var jsApp = function() {
			// bundle page event
			var bundlePageEvent = function() {
				//Search Button
				$('#printBtn').on(
						'click',
						function(event) {
							if($('#dataType').val() == 'crosstab') {							
								appForm.attr('action', httpDispatcher
										+ '/report/activityReportforLine/crossTab'); // findBy 						
							} else {
								appForm.attr('action', httpDispatcher
										+ '/report/activityReportforLine/findBy'); // findBy
							}
							appForm.submit();  
							
							
						});
				//Reset Button
				$('#resetBtn').on('click', function(event) {
					$('#s_date').text(''); // select the "ALL" with empty value
					$('#e_date').text('');
				});

			};
			return {
				init : function() {
					// 表單事件初始化					
					bundlePageEvent();

					// if post back with msg , show it
					jsApp.showMsg();
				},
				showMsg : function() {
					if (errorMsg != '') {
						$.messager.alert('Error', errorMsg, 'error');
					}
					if (msg != '') {
						$.messager.alert('Info', msg, 'info');
					}
				}
			};
		}();

		$(document).ready(jsApp.init);
		// ]]>
	</script>
</body>
</html>