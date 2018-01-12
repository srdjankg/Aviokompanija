<jsp:include page="header.jsp" />
<link href="resources/jquery/jquery-ui.css" rel="stylesheet">
<script src="resources/jquery/jquery.js"></script>
<script src="resources/jquery/jquery-ui.js"></script>
<script>
	$(document).ready(function() {
		$("#datumRodj").datepicker({
			dateFormat : 'yy-mm-dd',
			maxDate : -6575,
	    	yearRange: "-70:-18",
	    	changeMonth: true,
	    	changeYear: true
		});
	});
</script>
<div class="sadrzaj">
	<form method="post" class="form" action="KorisnikRegistracija">
		<h2>Registrujte se</h2>
		${ error} <input type="text" placeholder="IME" name="ime" required />
		<input type="text" placeholder="PREZIME" name="prezime" required /> 
		<input type="text" placeholder="KORISNICKO IME" name="imeK" pattern="[0-9a-zA-Z]{4,20}"
			title="Korisnicko ime mora imati minimum 4 karaktera!" required /> 
		<input type="password" placeholder="SIFRA" name="sifra_korisnika" pattern="[0-9a-zA-Z]{4,8}"
			title="Sifra mora imati minimum 4 karaktera!" required /> 
		<input type="email" title="Unesite pravilnu email formu!" placeholder="EMAIL" name="email" required /> 
		<input type="text" class="datum" placeholder="DATUM RODJENJA" onfocus="(this.type='date')" 
			onblur="(this.type='text')" name="datumRodjenja" id="datumRodj" required> 
		<input type="submit" class="dugme" value="REGISTRUJ SE">
	</form>
</div>
</body>
</html>