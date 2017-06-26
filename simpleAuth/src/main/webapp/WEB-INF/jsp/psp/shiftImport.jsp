<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 
    程式說明
    1.範本名稱:單檔操作 (Server Side Paging) V2017.03.07
         
  @author jeff, juain farn, liu 劉君帆 (jeffliu@gisbim.com)  
  History:
     2017/03/0? first release
 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login here</title>
    <%@ include file="../jspPreload.jsp"%>
</head>
<body>
        <div  id="northPannel"  style="height:190px;">
            <div class="easyui-panel" title="Search Filter" style="width:100%;max-width:100%;padding:30px 60px;">
                    <table>
                        <tr><td>Department:</td>
                            <td><select id="criteria_departmentCode" name="criteria_departmentCode"   class="easyui-combobox" 
                                                          data-options="panelHeight:180,separator:'|'"
                                                          style="width:300px;">
                                                <c:forEach var="entity" items="${requestScope.departments}">
                                                <option value="${entity.department}">${entity.department}-${entity.description}</option>                                                
                                                </c:forEach>
                                                <option value="" SELECTED>ALL</option>
                                </select>
                            </td>                            
                            <td> &nbsp; &nbsp;</td>
                            <td>Employee No:</td>
                            <td><input class="easyui-textbox" id="criteria_employeeNo" name="criteria_employeeNo" style="width:120px" >                           
                            </td>                            
                            <td> &nbsp; &nbsp;</td>
                            <td>Year Month:</td>
                            <td><input class="easyui-textbox" id="criteria_yearMonth" name="criteria_yearMonth" style="width:120px" >
                            </td>                            
                        </tr>   
                    
                    </table>       
            </div>
            <div style="text-align:left;padding:5px 0">
                <a id="searchBtn"  href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:80px">Search</a>
                <a id="resetBtn"  href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:80px">Reset</a>
            </div>
        </div>
        
        <form id="ff" method="POST"  enctype="multipart/form-data">
        <div  id="centerPannel"  style="height:400px;">
            <div style="text-align:left;padding:5px 0">
                <table>
                    <tr><td>Import Month:</td>
                        <td><select id="importYearMonth" name="importYearMonth"   class="easyui-combobox" 
                                                          data-options="panelHeight:80,separator:'|'"
                                                          style="width:70px;">
                                                <c:forEach var="yearMonth" items="${requestScope.yearMonths}">
                                                <option value="${yearMonth}">${yearMonth}</option>                                                
                                                </c:forEach>                                                
                            </select>
                        </td>                    
                        <td>
                            <a id="file" name="file" href="javascript:void(0)" class="easyui-filebox" onclick="" style="width:380px"></a>        
                        </td>
                        <td>
                            <a id="uploadBtn" name="importBtn" href="javascript:void(0)" class="easyui-linkbutton" style="width:80px">Upload</a>
                        </td>
                        <td>
                            <a id="importBtn" name="importBtn" href="javascript:void(0)" class="easyui-linkbutton" style="width:80px">Import</a>
                        </td>
                    </tr>                
                </table>                
            </div> 
            <div style="text-align:left;padding:5px 0"> 
            <table id="dg" title="Search Result" style="width:100%;height:355px" data-options="
                        rownumbers:true,
                        singleSelect:true,
                        autoRowHeight:false">
                        
            </table>
            </div>                        
        </div>

        
        <input id="employeeNo"    name="employeeNo"     type="hidden">
        <input id="yearMonth"     name="yearMonth"      type="hidden">

        <input id="01_id"     name="01_id"      type="hidden">
        <input id="02_id"     name="02_id"      type="hidden">
        <input id="03_id"     name="03_id"      type="hidden">
        <input id="04_id"     name="04_id"      type="hidden">
        <input id="05_id"     name="05_id"      type="hidden">
        <input id="06_id"     name="06_id"      type="hidden">
        <input id="07_id"     name="07_id"      type="hidden">
        <input id="08_id"     name="08_id"      type="hidden">
        <input id="09_id"     name="09_id"      type="hidden">
        <input id="10_id"     name="10_id"      type="hidden">
        <input id="11_id"     name="11_id"      type="hidden">
        <input id="12_id"     name="12_id"      type="hidden">
        <input id="13_id"     name="13_id"      type="hidden">
        <input id="14_id"     name="14_id"      type="hidden">
        <input id="15_id"     name="15_id"      type="hidden">
        <input id="16_id"     name="16_id"      type="hidden">
        <input id="17_id"     name="17_id"      type="hidden">
        <input id="18_id"     name="18_id"      type="hidden">
        <input id="19_id"     name="19_id"      type="hidden">
        <input id="20_id"     name="20_id"      type="hidden">
        <input id="21_id"     name="21_id"      type="hidden">
        <input id="22_id"     name="22_id"      type="hidden">
        <input id="23_id"     name="23_id"      type="hidden">
        <input id="24_id"     name="24_id"      type="hidden">
        <input id="25_id"     name="25_id"      type="hidden">
        <input id="26_id"     name="26_id"      type="hidden">
        <input id="27_id"     name="27_id"      type="hidden">
        <input id="28_id"     name="28_id"      type="hidden">
        <input id="29_id"     name="29_id"      type="hidden">
        <input id="30_id"     name="30_id"      type="hidden">
        <input id="31_id"     name="31_id"      type="hidden">
        
        <input id="01_operateAtTime"     name="01_operateAtTime"      type="hidden">
        <input id="02_operateAtTime"     name="02_operateAtTime"      type="hidden">
        <input id="03_operateAtTime"     name="03_operateAtTime"      type="hidden">
        <input id="04_operateAtTime"     name="04_operateAtTime"      type="hidden">
        <input id="05_operateAtTime"     name="05_operateAtTime"      type="hidden">
        <input id="06_operateAtTime"     name="06_operateAtTime"      type="hidden">
        <input id="07_operateAtTime"     name="07_operateAtTime"      type="hidden">
        <input id="08_operateAtTime"     name="08_operateAtTime"      type="hidden">
        <input id="09_operateAtTime"     name="09_operateAtTime"      type="hidden">
        <input id="10_operateAtTime"     name="10_operateAtTime"      type="hidden">
        <input id="11_operateAtTime"     name="11_operateAtTime"      type="hidden">
        <input id="12_operateAtTime"     name="12_operateAtTime"      type="hidden">
        <input id="13_operateAtTime"     name="13_operateAtTime"      type="hidden">
        <input id="14_operateAtTime"     name="14_operateAtTime"      type="hidden">
        <input id="15_operateAtTime"     name="15_operateAtTime"      type="hidden">
        <input id="16_operateAtTime"     name="16_operateAtTime"      type="hidden">
        <input id="17_operateAtTime"     name="17_operateAtTime"      type="hidden">
        <input id="18_operateAtTime"     name="18_operateAtTime"      type="hidden">
        <input id="19_operateAtTime"     name="19_operateAtTime"      type="hidden">
        <input id="20_operateAtTime"     name="20_operateAtTime"      type="hidden">
        <input id="21_operateAtTime"     name="21_operateAtTime"      type="hidden">
        <input id="22_operateAtTime"     name="22_operateAtTime"      type="hidden">
        <input id="23_operateAtTime"     name="23_operateAtTime"      type="hidden">
        <input id="24_operateAtTime"     name="24_operateAtTime"      type="hidden">
        <input id="25_operateAtTime"     name="25_operateAtTime"      type="hidden">
        <input id="26_operateAtTime"     name="26_operateAtTime"      type="hidden">
        <input id="27_operateAtTime"     name="27_operateAtTime"      type="hidden">
        <input id="28_operateAtTime"     name="28_operateAtTime"      type="hidden">
        <input id="29_operateAtTime"     name="29_operateAtTime"      type="hidden">
        <input id="30_operateAtTime"     name="30_operateAtTime"      type="hidden">
        <input id="31_operateAtTime"     name="31_operateAtTime"      type="hidden">  
        
        <div id="southPannel"  style="height:200px;"> 
            <div class="easyui-panel" title="Data Input" style="width:100%;max-width:100%;padding:30px 60px;">
                    <div style="margin-bottom:20px">
                        <table style="width:99%">
                        <tr>
                            <td style="font-weight:bold;">Date</td><td>Shift</td><td>Rev.</td><td>AirCraft</td><td>Note</td><td>Section</td><td>Team</td><td>&nbsp;&nbsp;&nbsp;</td>
                            <td style="font-weight:bold;">Date</td><td>Shift</td><td>Rev.</td><td>AirCraft</td><td>Note</td><td>Section</td><td>Team</td><td>&nbsp;&nbsp;&nbsp;</td>
                            <td style="font-weight:bold;">Date</td><td>Shift</td><td>Rev.</td><td>AirCraft</td><td>Note</td><td>Section</td><td>Team</td><td>&nbsp;&nbsp;&nbsp;</td>
                        </tr>                         <tr>
                            <td>01</td>                            
                            <td><input class="easyui-textbox" id="01_shiftCode"       name="01_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="01_reviseShiftCode" name="01_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="01_acRegistr"       name="01_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="01_wildNote"        name="01_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="01_sectionCode"     name="01_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="01_teamCode"        name="01_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                            <td>11</td>                          
                            <td><input class="easyui-textbox" id="11_shiftCode"       name="11_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="11_reviseShiftCode" name="11_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="11_acRegistr"       name="11_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="11_wildNote"        name="11_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="11_sectionCode"     name="11_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="11_teamCode"        name="11_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                            <td>21</td>
                            <td><input class="easyui-textbox" id="21_shiftCode"       name="21_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="21_reviseShiftCode" name="21_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="21_acRegistr"       name="21_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="21_wildNote"        name="21_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="21_sectionCode"     name="21_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="21_teamCode"        name="21_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>02</td>
                            <td><input class="easyui-textbox" id="02_shiftCode"       name="02_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="02_reviseShiftCode" name="02_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="02_acRegistr"       name="02_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="02_wildNote"        name="02_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="02_sectionCode"     name="02_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="02_teamCode"        name="02_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                            <td>12</td>
                            <td><input class="easyui-textbox" id="12_shiftCode"       name="12_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="12_reviseShiftCode" name="12_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="12_acRegistr"       name="12_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="12_wildNote"        name="12_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="12_sectionCode"     name="12_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="12_teamCode"        name="12_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                            <td>22</td>
                            <td><input class="easyui-textbox" id="22_shiftCode"       name="22_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="22_reviseShiftCode" name="22_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="22_acRegistr"       name="22_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="22_wildNote"        name="22_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="22_sectionCode"     name="22_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="22_teamCode"        name="22_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>03</td>
                            <td><input class="easyui-textbox" id="03_shiftCode"       name="03_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="03_reviseShiftCode" name="03_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="03_acRegistr"       name="03_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="03_wildNote"        name="03_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="03_sectionCode"     name="03_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="03_teamCode"        name="03_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                            <td>13</td>
                            <td><input class="easyui-textbox" id="13_shiftCode"       name="13_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="13_reviseShiftCode" name="13_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="13_acRegistr"       name="13_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="13_wildNote"        name="13_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="13_sectionCode"     name="13_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="13_teamCode"        name="13_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                            <td>23</td>
                            <td><input class="easyui-textbox" id="23_shiftCode"       name="23_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="23_reviseShiftCode" name="23_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="23_acRegistr"       name="23_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="23_wildNote"        name="23_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="23_sectionCode"     name="23_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="23_teamCode"        name="23_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>04</td>
                            <td><input class="easyui-textbox" id="04_shiftCode"       name="04_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="04_reviseShiftCode" name="04_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="04_acRegistr"       name="04_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="04_wildNote"        name="04_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="04_sectionCode"     name="04_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="04_teamCode"        name="04_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                            <td>14</td>
                            <td><input class="easyui-textbox" id="14_shiftCode"       name="14_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="14_reviseShiftCode" name="14_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="14_acRegistr"       name="14_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="14_wildNote"        name="14_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="14_sectionCode"     name="14_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="14_teamCode"        name="14_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                            <td>24</td>
                            <td><input class="easyui-textbox" id="24_shiftCode"       name="24_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="24_reviseShiftCode" name="24_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="24_acRegistr"       name="24_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="24_wildNote"        name="24_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="24_sectionCode"     name="24_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="24_teamCode"        name="24_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>05</td>
                            <td><input class="easyui-textbox" id="05_shiftCode"       name="05_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="05_reviseShiftCode" name="05_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="05_acRegistr"       name="05_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="05_wildNote"        name="05_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="05_sectionCode"     name="05_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="05_teamCode"        name="05_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                            <td>15</td>
                            <td><input class="easyui-textbox" id="15_shiftCode"       name="15_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="15_reviseShiftCode" name="15_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="15_acRegistr"       name="15_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="15_wildNote"        name="15_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="15_sectionCode"     name="15_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="15_teamCode"        name="15_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                            <td>25</td>
                            <td><input class="easyui-textbox" id="25_shiftCode"       name="25_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="25_reviseShiftCode" name="25_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="25_acRegistr"       name="25_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="25_wildNote"        name="25_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="25_sectionCode"     name="25_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="25_teamCode"        name="25_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>06</td>
                            <td><input class="easyui-textbox" id="06_shiftCode"       name="06_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="06_reviseShiftCode" name="06_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="06_acRegistr"       name="06_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="06_wildNote"        name="06_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="06_sectionCode"     name="06_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="06_teamCode"        name="06_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                            <td>16</td>
                            <td><input class="easyui-textbox" id="16_shiftCode"       name="16_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="16_reviseShiftCode" name="16_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="16_acRegistr"       name="16_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="16_wildNote"        name="16_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="16_sectionCode"     name="16_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="16_teamCode"        name="16_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                            <td>26</td>
                            <td><input class="easyui-textbox" id="26_shiftCode"       name="26_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="26_reviseShiftCode" name="26_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="26_acRegistr"       name="26_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="26_wildNote"        name="26_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="26_sectionCode"     name="26_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="26_teamCode"        name="26_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                        </tr>
						<tr>
                            <td>07</td>
                            <td><input class="easyui-textbox" id="07_shiftCode"       name="07_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="07_reviseShiftCode" name="07_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="07_acRegistr"       name="07_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="07_wildNote"        name="07_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="07_sectionCode"     name="07_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="07_teamCode"        name="07_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                            <td>17</td>
                            <td><input class="easyui-textbox" id="17_shiftCode"       name="17_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="17_reviseShiftCode" name="17_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="17_acRegistr"       name="17_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="17_wildNote"        name="17_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="17_sectionCode"     name="17_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="17_teamCode"        name="17_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                            <td>27</td>
                            <td><input class="easyui-textbox" id="27_shiftCode"       name="27_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="27_reviseShiftCode" name="27_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="27_acRegistr"       name="27_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="27_wildNote"        name="27_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="27_sectionCode"     name="27_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="27_teamCode"        name="27_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>08</td>
                            <td><input class="easyui-textbox" id="08_shiftCode"       name="08_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="08_reviseShiftCode" name="08_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="08_acRegistr"       name="08_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="08_wildNote"        name="08_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="08_sectionCode"     name="08_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="08_teamCode"        name="08_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                            <td>18</td>
                            <td><input class="easyui-textbox" id="18_shiftCode"       name="18_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="18_reviseShiftCode" name="18_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="18_acRegistr"       name="18_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="18_wildNote"        name="18_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="18_sectionCode"     name="18_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="18_teamCode"        name="18_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                            <td>28</td>
                            <td><input class="easyui-textbox" id="28_shiftCode"       name="28_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="28_reviseShiftCode" name="28_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="28_acRegistr"       name="28_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="28_wildNote"        name="28_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="28_sectionCode"     name="28_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="28_teamCode"        name="28_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>09</td>
                            <td><input class="easyui-textbox" id="09_shiftCode"       name="09_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="09_reviseShiftCode" name="09_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="09_acRegistr"       name="09_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="09_wildNote"        name="09_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="09_sectionCode"     name="09_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="09_teamCode"        name="09_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                            <td>19</td>
                            <td><input class="easyui-textbox" id="19_shiftCode"       name="19_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="19_reviseShiftCode" name="19_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="19_acRegistr"       name="19_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="19_wildNote"        name="19_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="19_sectionCode"     name="19_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="19_teamCode"        name="19_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                            <td><p id='29_shiftDate'>29</p></td>
                            <td><input class="easyui-textbox" id="29_shiftCode"       name="29_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="29_reviseShiftCode" name="29_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="29_acRegistr"       name="29_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="29_wildNote"        name="29_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="29_sectionCode"     name="29_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="29_teamCode"        name="29_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>10</td>
                            <td><input class="easyui-textbox" id="10_shiftCode"       name="10_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="10_reviseShiftCode" name="10_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="10_acRegistr"       name="10_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="10_wildNote"        name="10_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="10_sectionCode"     name="10_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="10_teamCode"        name="10_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                            <td>20</td>
                            <td><input class="easyui-textbox" id="20_shiftCode"       name="20_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="20_reviseShiftCode" name="20_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="20_acRegistr"       name="20_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="20_wildNote"        name="20_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="20_sectionCode"     name="20_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="20_teamCode"        name="20_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                            <td><p id='30_shiftDate'>30</p></td>
                            <td><input class="easyui-textbox" id="30_shiftCode"       name="30_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="30_reviseShiftCode" name="30_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="30_acRegistr"       name="30_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="30_wildNote"        name="30_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="30_sectionCode"     name="30_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="30_teamCode"        name="30_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><p id='31_shiftDate'>31</p></td>
                            <td><input class="easyui-textbox" id="31_shiftCode"       name="31_shiftCode"       style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td><input class="easyui-textbox" id="31_reviseShiftCode" name="31_reviseShiftCode" style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2" ></td>
                            <td><input class="easyui-textbox" id="31_acRegistr"       name="31_acRegistr"       style="width:95px" validType="length[0,8]" invalidMessage="長度需小於等於8"></td>
                            <td><input class="easyui-textbox" id="31_wildNote"        name="31_wildNote"        style="width:45px" validType="length[0,4]" invalidMessage="長度需小於等於4"></td>
                            <td><input class="easyui-textbox" id="31_sectionCode"     name="31_sectionCode"     style="width:45px" validType="length[4,4]" invalidMessage="長度需等於4"></td>
                            <td><input class="easyui-textbox" id="31_teamCode"        name="31_teamCode"        style="width:30px" validType="length[2,2]" invalidMessage="長度需等於2"></td>
                            <td></td>
                        </tr>
                        
                        
                        </table>
                    </div>                
                    <div style="text-align:left;padding:5px 0">
                        <a id="saveBtn"    href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:80px">Set</a>                        
                        <a id="cancelBtn"  href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:80px">Cancel</a>
                    </div>  
            </div>
        </div>    
        </form>    
	<script type="text/javascript">
		// <![CDATA[
        var httpDispatcher = '${contextPath}';
	    var appForm = $('#ff');        		
	    var errorMsg = '${errorMsg}';
	    var msg      = '${msg}';
	    var stopProgress = false;
		
	    // override the function, to let datagrid doing client side paging.
		$(function(){        	
            $('#dg').datagrid({loadFilter:pagerFilter}).datagrid('loadData', $('#dg').datagrid("getData"));
        });
		
		var jsApp = function() {
			// bundle page event
			var bundlePageEvent = function() {
		
				
				// Import Button
				$('#importBtn').on('click', function(event) {
					$('#dg').datagrid({
					    url: httpDispatcher +'/psp/groupShift/importExcel',
					    method:'post',
					    rownumbers:true,
					    pagination:true,
		                singleSelect:true,
		                autoRowHeight:false,
		                collapsible:true,
		                pageSize:10,
		                async: false,
		                queryParams: {'importYearMonth': $('#importYearMonth').combobox("getValue")},		                
					    columns:[[
					    	{width:90, align:'right',field:'employeeNo',     title:'Employee NO'},
			                {width:120,align:'right',field:'name',           title:'Name'},		                    
		                    {width:80, align:'right',field:'yearMonth',      title:'Year Month'},
		                    {width:55, align:'right',field:'sectionCode',    title:'Section'},
		                    {width:40, align:'right',field:'teamCode',       title:'Team'},		                    
		                    {width:25, align:'right',field:'d01',      title:'01'},
		                    {width:25, align:'right',field:'d02',      title:'02'},
		                    {width:25, align:'right',field:'d03',      title:'03'},
		                    {width:25, align:'right',field:'d04',      title:'04'},
		                    {width:25, align:'right',field:'d05',      title:'05'},
		                    {width:25, align:'right',field:'d06',      title:'06'},
		                    {width:25, align:'right',field:'d07',      title:'07'},
							{width:25, align:'right',field:'d08',      title:'08'},
							{width:25, align:'right',field:'d09',      title:'09'},
							{width:25, align:'right',field:'d10',      title:'10'},
							{width:10, align:'right',field:'sp',       title:''},
		                    {width:25, align:'right',field:'d11',      title:'11'},
		                    {width:25, align:'right',field:'d12',      title:'12'},
		                    {width:25, align:'right',field:'d13',      title:'13'},
		                    {width:25, align:'right',field:'d14',      title:'14'},
		                    {width:25, align:'right',field:'d15',      title:'15'},
		                    {width:25, align:'right',field:'d16',      title:'16'},
		                    {width:25, align:'right',field:'d17',      title:'17'},
							{width:25, align:'right',field:'d18',      title:'18'},
							{width:25, align:'right',field:'d19',      title:'19'},
							{width:25, align:'right',field:'d20',      title:'20'},
							{width:10, align:'right',field:'sp',       title:''},
		                    {width:25, align:'right',field:'d21',      title:'21'},
		                    {width:25, align:'right',field:'d22',      title:'22'},
		                    {width:25, align:'right',field:'d23',      title:'23'},
		                    {width:25, align:'right',field:'d24',      title:'24'},
		                    {width:25, align:'right',field:'d25',      title:'25'},
		                    {width:25, align:'right',field:'d26',      title:'26'},
		                    {width:25, align:'right',field:'d27',      title:'27'},
							{width:25, align:'right',field:'d28',      title:'28'},
							{width:25, align:'right',field:'d29',      title:'29'},
							{width:25, align:'right',field:'d30',      title:'30'},
							{width:10, align:'right',field:'sp',       title:''},
		                    {width:25, align:'right',field:'d31',      title:'31'}
					    ]],
					    onLoadSuccess: function(result) {					    	
					    }, 
					    onLoadError: function(XMLHttpRequest, textStatus, errorThrown) {
					    	jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
					    	$('#dg').datagrid('loadData', {"total":0,"rows":[]});
					    }
					    
					});	
				});
				//Upload Button
				$('#uploadBtn').on('click', function(event) {	
					if($('#file').filebox('getValue') == '' ){
						$.messager.alert('Errors','Please choose File first.','error');
						return;
					}
					
					
					appForm.form({
						url: httpDispatcher + '/psp/groupShift/uploadExcel',
						iframe: false,
						dataType:'json',
						success:function(result){
							var obj = jQuery.parseJSON(result);
							if(obj.message != null && obj.message != '') {
								$.messager.alert('Success',obj.message,'info');	
							}
							
		                    // ajax start
							$('#dg').datagrid({
							    url: httpDispatcher +'/psp/groupShift/getUploaded',
							    method:'post',
							    rownumbers:true,
							    pagination:true,
				                singleSelect:true,
				                autoRowHeight:false,
				                collapsible:true,
				                pageSize:10,
				                async: false,
				                queryParams: {},		                
							    columns:[[
							    	{width:45, align:'right',field:'trade',          title:'Trade'},
				                    {width:90, align:'right',field:'employeeNo',     title:'Employee NO'},
				                    {width:90, align:'right',field:'name',           title:'Name'},
				                    {width:80, align:'right',field:'yearMonth',      title:'Year Month'},                    
				                    {width:25, align:'right',field:'d01',      title:'01'},
				                    {width:25, align:'right',field:'d02',      title:'02'},
				                    {width:25, align:'right',field:'d03',      title:'03'},
				                    {width:25, align:'right',field:'d04',      title:'04'},
				                    {width:25, align:'right',field:'d05',      title:'05'},
				                    {width:25, align:'right',field:'d06',      title:'06'},
				                    {width:25, align:'right',field:'d07',      title:'07'},
									{width:25, align:'right',field:'d08',      title:'08'},
									{width:25, align:'right',field:'d09',      title:'09'},
									{width:25, align:'right',field:'d10',      title:'10'},
									{width:20, align:'right',field:'sp',       title:''},
				                    {width:25, align:'right',field:'d11',      title:'11'},
				                    {width:25, align:'right',field:'d12',      title:'12'},
				                    {width:25, align:'right',field:'d13',      title:'13'},
				                    {width:25, align:'right',field:'d14',      title:'14'},
				                    {width:25, align:'right',field:'d15',      title:'15'},
				                    {width:25, align:'right',field:'d16',      title:'16'},
				                    {width:25, align:'right',field:'d17',      title:'17'},
									{width:25, align:'right',field:'d18',      title:'18'},
									{width:25, align:'right',field:'d19',      title:'19'},
									{width:25, align:'right',field:'d20',      title:'20'},
									{width:20, align:'right',field:'sp',       title:''},
				                    {width:25, align:'right',field:'d21',      title:'21'},
				                    {width:25, align:'right',field:'d22',      title:'22'},
				                    {width:25, align:'right',field:'d23',      title:'23'},
				                    {width:25, align:'right',field:'d24',      title:'24'},
				                    {width:25, align:'right',field:'d25',      title:'25'},
				                    {width:25, align:'right',field:'d26',      title:'26'},
				                    {width:25, align:'right',field:'d27',      title:'27'},
									{width:25, align:'right',field:'d28',      title:'28'},
									{width:25, align:'right',field:'d29',      title:'29'},
									{width:25, align:'right',field:'d30',      title:'30'},
									{width:20, align:'right',field:'sp',       title:''},
				                    {width:25, align:'right',field:'d31',      title:'31'},
				                    {width:1450, align:'left',field:'errors',      title:'Error.'}
							    ]],
							    onLoadSuccess: function(result) {								    								    	
							    }, 
							    onLoadError: function(XMLHttpRequest, textStatus, errorThrown) {							   
							    	jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
							    	$('#dg').datagrid('loadData', {"total":0,"rows":[]});
							    }
							    
							});
		                    // end ajax
		                },
                        error:function(XMLHttpRequest, textStatus, errorThrown) {                        	
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                        }
		            });
					appForm.form('submit');

				});
				
				
				//Search Button
				$('#searchBtn').on('click', function(event) {			
                    jsApp.ajax_findBy();					
				});			
				//Reset Button
				$('#resetBtn').on('click', function(event) {			
					$('#criteria_employeeNo').textbox('setValue', ''); 
					$('#criteria_yearMonth').textbox('setValue', '');					
				});					
				
				//Set Button
				$('#saveBtn').on('click', function(event) {	
					var valid = false;
					valid = appForm.form('validate');
					if(valid) {
						var action = httpDispatcher + '/psp/personalShift/setBy';

                        $.ajax({
                            url: action,
                            data: appForm.serialize(),
                            type:"POST",
                            dataType:'json',
                            success: function(data){
                                if(data.message != null &&data.message != '') {
                                    $.messager.alert('Success',data.message,'info');
                                }                                                              
                            },                            
                            error:function(XMLHttpRequest, textStatus, errorThrown) {
                                jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                            }
                        });
					} else {
						$.messager.alert('Info', 'Validation Error.');
					}
				});		
				
					
				//Cancel Button
				$('#cancelBtn').on('click', function(event) {						
					jsApp.togglePanel();
					jsApp.ajax_findBy();
				});		
				
                //Double Click Row
                $('#dg').datagrid({
                    onDblClickRow: function(index,row){
                    	$('#employeeNo').val(row.employeeNo);
                    	$('#yearMonth').val(row.yearMonth);
                    	// ajax to query data
                        $.ajax({
                            url: httpDispatcher + '/psp/personalShift/findBy',
                            data: appForm.serialize(),
                            type:"POST",
                            dataType:'json',
                            success: function(data){
                                for(var i=0; i< data.rows.length; i++) {
                                	var bean = data.rows[i];
                                	var shiftDate = bean.shiftDate;
                                	
                					$('#'+shiftDate+'_id').val(bean.id);
                	                $('#'+shiftDate+'_operateAtTime').val(bean.operateAtTime);
                                	$('#'+shiftDate+'_shiftCode').textbox('setValue',       bean.shiftCode);
                                	$('#'+shiftDate+'_reviseShiftCode').textbox('setValue', bean.reviseShiftCode);
                                	$('#'+shiftDate+'_acRegistr').textbox('setValue',       bean.acRegistr);
                                	$('#'+shiftDate+'_wildNote').textbox('setValue',        bean.wildNote);
                                	$('#'+shiftDate+'_sectionCode').textbox('setValue',     bean.sectionCode);
                                	$('#'+shiftDate+'_teamCode').textbox('setValue',        bean.teamCode);                                    
                                }   

                            	var dayOfMonth = data.dayOfMonth;                            	
                            	for(var j=29; j<32; j++) { // default: hide 29, 30, 31                            		
                            		$('#'+j+'_shiftDate').hide();
                            		$('#'+j+'_shiftCode').textbox('hide');
                                	$('#'+j+'_reviseShiftCode').textbox('hide');
                                	$('#'+j+'_acRegistr').textbox('hide');
                                	$('#'+j+'_wildNote').textbox('hide');
                                	$('#'+j+'_sectionCode').textbox('hide');
                                	$('#'+j+'_teamCode').textbox('hide');
                            	}
                            	for(var k=29; k<=dayOfMonth; k++) {
                            		$('#'+k+'_shiftDate').show();
                            		$('#'+k+'_shiftCode').textbox('show');
                                	$('#'+k+'_reviseShiftCode').textbox('show');
                                	$('#'+k+'_acRegistr').textbox('show');
                                	$('#'+k+'_wildNote').textbox('show');
                                	$('#'+k+'_sectionCode').textbox('show');
                                	$('#'+k+'_teamCode').textbox('show');	
                            	}
                            	
                            	
                            },                            
                            error:function(XMLHttpRequest, textStatus, errorThrown) {
                                jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                            }
                        });
                    	
    		            jsApp.togglePanel();
    		            
                    }
                });			
                //-------------------------------------------------------------
			};

			return {
				init : function() {
					// 表單事件初始化					
					bundlePageEvent();
					$('#southPannel').toggle(); // hide southPanel
					
					// if post back with msg , show it
					jsApp.showMsg();
					//jsApp.ajax_findBy();
					
				},
		       	togglePanel : function () {
					$('#northPannel').toggle();
					$('#centerPannel').toggle();
					$('#southPannel').toggle(); 
			    },
				showMsg : function() {
					if (errorMsg != '') {
						$.messager.alert('Error',errorMsg,'error');
					}
					if (msg != '') {
						$.messager.alert('Info',msg,'info');
					}
				},
				ajaxMsg : function (XMLHttpRequest, textStatus, errorThrown){
			    	var result = XMLHttpRequest.responseJSON;
			    	
			    	// NOT EXTENDED 所提供的參數條件不充份 (使用者的使用問題 LogicException)
			    	if(errorThrown == 'Not Extended') {
			    		$.messager.alert('Try again.',result.message,'warn');
			    		
			    	// INTERNAL_SERVER_ERROR 未出現過的錯誤 (測試時沒測到的Exception)	
			    	} else if (errorThrown == 'Internal Server Error') {
			    		$.messager.alert('Please Contact the Developer.',result.message,'error');
			    	
			    	// 傳出不允許的HttpStatus, 開發者開發紀律問題	
			    	} else {
			    		$.messager.alert('Please Contact the Administrator.',result.message,'error');
			    	}
				},					
				ajax_findBy : function() {
					$('#dg').datagrid({
					    url: httpDispatcher +'/psp/groupShift/indexList',
					    method:'post',
					    rownumbers:true,
					    pagination:true,
		                singleSelect:true,
		                autoRowHeight:true,
		                collapsible:true,
		                pageSize:10,		                
		                queryParams: { 'departmentCode': $('#criteria_departmentCode').combobox("getValue"),
		                               'employeeNo': $('#criteria_employeeNo').textbox("getValue"),	                
		                	           'yearMonth': $('#criteria_yearMonth').textbox("getValue")
		                },		                
					    columns:[[
					    	{width:90, align:'right',field:'employeeNo',     title:'Employee NO'},
			                {width:200,align:'right',field:'name',           title:'Name'},	                    
		                    {width:80, align:'right',field:'yearMonth',      title:'Year Month'},
		                    {width:55, align:'right',field:'sectionCode',    title:'Section'},
		                    {width:40, align:'right',field:'teamCode',       title:'Team'},		                    
		                    {width:25, align:'right',field:'d01',      title:'01'},
		                    {width:25, align:'right',field:'d02',      title:'02'},
		                    {width:25, align:'right',field:'d03',      title:'03'},
		                    {width:25, align:'right',field:'d04',      title:'04'},
		                    {width:25, align:'right',field:'d05',      title:'05'},
		                    {width:25, align:'right',field:'d06',      title:'06'},
		                    {width:25, align:'right',field:'d07',      title:'07'},
							{width:25, align:'right',field:'d08',      title:'08'},
							{width:25, align:'right',field:'d09',      title:'09'},
							{width:25, align:'right',field:'d10',      title:'10'},
							{width:10, align:'right',field:'sp',       title:''},
		                    {width:25, align:'right',field:'d11',      title:'11'},
		                    {width:25, align:'right',field:'d12',      title:'12'},
		                    {width:25, align:'right',field:'d13',      title:'13'},
		                    {width:25, align:'right',field:'d14',      title:'14'},
		                    {width:25, align:'right',field:'d15',      title:'15'},
		                    {width:25, align:'right',field:'d16',      title:'16'},
		                    {width:25, align:'right',field:'d17',      title:'17'},
							{width:25, align:'right',field:'d18',      title:'18'},
							{width:25, align:'right',field:'d19',      title:'19'},
							{width:25, align:'right',field:'d20',      title:'20'},
							{width:10, align:'right',field:'sp',       title:''},
		                    {width:25, align:'right',field:'d21',      title:'21'},
		                    {width:25, align:'right',field:'d22',      title:'22'},
		                    {width:25, align:'right',field:'d23',      title:'23'},
		                    {width:25, align:'right',field:'d24',      title:'24'},
		                    {width:25, align:'right',field:'d25',      title:'25'},
		                    {width:25, align:'right',field:'d26',      title:'26'},
		                    {width:25, align:'right',field:'d27',      title:'27'},
							{width:25, align:'right',field:'d28',      title:'28'},
							{width:25, align:'right',field:'d29',      title:'29'},
							{width:25, align:'right',field:'d30',      title:'30'},
							{width:10, align:'right',field:'sp',       title:''},
		                    {width:25, align:'right',field:'d31',      title:'31'}
					    ]],
					    onLoadSuccess: function(result) {					    	
					    }, 
					    onLoadError: function(XMLHttpRequest, textStatus, errorThrown) {
					    	jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
					    	$('#dg').datagrid('loadData', {"total":0,"rows":[]});
					    }
					    
					});	
				}
				
				
			};
		}();

		$(document).ready(jsApp.init);

		// ]]>
	</script>
</body>
</html>