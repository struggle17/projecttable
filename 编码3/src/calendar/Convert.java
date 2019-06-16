package calendar;

import java.util.GregorianCalendar;
import java.util.Calendar;

public class Convert {
	
	private String[] weeks=new String[]{"������","����һ","���ڶ�","������","������","������","������"};
	private int weekInt = 1;
	
	public String getWeek(String date) {
		System.out.println(date);
		GregorianCalendar gc=new GregorianCalendar();
		gc.setLenient(false);
		
		String temp[] = date.split("-");
		if (temp.length == 3) {
			gc.set(Integer.parseInt(temp[0]), Integer.parseInt(temp[1]) - 1, Integer.parseInt(temp[2]));
			weekInt = gc.get(Calendar.DAY_OF_WEEK);
		}
		System.out.println(weeks[weekInt - 1]);
		return weeks[weekInt - 1];
	}
	
	//����
/*	public static void main(String args[]) {
		Convert a = new Convert();
		a.getWeek("2010-12-04");
	}*/
}