using Toybox.WatchUi;

class ExampleRxDelegate extends WatchUi.BehaviorDelegate {

	var dm;

    function initialize() {
        BehaviorDelegate.initialize();
        dm = Application.getApp().dm;
    }
    
    function onKey(keyEvent){
    	if(keyEvent.getKey() == 13){//up
    		dm.setMessage("receive . . .");
    		Communications.registerForPhoneAppMessages(method(:onMessage));
		}    
    	if(keyEvent.getKey() == 8){//down
    	    	dm.setMessage("Send data");
    	    	System.println("send");
    		Communications.transmit("From IQ", null, new A(dm));
    	}
    }
    
    function onMessage(msg){
    		System.println("2");
    				System.println(msg.data);
//    				var myDict = {
//					    "One" => 1,
//					    "Two" => 2,
//					    "Three" => 3
//					};
//    				Communications.transmit(myDict, null, new A(dm));    				
    	dm.setMessage(msg.data);
    }
    
    class A extends Toybox.Communications.ConnectionListener{
	    var dm;
    	function initialize(dataManager){
    		dm = dataManager;
    		Communications.ConnectionListener.initialize();
    	}
    	function onError(){
  	    	System.println("sending error");
    		dm.setMessage("sending error");    	
    	}
    	function onComplete(){
  	    	System.println("sending ok");
    		dm.setMessage("sending ok");    	    	
    	}
    }

}