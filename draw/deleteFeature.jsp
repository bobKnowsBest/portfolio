<%@page import="java.text.SimpleDateFormat"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="javax.servlet.*" %>

<%@page import="javax.servlet.http.*" %>

<%@page import="java.util.*,java.sql.*,java.io.*" %>

 

<html>

<%!Connection con1; %>

<%!Statement s2; %>






<% String name=request.getParameter("q");
//out.println(name);


try{
Class.forName("org.postgresql.Driver");
con1=DriverManager.getConnection
("jdbc:postgresql://localhost:5432/chicagoTest","postgres","pass");
s2=con1.createStatement();

int rowsAdded = 0;
int rowIter=0;
while(rowsAdded==0 && rowIter<=100){
String myQuery = "delete from myschema.mydraw where geom='"+name+"'";
rowsAdded = s2.executeUpdate(myQuery);rowIter+=1;}


//s2.executeQuery("delete from myschema.mydraw where geom='"+name+"'");
//s2.executeQuery("INSERT INTO myschema.mydraw(geom) VALUES('"+name+"')");
//s2.executeQuery("INSERT INTO myschema.mydraw (geom) VALUES ('BOB')");
//s1=con1.createStatement();
}catch(Exception e){ e.printStackTrace(); }

try{s2.close();}catch(Exception e){e.printStackTrace();}
try{con1.close();}catch(Exception e){e.printStackTrace();}
%>
;



</html>