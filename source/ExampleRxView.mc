using Toybox.WatchUi;
using Toybox.Graphics as Gfx;

class ExampleRxView extends WatchUi.View {

	var dm;
	var label;
	
    function initialize() {
        View.initialize();
        dm = Application.getApp().dm;
        dm.setCallback(method(:update));
    }
    
    function update(){
    	Toybox.WatchUi.requestUpdate();
    }

    // Load your resources here
    function onLayout(dc) {
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
		dc.clear();
		dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
		dc.drawText(dc.getWidth()/2, dc.getHeight()* 0.1, Gfx.FONT_SMALL, Toybox.WatchUi.loadResource(Rez.Strings.AppName), Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawLine(0, dc.getHeight()* 0.25, dc.getWidth(), dc.getHeight()* 0.25);
		
		dc.drawText(dc.getWidth()* 0.15, dc.getHeight()* 0.4, Gfx.FONT_SMALL, "receive", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawText(dc.getWidth()* 0.2, dc.getHeight()* 0.6, Gfx.FONT_SMALL, "send", Gfx.TEXT_JUSTIFY_CENTER);
		dc.drawLine(dc.getWidth()* 0.4, dc.getHeight()* 0.25, dc.getWidth()* 0.4, dc.getHeight());

		dc.drawText(dc.getWidth()* 0.65, dc.getHeight()* 0.4, Gfx.FONT_SMALL, dm.msg, Gfx.TEXT_JUSTIFY_CENTER);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

}
