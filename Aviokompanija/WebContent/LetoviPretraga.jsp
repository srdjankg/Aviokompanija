<%@ page import="java.sql.*" %>
<jsp:include page="header.jsp" />
<link href="resources/jquery/jquery-ui.css" rel="stylesheet">
<script src="resources/jquery/jquery.js"></script>
<script src="resources/jquery/jquery-ui.js"></script>
<script>
$(document).ready(function () {
    $('.letoviRez tr').click(function (event) {
        if (event.target.type !== 'radio') {
            $(':radio', this).trigger('click');
        }
    });
    $("input[type='radio']").change(function (e) {
        e.stopPropagation();
        $('.letoviRez tr').removeClass("highlight_row");        
        if ($(this).is(":checked")) {
            $(this).closest('tr').addClass("highlight_row");
        }     
    });
});
</script>
<%
try{
String polaziste = request.getParameter("polaziste");
String odrediste = request.getParameter("odrediste");
String datumPolaska = request.getParameter("datumPolaska");
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/aerodrom","root","");    
PreparedStatement pst = conn.prepareStatement("Select * from letovi where polaziste=? and odrediste=? and datumPolaska=?");
pst.setString(1, polaziste);
pst.setString(2, odrediste);
pst.setString(3, datumPolaska);
ResultSet rs = pst.executeQuery();
%>
<div class="rezL">
	<p style="font-size: 18px;"><% out.println(request.getParameter("polaziste")); %> -> <% out.println(request.getParameter("odrediste"));%> 
	&nbsp;&nbsp;&nbsp;&nbsp; Polazak:&nbsp; <% out.println(request.getParameter("datumPolaska"));%><p>
<form method="post" class="formLetovi" action="RezervLet.jsp">
<table>
		<tr>
			<th></th>
			<th style="width: 50px;">Id leta</th>
			<th>Avion</th>
			<th>Polaziste</th>
			<th>Odrediste</th>
			<th>DatumPolaska</th>
			<th>VremePolaska</th>
			<th>VremeDolaska</th>
			<th>Slobodna mesta</th>
			<th>Cena</th>
		</tr>
		<tbody class="letoviRez">
<%
if (!rs.isBeforeFirst() ) {    
	%>
    <tr style="height: 50px;"><td colspan=10 style="text-align:center;">Nema letova izabranog datuma</td></tr>
	<%
} 
else{
while(rs.next()) {
	%>
	<tr style="height: 40px;">
		<td style="width: 50px;"><input type="radio" name="izaberi" value="<%=rs.getInt(1)%>" required></td>
		<td><%=rs.getString(1)%></td>
		<td><%=rs.getString(2)%></td>	
		<td><%=rs.getString(3)%></td>
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getString(5)%></td>
		<td><%=rs.getString(6)%></td>
		<td><%=rs.getString(7)%></td>
		<td><%=rs.getString(8)%></td>
		<td><%=rs.getFloat(9)%></td>
	</tr>
	<% } %>
</tbody>
</table><br>
	<% if(session.getAttribute("imeK") == null ) {
		%>
		<p style="text-align:center; font-size:20px;"><a href="Prijava.jsp" class="pos">Prijavite se </a>da bi rezervisali letove</p>
<% } else { 
	%>
<input type="submit" class="dugme" value="REZERVISI IZABRAN LET">
 <% }
} %>
</form>
<%
rs.close();
pst.close();
conn.close();
} catch (Exception ex) {
	out.println("Unable to connect to database.");
}
%>
<br>
</div>
</body>
</html>