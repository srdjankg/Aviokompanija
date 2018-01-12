package com.aviokompanija;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RezervisiLet
 */
@WebServlet("/RezervisiLet")
public class RezervisiLet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RezervisiLet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String klasa = request.getParameter("klasa");
		String let = request.getParameter("let");
		String b = request.getParameter("brojPutnika");
		int brojPutnika = Integer.parseInt(b);
		String bD = request.getParameter("brojDece");
		int brojDece = Integer.parseInt(bD);
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection  con=DriverManager.getConnection
                     ("jdbc:mysql://localhost:3306/aerodrom","root","");
        PreparedStatement ps1=con.prepareStatement
                ("insert into rezervacije values(default,?,?,default,?,?,?,?)");
        PreparedStatement ps = con.prepareStatement("Select slobMesta, cena from letovi where id_letovi=?");
        PreparedStatement ps2=con.prepareStatement
                ("update letovi set slobMesta=slobMesta-? where id_letovi=?");
        
        HttpSession session = request.getSession(false);
        ps1.setString(1, (String) session.getAttribute("imeK"));
		ps1.setString(2, let);
		ps1.setInt(3, brojPutnika);
		ps1.setInt(4, brojDece);
		ps1.setString(5, klasa);
		ps.setString(1, let);
		ps2.setInt(1, brojPutnika+brojDece);
		ps2.setString(2, let);
		
		ResultSet rs1 = ps.executeQuery();
		
        if(rs1.next()) {
        if((rs1.getInt(1)-brojPutnika-brojDece)>=0) {
        	if ( klasa.contains("Ekonomska")){
        		ps1.setFloat(6, (rs1.getFloat(2)*brojPutnika+rs1.getFloat(2)/2*brojDece));
        	}
        	else if ( klasa.contains("Biznis")){
        		ps1.setFloat(6, (rs1.getFloat(2)*brojPutnika*2+rs1.getFloat(2)*brojDece));
        	}
        	else if ( klasa.contains("Prva")){
        		ps1.setFloat(6, (rs1.getFloat(2)*brojPutnika*3+rs1.getFloat(2)/2*brojDece*3));
        	}
            int i=ps1.executeUpdate();
            int j=ps2.executeUpdate();
        if(i>0 && j>0) {
    	  	request.setAttribute("poruka", "<p style=\"color:blue; text-align:center;\">Uspesna rezervacija!</p>");
			request.getRequestDispatcher("RezervacijeKor.jsp").forward(request, response);
        } } else {
        	request.setAttribute("greska1", "<p style=\"color:red; text-align:center;\""
        			+ ">Nema dovoljno slobodnih mesta!<br>Probajte sa drugim letom</p>");
			request.getRequestDispatcher("index.jsp").forward(request, response);
        	}
        } }
        catch(Exception se)
        {
        	out.println("Something went wrong !! Please try again");
        }
      }
}
