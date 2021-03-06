<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
						<form action="api/${msg }.do" name="accessForm" id="accessForm" method="post">
							<input type="hidden" name="DR_ID" id="dr_id" value="${pd.DR_ID }"/>
							<div id="zhongxin" style="padding-top: 13px;">
							<table id="table_report" class="table table-striped table-bordered table-hover">
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">业务说明:</td>
									<td>
										<select name="IN_ID" title="业务名称">
											<!-- 开始循环 -->	
											<c:choose>
												<c:when test="${not empty interfaceList}">
													<c:forEach items="${interfaceList}" var="interfaceM" varStatus="vs">
														<option value="${interfaceM.IN_ID }" <c:if test="${pd.IN_ID == interfaceM.IN_ID}">selected</c:if>>${interfaceM.NAME }</option>
													</c:forEach>
												</c:when>
											</c:choose>
										</select>
									</td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">操作表名:</td>
									<td><input type="text" name="TABLE_NAME" id="table_disc" value="${pd.TABLE_NAME }" maxlength="32" placeholder="输入说明" title="表说明"style="width:98%;" /></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">表说明:</td>
									<td><input type="text" name="TABLE_DISC" id="table_disc" value="${pd.TABLE_DISC }" maxlength="32" placeholder="输入说明" title="表说明"style="width:98%;" /></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">字段名称:</td>
									<td><input type="text" name="COLUMN_NAME" id="column_name" value="${pd.COLUMN_NAME }" maxlength="32" placeholder="输入字段名称" title="字段名称"style="width:98%;" /></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">列说明:</td>
									<td><input type="text" name="COLUMN_DISC" id="column_disc" value="${pd.COLUMN_DISC }" maxlength="32" placeholder="输入列说明" title="列说明"style="width:98%;" /></td>
								</tr>
								<tr>
									<td class="center" colspan="6">
								
											<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									
										<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
									</td>
								</tr>
							</table>
							</div>
							<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						</form>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</body>						
<script type="text/javascript">
	$(top.hangge());
	
	$(document).ready(function(){
		if($("#in_id").val()!=""){
			$("#loginname").attr("readonly","readonly");
			$("#loginname").css("color","gray");
		}
	});
	//保存
	function save(){
					$("#accessForm").submit();
					$("#zhongxin").hide();
					$("#zhongxin2").show();
				};
	$(function() {
					//下拉框
					if(!ace.vars['touch']) {
						$('.chosen-select').chosen({allow_single_deselect:true}); 
						$(window)
						.off('resize.chosen')
						.on('resize.chosen', function() {
							$('.chosen-select').each(function() {
								 var $this = $(this);
								 $this.next().css({'width': $this.parent().width()});
							});
						}).trigger('resize.chosen');
						$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
							if(event_name != 'sidebar_collapsed') return;
							$('.chosen-select').each(function() {
								 var $this = $(this);
								 $this.next().css({'width': $this.parent().width()});
							});
						});
						$('#chosen-multiple-style .btn').on('click', function(e){
							var target = $(this).find('input[type=radio]');
							var which = parseInt(target.val());
							if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
							 else $('#form-field-select-4').removeClass('tag-input-style');
						});
					}
				});			
</script>
</html>