<%@ taglib tagdir="/WEB-INF/tags" prefix="mytags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title><fmt:message key="title"/></title>
<mytags:style /> 
<mytags:jquery />
</head>
<body>
<mytags:menu/>
<h4>Price Increase</h4>
<c:if test="${errors.errorCount gt 0}">
	<c:forEach var="error" items="${errors.allErrors}">
		<span class="error">${error.objectName} ${error.code}</span>
		<br />
	</c:forEach>
</c:if>
<form method="post" action="priceIncrease/1.htm">
  <label for="name">Incremento:</label>
  <input type="text" name="percentage" /><br />
  <input type="submit" /><input type="reset" />
</form>

<div> ${product.name} </div>

</body>
</html>