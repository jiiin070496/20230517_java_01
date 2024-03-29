package kh.lclass.spring1;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.trace("트레이스"); // 추적용
		logger.debug("디버깅깅");
		logger.info("Welcome home! The client locale is {}.", locale);
		//sysout대신사용. sysout은 매우 급하거나 곧바로 지워질 메시지 찍을때만 사용
		logger.warn("워닝워닝");
		logger.error("에러에러");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate ); //setAttribute
		
		return "home";
	}
	
	@GetMapping("/aaa/a2")
//	@RequestMapping(value = "/aaa/a2", method = RequestMethod.GET)
	public void a2() {
	}
	
	@RequestMapping(value = "/aaa/a1", method = RequestMethod.GET)
	public String a1() {
		return "aaa/a1";
	}
	
	
}
