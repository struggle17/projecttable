<%@ page language="java" contentType="text/html; charset=GBK"%>
<jsp:useBean id="cvariable" class="myUtils.ComVariable" scope="page"></jsp:useBean>

<html>
<head>
<title>����ѧ����Ϣ
</title>
	<script>
	function checkFrom(form) 
	{
		var strNum = form.studentNum.value;
		var length = strNum.length;
		if(length == 0)
		{
			alert("ѧ�Ų���Ϊ��");
			form.studentNum.focus();
			return false;
		} else if (length != 10) {
			alert("ѧ��ֻ��Ϊ10λ����������");
			form.studentNum.focus();
			return false;
		} else {
			for (var i = 0; i < length; i++) {
				if (strNum.charAt(i) > '9' || strNum.charAt(i) < '0') {
					alert("ѧ������ֻ��Ϊ0~9");
					form.studentNum.focus();
					return false;
				}
			}
		}
		if (form.studentName.value.length == 0) {
			alert("ѧ����������Ϊ��");
			form.studentName.focus();
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
            	<font size=6>����ѧ����Ϣ</font>
            		<table width="220", height="160">
            		<tr><td>
            			<form id="addCourse" name="addCourseForm" method="post" action="<%=basePath%>admin/index.jsp?mainPage=opStudent/addStudentOk" onsubmit="return checkFrom(this);">
	            			<P>&nbsp;&nbsp;ѧ&nbsp;��&nbsp;:<input type="text" name="studentNum" size=17/>
	            			<br>ѧ������:<input type="text" name="studentName" size=17/>
						    <br>����Ժϵ:<Select name="deptname">
						    		   <%
						    		   String strTemp[] = cvariable.getDeptnames();
						    		   int length = strTemp.length;
						    		   for (int i = 0; i < length; i++) {
						    		   %>
						    		   <option value=<%=strTemp[i]%>><%=strTemp[i]%>
						    		   <%
						    		   }%>
						   		       </Select>
						   	</P>
						   	<center>
						   	<input type="submit" value="���" name="submit" style="width:100px;height:22px"/>
						   	<input type="button" value="ȡ��������" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opStudent/lookStudents&id=1')" style="width:100px;height:22px"/>
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