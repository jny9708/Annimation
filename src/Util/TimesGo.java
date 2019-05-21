package Util;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.TimerTask;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.contest.model.ContestDao;
import com.contest.model.ContestDto;

public class TimesGo extends TimerTask{

	@Override
	public void run() {
		// TODO Auto-generated method stub
		System.out.println("run함수에 들어옴");
		crawler();
	}
	public void crawler() {
		String Domain="https://www.wevity.com/";
		String url = "https://www.wevity.com/?c=find&s=1&gub=1&sp=contents&sw=%EC%95%A0%EB%8B%88%EB%A9%94%EC%9D%B4%EC%85%98&gp=1";
		Document doc=null;
		try {
            doc = Jsoup.connect(url).get();
        } catch (IOException e) {
            e.printStackTrace();
        }
		Elements element = doc.select("ul.list li div.tit a");
		//System.out.println(element);
		ContestDao ContestDao = new ContestDao();
		String con_url=null;
		con_url= ContestDao.getRecentlyUrl();
		for(Element el : element) {
			//여기 안에서 href값이 같으면 크롤링메소드 실행 안시키면 될듯? 여기서 dao가 필요함 저장된 링크가져오는..
			System.out.println("======================");
			System.out.println(Domain + el.attr("href"));
			url=Domain+ el.attr("href");
			if(url.equals(con_url)) {
				System.out.print("맞음!");
				break;
			}else {
				System.out.println(con_url);
				Crawling(url); 
			}
			
			
		}

	}
	
	public static void Crawling(String url) {
		//이제 이 메소드에서 map을 만들어서 dao로 넘겨주면 될듯
		String Domain="https://www.wevity.com/";
		Document detaildoc=null;
		//Map<String,String> map = new HashMap<String,String>();
		ContestDao ContestDao = new ContestDao();
		ContestDto ContestDto = new ContestDto();
		try {
			detaildoc = Jsoup.connect(url).get();
        } catch (IOException e) {
            e.printStackTrace();
        }
		Elements element = detaildoc.select(".cd-area");
		for(Element el : element) {
			ContestDto.setCon_img(Domain+el.select(".img .thumb img").attr("src"));
			System.out.println(ContestDto.getCon_img());
			
		}
		element = detaildoc.select(".cd-info-list");
		for(Element el : element) {
			
			String text = el.text();
			int field = text.indexOf("분야");
			int target = text.indexOf("응모대상");
			int host = text.indexOf("주최/주관");
			int support = text.indexOf("후원/협찬");
			int start_date = text.indexOf("접수기간");
			int end_date = text.indexOf(" ~ ");
			int reward_total = text.indexOf("총 상금");
			int reward_win = text.indexOf("1등 상금");
			int homepage = text.indexOf("홈페이지");
			int file = text.indexOf("첨부파일");
			
			String con_field = text.substring(field+3, target);
			String con_target = text.substring(target+5,host);
			String con_host = text.substring(host+6,support);
			String con_support = text.substring(support+6,start_date);
			String con_start_date = text.substring(start_date+5,end_date);
			String con_end_date = text.substring(end_date+3,end_date+13);
			String con_reward_total = text.substring(reward_total+5,reward_win);
			String con_reward_win = text.substring(reward_win+6,homepage);
			String con_homepage = text.substring(homepage+5,file);
			System.out.println(el.text());
			System.out.println(con_field);
			System.out.println(con_target);
			System.out.println(con_host);
			System.out.println(con_support);
			System.out.println(con_start_date);
			System.out.println(con_end_date);
			System.out.println(con_reward_total);
			System.out.println(con_reward_win);
			System.out.println(con_homepage);
			
			ContestDto.setCon_url(url);
			ContestDto.setCon_field(con_field);
			ContestDto.setCon_target(con_target);
			ContestDto.setCon_host(con_host);
			ContestDto.setCon_support(con_support);
			ContestDto.setCon_start_date(con_start_date);
			ContestDto.setCon_end_date(con_end_date);
			ContestDto.setCon_reward_total(con_reward_total);
			ContestDto.setCon_reward_win(con_reward_win);
			ContestDto.setCon_homepage(con_homepage);
			
		}
		element = detaildoc.select(".comm-desc");
		for(Element el : element) {
			
			String contents = el.toString();
			if(contents.contains("'")) {
				contents =contents.replace("'", "\'");
			}
			
			ContestDto.setCon_contents(contents);
			
			System.out.println(el.toString());
			System.out.println("------------------------------");
			
			int result =-1;
			result =ContestDao.InsertContest(ContestDto);
			if(result==1) {
				System.out.println("insert성공");
			}else {
				System.out.println("insert 실패");
			}
			
			
			
			
		}
		
		
		
	}
	
	

}
