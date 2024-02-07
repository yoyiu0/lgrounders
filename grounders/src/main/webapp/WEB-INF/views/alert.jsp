<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./include/header.jsp" %>
<script>
	var path = "<c:out value='${path}'/>";

	var msg = "<c:out value='${msg}'/>";
	var url = "<c:out value='${url}'/>";
	var paramName = "<c:out value='${paramName}'/>";
	var paramValue = "<c:out value='${paramValue}'/>";

	if(paramName != null && paramName != ''){
		alert(msg);
    	location.href=path+url+"?"+paramName+"="+paramValue;
	}else if(url == null || url == ''){
		alert(msg);
		history.back();
	}else{
		alert(msg);
    	location.href=path+url;
	}
    

</script>
<%@ include file = "./include/footer.jsp" %>