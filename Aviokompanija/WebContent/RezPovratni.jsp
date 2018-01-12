<%@ page import="java.sql.*" %>
<jsp:include page="header.jsp" />
<%
try{
	String l = request.getParameter("izaberi");
	int let = Integer.parseInt(l);
	String pl = request.getParameter("izaberiL");
	int pLet = Integer.parseInt(pl);
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/aerodrom","root","");    
	PreparedStatement ps = conn.prepareStatement("Select * from letovi where id_letovi=?");
	PreparedStatement pst = conn.prepareStatement("Select * from letovi where id_letovi=?");
	ps.setInt(1, let);
	pst.setInt(1, pLet);
	ResultSet rs = ps.executeQuery();
	ResultSet rs1 = pst.executeQuery();
	if (rs.next() && rs1.next()){
%>
	<div class="rezLetove">
	<form method="post" class="formRez" action="RezervisiPovratniLet">
		<h2>Rezervacija povratnog leta</h2>
			<table class="rzL">
				<tr>
					<td><img src="resources/slike/avionMali.png" class="logo" alt="avion"></td>
					<td style="width: 80px; text-align:left;"><%=rs.getString(6)%><br><%=rs.getString(7)%></td>
					<td style="width: 85px; text-align:left;"><%=rs.getString(3)%><br><%=rs.getString(4)%></td>
					<td style="width: 120px; text-align:left;"><%=rs.getString(5)%></td>
					<td><img src="resources/slike/avionUnazad.png" class="logo" alt="avion"></td>
					<td style="width: 80px; text-align:left;"><%=rs1.getString(6)%><br><%=rs1.getString(7)%></td>
					<td style="width: 85px; text-align:left;"><%=rs1.getString(3)%><br><%=rs1.getString(4)%></td>
					<td style="width: 125px; text-align:left;"><%=rs1.getString(5)%></td>
				</tr>
			</table>
				<input type="hidden" name="let" value="<%out.println(let);%>" readonly>
				<input type="hidden" name="povratniLet" value="<%out.println(pLet);%>" readonly>
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
					<select style="margin-right: 0px;" name="klasa" class="klasa" id="izabKlasu" onchange="myFunction()" required>
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
						   		var cena = ((<%=rs.getFloat(9)%>*x+<%=rs.getFloat(9)%>*i/2)
						   			+ (<%=rs1.getFloat(9)%>*x+<%=rs1.getFloat(9)%>*i/2))*0.7;
						    } else if (k == "Biznis"){
						    	var cena = ((<%=rs.getFloat(9)%>*x+<%=rs.getFloat(9)%>*i/2)
							   		+ (<%=rs1.getFloat(9)%>*x+<%=rs1.getFloat(9)%>*i/2))*0.7*2;
						    } else {
						    	var cena = ((<%=rs.getFloat(9)%>*x+<%=rs.getFloat(9)%>*i/2)
							   		+ (<%=rs1.getFloat(9)%>*x+<%=rs1.getFloat(9)%>*i/2))*0.7*3;
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
			rs1.close();
			ps.close();
			pst.close();
			conn.close();
			} catch (Exception ex) {
				out.println("Unable to connect to database.");
			}
		%>
	</div>
</body>
</html>