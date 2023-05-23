import java.text.SimpleDateFormat;
import java.util.*;
class date
{
    public static void main(String[] args) {
        Date date = new Date();
	    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yy");
	    String str = formatter.format(date);
	    System.out.print("Current date: "+str);
    }
}