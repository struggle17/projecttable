<%@ page language="java" contentType="text/html; charset=GBK"%>
<jsp:useBean id="cvariable" class="myUtils.ComVariable" scope="page"></jsp:useBean>

<html>
<head>
<title>���ӿγ�</title>
	<script>
	function checkFrom(form) 
	{
		var strNum = form.teacherNum.value;
		var length = strNum.length;
		if(length == 0)
		{
			alert("��ʦ���Ų���Ϊ��");
			form.teacherNum.focus();
			return false;
		} else {
			for (var i = 0; i < length; i++) {
				if (!((strNum.charAt(i) >= 'a' && strNum.charAt(i) <= 'z') ||
					  (strNum.charAt(i) >= 'A' && strNum.charAt(i) <= 'Z') ||
					  (strNum.charAt(i) >= '0' && strNum.charAt(i) <= '9') ||
					   strNum.charAt(i) == '_')) {
					alert("��ʦ���Ų��Ϸ�\n����Ϊ���֣���ĸ���»���");
					form.teacherNum.focus();
					return false;
				}
			}
		}
		if (form.teacherName.value.length == 0) {
			alert("��ʦ��������Ϊ��");
			form.teacherName.focus();
			return false;
		}
		return true;
	}
	</script>
	<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
	%>
</head>
<body>
    <center>
        <table border="0" cellpadding="0" cellspacing="0" width="800" height="410">
        <tr><td align="center">
            <table border="1" style= "border-collapse:collapse" bordercolor=rgb(2, 50, 112) width="700", height="350">
            <tr><td>
            	<center>
            	<font size=6>���ӽ�ʦ</font>
            		<table width="310", height="180">
            		<tr><td>
            			<form id="addTeacher" name="addTeacherForm" method="post" action="<%=basePath%>admin/index.jsp?mainPage=opTeacher/addTeacherOk" onsubmit="return checkFrom(this);">
	            			<P> ��ʦ����:<input type="text" name="teacherNum" size=17/>
	            			<br>��ʦ����:<input type="text" name="teacherName" size=17/>
	            				�Ա�:<Select name="sex">
            							<option value="��">��
            							<option value="Ů">Ů
	            					</Select>
	            			
						    <br>����Ժϵ:<Select name="deptname">
						    		   <%
						    		   String strDeptnames[] = cvariable.getDeptnames();
						    		   int length = strDeptnames.length;
						    		   for (int i = 0; i < length; i++) {
						    		   %>
						    		   <option value=<%=strDeptnames[i]%>><%=strDeptnames[i]%>
						    		   <%
						    		   }%>
						   		       </Select>
						   	</P>
						   	<center>
						   	<input type="submit" value="���" name="submit" style="width:100px;height:22px"/>
						   	<input type="button" value="ȡ��������" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opTeacher/lookTeachers&id=1')" style="width:100px;height:22px"/>
						   	</center>
	            		</form>
            		</td></tr>
            		</table>
            	</center>
            </td></tr>
            </table>
        </td></tr>
        </table>
    </center>
</body>
</html>