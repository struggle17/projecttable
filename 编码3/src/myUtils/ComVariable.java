package myUtils;

public class ComVariable {
	
	private String[] deptnames = {"软件与信息工程学院", "外国语学院", 
								  "经济与管理学院", "规划与生态学院", "东盟国际学院", 
								  "现代体育学院", "旅游管理学院", "艺术学院"};
	private String[] teacherTitles = {"助教", "讲师", "副教授", "教授"};
	private String[] devices = {"多媒体", "普通"};
	private String[] weekDays = {"星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"};
	private String[] periods = {"一二节", "三四节", "五六节", "七八节", "九十节"};
	
	public ComVariable() {
	}
	
	public String[] getDeptnames() {
		return deptnames;
	}
	
	public String[] getTeacherTitles() {
		return teacherTitles;
	}
	
	public String[] getDevices() {
		return devices;
	}
	
	public String[] getWeekDays() {
		return weekDays;
	}
	
	public String[] getPeriods() {
		return periods;
	}
	
	public String getDeptnameString() {
		StringBuffer strBuffer = new StringBuffer(""); 
		for(int i = 0; i < deptnames.length; i++){
			strBuffer.append( "'"+deptnames[i]+"',");
		}
		String strTemp = strBuffer.toString(); 
		if(strTemp.endsWith(",")){ //去除尾部的逗号 
			strTemp = strTemp.substring(0, strTemp.length() - 1); 
		}
		return strTemp;
	}
	
}
