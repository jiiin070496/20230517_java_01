package kh.lclass.db1.opendata.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class APIController {
	private static final String serviceKey = "ey51rbqUG4nLxm%2FIMXybyk%2FsuSNe95v4aIgn4Ydn0UhcJl91gToKXy7\r\n"
			+ "htiiqkWXyGCVxm6xyZpakkO4hk%2FLs3w%3D%3D";
	
	@ResponseBody
	@RequestMapping(value="/air.do", produces="application/json; charset=UTF-8")
	public String airPollution(String location) throws IOException{
		String url = "http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesur eDnsty";
		url += "?serviceKey=" + serviceKey;
		url += "&sidoName=" + URLEncoder.encode(location, "UTF-8");
		url += "&returnType=json";
		url += "&numOfRows=15";
		
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection =(HttpURLConnection)requestUrl.openConnection();
			urlConnection.setRequestMethod("GET");
			
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		String responseText="";
		String line;
		while((line=br.readLine())!=null) {
			responseText += line;
		}
		br.close();
		urlConnection.disconnect();
		return responseText;

	}
}
