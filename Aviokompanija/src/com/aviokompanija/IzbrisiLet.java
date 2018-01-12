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
 * Servlet implementation class IzbrisiLet
 */
@WebServlet("/IzbrisiLet")
public class IzbrisiLet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IzbrisiLet() {
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
		String id=request.getParameter("idLeta");
		int idLeta=Integer.parseInt(id);
		try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection
                    ("jdbc:mysql://localhost:3306/aerodrom","root","");
        PreparedStatement ps = con.prepareStatement("delete from letovi where id_letovi=?");
        ps.setInt(1, idLeta);
        int i = ps.executeUpdate();
        if(i>0) {
        	request.setAttribute("poruka", "<p style=\"color:blue; text-align:center;\">Uspesno uklonjen let!</p>");
        	request.getRequestDispatcher("LetoviAdmin.jsp").forward(request, response);
        }
        else {
			request.setAttribute("greska", "<p style=\"color:blue; text-align:center;\">Greska u brisanju!</p>");
			request.getRequestDispatcher("LetoviAdmin.jsp").forward(request, response);
        } }
        catch(Exception e)
        {
        	out.println("Something went wrong !! Please try again");
        }
	}

}
