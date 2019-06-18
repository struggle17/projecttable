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
         alert("用户名不能为空");
         form.user.focus();
         return false;  
       } 
       if(form.pwd.value=="")
      { 
         alert("密码不能为空");
         form.pwd.focus();
         return false;  
       }
      return true ;
} 
</script> 

<title>用户登录</title>
<CENTER>
  <H1><FONT COLOR=RED>用户登录
<BR>
<HR color=green>
  <BR><FONT Size=4><FONT COLOR=black>
  <FORM action="borrow.jsp" name = "form" onsubmit="return checkInput(this);">
   <table>
     <tr>
      <td>
          用户名:<INPUT type = "text" name = "user" value="" size="15" maxlength="30" >
      </td>
    </tr>
    <tr>
     <td>
        <BR>密&nbsp&nbsp码:<INPUT type = "password" name = "pwd" value="" size="15" maxlength="30" >
     </td>
    </tr>
    <tr><td align="center">
    <BR><input type="radio" name="logintype" value="student" checked = "ok">学生&nbsp&nbsp&nbsp<input type="radio" name="logintype" value="teacher">教师
    </td></tr>
    <tr><td align = center>
      <BR><INPUT type="submit" value="登录" name="submit">&nbsp&nbsp
          <INPUT type="reset" value="重置">
    </td></tr>
    </table>
  </FORM>

</CENTER>
</BODY>
<HTML>