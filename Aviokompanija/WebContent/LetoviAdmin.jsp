<%@ page import="java.sql.*"%>
<jsp:include page="headerAdm.jsp" />
<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/aerodrom", "root", "");
		PreparedStatement ps = conn.prepareStatement("Select * from letovi");
		ResultSet rs = ps.executeQuery();
%>
<div class="letoviAd">
	${ poruka } ${ greska }
	<table>
		<tr>
			<td style="text-align: right;" colspan=6>
			<span style="margin-right: 60px;">PRETRAGA LETOVA</span></td>
			<td colspan=3 style="text-align: right;">
				<form method="post" class="formLet" action="IzbrisiLet">
					<input type="number" placeholder=" ID LETA" name="idLeta" style="width: 180px;"> 
					<input type="submit" value="IZBRISI" name="izbrisi" class="dugmeL">
				</form>
			</td>
		</tr>
		<tr><td></td></tr>
		<tr>
			<th>Id leta</th>
			<th>Avion</th>
			<th>Polaziste</th>
			<th>Odrediste</th>
			<th>Datum Polaska</th>
			<th>Vreme Polaska</th>
			<th>Planiran dolazak</th>
			<th>Slobodna mesta</th>
			<th>Cena</th>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr style="height: 40px; border-top: 1px solid white;">
			<td><%=rs.getInt(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getInt(8)%></td>
			<td><%=rs.getFloat(9)%></td>
		</tr>
		<%
			}
		%>
		</table>
		<%
		} catch (Exception ex) {
			out.println("Unable to connect to database.");
		}
	%>
	<br>
</div>
</body>
</html>