package kh.lclass.db1.common;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUpload {
	// @return : 저장한 파일명 , saveFile호출은 컨트롤러 insertDo에서
	public Map<String, String> saveFile(MultipartFile multi, HttpServletRequest req) throws Exception {
		Map<String, String> result  = null;
		String renameFilepath = null;
		String renameByTime = null;

		String realPath = req.getSession().getServletContext().getRealPath("");
		String savePath = "resources/upload";
		if(multi != null && !multi.equals("")) {
			result = new HashMap<String, String>();
			
			String orginalFileName = multi.getOriginalFilename();
			
			// 저장할 폴더가 안만들어져 있다면 만들어줘야함.
			File folder = new File(savePath);
			if(!folder.exists()) {
				folder.mkdirs();
			} 
			// 파일을 savePath 위치에 저장
			// 시간을 활용한 rename
			renameByTime = System.currentTimeMillis() + "_"+orginalFileName;
			// UUID
			
			renameFilepath = savePath + "\\" + renameByTime;
			multi.transferTo(new File(savePath + "\\" + renameByTime));
			
			result.put("original", orginalFileName);
			result.put("rename", renameByTime);
		}
		return result;
	}
		
}