package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ToolbarIcon
   {
       
      
      private var var_431:ToolbarIconGroup;
      
      private var var_896:Boolean = false;
      
      private var var_1651:String;
      
      private var var_767:Number;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_895:String = "-1";
      
      private var _window:IBitmapWrapperWindow;
      
      private var _state:String = "-1";
      
      private var var_103:IRegionWindow;
      
      private var _bitmapData:BitmapData;
      
      private var var_604:String;
      
      private var var_1652:int;
      
      private var var_603:Timer;
      
      private var var_1333:Array;
      
      private var var_893:ToolbarIconBouncer;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _events:IEventDispatcher;
      
      private var var_2207:Array;
      
      private var var_246:ToolbarBarMenuAnimator;
      
      private var var_371:ToolbarIconAnimator;
      
      private var var_508:Array;
      
      private var var_722:Array;
      
      private var var_723:String = "-1";
      
      private var var_2276:Boolean = true;
      
      private var var_894:Array;
      
      private var var_1082:Timer;
      
      private var var_1650:int;
      
      private var var_91:Number = 0;
      
      private var _y:Number = 0;
      
      public function ToolbarIcon(param1:ToolbarIconGroup, param2:IHabboWindowManager, param3:IAssetLibrary, param4:String, param5:IEventDispatcher, param6:ToolbarBarMenuAnimator)
      {
         var_508 = new Array();
         var_722 = new Array();
         var_2207 = new Array();
         var_893 = new ToolbarIconBouncer(0.8,1);
         super();
         var_431 = param1;
         _windowManager = param2;
         _assetLibrary = param3;
         var_604 = param4;
         _events = param5;
         var_246 = param6;
         var_1082 = new Timer(40,40);
         var_1082.addEventListener(TimerEvent.TIMER,updateBouncer);
         var_103 = param2.createWindow("TOOLBAR_ICON_" + param4 + "_REGION","",WindowType.const_421,HabboWindowStyle.const_40,HabboWindowParam.const_38,new Rectangle(0,0,1,1),onMouseEvent) as IRegionWindow;
         var_103.background = true;
         var_103.alphaTreshold = 0;
         var_103.visible = false;
         _window = IBitmapWrapperWindow(param2.createWindow("TOOLBAR_ICON_" + param4,"",HabboWindowType.BITMAP_WRAPPER,HabboWindowStyle.const_40,HabboWindowParam.const_40,new Rectangle(0,0,1,1),onMouseEvent,0));
         var_103.addChild(_window);
         _window.addEventListener(WindowEvent.const_43,onWindowResized);
      }
      
      private function getStateObject(param1:String) : StateItem
      {
         return var_1333[var_894.indexOf(param1)];
      }
      
      public function get windowOffsetFromIcon() : Number
      {
         return var_1650;
      }
      
      public function get iconId() : String
      {
         return var_604;
      }
      
      private function onWindowResized(param1:WindowEvent) : void
      {
         updateRegion();
      }
      
      public function changePosition(param1:Number) : void
      {
         var_767 = param1;
         updateRegion();
      }
      
      public function setIcon(param1:Boolean = true) : void
      {
         exists = param1;
         setAnimator();
      }
      
      public function set state(param1:String) : void
      {
         _state = param1;
         exists = true;
         setAnimator();
         setTooltip();
      }
      
      private function updateRegion() : void
      {
         if(var_103 == null || _window == null)
         {
            return;
         }
         var_103.width = _window.width;
         var_103.height = _window.height;
         var _loc1_:Boolean = false;
         if(_loc1_)
         {
            var_91 = (0 - 0) / 2;
            _y = var_767 + (0 - 0) / 2;
         }
         else
         {
            var_91 = var_767 + (0 - 0) / 2;
            _y = (0 - 0) / 2;
         }
         var_103.x = var_91;
         var_103.y = _y;
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(var_103 != null)
         {
            var_103.dispose();
            var_103 = null;
         }
         var_508 = null;
         var_722 = null;
         exists = false;
         _windowManager = null;
         _events = null;
         var_246 = null;
         var_371 = null;
         _bitmapData = null;
      }
      
      public function dockMenu(param1:String, param2:Array = null, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         if(var_508.indexOf(param1) < 0)
         {
            var_508.push(param1);
            _loc4_ = new MenuSettingsItem(param1,param2,param3);
            var_722.push(_loc4_);
         }
      }
      
      private function onMouseEvent(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         if(!var_896)
         {
            return;
         }
         var _loc3_:StateItem = getCurrentStateObject();
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(var_246)
               {
                  var_246.repositionWindow(var_604,true);
               }
               if(_events != null)
               {
                  _loc4_ = new HabboToolbarEvent(HabboToolbarEvent.const_61);
                  _loc4_.iconId = var_604;
                  _events.dispatchEvent(_loc4_);
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               if(false)
               {
                  if(_loc3_.hasStateOver)
                  {
                     state = _loc3_.stateOver;
                  }
                  else
                  {
                     state = var_895;
                  }
               }
               break;
            case WindowMouseEvent.const_28:
               if(false)
               {
                  if(_loc3_.hasDefaultState)
                  {
                     state = _loc3_.defaultState;
                  }
                  else
                  {
                     state = var_723;
                  }
               }
         }
      }
      
      public function docksMenu(param1:String) : Boolean
      {
         return var_508.indexOf(param1) > -1;
      }
      
      public function menuLockedToIcon(param1:String) : Boolean
      {
         if(!docksMenu(param1))
         {
            return false;
         }
         var _loc2_:MenuSettingsItem = var_722[var_508.indexOf(param1)];
         return _loc2_.lockToIcon;
      }
      
      public function set exists(param1:Boolean) : void
      {
         var_896 = param1;
         if(var_103 != null)
         {
            var_103.visible = var_896;
         }
      }
      
      private function setTooltip() : void
      {
         if(var_103 == null)
         {
            return;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && _loc1_.tooltip != null)
         {
            var_103.toolTipCaption = "${toolbar.icon.tooltip." + _loc1_.tooltip + "}";
         }
         else
         {
            var_103.toolTipCaption = "${toolbar.icon.tooltip." + var_1651.toLowerCase() + "}";
         }
         var_103.toolTipDelay = 100;
      }
      
      public function animateWindowIn(param1:String, param2:IWindowContainer, param3:Number, param4:String, param5:Point) : void
      {
         if(var_246 != null)
         {
            var_246.animateWindowIn(this,param1,param2,var_604,param3,param4,getMenuYieldList(param1));
         }
      }
      
      private function updateAnimator(param1:Event) : void
      {
         if(var_371 != null && _window != null)
         {
            var_371.update(_window);
            if(var_371.hasNextState())
            {
               state = var_371.nextState;
            }
         }
      }
      
      public function defineFromXML(param1:XML) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var_1333 = new Array();
         var_894 = new Array();
         var_1651 = param1.@id;
         var_1650 = int(param1.@window_offset_from_icon);
         var_1652 = int(param1.@window_margin);
         var _loc2_:XMLList = param1.elements("state");
         if(_loc2_.length() > 0)
         {
            if(param1.attribute("state_over").length() > 0)
            {
               var_895 = param1.@state_over;
            }
            if(param1.attribute("state_default").length() > 0)
            {
               var_723 = param1.@state_default;
            }
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length())
            {
               _loc4_ = _loc2_[_loc3_];
               _loc5_ = new StateItem(_loc4_,param1.@id.toLowerCase());
               var_894.push(_loc5_.id);
               var_1333.push(_loc5_);
               if(_loc3_ == 0)
               {
                  if(var_895 == "-1")
                  {
                     var_895 = _loc5_.id;
                  }
                  if(var_723 == "-1")
                  {
                     var_723 = _loc5_.id;
                  }
               }
               _loc3_++;
            }
         }
         _state = var_723;
      }
      
      public function setIconBitmapData(param1:BitmapData = null) : void
      {
         exists = true;
         _bitmapData = param1;
         setAnimator();
      }
      
      public function hideWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_246 != null)
         {
            var_246.hideWindow(param1,param2,var_604,param3);
         }
      }
      
      public function positionWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_246 != null)
         {
            var_246.positionWindow(this,param1,param2,var_604,param3,getMenuYieldList(param1));
         }
      }
      
      public function animateWindowOut(param1:String, param2:IWindowContainer, param3:String) : void
      {
         if(var_246 != null)
         {
            var_246.animateWindowOut(this,param1,param2,param3);
         }
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get exists() : Boolean
      {
         return var_896;
      }
      
      private function updateBouncer(param1:Event) : void
      {
         if(var_893 != null && _window != null)
         {
            var_893.update();
            _window.y = var_893.location;
         }
      }
      
      private function setAnimator() : void
      {
         if(var_603 != null)
         {
            var_603.stop();
            var_603 = null;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && var_896)
         {
            if(_loc1_.frames == null)
            {
               return;
            }
            var_371 = new ToolbarIconAnimator(_loc1_,_assetLibrary,_window,var_91,_y,_bitmapData);
            if(false)
            {
               var_603 = new Timer(_loc1_.timer);
               var_603.addEventListener(TimerEvent.TIMER,updateAnimator);
               var_603.start();
            }
            if(_loc1_.bounce)
            {
               var_893.reset(-7);
               var_1082.reset();
               var_1082.start();
            }
         }
         else
         {
            var_371 = null;
            _window.bitmap = null;
         }
      }
      
      public function get windowMargin() : Number
      {
         return var_1652 + var_431.windowMargin;
      }
      
      private function getCurrentStateObject() : StateItem
      {
         return getStateObject(_state);
      }
      
      public function get window() : IWindow
      {
         return var_103;
      }
      
      public function get x() : Number
      {
         return var_91;
      }
      
      private function getMenuYieldList(param1:String) : Array
      {
         if(!docksMenu(param1))
         {
            return null;
         }
         var _loc2_:MenuSettingsItem = var_722[var_508.indexOf(param1)];
         return _loc2_.yieldList;
      }
      
      public function get group() : ToolbarIconGroup
      {
         return var_431;
      }
   }
}
