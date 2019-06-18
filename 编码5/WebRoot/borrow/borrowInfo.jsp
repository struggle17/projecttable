<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*"%> 
<jsp:useBean id="result" class="cd.ConnetDB" scope="page"/>
<jsp:useBean id="convert" class="calendar.Convert" scope="page"/>

<HTML>

<STYLE type=text/css>
BODY {
Background-image: url(../img/Clear.jpg);
}
</STYLE>
<center>
  <H1><font color=red>空闲教室
  
  <BR>
  <% String clStr=request.getParameter("classroom");
     String dateStr=request.getParameter("date");
     String periodStr=request.getParameter("period");
     String useforStr=request.getParameter("usefor");
     
     String clnoStr="";
     int i = 0;
     String str="",weekdayStr="";
     
     byte b1[] = clStr.getBytes("ISO-8859-1");
     clStr = new String(b1);
     
     byte b2[] = periodStr.getBytes("ISO-8859-1");
     periodStr = new String(b2);
     
     byte b3[] = useforStr.getBytes("ISO-8859-1");
     useforStr = new String(b3);
     
     weekdayStr = convert.getWeek(dateStr);
     
     if(clStr.equals("教学楼")){
        str="select * from Classroom where clno like '2___' or clno like 'XJ___' or clno like 'DJ___' and clno not in" +
        "(select clno from Schedule "+
        "where  weekday = '"+weekdayStr+"' and period = '"+periodStr+"')";
     }   
     
     if(clStr.equals("实验楼")){
        str="select * from Classroom where clno like 'S___' or clno like 'SJ_' and clno not in" +
        "(select clno from Schedule "+
        "where  weekday = '"+weekdayStr+"' and period = '"+periodStr+"')";
     }
     
     if(clStr.equals("综合楼")){
        str="select * from Classroom where clno like 'YF____' and clno not in" +
        "(select clno from Schedule "+
        "where  weekday = '"+weekdayStr+"' and period = '"+periodStr+"')";
     }
 
     ResultSet rs = result.connetSQL(str);
     String[] clno = new String[100];
 
 
    out.print("<BR>");
	out.println("<table width = '50%' border = 1 bordercolor = cyan cellspacing='0' cellpadding='0'  class = Tab> ");
	out.println("<tr>");
	out.println("<th>教室号</th>");
	out.println("<th>设备</th>");
	out.println("<th>容纳人数</th>");
	out.println("<th>日期</th>");
	out.println("<th>时间段</th>");
	out.println("<th>节次</th>");
	out.println("<th>借用</th>");

	out.println("</tr>");
	while(rs.next()) {
	   out.print("<tr>");
%>	   
	   <td align = center><%=rs.getString(1)%></td>
	   <td align = center><%=rs.getString(2)%></td>
	   <td align = center><%=rs.getString(3)%></td>
	   <td align = center><%=dateStr%></td>
	   <td align = center><%=weekdayStr%></td>
	   <td align = center><%=periodStr%></td>
	 <%  clno[i] = rs.getString(1) ; %>
	   <td align = center>
	       <form action="rs_borrow.jsp" method="post">
	            <input type="hidden" name="date" value="<%=dateStr%>">
	            <input type="hidden" name="weekday" value="<%=weekdayStr%>">
	            <input type="hidden" name="period" value="<%=periodStr%>">
	            <input type="hidden" name="usefor" value="<%=useforStr%>">
	            <input type="hidden" name="clno" value="<%=clno[i]%>">
	            <input type="hidden" name="index" value="<%=i%>">
	            <input type="submit" name="submit[<%=i%>]" value="申请">
           </form>
       </td>
<%     
      i++;
    
	 }

  %>
 
</center>
</html>