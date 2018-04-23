package util;

public class FormatNumber {
	public String Format(Integer number) {
		String result ="";
		while (number > 0) {
		 Integer text=	number%1000;
		 number = number/1000;
		 String text1 = text.toString();
		 if (text == 0 ) {
			 text1 = "000";
		 }
		 result = "."+text1+ result ;
		}
		String finaltext = result.substring(1, result.length());
		return finaltext;
	}
	
}
