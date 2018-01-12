<jsp:include page="headerAdm.jsp" />
<link href="resources/jquery/jquery-ui.css" rel="stylesheet">
<script src="resources/jquery/jquery.js"></script>
<script src="resources/jquery/jquery-ui.js"></script>
<script>
	$(document).ready(function() {
		$("#dat").datepicker({
			dateFormat : 'yy-mm-dd',
			minDate : +1
		});
	});
</script>

<div class="adminLet">
	<form method="post" class="formAdm" action="DodajLet">
		${ poruka }
		<table>
			<tr>
				<th colspan=2><p style="font-size: 20px;">DODAJ LET</p></th>
			</tr>
			<tr>
				<td><input type="text" list="Od" name="polaziste" id="p"
					placeholder="POLAZISTE" required> <datalist id="Od">
						<option value="Beograd" class="opcije">Beograd</option>
						<option value="Pariz" class="opcije">Pariz</option>
						<option value="Rim">Rim</option>
						<option value="Madrid">Madrid</option>
						<option value="Dubai">Dubai</option>
					</datalist></td>
				<td><input type="text" list="Do" name="odrediste" id="o"
					placeholder="ODREDISTE" required> <datalist id="Do">
						<option value="Beograd" class="opcije">Beograd</option>
						<option value="Pariz" class="opcije">Pariz</option>
						<option value="Rim">Rim</option>
						<option value="Madrid">Madrid</option>
						<option value="Dubai">Dubai</option>
					</datalist></td>
			</tr>
			<tr>
				<td><input type="text" name="avion" id="av" placeholder="AVION"
					required></td>
				<td><input type="text" class="datumP"
					placeholder="DATUM POLASKA" name="datumPolaska" id="dat" required></td>
			</tr>
			<tr>
				<td><input type="text" placeholder="VREME POLASKA"
					name="vremePolaska" id="vrP" onfocus="(this.type='time')"
					onblur="(this.type='text')" required></td>
				<td><input type="text" placeholder="VREME DOLASKA"
					name="vremeDolaska" id="vrD" onfocus="(this.type='time')"
					onblur="(this.type='text')" required></td>
			</tr>
			<tr>
				<td><input type="text" name="slobMesta"
					placeholder="BROJ MESTA" id="sm" required></td>
				<td><input type="text" name="cena" placeholder="CENA" id="c"
					required></td>
			</tr>
			<tr>
				<td colspan=2><input type="submit" id="dugme" name="dLet"
					value="DODAJ LET" id="dod"></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>