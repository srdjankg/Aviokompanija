package com.aviokompanija;


import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/traziLetove")
public class traziLetove extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
     * @see HttpServlet#HttpServlet()
     */
    public traziLetove() {
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
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		try{
			String polaziste = request.getParameter("polaziste");
	        String odrediste = request.getParameter("odrediste");
	        String datumPolaska = request.getParameter("datumPolaska");
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/aerodrom","root","");    
	        PreparedStatement pst = conn.prepareStatement("Select * from letovi where polaziste=? and odrediste=? and datumPolaska=?");
	        pst.setString(1, polaziste);
	        pst.setString(2, odrediste);
			pst.setString(3, datumPolaska);
			String str = "<table><tr><th>Id leta</th><th>Avion</th><th>Polaziste</th>"
					+ "<th>Odrediste</th><th>Datum polaska</th><th>Vreme polaska</th><th>Vreme dolaska</th><th>Cena</th></tr>";	
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
	        		str += "<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+
	        		"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getFloat(8)+"</td>";
			}
	        str +="</table>";
	        out.println(str);
		}
		catch(Exception e){       
	       	out.println("Something went wrong !! Please try again");       
	   }finally {
		   out.close();
	   }
	}

}