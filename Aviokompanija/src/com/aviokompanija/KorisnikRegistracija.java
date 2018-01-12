package com.aviokompanija;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class KorisnikPrijava
 */
@WebServlet("/KorisnikRegistracija")
public class KorisnikRegistracija extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public KorisnikRegistracija() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String ime = request.getParameter("ime");
			String prezime = request.getParameter("prezime");
			String imeK = request.getParameter("imeK");
			String sifra_korisnika = request.getParameter("sifra_korisnika");
			String email = request.getParameter("email");
			String datumRodjenja = request.getParameter("datumRodjenja");
			
			try{
	        //loading drivers for mysql
	        Class.forName("com.mysql.jdbc.Driver");

	        //creating connection with the database 
	          Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/aerodrom","root","");

	        Statement ps=con.createStatement();
	        int i = ps.executeUpdate("insert into korisnici values('"+ime+"','"+prezime+"','"+imeK+"','"+sifra_korisnika+"','"+email+"','"+datumRodjenja+"')");
	        if(i>0) {
	        	  	request.setAttribute("poruka", "<p style=\"color:blue\">Uspesna registracija! Prijavite se<p>");
					request.getRequestDispatcher("Prijava.jsp").forward(request, response);
	        	}
			}
	        catch(Exception e){
        	  	request.setAttribute("error", "<p style=\"color:red\">Korisnicko ime vec postoji!<p>");
				request.getRequestDispatcher("Registracija.jsp").forward(request, response);
	        }
	}
}
