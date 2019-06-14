package myUtils;

public class ComVariable {
	
	private String[] deptnames = {"�������Ϣ����ѧԺ", "�����ѧԺ", 
								  "���������ѧԺ", "�滮����̬ѧԺ", "���˹���ѧԺ", 
								  "�ִ�����ѧԺ", "���ι���ѧԺ", "����ѧԺ"};
	private String[] teacherTitles = {"����", "��ʦ", "������", "����"};
	private String[] devices = {"��ý��", "��ͨ"};
	private String[] weekDays = {"����һ", "���ڶ�", "������", "������", "������", "������", "������"};
	private String[] periods = {"һ����", "���Ľ�", "������", "�߰˽�", "��ʮ��"};
	
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
		if(strTemp.endsWith(",")){ //ȥ��β���Ķ��� 
			strTemp = strTemp.substring(0, strTemp.length() - 1); 
		}
		return strTemp;
	}
	
}
