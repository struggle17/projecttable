<%@ page contentType="text/html;charset=GB2312"%>
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
      if(form.user.value=="")
      { 
         alert("�û�������Ϊ��");
         form.user.focus();
         return false;  
       } 
       if(form.pwd.value=="")
      { 
         alert("���벻��Ϊ��");
         form.pwd.focus();
         return false;  
       }
      return true ;
} 
</script> 

<title>�û���¼</title>
<CENTER>
  <H1><FONT COLOR=RED>�û���¼
<BR>
<HR color=green>
  <BR><FONT Size=4><FONT COLOR=black>
  <FORM action="borrow.jsp" name = "form" onsubmit="return checkInput(this);">
   <table>
     <tr>
      <td>
          �û���:<INPUT type = "text" name = "user" value="" size="15" maxlength="30" >
      </td>
    </tr>
    <tr>
     <td>
        <BR>��&nbsp&nbsp��:<INPUT type = "password" name = "pwd" value="" size="15" maxlength="30" >
     </td>
    </tr>
    <tr><td align="center">
    <BR><input type="radio" name="logintype" value="student" checked = "ok">ѧ��&nbsp&nbsp&nbsp<input type="radio" name="logintype" value="teacher">��ʦ
    </td></tr>
    <tr><td align = center>
      <BR><INPUT type="submit" value="��¼" name="submit">&nbsp&nbsp
          <INPUT type="reset" value="����">
    </td></tr>
    </table>
  </FORM>

</CENTER>
</BODY>
<HTML>