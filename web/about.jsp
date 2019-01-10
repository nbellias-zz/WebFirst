<%-- 
    Document   : about
    Created on : 9 Ιαν 2019, 8:34:22 μ.μ.
    Author     : Νικόλαος Μπέλλιας
--%>

<%@page import="myclasses.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/mycss.css"/>
    </head>
    <body>
        <h1>About</h1>
        <hr>
        <%
            Student st = new Student();
        %>
        <table>
            <thead>
                <tr>
                    <th>ID</th><th>NAME</th>
                </tr>
            </thead>
            <tbody>
                <% 
                for(Student student: st.fetchStudentsFromDatabase()){
                    out.print("<tr><td>" + student.getId() + "</td><td>" + student.getName() + "</td></tr>");
                };
                %>
            </tbody>
            <tfoot>
                <tr>
                    <td>...</td><td>...</td>
                </tr>
            </tfoot>
        </table>
        <hr>
        <form action="about.jsp" enctype="multipart/form-data">
            <input type="file" name="myfilename"/>
            <input type="submit" value="Upload"/>
        </form>
        <ul>
            <li><a href="index.jsp">Home</a></li>
        </ul>
    </body>
</html>
