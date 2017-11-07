package model
{
	public class Credentials
	{
		private var username:String="";
		private var password:String="";
		private var rememberMe:Boolean=false;
		
		public function Credentials(_username:String="", _password:String="", _rememberMe:Boolean=false)
		{
			username = _username;
			password = _password;
			rememberMe = _rememberMe;
		}
		
		public function toJson():String {
			return JSON.stringify({username:username, password: password, rememberMe: rememberMe});
		}
		
		
	}
}