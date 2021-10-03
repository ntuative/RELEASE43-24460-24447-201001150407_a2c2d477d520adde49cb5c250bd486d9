package com.sulake.habbo.widget.roomchat
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomChatHistoryPulldown
   {
      
      public static const const_445:int = 2;
      
      public static const const_277:int = 1;
      
      public static const const_206:int = 0;
      
      public static const const_749:int = 3;
      
      private static const const_738:int = 150;
      
      private static const const_737:int = 250;
      
      public static const const_69:int = 39;
       
      
      private var var_1324:BitmapData;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_1323:BitmapData;
      
      private var _window:IWindowContainer;
      
      private var var_1569:int = 0;
      
      private var var_44:IWindowContainer;
      
      private var var_103:IRegionWindow;
      
      private var var_1565:int = 30;
      
      private var _state:int = -1;
      
      private var var_1568:BitmapData;
      
      private var _widget:RoomChatWidget;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1567:BitmapData;
      
      private var var_74:IBitmapWrapperWindow;
      
      private var var_1564:BitmapData;
      
      private var var_1566:BitmapData;
      
      private var var_1322:BitmapData;
      
      public function RoomChatHistoryPulldown(param1:RoomChatWidget, param2:IHabboWindowManager, param3:IWindowContainer, param4:IAssetLibrary)
      {
         super();
         _widget = param1;
         _windowManager = param2;
         _assetLibrary = param4;
         var_44 = param3;
         var_1566 = (_assetLibrary.getAssetByName("chat_grapbar_bg") as BitmapDataAsset).content as BitmapData;
         var_1323 = (_assetLibrary.getAssetByName("chat_grapbar_grip") as BitmapDataAsset).content as BitmapData;
         var_1564 = (_assetLibrary.getAssetByName("chat_grapbar_handle") as BitmapDataAsset).content as BitmapData;
         var_1322 = (_assetLibrary.getAssetByName("chat_grapbar_x") as BitmapDataAsset).content as BitmapData;
         var_1324 = (_assetLibrary.getAssetByName("chat_grapbar_x_hi") as BitmapDataAsset).content as BitmapData;
         var_1568 = (_assetLibrary.getAssetByName("chat_grapbar_x_pr") as BitmapDataAsset).content as BitmapData;
         var_1567 = (_assetLibrary.getAssetByName("chat_history_bg") as BitmapDataAsset).content as BitmapData;
         var_74 = _windowManager.createWindow("chat_history_bg","",HabboWindowType.BITMAP_WRAPPER,HabboWindowStyle.const_39,HabboWindowParam.const_64,new Rectangle(0,0,param3.width,param3.height - const_69),null,0,0) as IBitmapWrapperWindow;
         var_44.addChild(var_74);
         _window = _windowManager.createWindow("chat_pulldown","",HabboWindowType.const_53,HabboWindowStyle.const_39,HabboWindowParam.const_38,new Rectangle(0,0 - const_69,param3.width,const_69),null,0) as IWindowContainer;
         var_44.addChild(_window);
         var_103 = _windowManager.createWindow("REGIONchat_pulldown","",WindowType.const_421,HabboWindowStyle.const_40,0 | 0 | 0 | 0,new Rectangle(0,0,param3.width,param3.height - const_69),null,0) as IRegionWindow;
         if(var_103 != null)
         {
            var_103.background = true;
            var_103.alphaTreshold = 0;
            var_103.addEventListener(WindowMouseEvent.const_51,onPulldownMouseDown);
            var_44.addChild(var_103);
            var_103.toolTipCaption = "${chat.history.drag.tooltip}";
            var_103.toolTipDelay = 250;
         }
         var _loc5_:XmlAsset = param4.getAssetByName("chat_history_pulldown") as XmlAsset;
         _window.buildFromXML(_loc5_.content as XML);
         _window.addEventListener(WindowMouseEvent.const_51,onPulldownMouseDown);
         var _loc6_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc6_ != null)
         {
            _loc6_.alphaTreshold = 0;
            _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onCloseButtonClicked);
            _loc6_.addEventListener(WindowMouseEvent.const_95,onCloseButtonMouseUp);
            _loc6_.addEventListener(WindowMouseEvent.const_51,onCloseButtonMouseDown);
            _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onCloseButtonMouseOver);
            _loc6_.addEventListener(WindowMouseEvent.const_28,onCloseButtonMouseOut);
         }
         _window.background = true;
         _window.color = 0;
         _window.alphaTreshold = 0;
         this.state = const_206;
         buildWindowGraphics();
      }
      
      private function onCloseButtonMouseDown(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = var_1568.clone();
         }
      }
      
      private function onCloseButtonMouseUp(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = var_1324.clone();
         }
      }
      
      public function update(param1:uint) : void
      {
         switch(state)
         {
            case const_445:
               var_74.blend += param1 / const_737;
               _window.blend += param1 / const_737;
               if(false)
               {
                  state = const_277;
               }
               break;
            case const_749:
               var_74.blend = 0 - param1 / const_738;
               _window.blend = 0 - param1 / const_738;
               if(true)
               {
                  state = const_206;
               }
         }
      }
      
      private function onCloseButtonClicked(param1:WindowMouseEvent) : void
      {
         if(_widget != null)
         {
            _widget.onPulldownCloseButtonClicked(param1);
         }
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      private function onCloseButtonMouseOver(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = var_1324.clone();
         }
      }
      
      public function dispose() : void
      {
         if(var_103 != null)
         {
            var_103.dispose();
            var_103 = null;
         }
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(var_74 != null)
         {
            var_74.dispose();
            var_74 = null;
         }
      }
      
      private function onPulldownMouseDown(param1:WindowMouseEvent) : void
      {
         if(_widget != null)
         {
            _widget.onPulldownMouseDown(param1);
         }
      }
      
      public function set state(param1:int) : void
      {
         if(param1 == _state)
         {
            return;
         }
         switch(param1)
         {
            case const_277:
               if(_state == const_206)
               {
                  this.state = const_445;
               }
               else
               {
                  if(_window == null || var_74 == null)
                  {
                     return;
                  }
                  _window.visible = true;
                  var_74.visible = true;
                  var_103.visible = true;
                  _state = param1;
               }
               break;
            case const_206:
               if(_window == null || var_74 == null)
               {
                  return;
               }
               _window.visible = false;
               var_74.visible = false;
               var_103.visible = false;
               _state = param1;
               break;
            case const_445:
               if(_window == null || var_74 == null)
               {
                  return;
               }
               _window.blend = 0;
               var_74.blend = 0;
               _window.visible = true;
               var_74.visible = true;
               _state = param1;
               break;
            case const_749:
               if(_window == null || var_74 == null)
               {
                  return;
               }
               _window.blend = 1;
               var_74.blend = 1;
               _state = param1;
               break;
         }
      }
      
      private function tileBitmapHorz(param1:BitmapData, param2:BitmapData) : void
      {
         var _loc3_:int = param2.width / param1.width;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_ + 1)
         {
            param2.copyPixels(param1,param1.rect,new Point(_loc4_ * param1.width,0));
            _loc4_++;
         }
      }
      
      public function containerResized(param1:Rectangle) : void
      {
         if(_window != null)
         {
            _window.x = 0;
            _window.y = 0 - const_69;
            _window.width = var_44.width;
         }
         if(var_103 != null)
         {
            var_103.x = 0;
            var_103.y = 0 - const_69;
            var_103.width = 0 - var_1565;
         }
         if(var_74 != null)
         {
            var_74.rectangle = var_44.rectangle;
            var_74.height = 0 - const_69;
         }
         buildWindowGraphics();
      }
      
      private function onCloseButtonMouseOut(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = var_1322.clone();
         }
      }
      
      private function buildWindowGraphics() : void
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(_window == null)
         {
            return;
         }
         if(var_1569 == _window.width)
         {
            return;
         }
         var_1569 = _window.width;
         var _loc1_:IBitmapWrapperWindow = _window.findChildByName("grapBarBg") as IBitmapWrapperWindow;
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         var _loc3_:IBitmapWrapperWindow = _window.findChildByName("grapBarGripL") as IBitmapWrapperWindow;
         var _loc4_:IBitmapWrapperWindow = _window.findChildByName("grapBarGripR") as IBitmapWrapperWindow;
         var _loc5_:IBitmapWrapperWindow = _window.findChildByName("grapBarHandle") as IBitmapWrapperWindow;
         if(_loc2_ != null && _loc5_ != null)
         {
            _loc5_.bitmap = var_1564.clone();
            _loc2_.bitmap = var_1322.clone();
            var_1565 = 0 - _loc2_.x;
         }
         _loc3_.width = _loc5_.x - 5;
         _loc3_.x = 0;
         _loc4_.x = _loc5_.x + _loc5_.width + 5;
         _loc4_.width = _loc2_.x - 5 - _loc4_.x;
         if(_loc3_.width < 0)
         {
            _loc3_.width = 0;
         }
         if(_loc4_.width < 0)
         {
            _loc4_.width = 0;
         }
         if(_loc1_ != null && _loc3_ != null && _loc4_ != null)
         {
            if(_loc1_.width > 0 && _loc1_.height > 0)
            {
               _loc7_ = new BitmapData(_loc1_.width,_loc1_.height);
               tileBitmapHorz(var_1566.clone(),_loc7_);
               _loc1_.bitmap = _loc7_;
            }
            if(_loc3_.width > 0 && _loc3_.height > 0)
            {
               _loc8_ = new BitmapData(_loc3_.width,_loc3_.height);
               tileBitmapHorz(var_1323.clone(),_loc8_);
               _loc3_.bitmap = _loc8_;
            }
            if(_loc4_.width > 0 && _loc4_.height > 0)
            {
               _loc9_ = new BitmapData(_loc4_.width,_loc4_.height);
               tileBitmapHorz(var_1323.clone(),_loc9_);
               _loc4_.bitmap = _loc9_;
            }
         }
         if(var_74 == null)
         {
            return;
         }
         var_74.bitmap = var_1567.clone();
      }
   }
}
