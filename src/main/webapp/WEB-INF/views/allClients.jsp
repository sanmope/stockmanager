<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script> 

<mytags:jquery />
<mytags:style />

<title>Spring Auto-complete</title>
<script type="text/javascript">

    $(function() {  
        $("#tagsName").autocomplete({
            source: function (request, response) {
                $.getJSON("${pageContext.request.contextPath}/${"getMachedNames.htm"}", {
                    term: request.term
                }, response);
            }
        });
    });
    
</script> 
</head>
<body>
<form:form method="get" action="" >
    <h1>${message}</h1>
    Enter Name: <input id="tagsName">
    
</form:form>    
</body>
</html>