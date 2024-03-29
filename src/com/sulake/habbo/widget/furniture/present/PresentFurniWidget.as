package com.sulake.habbo.widget.furniture.present
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetEcotronBoxDataUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPresentDataUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetPresentOpenMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class PresentFurniWidget extends RoomWidgetBase
   {
      
      private static const const_1052:Number = 100;
      
      private static const const_1053:Number = 100;
       
      
      private var var_231:Boolean = false;
      
      private var var_204:String;
      
      private var _window:IWindowContainer;
      
      private var var_160:int = -1;
      
      private var _controller:Boolean;
      
      public function PresentFurniWidget(param1:IHabboWindowManager, param2:IAssetLibrary = null)
      {
         super(param1,param2);
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_231 = false;
         hideInterface();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetPresentDataUpdateEvent.const_59,onObjectUpdate);
         param1.addEventListener(RoomWidgetPresentDataUpdateEvent.const_74,onObjectUpdate);
         param1.addEventListener(RoomWidgetPresentDataUpdateEvent.const_427,onObjectUpdate);
         param1.addEventListener(RoomWidgetPresentDataUpdateEvent.const_450,onObjectUpdate);
         param1.addEventListener(RoomWidgetPresentDataUpdateEvent.const_416,onObjectUpdate);
         param1.addEventListener(RoomWidgetPresentDataUpdateEvent.const_401,onObjectUpdate);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_106,onRoomObjectRemoved);
         param1.addEventListener(RoomWidgetEcotronBoxDataUpdateEvent.const_59,onEcotronUpdate);
         super.registerUpdateEvents(param1);
      }
      
      private function showIcon(param1:BitmapData) : void
      {
         if(param1 == null)
         {
            param1 = new BitmapData(1,1);
         }
         if(_window == null)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("packagecard_flake") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = new BitmapData(_loc2_.width,_loc2_.height,true,0);
            _loc2_.bitmap.copyPixels(param1,param1.rect,new Point(0,0));
         }
         hideOpenButton();
      }
      
      private function hideInterface() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(!var_231)
         {
            var_160 = -1;
         }
         var_204 = "";
         _controller = false;
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetPresentDataUpdateEvent.const_59,onObjectUpdate);
         param1.removeEventListener(RoomWidgetPresentDataUpdateEvent.const_74,onObjectUpdate);
         param1.removeEventListener(RoomWidgetPresentDataUpdateEvent.const_427,onObjectUpdate);
         param1.removeEventListener(RoomWidgetPresentDataUpdateEvent.const_450,onObjectUpdate);
         param1.removeEventListener(RoomWidgetPresentDataUpdateEvent.const_416,onObjectUpdate);
         param1.removeEventListener(RoomWidgetPresentDataUpdateEvent.const_401,onObjectUpdate);
         param1.removeEventListener(RoomWidgetEcotronBoxDataUpdateEvent.const_59,onEcotronUpdate);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_106,onRoomObjectRemoved);
      }
      
      override public function dispose() : void
      {
         hideInterface();
         super.dispose();
      }
      
      private function onObjectUpdate(param1:RoomWidgetPresentDataUpdateEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetPresentDataUpdateEvent.const_59:
               hideInterface();
               var_231 = false;
               var_160 = param1.objectId;
               var_204 = param1.text;
               _controller = param1.controller;
               showInterface();
               break;
            case RoomWidgetPresentDataUpdateEvent.const_450:
               if(!var_231)
               {
                  return;
               }
               var_160 = param1.objectId;
               var_204 = param1.text;
               showInterface();
               showCustomIcon("packagecard_icon_floor");
               break;
            case RoomWidgetPresentDataUpdateEvent.const_416:
               if(!var_231)
               {
                  return;
               }
               var_160 = param1.objectId;
               var_204 = param1.text;
               showInterface();
               showCustomIcon("packagecard_icon_landscape");
               break;
            case RoomWidgetPresentDataUpdateEvent.const_401:
               if(!var_231)
               {
                  return;
               }
               var_160 = param1.objectId;
               var_204 = param1.text;
               showInterface();
               showCustomIcon("packagecard_icon_wallpaper");
               break;
            case RoomWidgetPresentDataUpdateEvent.const_427:
               if(!var_231)
               {
                  return;
               }
               var_160 = param1.objectId;
               var_204 = param1.text;
               showInterface();
               showCustomIcon("packagecard_icon_hc");
               break;
            case RoomWidgetPresentDataUpdateEvent.const_74:
               if(!var_231)
               {
                  return;
               }
               var_160 = param1.objectId;
               var_204 = param1.text;
               showInterface();
               showIcon(param1.iconBitmapData);
               break;
         }
      }
      
      private function showCustomIcon(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc2_:BitmapDataAsset = assets.getAssetByName(param1) as BitmapDataAsset;
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.content as BitmapData;
         }
         showIcon(_loc3_);
      }
      
      private function onMouseEvent(param1:WindowMouseEvent) : void
      {
         var _loc2_:IWindow = param1.target as IWindow;
         var _loc3_:String = _loc2_.name;
         switch(_loc3_)
         {
            case "open":
            case "packagecard_btn_open":
               sendOpen();
               break;
            case "close":
            case "close_btn":
            default:
               var_231 = false;
               hideInterface();
         }
      }
      
      private function onRoomObjectRemoved(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         if(param1.id == var_160)
         {
            hideInterface();
         }
      }
      
      private function onEcotronUpdate(param1:RoomWidgetEcotronBoxDataUpdateEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetEcotronBoxDataUpdateEvent.const_59:
               hideInterface();
         }
      }
      
      private function sendOpen() : void
      {
         var _loc1_:* = null;
         if(var_231 || var_160 == -1 || !_controller)
         {
            return;
         }
         var_231 = true;
         if(messageListener != null)
         {
            _loc1_ = new RoomWidgetPresentOpenMessage(RoomWidgetPresentOpenMessage.const_682,var_160);
            messageListener.processWidgetMessage(_loc1_);
         }
      }
      
      private function showInterface() : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(var_160 < 0)
         {
            return;
         }
         var _loc1_:IAsset = assets.getAssetByName("packagecard");
         var _loc2_:XmlAsset = XmlAsset(_loc1_);
         if(_loc2_ == null)
         {
            return;
         }
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         _window = windowManager.createWindow("presentcardui_container","",HabboWindowType.const_53,HabboWindowStyle.const_39,0 | 0,new Rectangle(const_1052,const_1053,2,2),null,0) as IWindowContainer;
         _window.buildFromXML(XML(_loc2_.content));
         var _loc3_:BitmapDataAsset = assets.getAssetByName("packagecard_flake") as BitmapDataAsset;
         if(_loc3_ != null)
         {
            _loc6_ = _loc3_.content as BitmapData;
            if(_loc6_ != null)
            {
               showIcon(_loc6_);
            }
         }
         _loc4_ = _window.findChildByName("packagecard_msg") as ITextWindow;
         if(_loc4_ != null && var_204 != null)
         {
            _loc4_.caption = var_204;
         }
         _loc5_ = _window.findChildByName("packagecard_btn_open");
         if(_loc5_ != null)
         {
            if(_controller)
            {
               _loc5_.visible = true;
               _loc5_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseEvent);
            }
            else
            {
               _loc5_.visible = false;
            }
         }
         if(!_controller)
         {
            hideOpenButton();
         }
         _loc5_ = _window.findChildByTag("close");
         if(_loc5_ != null)
         {
            _loc5_.procedure = onWindowClose;
         }
         _window.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseEvent);
      }
      
      private function hideOpenButton() : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc1_:IWindow = _window.findChildByName("packagecard_btn_open");
         if(_loc1_ != null)
         {
            _loc1_.visible = false;
         }
      }
   }
}
