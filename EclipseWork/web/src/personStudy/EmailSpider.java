package personStudy;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class EmailSpider {

	public static void main(String[] args) {
		try {
			BufferedReader br = new BufferedReader(new FileReader("F:\\EclipseWork\\web\\WebContent\\otherStudy\\EmailSpider.html"));
			//BufferedReader 由Reader类扩展而来，提供通用的缓冲方式文本读取，
			//而且提供了很实用的readLine，读取一个文本行，从字符输入流中读取文本，缓冲各个字符，
			//从而提供字符、数组和行的高效读取。
			String line = "";
			while((line = br.readLine()) != null){
				parse(line);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private static void parse(String line) {
		//java.util.regex是一个用正则表达式所订制的模式来对字符串进行匹配工作的类库包。 
		//它包括两个类：Pattern和Matcher Pattern 一个Pattern是一个正则表达式经编译后的表现模式。 
		//Matcher 一个Matcher对象是一个状态机器，它依据Pattern对象做为匹配模式对字符串展开匹配检查。 
		//首先一个Pattern实例订制了一个所用语法与PERL的类似的正则表达式经编译后的模式，
		//然后一个Matcher实例在这个给定的Pattern实例的模式控制下进行字符串的匹配工作。
		Pattern p = Pattern.compile("[\\w[.-]]+@[\\w[.-]]+\\.[\\w]+");
		Matcher m = p.matcher(line);
		while(m.find()){
			System.out.println(m.group());
		}
	}

}
