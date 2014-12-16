<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytags"%>
<html>
<head>
<mytags:jquery />
<mytags:style />
</head>
<body>

<div>

<c:choose>
	<c:when test="${fn:length(persons) gt 0}">
		<table border=1>
			<tr>
				<th>Name</th>
				<th>cost</th>
				<th>price</th>
				<th>quantity</th>
				<th>description</th>
				
			</tr>
			<c:forEach var="product" items="${persons}">
					<td><c:out value="${person.name}"/></td>
					<td>${product.cost}</td>
					<td>${product.price}</td>
					<td>${product.quantity}</td>
					<td>${product.description}</td>
				</tr>
			</c:forEach>
		</table>
	</c:when>
	<c:otherwise>No products</c:otherwise>
</c:choose>

</div>

<mytags:menu />
<h4>Edit Person</h4>
<c:if test="${errors.errorCount gt 0}">
	Errors!<br/>
	<c:forEach var="error" items="${errors.allErrors}">
		<span class="error">${error.objectName} ${error.code}</span>
		<br />
	</c:forEach>
</c:if>

<form method="post" action="editPerson.htm">
	 <label for="name">Nombre:</label>
	 <input type="text" name="name" value= "${person.name}"/><br />
	 <label for="name">Apellido:</label>
	 <input type="text" name="lastName"  value= "${person.lastName}"/><br />
	 <label for="name">Edad:</label>
	 <input type="text" name="age"  value= "${person.age}" /><br />
	 <label for="name">Direccion:</label>
	 <input type="text" name="address"  value= "${person.address}"/><br />
	 <label for="name">Rubro:</label>
	 <input type="text" name="occupation"  value= "${person.occupation}"/><br />
	 <label for="name">E-Mail:</label>
	 <input type="text" name="eMail"  value= "${person.eMail}"/><br />
	 <label for="name">Tel Casa:</label>
	 <input type="text" name="phoneHome"  value= "${person.phoneHome}"/><br />
	 <label for="name">Celular:</label>
	 <input type="text" name="phoneCell"  value= "${person.phoneCell}"/><br />
	 <label for="name">Tel Oficina:</label>
	 <input type="text" name="phoneOffice"  value= "${person.phoneOffice}"/><br />
	 <input type="hidden" name="id"  value= "${person.id}"/><br />
	 <input type="submit" /><input type="reset" />
</form>

<div id="lightbox">
	<a href="#" id="opener">click Me</a>
	<script type="text/javascript">
	var opener = document.getElementById("opener");

	opener.onclick = function(){
	    
	    var lightbox = document.getElementById("lightbox"),
	        dimmer = document.createElement("div");
	    
	    dimmer.style.width =  window.innerWidth + 'px';
	    dimmer.style.height = window.innerHeight + 'px';
	    dimmer.className = 'dimmer';
	    
	    dimmer.onclick = function(){
	        document.body.removeChild(this);   
	        lightbox.style.visibility = 'visible';
	    }
	        
	    document.body.appendChild(dimmer);
	    
	    lightbox.style.visibility = 'visible';
	    lightbox.style.top = window.innerHeight/2 - 50 + 'px';
	    lightbox.style.left = window.innerWidth/2 - 100 + 'px';
	    return false;
	}
	</script>
</div>
<mytags:footer/>
</body>
</html>

