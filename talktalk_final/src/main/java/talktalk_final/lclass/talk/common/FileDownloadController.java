package talktalk_final.lclass.talk.common;

import java.io.File;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class FileDownloadController {
	   private static String CURR_IMAGE_REPO_PATH = 
	               "D:\\A_TeachingMaterial\\6.JspSpring\\other\\images";
	   @RequestMapping("/download")
	   protected void download(@RequestParam("imageFileName") String imageFileName,
	                           HttpServletResponse response) throws Exception{
	       
	       OutputStream out = response.getOutputStream();
	       String filePath = CURR_IMAGE_REPO_PATH + "\\" + imageFileName;
	       File image = new File(filePath);
	       int lastIndex = imageFileName.lastIndexOf(".");
	       String fileName = imageFileName.substring(0,lastIndex);
	       File thumbnail = new File(CURR_IMAGE_REPO_PATH + 
	                                   "\\" + "thumbnail" + "\\" + fileName + ".png");
	       if(image.exists()) {
	           Thumbnails.of(image).size(50, 50).outputFormat("png").toOutputStream(out);
	       }else {
	           return;
	       }
	       
	       byte[] buffer = new byte[1024 * 8];
	       out.write(buffer);
	       out.close();
   }
}
