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
    $(document).ready(function () {
        $('.letoviRezer tr').click(function (event1) {
            if (event1.target.type !== 'radio') {
                $(':radio', this).trigger('click');
            }
        });
    $(".letoviRez input[type='radio']").change(function (e) {
        e.stopPropagation();
        $('.letoviRez tr').removeClass("highlight_row");        
        if ($(this).is(":checked")) {
            $(this).closest('tr').addClass("highlight_row");
        }     
    });
});
    $(".letoviRezer input[type='radio']").change(function (e1) {
        e1.stopPropagation();
        $('.letoviRezer tr').removeClass("highlight_row");        
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
    String datumPovratka = request.getParameter("datumPovratka");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/aerodrom","root","");    
    PreparedStatement pst = conn.prepareStatement("Select * from letovi where polaziste=? and odrediste=? and datumPolaska=?");
    PreparedStatement ps = conn.prepareStatement("Select * from letovi where polaziste=? and odrediste=? and datumPolaska=?");
    pst.setString(1, polaziste);
    pst.setString(2, odrediste);
	pst.setString(3, datumPolaska);
    ps.setString(1, odrediste);
    ps.setString(2, polaziste);
	ps.setString(3, datumPovratka);
	ResultSet rs = pst.executeQuery();
	 %>
<div class="rezL">
	<p style="font-size: 18px;"><% out.println(request.getParameter("polaziste")); %> -> <% out.println(request.getParameter("odrediste"));%> 
	&nbsp;&nbsp;&nbsp;&nbsp; Polazak:&nbsp; <% out.println(request.getParameter("datumPolaska"));%></p>
<form method="post" class="formLetovi" action="RezPovratni.jsp">
	<table>
		<tr>
			<th></th>
			<th>Id leta</th>
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
    <tr><td colspan=10 style="text-align:center;">Nema letova izabranog datuma</td></tr>
	<%
}
while(rs.next()) {
	%>
	<tr style=" height: 40px;" >
	<td><input type="radio" name="izaberi" value="<%=rs.getInt(1)%>" required></td>
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
</table>
	<p style="font-size: 18px; margin-top:40px;"><% out.println(request.getParameter("odrediste")); %> -> 
	<% out.println(request.getParameter("polaziste"));%> 
	&nbsp;&nbsp;&nbsp;&nbsp; Povratak:&nbsp; <% out.println(request.getParameter("datumPovratka"));%><p>
<table>
		<tr>
			<th></th>
			<th>Id leta</th>
			<th>Avion</th>
			<th>Polaziste</th>
			<th>Odrediste</th>
			<th>DatumPolaska</th>
			<th>VremePolaska</th>
			<th>VremeDolaska</th>
			<th>Slobodna mesta</th>
			<th>Cena</th>
		</tr>
		<tbody class="letoviRezer">
<%
ResultSet rs1 = ps.executeQuery();
if (!rs1.isBeforeFirst() ) {    
	%>
    <tr><td colspan=10 style="text-align:center;">Nema letova izabranog datuma</td></tr>
	<%
}
else{
while(rs1.next()) {
%>
		<tr style=" height: 40px;" >
		<td><input type="radio" name="izaberiL" value="<%=rs1.getInt(1)%>" required></td>
		<td><%=rs1.getString(1)%></td>
		<td><%=rs1.getString(2)%></td>	
		<td><%=rs1.getString(3)%></td>
		<td><%=rs1.getString(4)%></td>
		<td><%=rs1.getString(5)%></td>
		<td><%=rs1.getString(6)%></td>
		<td><%=rs1.getString(7)%></td>
		<td><%=rs1.getString(8)%></td>
		<td><%=rs1.getFloat(9)%></td>
		</tr>	
<% } %>
</tbody>
</table>
<p style="text-align:right; margin-bottom: -10px; font-size:13px;">*Popust na povratnu kartu iznosi 30% od cene izabranih letova</p><br>
<% if(session.getAttribute("imeK") == null ) {
	%>
		<p style="text-align:center; font-size:20px;"><a href="Prijava.jsp" class="pos">Prijavite se </a>da bi rezervisali letove</p>
<% } else { 
	%>
<input type="submit" class="dugme" value="REZERVISI IZABRANE LETOVE">
 <% }
}
rs.close();
pst.close();
conn.close();
} catch (Exception ex) {
	out.println("Unable to connect to database.");
}
%>
</form>
</div>
</body>
</html>