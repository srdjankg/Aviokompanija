<% 
    session.invalidate();
    session = request.getSession();
    response.sendRedirect("index.jsp");
%>  