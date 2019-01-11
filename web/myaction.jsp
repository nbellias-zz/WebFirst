<%@page import="personaldata.PersonAddress"%>
<%@page import="personaldata.Address"%>
<%@page import="personaldata.Person"%>

<%
    if (request.getMethod().equals("POST")) {
        Person person = new Person(
                request.getParameter("name"),
                request.getParameter("email"),
                request.getParameter("phonenumber"),
                request.getParameter("birthday"),
                request.getParameter("message")
        );

        Address address = new Address(
                request.getParameter("street"),
                Integer.parseInt(request.getParameter("streetno")),
                Integer.parseInt(request.getParameter("zipcode")),
                request.getParameter("city"),
                request.getParameter("state")
        );

        PersonAddress personAddress = new PersonAddress(person, address);

        out.print(personAddress);
        out.print("<hr>");
    } else {
        out.print("Not Submitted yet!");
    }
%>

