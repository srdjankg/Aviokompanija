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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class IzbrisiRez
 */
@WebServlet("/IzbrisiRez")
public class IzbrisiRez extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IzbrisiRez() {
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
	        Connection con=DriverManager.getConnection
	                    ("jdbc:mysql://localhost:3306/aerodrom","root","");
	        PreparedStatement ps1 = con.prepareStatement("select let, povratniLet, brojPutnika, brojDece from rezervacije where id_rezervacije=?");
	        PreparedStatement ps = con.prepareStatement("delete from rezervacije where id_rezervacije=? and korisnik=?");
	        PreparedStatement ps2 = con.prepareStatement("update letovi set slobMesta=slobMesta+? where id_letovi=?");
	        PreparedStatement ps22 = con.prepareStatement("update letovi set slobMesta=slobMesta+? where id_letovi=?");
	        ps.setInt(1, idRez);
	        HttpSession session = request.getSession(false);
	        ps.setString(2, (String) session.getAttribute("imeK"));
	        ps1.setInt(1, idRez);
	        ResultSet rs = ps1.executeQuery();
	        
	        if(rs.next()) {
	        	if(rs.getInt(2) > 0) {
	        		ps2.setInt(1, rs.getInt(3)+rs.getInt(4));
	        		ps2.setInt(2, rs.getInt(1));
	        		ps22.setInt(1, rs.getInt(3)+rs.getInt(4));
	        		ps22.setInt(2, rs.getInt(2));
		        	int j = ps2.executeUpdate();
		        	int i = ps.executeUpdate();
	        		int k = ps22.executeUpdate();
	        		if(i>0 && j>0 && k>0) {
		        		request.setAttribute("poruka", "<p style=\"color:blue; text-align:center;\">Uspesno uklonjena rezervacija!</p>");
		        		request.getRequestDispatcher("RezervacijeKor.jsp").forward(request, response);
		        	} else {
		        		request.setAttribute("greskaa", "<p style=\"color:red; text-align:center;\">Ne posedujete rezervaciju sa ovim identifikacionim brojem!</p>");
		        		request.getRequestDispatcher("RezervacijeKor.jsp").forward(request, response);
		        	}
	        	} else {
	        		ps2.setInt(1, rs.getInt(3)+rs.getInt(4));
	        		ps2.setInt(2, rs.getInt(1));
	        		int j = ps2.executeUpdate();
	        		int i = ps.executeUpdate();
	        		if(i>0 && j>0) {
	        			request.setAttribute("poruka", "<p style=\"color:blue; text-align:center;\">Uspesno uklonjena rezervacija!</p>");
	        			request.getRequestDispatcher("RezervacijeKor.jsp").forward(request, response);
	        		} else {
	        			request.setAttribute("greskaa", "<p style=\"color:red; text-align:center;\">Ne posedujete rezervaciju sa ovim identifikacionim brojem!</p>");
	        			request.getRequestDispatcher("RezervacijeKor.jsp").forward(request, response);
	        		}}
	        	}
	        else {
	        	request.setAttribute("greskaa", "<p style=\"color:red; text-align:center;\">Ne posedujete rezervaciju sa ovim identifikacionim brojem!</p>");
	        	request.getRequestDispatcher("RezervacijeKor.jsp").forward(request, response);
	        }
	        }
	        catch(Exception se)
	        {
	        	out.println("Something went wrong !! Please try again");
	        }
	}

}
