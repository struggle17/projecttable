<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*"%> 
<jsp:useBean id="result" class="cd.ConnetDB" scope="session"/>
<HTML>
<STYLE type=text/css>
BODY {
Background-image: url(../img/Clear.jpg);
}
</STYLE>
<BODY>


<% String QueryType = request.getParameter("search");
   if(QueryType==null)
   {
     QueryType="";
   }
   if(QueryType.equals("nameSearch"))
   {
%>

<title>�γ�����ѯ</title>
<CENTER>
  <H1><FONT COLOR=RED>�γ�����ѯ
<BR>

  
  <FONT Size=4><FONT COLOR=black>
  <FORM action="rs_Cname.jsp" method = post name = form>
    <P>�γ���:<INPUT type = "text" name = "courseName" value="" size=10>
    
   <BR><BR><INPUT type="submit" value="�ύ��ѯ����" name="submit">
  </FORM>

<% }

   if(QueryType.equals("dirSearch"))
   {
   
 %>
   <title>Ŀ¼��ѯ</title>
<CENTER>
  <H1><FONT COLOR=RED>Ŀ¼��ѯ
<BR>

  <FONT Size=4><FONT COLOR=black>
  <FORM action="rs_Cdir.jsp" method = post name = form>
    <Select name = "department">
       <Option value="�������Ϣ����ѧԺ">�������Ϣ����ѧԺ
       <Option value="�����ѧԺ">�����ѧԺ
       <Option value="���������ѧԺ">���������ѧԺ
       <Option value="�滮����̬ѧԺ">�滮����̬ѧԺ
       <Option value="���˹���ѧԺ">���˹���ѧԺ
       <Option value="�ִ�����ѧԺ">�ִ�����ѧԺ
       <Option value="���ι���ѧԺ">���ι���ѧԺ
       <Option value="����ѧԺ">����ѧԺ
    </Selcet> 
   <BR><BR><INPUT type="submit" value="�ύ��ѯ����" name="submit">
  </FORM>
<%  
   }
%>


</CENTER>
</BODY>
</HTML>