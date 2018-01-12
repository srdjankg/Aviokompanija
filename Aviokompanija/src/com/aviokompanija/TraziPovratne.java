package com.aviokompanija;


import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TraziPovratne")
public class TraziPovratne extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
     * @see HttpServlet#HttpServlet()
     */
    public TraziPovratne() {
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
	        String datumPovratka = request.getParameter("datumPovratka");
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/aerodrom","root","");    
	        PreparedStatement pst = conn.prepareStatement("Select * from letovi where polaziste=? and odrediste=? and datumPolaska=?");
	        PreparedStatement ps = conn.prepareStatement("Select * from letovi where polaziste=? and odrediste=? and datumPolaska=?");
	        pst.setString(1, polaziste);
	        pst.setString(2, odrediste);
			pst.setString(3, datumPolaska);
	        ps.setString(1, odrediste);
	        ps.setString(2, polaziste);
			ps.setString(3, datumPovratka);
			String str = "<table><tr><th>Id leta</th><th>Avion</th><th>Polaziste</th>"
					+ "<th>Odrediste</th><th>Datum polaska</th><th>Vreme polaska</th><th>Vreme dolaska</th><th>Cena</th></tr>";	
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
	        		str += "<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+
	        		"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td>";
			}
	        str +="</table>";
	        out.println(str);
	        String str1 = "<br><br><table><tr><th>Id leta</th><th>Avion</th><th>Polaziste</th>"
					+ "<th>Odrediste</th><th>Datum polaska</th><th>Vreme polaska</th><th>Vreme dolaska</th><th>Cena</th></tr>";	
	        ResultSet rs1 = ps.executeQuery();
		        while(rs1.next()) {
	        		str1 += "<tr><td>"+rs1.getString(1)+"</td><td>"+rs1.getString(2)+"</td><td>"+rs1.getString(3)+"</td><td>"+rs1.getString(4)+
	        		"</td><td>"+rs1.getString(5)+"</td><td>"+rs1.getString(6)+"</td><td>"+rs1.getString(7)+"</td><td>"+rs1.getFloat(8)*1.3+"</td>";
		        }
		        str1 +="</table>";
		        out.println(str1);
		}
		catch(Exception e){       
	       	out.println("Something went wrong !! Please try again");       
	   }finally {
		   out.close();
	   }
	}

}