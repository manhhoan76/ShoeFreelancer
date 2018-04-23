package util;

public class FilenameUtil {
	public static String renameFile(String filename) {
		String[] tachFilename = filename.split("[.]");
		String duoiFilename = tachFilename[tachFilename.length - 1];
		String tmp = "";
		for (int i = 0; i < tachFilename.length - 1; i++) {
			tmp += tachFilename[i] + "-";
		}
		String newFilename = tmp + System.nanoTime() + "." + duoiFilename;
		return newFilename;
	}
}
