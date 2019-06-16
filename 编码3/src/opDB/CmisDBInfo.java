package opDB;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CmisDBInfo {
	
	private ConnectDB schedule = new ConnectDB();
	private String strQuery = "";
	private String courseNum[] = null;
	private String courseName[] = null;
	private String courseNameString = "";
	private String courseDeptname[] = null;
	private String courseDeptnameString = "";
	private String courseString = "";
	private String classroomNum[] = null;
	private String classroomString = "";
	private String teacherNum[] = null;
	private String teacherName[] = null; 
	private String teacherNameString = ""; 
	private String teacherDeptname[]= null;
	private String teacherDeptnameString = "";
	private String teacherString = "";
	
	public CmisDBInfo () {
		schedule.connect("cmisdb");
	}
	
	public int getResultRows(ResultSet rs) {
		int rows = 0;
		if (rs != null) {
			try {
				rs.absolute(-1);
				rows = rs.getRow();
				rs.beforeFirst();
			} catch (SQLException e) {
			}
		}
		return rows; 
	}
	
	private String getCommonString(ResultSet rs, int index) {
		StringBuffer strBuffer = new StringBuffer(""); 
		for(int i = 1; i <= getResultRows(rs); i++){ 
			try {
				rs.absolute(i);
				strBuffer.append( "'"+rs.getString(index)+"',"); 
			} catch (SQLException e) {
			}
		}
		String strTemp = strBuffer.toString(); 
		if(strTemp.endsWith(",")){ //È¥³ýÎ²²¿µÄ¶ººÅ 
			strTemp = strTemp.substring(0, strTemp.length() - 1); 
		} 
		return strTemp; 
	}
	
	private String[] getCommons(ResultSet rs, int index) {
		String strTemp[] = new String[getResultRows(rs)];
		for (int i = 0; i < strTemp.length; i++) {
			try {
				rs.absolute(i + 1);
				strTemp[i] = rs.getString(index);
			} catch (SQLException e) {
			}
		}
		return strTemp;
	}
	
	public void loadClassrooms() {
		strQuery = "SELECT * FROM Classroom";
		ResultSet rs = schedule.queryDB(strQuery);
		classroomString = getCommonString(rs, 1);
		classroomNum = getCommons(rs, 1);
	}
	
	public String[] getClassrooms() {
		return classroomNum;
	}
	
	public String getClassroomString() {
		return classroomString;
	}
	
	public void loadCourses() {
		strQuery = "SELECT * FROM Course";
		ResultSet rs = schedule.queryDB(strQuery);
		courseName = getCommons(rs, 2);
		courseNameString = getCommonString(rs, 2);
		courseDeptnameString = getCommonString(rs, 5);
		courseString = getCommonString(rs, 1);
		courseNum = getCommons(rs, 1);
		courseDeptname = getCommons(rs, 5);
	}
	
	public String[] getCourses() {
		return courseNum;
	}
	
	public String[] getCourseNames() {
		return courseName;
	}
	
	public String[] getCourseDeptnames() {
		return courseDeptname;
	}
	
	public String getCourseDeptnameString() {
		return courseDeptnameString;
	}
	
	public String getCourseString() {
		return courseString;
	}
	
	public String getCourseNameString() {
		return courseNameString;
	}
	
	public void loadTeachers() {
		strQuery = "SELECT * FROM Teacher";
		ResultSet rs = schedule.queryDB(strQuery);
		teacherName = getCommons(rs, 2);
		teacherNameString = getCommonString(rs, 2);
		teacherDeptnameString = getCommonString(rs, 4);
		teacherString = getCommonString(rs, 1);
		teacherNum = getCommons(rs, 1);
		teacherDeptname = getCommons(rs, 4); 
	}
	
	public String[] getTeachers() {
		return teacherNum;
	}
	
	public String[] getTeacherNames() {
		return teacherName;
	}
	
	public String[] getTeacherDeptnames() {
		return teacherDeptname;
	}
	
	public String getTeacherDeptnameString() {
		return teacherDeptnameString;
	}
	
	public String getTeacherString() {
		return teacherString;
	}
	
	public String getTeacherNameString() {
		return teacherNameString;
	}
	
	public String getCourseName(String cno) {
		String strReturn = "";
		String strQuery = "SELECT * FROM Course where cno='"+cno+"'";
		ResultSet rs = schedule.queryDB(strQuery);
		try {
			if (rs.next()) {
				strReturn = rs.getString(2);
			}
		} catch (SQLException e) {
		}
		return strReturn;
	}
	
	public String getCourseDeptName(String cno) {
		String strReturn = "";
		String strQuery = "SELECT * FROM Course where cno='"+cno+"'";
		ResultSet rs = schedule.queryDB(strQuery);
		try {
			if (rs.next()) {
				strReturn = rs.getString(5);
			}
		} catch (SQLException e) {
		}
		return strReturn;
	}
	
	public String getTeacherName(String tno) {
		String strReturn = "";
		String strQuery = "SELECT * FROM Teacher where tno='"+tno+"'";
		ResultSet rs = schedule.queryDB(strQuery);
		try {
			if (rs.next()) {
				strReturn = rs.getString(2);
			}
		} catch (SQLException e) {
		}
		return strReturn;
	}
	
	public void disConnect() {
		schedule.disConnect();
	}

	/*public static void main(String[] args) {
		ScheduleInfo info = new ScheduleInfo();
		String str = info.getCourseString();
		String str1[] = info.getTeachers();
		String str2[] = info.getTeacherNames();
		String str3 = info.getTeacherString();
		System.out.println(str3);
		for (int i = 0; i < str1.length; i++) {
			System.out.println(str1[i]);
			System.out.println(str2[i]);
		}
	}*/

}
