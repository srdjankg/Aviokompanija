<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
</head>
<body>
	<div class="meni">
		<div class="meni-levo">
			<a href="index.jsp"> <img src="resources/slike/logo.png"
				class="logo" alt="avion">
			</a>
		</div>
		<div class="meni-desno">
			<ul>
				<% if(session.getAttribute("imeK") == null) {
						%><li><a href="index.jsp" class="selected">POCETNA</a></li>
				<li><a href="Prijava.jsp">PRIJAVA</a></li>
				<li><a href="Registracija.jsp">REGISTRACIJA</a></li>
				<%	
					} else {
						%><li><a href="index.jsp">POCETNA</a></li>
				<li><a href="RezervacijeKor.jsp">REZERVACIJE</a></li>
				<li><a href="OdjaviSe.jsp">ODJAVITE SE</a></li>
				<li class="imePr">${sessionScope.imeK }</li>
				<%		    	
					}%>
			</ul>
		</div>
	</div>