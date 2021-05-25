package com.tech.blog.helpers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {

	public static boolean deleteFile(String path) {
		boolean flag = false;

		try {
			File file = new File(path);
			flag = file.delete();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	public static boolean saveFile(InputStream inputStream, String path) {
		boolean flag = false;

		try {
			byte b[] = new byte[inputStream.available()];
			inputStream.read(b);
			FileOutputStream fileOutputStream = new FileOutputStream(path);
			fileOutputStream.write(b);
			fileOutputStream.flush();
			fileOutputStream.close();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

}
