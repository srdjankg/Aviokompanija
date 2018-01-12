package com.aviokompanija;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class IzbrisiRez
 */
@WebServlet("/AdminIzbrisiRez")
public class AdminIzbrisiRez extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminIzbrisiRez() {
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
			String id=request.getParameter("idRez");
			int idRez=Integer.parseInt(id);
			
			try{
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/aerodrom","root","");
	        PreparedStatement ps1 = con.prepareStatement("select let, brojPutnika, brojDece from rezervacije where id_rezervacije=?");
	        PreparedStatement ps = con.prepareStatement("delete from rezervacije where id_rezervacije=?");
	        PreparedStatement ps2 = con.prepareStatement("update letovi set slobMesta=slobMesta+? where id_letovi=?");
	        ps.setInt(1, idRez);
	        ps1.setInt(1, idRez);
	        ResultSet rs = ps1.executeQuery();
	        
	        if(rs.next()) {
	        	ps2.setInt(1, rs.getInt(2)+rs.getInt(3));
	        	ps2.setInt(2, rs.getInt(1));
	        	int j = ps2.executeUpdate();
	        	int i = ps.executeUpdate();
	        	if(i>0 && j>0) {
		        		request.setAttribute("poruka", "<p style=\"color:blue; text-align:center;\">Uspesno uklonjena rezervacija!</p>");
		        		request.getRequestDispatcher("Rezervacije.jsp").forward(request, response);
	        		} else {
		        		request.setAttribute("greska", "<p style=\"color:blue; text-align:center;\">Greska prilikom uklanjanja rezervacije!</p>");
		        		request.getRequestDispatcher("Rezervacije.jsp").forward(request, response);
	        		}
	        	}
	        }
	        catch(Exception se)
	        {
	        	out.println("Something went wrong !! Please try again");
	        }
	}

}
