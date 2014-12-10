<%@ taglib tagdir="/WEB-INF/tags" prefix="mytags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title><fmt:message key="title"/></title>
  <style>
    .error { color: red; }
  </style> 
</head>
<body>
<mytags:menu />
<h4>Price Increase</h4>
<c:if test="${errors.errorCount gt 0}">
	Errors!<br/>
	<c:forEach var="error" items="${errors.allErrors}">
		<span class="error">${error.objectName} ${error.code}</span>
		<br />
	</c:forEach>
</c:if>
<form method="post" action="priceIncrease.htm">
  <label for="name">Incremento:</label>
  <input type="text" name="percentage" /><br />
  <input type="submit" /><input type="reset" />
</form>
</body>
</html>