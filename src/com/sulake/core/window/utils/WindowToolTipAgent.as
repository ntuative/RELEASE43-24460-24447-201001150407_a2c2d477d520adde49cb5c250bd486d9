package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IToolTipWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowType;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class WindowToolTipAgent extends WindowMouseOperator implements IWindowToolTipAgentService
   {
       
      
      protected var var_315:Timer;
      
      protected var var_882:String;
      
      protected var var_881:uint;
      
      protected var var_1054:Point;
      
      protected var var_245:IToolTipWindow;
      
      protected var var_1055:Point;
      
      public function WindowToolTipAgent(param1:DisplayObject)
      {
         var_1054 = new Point();
         var_1055 = new Point(20,20);
         var_881 = 500;
         super(param1);
      }
      
      override public function end(param1:IWindow) : IWindow
      {
         if(var_315 != null)
         {
            var_315.stop();
            var_315.removeEventListener(TimerEvent.TIMER,showToolTip);
            var_315 = null;
         }
         hideToolTip();
         return super.end(param1);
      }
      
      override public function operate(param1:int, param2:int) : void
      {
         if(_window && true)
         {
            _mouse.x = param1;
            _mouse.y = param2;
            getMousePositionRelativeTo(_window,_mouse,var_1054);
            if(var_245 != null && true)
            {
               var_245.x = param1 + var_1055.x;
               var_245.y = param2 + var_1055.y;
            }
         }
      }
      
      protected function showToolTip(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         if(var_315 != null)
         {
            var_315.reset();
         }
         if(_window && true)
         {
            if(var_245 == null || false)
            {
               var_245 = _window.context.create("undefined::ToolTip",var_882,WindowType.WINDOW_TYPE_TOOLTIP,_window.style,0 | 0,null,null,null,0,null,null) as IToolTipWindow;
            }
            _loc2_ = new Point();
            _window.getGlobalPosition(_loc2_);
            var_245.x = _loc2_.x + var_1054.x + var_1055.x;
            var_245.y = _loc2_.y + var_1054.y + var_1055.y;
         }
      }
      
      override public function begin(param1:IWindow, param2:uint = 0) : IWindow
      {
         if(param1 && !param1.disposed)
         {
            if(param1 is IInteractiveWindow)
            {
               var_882 = IInteractiveWindow(param1).toolTipCaption;
               var_881 = IInteractiveWindow(param1).toolTipDelay;
            }
            else
            {
               var_882 = param1.caption;
               var_881 = 500;
            }
            _mouse.x = var_124.mouseX;
            _mouse.y = var_124.mouseY;
            getMousePositionRelativeTo(param1,_mouse,var_1054);
            if(var_882 != null && var_882 != "")
            {
               if(var_315 == null)
               {
                  var_315 = new Timer(var_881,1);
                  var_315.addEventListener(TimerEvent.TIMER,showToolTip);
               }
               var_315.reset();
               var_315.start();
            }
         }
         return super.begin(param1,param2);
      }
      
      protected function hideToolTip() : void
      {
         if(var_245 != null && true)
         {
            var_245.destroy();
            var_245 = null;
         }
      }
   }
}
