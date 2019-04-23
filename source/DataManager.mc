class DataManager{
	
	var msg ="___";
	var c;
	
	function setCallback(callback){
		c = callback;
	}
	
	function setMessage(message){
		msg = message;
		c.invoke();
	}
}