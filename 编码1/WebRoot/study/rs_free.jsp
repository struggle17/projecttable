<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*"%> 
<jsp:useBean id="result" class="cd.ConnetDB" scope="page"/>

<HTML>

<STYLE type=text/css>
BODY {
Background-image: url(../img/Clear.jpg);
}
</STYLE>

<BODY>
<title>空教室查询结果</title>
<CENTER>
  <H1><FONT COLOR=RED>空教室查询结果
<BR>
  <FONT Size=4 COLOR=black>
  
  <% String clStr=request.getParameter("classroom");
     String weekStr=request.getParameter("weekday");
     String periodStr=request.getParameter("period");
   %>
   
   
  <FORM action="rs_free.jsp" method = post name = form>
    <table border=1 bordercolor = green width = 30%>
    <td>教学楼:
    <Select name = "classroom">
       <Option value="教学楼">教学楼</Option>
       <Option value="实验楼">实验楼</Option>
       <Option value="逸夫楼">逸夫楼</option>
    </Selcet> 
    </td>
    <td>
    星期:
    <Select name = "weekday">
       <Option value="星期一">星期一</Option>
       <Option value="星期二">星期二</Option>
       <Option value="星期三">星期三</Option>
       <Option value="星期四">星期四</Option>
       <Option value="星期五">星期五</Option>
       <Option value="星期六">星期六</Option>
       <Option value="星期日">星期日</Option>
    </Selcet>
    </td>
    <td>空闲时间段:
		  <select name="period">
		     <option value="一二节">一二节</option>
		     <option value="三四节">三四节</option>
		     <option value="五六节">五六节</option>
		     <option value="七八节">七八节</option>
		     <option value="九十节">九十节</option>
		  </select></td>
    <td>
    <INPUT type="submit" value="查看" name="submit">
    </td>
   </table>
  </FORM>
  
  
  <% 

     String str=" ";
     
     byte b1[] = clStr.getBytes("ISO-8859-1");
     clStr = new String(b1);
     
     byte b2[] = weekStr.getBytes("ISO-8859-1");
     weekStr = new String(b2);
     
     byte b3[] = periodStr.getBytes("ISO-8859-1");
     periodStr = new String(b3);
     
     if(clStr.equals("教学楼")){
        str="select * from Classroom where clno like '2___' or clno like 'XJ___' or clno like 'DJ___' and clno not in" +
        "(select clno from Schedule "+
        "where  period = '"+periodStr+"' and weekday = '"+weekStr+"') ";
     }   
     
     if(clStr.equals("实验楼")){
        str="select * from Classroom where clno like 'S___' or clno like 'SJ_' and clno not in" +
        "(select clno from Schedule "+
        "where  period = '"+periodStr+"' and weekday = '"+weekStr+"')";
     }
     
     if(clStr.equals("逸夫楼")){
        str="select * from Classroom where clno like 'YF____' and clno not in" +
        "(select clno from Schedule "+
        "where  period = '"+periodStr+"' and weekday = '"+weekStr+"')";
     }
 
     ResultSet rs = result.connetSQL(str);
    
 
    out.print("<BR>");
	out.println("<table width = '30%' border = 1 bordercolor = cyan cellspacing='0' cellpadding='0'  class = Tab> ");
	out.println("<tr>");
	out.println("<th>教室号</th>");
	out.println("<th>设备</th>");
	out.println("<th>容纳人数</th>");
	out.println("<th>时间段</th>");
	out.println("<th>节次</th>");
	
	
	out.println("</tr>");
	while(rs.next()) {
	   out.print("<tr>");
	   out.println("<td align = center>"+rs.getString(1)+"</td>");
	   out.println("<td align = center>"+rs.getString(2)+"</td>");
	   out.println("<td align = center>"+rs.getString(3)+"</td>");
	   out.println("<td align = center>"+weekStr+"</td>");
	   out.println("<td align = center>"+periodStr+"</td>");
	   out.print("</tr>");
	}
%>
<table>
<td height=70>
<input type="button" name="return" value="返回首页" onclick="window.location.href('../welcome.jsp')" style="heigth = 100 width:70px"/>
</td>
</table>
  

</CENTER>
</BODY>
<HTML>