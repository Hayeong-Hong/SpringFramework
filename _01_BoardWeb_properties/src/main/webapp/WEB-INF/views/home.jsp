<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	${hi }
</h1>

<a href="test.do?firstName=hayeong&lastName=hong">click</a>
<form action="test.do" method="post">
	<input type="text" placeholder="firstName" name="firstName">
	<input type="text" placeholder="lastName" name="lastName">
	<button type="submit">submit</button>
</form>
</body>
</html>
