using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Application as App;
using Toybox.Lang as Lang;
using Toybox.ActivityMonitor as ActMon;

class BackToTheFutureView extends Ui.WatchFace {
	
    var mySwirl;
    function initialize() {
         mySwirl = new WatchUi.AnimationLayer(Rez.Drawables.giphy, {:locX => 42, :locY => 144});
         View.addLayer(mySwirl);
         WatchFace.initialize(); 
    }
    // Load your resources here
    function onLayout(dc) {
    	var layoutMode = App.getApp().getProperty("LayoutType");
    	if (layoutMode == 0){
            setLayout(Rez.Layouts.NormalModeLayout(dc));     
        } else if (layoutMode == 1){
            setLayout(Rez.Layouts.BlackModeLayout(dc));     
        }
    }

    var _playing = false;
    // Update the view
    function onUpdate(dc) {  
        onLayout(dc); 
        View.onUpdate(dc);
    }

      function play() {
        if(!_playing) {
            mySwirl.play({
                :delegate => new DanceDanceAnimationDelegate(self)});
            _playing = true;
        }
    }

    function stop() {
        if(_playing) {
            mySwirl.stop();
            _playing = false;
        }
    }

     function onShow() { 
        play();
        Ui.requestUpdate();
    }


    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
         Ui.requestUpdate();
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
        Ui.requestUpdate();
    }

  
}
