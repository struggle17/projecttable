<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*"%> 
<jsp:useBean id="result" class="cd.ConnetDB" scope="page"/>

<HTML>

<STYLE type=text/css>
BODY {
Background-image: url(../img/Clear.jpg);
}
</STYLE>

<script type="text/javascript" src="calendar.js"></script>
        
<BODY>
<center>
<P>

<script language="javascript"> 
   function checkInput(form)
   { 
      if(form.date.value=="")
      { 
         alert("使用日期不能为空!");
         form.date.focus();
         return false;  
       } 
       if(form.usefor.value=="")
      { 
         alert("用途不能为空!");
         form.usefor.focus();
         return false;  
       }
      return true ;
} 
</script> 

<% 
   String user = (String)session.getAttribute("userName");
   String str = "select clno,usedate,period,usefor,usestatus from Borrow where uno = '"+user+"'";
   ResultSet rs = result.connetSQL(str);
%>

		<title>教室借用</title>
		<CENTER>
		  <H1><FONT COLOR=RED>教室借用</Font></H1>
		  <form action="borrowInfo.jsp" name="form" onsubmit="return checkInput(this);">
		  <table>
		  <tr>
		  <td>
		  教学楼:<Select name = "classroom">
             <Option value="教学楼">教学楼</Option>
             <Option value="实验楼">实验楼</Option>
             <Option value="综合楼">综合楼</option>
          </Selcet></td>
		  
		  <td>
		  使用日期:<input type="text" name="date" value="" id="date" onclick="calendar.show(this);" size="10" maxlength="10" readonly="readonly">&nbsp;
		  </td><td>借用时间段:
		  <select name="period">
		     <option value="一二节">一二节</option>
		     <option value="三四节">三四节</option>
		     <option value="五六节">五六节</option>
		     <option value="七八节">七八节</option>
		     <option value="九十节">九十节</option>
		  </select></td></tr></table>
		  <table><td>用途:<input type="text" name="usefor" size = 40 value=""></td></table>
		  <BR><BR><BR><input type="submit" name="submit" value="查看空闲教室">
		  </form>
		  <BR>	       
		  
    <%  if(rs != null){
           
           out.println("你好! "+user+",  你申请的教室");
     %>
        <BR>
        <table border="1" width = 50% bordercolor = cyan >
          <th>教室号</th>
          <th>使用者编号</th>
          <th>使用日期</th>
          <th>借用时间段</th>
          <th>用途</th>
          <th>状态</th>
     <%
           while(rs.next()){
              out.println("<tr>");
              out.println("<td align=center>"+rs.getString(1)+"</td>");
              out.println("<td align=center>"+user+"</td>");
              out.println("<td align=center>"+rs.getString(2)+"</td>");
              out.println("<td align=center>"+rs.getString(3)+"</td>");
              out.println("<td align=center>"+rs.getString(4)+"</td>");
              if(rs.getString(5).equals("F"))
                  out.println("<td align=center>未批准</td>");
              if(rs.getString(5).equals("T"))
                  out.println("<td align=center>已批准</td>");
              out.println("</tr>");
           }
           
           }
        %>
          </table>
          <%
    
	 
        %>
<BR>     
</BODY>
</HTML>