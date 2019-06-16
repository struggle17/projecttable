package myUtils;

import java.io.FileInputStream;
import java.util.Vector;

public class Translator {
	
	private Vector enStr = new Vector();
	private Vector zhStr = new Vector();
	
	public Translator() {
	}
	
	public void LoadVector(String fileName) {
    	try
    	{
    		FileInputStream io = new FileInputStream(fileName);
		    byte a[] = new byte[io.available()];
		    io.read(a);
		    io.close();
		    String strpai = new String(a);
		    String str[] = strpai.split("\n");
		    for (int i=0; i < str.length; i++) {
		    	String temp[] = str[i].split("=");
		    	enStr.add(temp[0]);
		    	zhStr.add(temp[1]);
		    }
        } catch(Exception g){
        	System.out.println("Fail...");
        }
	}
	
	public String translate(String str) {
		int index = enStr.indexOf(str);
		if (index != -1) {
			//System.out.println(enStr.indexOf(str));
			//System.out.println((String)zhStr.elementAt(index));
			return (String)zhStr.elementAt(index);
		}
		return str;
	}

	/*public static void main(String[] args) {
		Translator my = new Translator("enToZh.txt");
		my.translate("sName");
	}*/
	
}