using Toybox.Application;
using Toybox.WatchUi;

class ExampleRxApp extends Application.AppBase {

	var dm;
	
    function initialize() {
        AppBase.initialize();
        dm = new $.DataManager();
    }

    // onStart() is called on application start up
    function onStart(state) {
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    	dm.msg = "";
    	dm.c = null;
    }

    // Return the initial view of your application here
    function getInitialView() {
        return [ new ExampleRxView(), new ExampleRxDelegate() ];
    }
}
