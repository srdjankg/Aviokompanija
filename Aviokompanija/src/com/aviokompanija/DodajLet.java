package com.aviokompanija;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RezervisiLet
 */
@WebServlet("/DodajLet")
public class DodajLet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DodajLet() {
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
	
		String avion = request.getParameter("avion");
		String polaziste = request.getParameter("polaziste");
		String odrediste = request.getParameter("odrediste");
        String datumPolaska = request.getParameter("datumPolaska");
        String vremePolaska = request.getParameter("vremePolaska");
        String vremeDolaska = request.getParameter("vremeDolaska");
        String slobMesta = request.getParameter("slobMesta");
        String c = request.getParameter("cena");
        Float cena = Float.parseFloat(c);
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/aerodrom","root","");
        PreparedStatement ps=con.prepareStatement
                  ("insert into letovi values(default,?,?,?,?,?,?,?,?)");
		ps.setString(1, avion);
		ps.setString(2, polaziste);
		ps.setString(3, odrediste);
		ps.setString(4, datumPolaska);
		ps.setString(5, vremePolaska);
		ps.setString(6, vremeDolaska);
		ps.setString(7, slobMesta);
		ps.setFloat(8, cena);
        int i=ps.executeUpdate();
        
          if(i>0)
          {
	    	  	request.setAttribute("poruka", "<p style=\"color:blue; text-align:center;\">Uspesno dodat let!</p>");
				request.getRequestDispatcher("AdminLet.jsp").forward(request, response);
          }
        
        }
        catch(Exception se)
        {
        	out.println("Something went wrong !! Please try again");
        }
	
      }

}
