package ao 
{
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.filesystem.FileMode;
	import flash.utils.ByteArray;
	import util.Config;

	/**
	 * @author Stefan
	 */
	public class ExternalStorageAO 
	{
		public static function saveFile(filePath:String, settings:String):void {
			var myFile:File = File.documentsDirectory.resolvePath(filePath);
			var fs:FileStream = new FileStream();
			fs.open(myFile, FileMode.WRITE);
			fs.writeUTFBytes(settings);
			fs.close();
		}

		public static function saveFileToDirectory(fileName:String, directory:String, data:String):void {
			var direct:File = File.documentsDirectory.resolvePath(directory);
			if (direct.isDirectory) {
				direct.createDirectory();
			}
			var file:File = File.documentsDirectory.resolvePath(direct.url + "/" + fileName);
			var fs:FileStream = new FileStream();
			fs.open(file, FileMode.WRITE);
			fs.writeUTFBytes(data);
			fs.close();
		}

		public static function loadFile(filePath:String):String {
			var file:File = File.documentsDirectory.resolvePath(filePath);
			var text:String = "";
			if (file.exists) {
				var fs:FileStream = new FileStream();
				fs.open(file, FileMode.READ);
				text = fs.readUTFBytes(fs.bytesAvailable);
				fs.close();
			}
			return text;
		}

		public static function loadFilesFromDirectory(directoryPath:String):Array {
			var directory:File = File.documentsDirectory.resolvePath(directoryPath);
			var files:Array = new Array();
			if (directory.isDirectory) {
				files = directory.getDirectoryListing();
			}
			return files;
		}

	}

}