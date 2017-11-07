package tools
{
	import services.authenticate.Authenticate;
	import services.people.People;

	public class Settings
	{

//			public static var server:String = "https://uz.signcloud.ru";
		public static var authenticate:Authenticate=new Authenticate();
		public static var people:People = new People();
		public static var token:String="";
	}
}