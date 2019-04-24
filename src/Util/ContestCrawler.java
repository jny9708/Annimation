package Util;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class ContestCrawler {
	
	public void Crawling() throws Exception {
		String url = "https://www.wevity.com/?c=find&s=1&gub=1&sp=contents&sw=%EC%95%A0%EB%8B%88%EB%A9%94%EC%9D%B4%EC%85%98&gp=1";
		Document doc=Jsoup.connect(url).get();
		Elements element = doc.select("ul.list li div.tit a");
		

		int idx=0;
		for(Element el : element) {
			System.out.println("======================");
			System.out.println(el.attr(++idx + "href"));
		}
		
		 
		
	}
	

}
