<%@ page import="java.sql.*" %>
<jsp:include page="header.jsp" />
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/aerodrom","root","");    
	PreparedStatement ps = conn.prepareStatement("Select * from rezervacije where korisnik=?");
	PreparedStatement pst = conn.prepareStatement("Select * from letovi where id_letovi=?");
	PreparedStatement pst1 = conn.prepareStatement("Select * from letovi where id_letovi=?");
	ps.setString(1, (String) session.getAttribute("imeK"));
	ResultSet rs1 = ps.executeQuery();
%>
<div class="rezervacije">
	${ poruka } ${ greskaa }
	<table>
<%

if (!rs1.isBeforeFirst()) {
	%> 
	<tr><td style="width:1000px;"><span style="text-align:center;">VASE REZERVACIJE</span></td></tr>
	<tr><td> </td></tr>
	<tr><td style="width:1000px;"><span style="text-align:center;">Korisnik trenutno nema rezervacija</span></td></tr>
	<%
}
else {
	%>
	<tr><td colspan=6 style="text-align:right; "><span style="margin-right:70px;">VASE REZERVACIJE</span></td>
	<td colspan=3 style="text-align:right; width: 280px; ">
	<form method="post" class="formRezer" action="IzbrisiRez">
	<input type="number" placeholder="ID REZERVACIJE" name="idRez" style="width:180px;" required>
	<input type="submit" value="IZBRISI" name="izbrisi" class="dugmeRezer"></form></td></tr>
	<tr><td></td></tr>
	<%
while(rs1.next()) {
	if(rs1.getInt(4) > 0){
		pst.setInt(1, rs1.getInt(3));
		ResultSet rs2 = pst.executeQuery();
		pst1.setInt(1, rs1.getInt(4));
		ResultSet rs3 = pst1.executeQuery();
		if(rs2.next() && rs3.next()){
		%>
		<tr class="povratna" id="pov" style="height: 60px;">
		<td rowspan=2 style="border-bottom: 1px solid white; border-left: 1px solid white;">ID rezervacije:<br><%=rs1.getInt(1)%></td>	
		<td><img src="resources/slike/avionMali.png" class="logo" alt="avion"></td>
		<td style="width: 80px; text-align:left;"><%=rs2.getString(6)%><br><%=rs2.getString(7)%></td>
		<td style="width: 90px; text-align:left;"><%=rs2.getString(3)%><br><%=rs2.getString(4)%></td>
		<td style="text-align:left;"><%=rs2.getString(5)%></td>		
		<td rowspan=2 style="border-bottom: 1px solid white;">Broj putnika:<br> <%=rs1.getInt(5)%></td>
		<td rowspan=2 style="border-bottom: 1px solid white;">Broj dece:<br> <%=rs1.getInt(6)%></td>
		<td rowspan=2 style="border-bottom: 1px solid white;"><%=rs1.getString(7)%> klasa</td>
		<td rowspan=2 style="border-bottom: 1px solid white; border-right: 1px solid white;">Cena:<br><%=rs1.getFloat(8)%></td>
		</tr>
		<tr class="povratna1" id="pov1" style="height: 60px;">
		<td><img src="resources/slike/avionUnazad.png" class="logo" alt="avion"></td>
		<td style="width: 80px; text-align:left;"><%=rs3.getString(6)%><br><%=rs3.getString(7)%></td>
		<td style="width: 90px; text-align:left;"><%=rs3.getString(3)%><br><%=rs3.getString(4)%></td>
		<td style="text-align:left;"><%=rs3.getString(5)%></td>	
		</tr>
		<%
	}} else {
	pst.setInt(1, rs1.getInt(3));
	ResultSet rs2 = pst.executeQuery();
	if(rs2.next()){
	%>
		<tr id="prLet" style="height: 90px;">
		<td style="border-left: 1px solid white;">ID rezervacije:<br><%=rs1.getInt(1)%></td>
		<td><img src="resources/slike/avionMali.png" class="logo" alt="avion"></td>
		<td style="width: 80px; text-align:left;"><%=rs2.getString(6)%><br><%=rs2.getString(7)%></td>
		<td style="width: 90px; text-align:left;"><%=rs2.getString(3)%><br><%=rs2.getString(4)%></td>
		<td style="text-align:left;"><%=rs2.getString(5)%></td>		
		<td>Broj putnika:<br> <%=rs1.getInt(5)%></td>
		<td>Broj dece:<br> <%=rs1.getInt(6)%></td>
		<td><%=rs1.getString(7)%> klasa</td>
		<td style="border-right: 1px solid white;">Cena:<br><%=rs1.getFloat(8)%></td>
		</tr>
	<% } } } } %>
</table>
<%
rs1.close();
ps.close();
conn.close();
} catch (Exception ex) {
	out.println("Unable to connect to database.");
}
%>
<br>
</div>