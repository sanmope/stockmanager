<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytags"%>
<html>
<head>
<mytags:jquery />
<mytags:style />
</head>
<body>
<mytags:menu />
<h4>New Person</h4>
<c:if test="${errors.errorCount gt 0}">
	Errors!<br/>
	<c:forEach var="error" items="${errors.allErrors}">
		<span class="error">${error.objectName} ${error.code}</span>
		<br />
	</c:forEach>
</c:if>
<form method="post" action="addPerson.htm">
  <label for="name">Nombre:</label>
  <input type="text" name="name" /><br />
  <label for="name">Apellido:</label>
  <input type="text" name="lastName" /><br />
  <label for="name">Edad:</label>
  <input type="text" name="age" /><br />
  <label for="name">Direccion:</label>
  <input type="text" name="address" /><br />
  <label for="name">Rubro:</label>
  <input type="text" name="occupation" /><br />
  <label for="name">E-Mail:</label>
  <input type="text" name="eMail" /><br />
  <label for="name">Tel Casa:</label>
  <input type="text" name="phoneHome" /><br />
  <label for="name">Celular:</label>
  <input type="text" name="phoneCell" /><br />
  <label for="name">Tel Oficina:</label>
  <input type="text" name="phoneOffice" /><br />
  <input type="submit" /><input type="reset" />
</form>
<mytags:footer/>
</body>
</html>

