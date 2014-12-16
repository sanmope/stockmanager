<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Job</title>
</head>
<body>

<c:if test="${errors.errorCount gt 0}">
	Errors!<br/>
	<c:forEach var="error" items="${errors.allErrors}">
		<span class="error">${error.objectName} ${error.code}</span>
		<br />
	</c:forEach>
</c:if>
<form method="post" action="newJob.htm">
  <label for="name">Descripcion:</label>
  <input type="text" name="description" /><br />
  <label for="name">Cliente:</label>
  <input type="text" name="clientId" /><br />
  <input type="submit" /><input type="reset" />
</form>

</body>
</html>