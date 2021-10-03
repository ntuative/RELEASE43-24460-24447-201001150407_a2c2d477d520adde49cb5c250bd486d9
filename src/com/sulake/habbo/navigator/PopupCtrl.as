package com.sulake.habbo.navigator
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class PopupCtrl
   {
       
      
      private var var_782:Timer;
      
      private var _navigator:HabboNavigator;
      
      private var var_1131:String;
      
      private var var_1894:int;
      
      private var var_1895:int;
      
      private var var_647:Timer;
      
      private var var_56:IWindowContainer;
      
      public function PopupCtrl(param1:HabboNavigator, param2:int, param3:int, param4:String)
      {
         var_782 = new Timer(500,1);
         var_647 = new Timer(100,1);
         super();
         _navigator = param1;
         var_1131 = param4;
         var_1895 = param2;
         var_1894 = param3;
         var_782.addEventListener(TimerEvent.TIMER,onDisplayTimer);
         var_647.addEventListener(TimerEvent.TIMER,onHideTimer);
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         if(var_56 != null)
         {
            var_56.visible = false;
         }
      }
      
      public function hideInstantly() : void
      {
         if(var_56 != null)
         {
            var_56.visible = false;
         }
         this.var_782.reset();
         this.var_647.reset();
      }
      
      private function onPopup(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1 as WindowMouseEvent == null)
         {
            return;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            this.var_647.reset();
         }
         else if(param1.type == WindowMouseEvent.const_28)
         {
            if(!Util.containsMouse(var_56))
            {
               this.closePopup();
            }
         }
      }
      
      public function closePopup() : void
      {
         var_647.reset();
         var_782.reset();
         var_647.start();
      }
      
      public function get navigator() : HabboNavigator
      {
         return _navigator;
      }
      
      public function refreshContent(param1:IWindowContainer) : void
      {
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         this.var_56.visible = true;
         this.var_56.activate();
      }
      
      public function showPopup(param1:IWindow) : void
      {
         if(var_56 == null)
         {
            var_56 = IWindowContainer(_navigator.getXmlWindow(var_1131));
            var_56.visible = false;
            var_56.setParamFlag(HabboWindowParam.const_38,true);
            var_56.procedure = onPopup;
         }
         Util.hideChildren(var_56);
         refreshContent(var_56);
         var_56.height = Util.getLowestPoint(var_56) + 5;
         var _loc2_:Point = new Point();
         param1.getGlobalPosition(_loc2_);
         var_56.x = _loc2_.x + var_1895 + param1.width;
         var_56.y = _loc2_.y - 0 + param1.height * 0.5;
         var _loc3_:Point = new Point();
         var_56.getGlobalPosition(_loc3_);
         if(_loc3_.x + var_56.width > var_56.desktop.width)
         {
            var_56.x = 0 + _loc2_.x + var_1894;
            refreshPopupArrows(var_56,false);
         }
         else
         {
            refreshPopupArrows(var_56,true);
         }
         if(true)
         {
            var_782.reset();
            var_782.start();
         }
         var_647.reset();
         var_56.activate();
      }
      
      public function get visible() : Boolean
      {
         return this.var_56 != null && this.var_56.visible;
      }
      
      private function refreshPopupArrow(param1:IWindowContainer, param2:Boolean, param3:Boolean) : void
      {
         var _loc4_:String = "popup_arrow_" + (!!param2 ? "left" : "right");
         var _loc5_:IBitmapWrapperWindow = IBitmapWrapperWindow(param1.findChildByName(_loc4_));
         if(!param3)
         {
            if(_loc5_ != null)
            {
               _loc5_.visible = false;
            }
         }
         else
         {
            if(_loc5_ == null)
            {
               _loc5_ = _navigator.getButton(_loc4_,_loc4_,null);
               _loc5_.setParamFlag(HabboWindowParam.const_64,false);
               param1.addChild(_loc5_);
            }
            _loc5_.visible = true;
            _loc5_.y = param1.height * 0.5 - _loc5_.height * 0.5;
            _loc5_.x = !!param2 ? int(1 - _loc5_.width) : int(param1.width - 1);
         }
      }
      
      private function refreshPopupArrows(param1:IWindowContainer, param2:Boolean) : void
      {
         refreshPopupArrow(param1,true,param2);
         refreshPopupArrow(param1,false,!param2);
      }
   }
}
