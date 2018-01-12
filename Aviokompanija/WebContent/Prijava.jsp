<jsp:include page="header.jsp" />
<div class="stranica">
	<div class="logovanje">
		<form method="post" class="form" action="KorisnikPrijava">
			<h2>Dobrodosli nazad!</h2>
			${error } ${poruka }
			<input type="text" name="imeK" placeholder="KORISNICKO IME" required>
			<input type="password" name="sifra_korisnika" placeholder="SIFRA" required>
			<input type="submit" class="dugme" value="PRIJAVI SE">
			<p>Nemate nalog? <a href="Registracija.jsp" class="pos">Registrujte se</a></p>
		</form>
	</div>
</div>
</body>
</html>