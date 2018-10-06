package com.cm.DisSale.util;

public class PathUtil {
	private static String seperator = System.getProperty("file.separator");

	public static String getImgBasePath() {
		String os = System.getProperty("os.name");
		String basePath = "";
		if (os.toLowerCase().startsWith("win")) {
			basePath = "C:/productImg";
		} else {
			basePath = "/user/image";
		}
		basePath = basePath.replace("/", seperator);
		return basePath;
	}

	public static String getProductImagePath(int productId) {
		String imagePath = "/upload/product/" + productId + "/";
		return imagePath.replace("/", seperator);
	}
}
