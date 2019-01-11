<%-- 
    Document   : index
    Created on : 9 Ιαν 2019, 8:28:34 μ.μ.
    Author     : Νικόλαος Μπέλλιας
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/mycss.css"/>
    </head>
    <body>
        <h1>Welcome to my Dynamic Site</h1>
        <hr>
        <h2><%=new Date() %></h2>
        <h3><%@include file="incnikos.jsp" %></h3>
        <form action="index.jsp" method="post">
            <p><input type="text" name="name" placeholder="Enter your name" autocomplete="off" required/></p>
            <p><input type="email" name="email" placeholder="Your e-mail" required/></p>
            <p><input type="tel" name="phonenumber" placeholder="Your phone number" required/></p>
            <p><input type="datetime" name="birthday" placeholder="Your birthday" required/></p>
            <p><textarea name="message" placeholder="Your message" rows="5" ></textarea></p>
            <h4>Address:</h4>
            <p><input type="text" name="street" placeholder="Your Street"/></p>
            <p><input type="text" name="streetno" placeholder="Your Street number"/></p>
            <p><input type="text" name="zipcode" placeholder="Your zipcode"/></p>
            <p><input type="text" name="city" placeholder="Your City"/></p>
            <p><input type="text" name="state" placeholder="Your State"/></p>
            <p><input type="submit"/><input type="reset"/></p>
        </form>
        <h3><%@include file="myaction.jsp" %></h3>
        <ul>
            <li><a href="about.jsp">About</a></li>
        </ul>
    </body>
</html>
