<jsp:include page="header.jsp" />

<link href="resources/jquery/jquery-ui.css" rel="stylesheet">
<script src="resources/jquery/jquery.js"></script>
<script src="resources/jquery/jquery-ui.js"></script>

<script>
	$(document).ready(function() {
		$("#datum").datepicker({
			dateFormat : 'yy-mm-dd',
			minDate : +1
		});
		$("#datumOd").datepicker({
			dateFormat : 'yy-mm-dd',
			minDate : +1,
			onSelect : function(selectedDate) {
				$('#datumDo').datepicker("option", "minDate", selectedDate);
			}
		});
		$("#datumDo").datepicker({
			dateFormat : 'yy-mm-dd',
			minDate : +1
		});
	});
	
	function toggle(theform) {
		document.getElementById("id1").style.display = "none";
		document.getElementById("id2").style.display = "none";
		document.getElementById(theform).style.display = "block";
	}
</script>

<body>

	<div class="sadrzajL">
		${ greska1 } ${ greska2 }
		<div class="pretraga">
			<br>
			<h1>
				Putujte sigurno. <span id="spanL">Putujte jeftino.</span>
			</h1>
			<br>
			<div class="letovi">
				<br>
				<%
					if (session.getAttribute("imeK") != null) {
				%>
				<h2 id="porDob">Dobrodosli ${sessionScope.imeK}!</h2>
				<%
					}
				%>
				<h2>Gde zelite da letite?</h2>
				<div class="ppp">
					<label> <input type="radio" name="myradio"
						checked="checked" class="myradio" value="1" onclick="toggle('id1');" />&nbsp;JEDAN SMER
					</label> <label> &nbsp;&nbsp;&nbsp;<input type="radio"
						name="myradio" class="myradio" value="2" onclick="toggle('id2');" />&nbsp;POVRATNO PUTOVANJE
					</label>
				</div>
				<br>
				<br>
				<form method="post" class="traziLetove" action="LetoviPretraga.jsp" id="id1">
					<input type="text" list="Od" name="polaziste" class="mesto"
						placeholder="OD"  oninvalid="this.setCustomValidity('Unesite mesto polaska')"
    					oninput="setCustomValidity('')" required>
					<datalist id="Od">
						<option value="Beograd" class="opcije">Beograd</option>
						<option value="Pariz" class="opcije">Pariz</option>
						<option value="Rim">Rim</option>
						<option value="Madrid">Madrid</option>
						<option value="Dubai">Dubai</option>
					</datalist>
					
					<img src="resources/slike/strelica.png" class="logoSlika"
						width="68px" height="47px" alt="avion"> <input type="text"
						list="Do" name="odrediste" class="mesto" placeholder="DO"
						oninvalid="this.setCustomValidity('Unesite zeljenu destinaciju')"
    					oninput="setCustomValidity('')" required>
						
					<datalist id="Do">
						<option value="Beograd">Beograd</option>
						<option value="Pariz">Pariz</option>
						<option value="Rim">Rim</option>
						<option value="Madrid">Madrid</option>
						<option value="Dubai">Dubai</option>
					</datalist>
					<br> <br> <input type="text" id="datum" class="datum1" placeholder="DATUM POLASKA" 
						onfocus="(this.type='date')" onblur="(this.type='text')" name="datumPolaska" required>

					<input type="submit" class="dugmeT" value="PRETRAZI LETOVE">
				</form>
				
				<form method="post" class="traziLetove" action="PovratniLetovi.jsp"
					id="id2" style="display: none">

					<input type="text" list="Od" name="polaziste" class="mesto"
						placeholder="OD"  oninvalid="this.setCustomValidity('Unesite mesto polaska')"
    					oninput="setCustomValidity('')" required>
					<datalist id="Od">
						<option value="Beograd" class="opcije">Beograd</option>
						<option value="Pariz" class="opcije">Pariz</option>
						<option value="Rim">Rim</option>
						<option value="Madrid">Madrid</option>
						<option value="Dubai">Dubai</option>
					</datalist>

					<img src="resources/slike/strelica.png" class="logoSlika"
						width="68px" height="47px" alt="avion"> <input type="text"
						list="Do" name="odrediste" class="mesto" placeholder="DO" 
						oninvalid="this.setCustomValidity('Unesite zeljenu destinaciju')"
    					oninput="setCustomValidity('')" required>
					<datalist id="Do">
						<option value="Beograd">Beograd</option>
						<option value="Pariz">Pariz</option>
						<option value="Rim">Rim</option>
						<option value="Madrid">Madrid</option>
						<option value="Dubai">Dubai</option>
					</datalist>
					<br> <br> <input type="text" id="datumOd" class="datum1" placeholder="DATUM POLASKA" 
						onfocus="(this.type='date')" onblur="(this.type='text')" name="datumPolaska" required>
						
					<img src="resources/slike/strelica2.png" class="logoSlika" width="68px" height="47px" alt="avion"> 
					
					<input type="text" id="datumDo" class="datum2" placeholder="DATUM POVRATKA"
						onfocus="(this.type='date')" onblur="(this.type='text')" name="datumPovratka" required>
					<input type="submit" class="dugmeT" value="PRETRAZI LETOVE">
				</form>
			</div>
		</div>
	</div>
</body>
</html>