package com.aviokompanija;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/KorisnikPrijava")
public class KorisnikPrijava extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public KorisnikPrijava() {
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false); 
	    if(session.getAttribute("imeK")!=null) {
	    	try {
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aerodrom","root","");
	        PreparedStatement ps = con.prepareStatement("select * from korisnici where imeK=?");
	        try {    
	            String imeKsession = session.getAttribute("imeK").toString();
	            ps.setString(1, imeKsession);
	            ResultSet rs = ps.executeQuery();
	            if(rs.next()) {
	                int iO = imeKsession.indexOf('@');
	                boolean cookieCheck=false;
	                Cookie ck[] = request.getCookies();
	                for(int i=0;i<ck.length;i++) {
	                    if(ck[i].getName().equals(imeKsession.substring(0,iO))) {
	                        cookieCheck = true;
	                        break;
	                }	}
	                if(!cookieCheck) {
	                    if("POST".equalsIgnoreCase(request.getMethod())) {
	                        if(request.getParameter("cookieSubmit")!=null) {
	                            if(request.getParameter("cookieSubmit").equals("Submit"))  {
	                                Cookie cookie = new Cookie(imeKsession.substring(0,iO), request.getParameter("imeK"));
	                                cookie.setMaxAge(10000);
	                                response.addCookie(cookie);
	        
	                            	}
	                            }
	                        }
	                    }
	                }
	            }
	        catch(SQLException e) {
	            System.out.println(e);
	        }       
	    }
	    catch(Exception e) {
	    	System.out.println(e);
		}
	}
		try{
	        String imeK = request.getParameter("imeK");   
	        String sifra_korisnika = request.getParameter("sifra_korisnika");
	        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
	        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/aerodrom","root","");    
	        PreparedStatement pst = conn.prepareStatement("Select imeK, sifra_korisnika from korisnici where imeK=? and sifra_korisnika=?");
	        pst.setString(1, imeK);
	        pst.setString(2, sifra_korisnika);
	        ResultSet rs = pst.executeQuery();
	        if(imeK.equals("admin") && sifra_korisnika.equals("1234")){
				response.sendRedirect("AdminLet.jsp");
			}	
	        else if(rs.next()) {
				response.sendRedirect("index.jsp");
				session = request.getSession();
                session.setAttribute("imeK", imeK);
                session.getAttribute(imeK);
	        }      
	        else {
				request.setAttribute("error", "<p style=\"color:red\">Pogresno ime ili lozinka!</p>");
				request.getRequestDispatcher("Prijava.jsp").forward(request, response);
	        }
	   }	        	
	   catch(Exception e){       
	       	out.println("Greska! Pokusajte ponovo!");       
	   }     
	}
}

