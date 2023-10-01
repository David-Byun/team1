package com.example.demo.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;

public class FileUpDownUtil {
	public static void saveFile(MultipartFile mf, String dir) {
		byte [] data;
		String imgname = mf.getOriginalFilename();
		try {
			data = mf.getBytes();
			FileOutputStream fo = 
					new FileOutputStream(dir+imgname);
			fo.write(data);
			fo.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	public static String uploadFile(MultipartFile file, String uploadPath) throws Exception {
		String originalFilename = file.getOriginalFilename();
		//String newFilename = UUID.randomUUID().toString() + "_" + originalFilename;

		String savePath = uploadPath + originalFilename;

		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}

		file.transferTo(new File(savePath));

		return originalFilename;
	}

}




