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

<script language="javascript">
  function checkInput(form)
  {
    if(form.teacherName.value=="")
    { 
       alert("��������Ϊ��");
       form.teacherName.focus();
       return false;  
    }
    return true ;
  } 
</script>

<% String QueryType = request.getParameter("search");
   if(QueryType==null)
   {
     QueryType="";
   }
   if(QueryType.equals("nameSearch"))
   {
%>

<title>��ʦ������ѯ</title>
<CENTER>
  <H1><FONT COLOR=RED>��ʦ������ѯ
<BR>

  
  <FONT Size=4><FONT COLOR=black>
  <FORM action="rs_Tname.jsp"  name = "form" onsubmit="return checkInput(this);">
    <P>����:<INPUT type = "text" name = "teacherName" value="" size=10>
    
   <BR><BR><INPUT type="submit" value="�ύ��ѯ����" name="submit">
  </FORM>

<% }

   if(QueryType.equals("dirSearch"))
   {
   
 %>
   <title>��ʦ Ŀ¼��ѯ</title>
<CENTER>
  <H1><FONT COLOR=RED>Ŀ¼��ѯ
<BR>

  <FONT Size=4><FONT COLOR=black>
  <FORM action="rs_Tdir.jsp" method = post name = form>
    <Select name = "department">
       <Option value="�������Ϣ����ѧԺ">�������Ϣ����ѧԺ
       <Option value="�����ѧԺ">�����ѧԺ
       <Option value="���������ѧԺ">���������ѧԺ
       <Option value="��̬��滮ѧԺ">��̬��滮ѧԺ
       <Option value="���˹���ѧԺ">���˹���ѧԺ
       <Option value="�ִ�����ѧԺ">�ִ�����ѧԺ
       <Option value="���ι���ѧԺ">���ι���ѧԺ
       <Option value="����ѧԺ">����ѧԺ

    </Selcet>
    <INPUT type="submit" value="�ύ��ѯ����" name="submit">
  </FORM>
<%  
   }
%>

</CENTER>
</BODY>
<HTML>