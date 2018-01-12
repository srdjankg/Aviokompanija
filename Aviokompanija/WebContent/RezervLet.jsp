<%@ page import="java.sql.*" %>
<jsp:include page="header.jsp" />
<%
try{
	String l = request.getParameter("izaberi");
	int let = Integer.parseInt(l);
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/aerodrom","root","");    
	PreparedStatement ps = conn.prepareStatement("Select * from letovi where id_letovi=?");
	ps.setInt(1, let);
	ResultSet rs = ps.executeQuery();
	if (rs.next()){
%>
		<div class="rezLetove">
				<form method="post" class="formRez" action="RezervisiLet">
					<h2>Rezervacija leta</h2>
					<table class="rzL">
					<tr>
						<td><img src="resources/slike/avionMali.png" class="logo" alt="avion"></td>
						<td style="width: 80px; text-align:left;"><%=rs.getString(6)%><br><%=rs.getString(7)%></td>
						<td style="width: 90px; text-align:left;"><%=rs.getString(3)%><br><%=rs.getString(4)%></td>
						<td style="text-align:left;"><%=rs.getString(5)%></td>
					</tr>
					</table>
					<input type="hidden" name="let" id="let" value="<%out.println(let);%>">
					<select class="putnici" name="brojPutnika" id="brojPutnika" onchange="myFunction()" required>
						<option value="" style="display:none" disabled selected>BROJ PUTNIKA</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
					<select class="putnici" name="brojDece" id="brojDece" onchange="myFunction()" required>
						<option value="" style="display:none" disabled selected>BROJ DECE</option>
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
					<select style="margin-right: 0px;" class="klasa" id="izabKlasu" name="klasa" onchange="myFunction()" required>
						<option value="Ekonomska" selected>Ekonomska klasa</option>
						<option value="Biznis">Biznis klasa</option>
						<option value="Prva">Prva klasa</option>
					</select><br>
					<p id="cena"></p>
					<input type="submit" class="dugme" value="REZERVISI LET">
					<script>
						function myFunction() {
						    var x = document.getElementById("brojPutnika").value;
						    var i = document.getElementById("brojDece").value;
						    var k = document.getElementById("izabKlasu").value;
						    if (k == "Ekonomska"){						    	
						   		var cena = <%=rs.getFloat(9)%>*x + <%=rs.getFloat(9)%>*i/2;
						    } else if (k == "Biznis"){
						    	var cena = (<%=rs.getFloat(9)%>*x + <%=rs.getFloat(9)%>*i/2)*2;
						    } else {
						    	var cena = (<%=rs.getFloat(9)%>*x + <%=rs.getFloat(9)%>*i/2)*3;
						    }
						    var ukCena = parseFloat(cena).toFixed(2);
						    document.getElementById("cena").innerHTML = 
						    	"Ukupna cena karte iznosi " + ukCena + " dinara";
						}
					</script>
				</form>
<%
	}
rs.close();
ps.close();
conn.close();
} catch (Exception ex) {
	out.println("Unable to connect to database.");
}
%>
		</div>
	</body>
</html>