<%@ page language="java" contentType="text/html; charset=GBK"%>
<jsp:useBean id="cvariable" class="myUtils.ComVariable" scope="page"></jsp:useBean>

<html>
<head>
<title>���ӽ�����Ϣ</title>
	<script>
	function checkFrom(form) 
	{
		var strNum = form.classroomNum.value;
		var length = strNum.length;
		var strNum1 = form.holdNum.value;
		var length1 = strNum1.length;
		
		if(length == 0)
		{
			alert("���ұ�Ų���Ϊ��");
			form.classroomNum.focus();
			return false;
		} else {
			for (var i = 0; i < length; i++) {
				if (!((strNum.charAt(i) >= 'a' && strNum.charAt(i) <= 'z') ||
					  (strNum.charAt(i) >= 'A' && strNum.charAt(i) <= 'Z') ||
					  (strNum.charAt(i) >= '0' && strNum.charAt(i) <= '9') ||
					   strNum.charAt(i) == '_')) {
					alert("�γ̱�Ų��Ϸ�\n����Ϊ���֣���ĸ���»���");
					form.classroomNum.focus();
					return false;
				}
			}
		}
		if(length1 == 0)
		{
			alert("������������Ϊ��!");
			form.holdNum.focus();
			return false;
		} else {
			for (var i = 0; i < length1; i++) {
				if (strNum1.charAt(i) < '0' || strNum1.charAt(i) > '9') {
					alert("�����������Ϸ�\n����Ϊ30~300������");
					form.holdNum.focus();
					return false;
				}
			}
			if (strNum1 > 300 || strNum1 < 30) {
				alert("�����������Ϸ�\n����Ϊ30~300������");
				form.holdNum.focus();
				return false;
			}
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
            	<font size=6>���ӽ�����Ϣ</font>
            		<table width="220", height="160">
            		<tr><td>
            			<form id="addClassroom" name="addClassroomForm" method="post" action="<%=basePath%>admin/index.jsp?mainPage=opClassroom/addClassroomOk" onsubmit="return checkFrom(this);">
	            			<P> ���ұ��:<input type="text" name="classroomNum" size=17/>
	            			<br>��������:<input type="text" name="holdNum" size=17/><br>
						         ��&nbsp;&nbsp;&nbsp;&nbsp;��:<Select name="deviceType" style="width:131px">
												    		   <%
												    		   String strTemp[] = cvariable.getDevices();
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
						   	<input type="button" value="ȡ��������" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opClassroom/lookClassrooms&id=1')" style="width:100px;height:22px"/>
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