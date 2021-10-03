package com.sulake.habbo.ui
{
   import com.sulake.habbo.catalog.enum.CatalogPageName;
   import com.sulake.habbo.session.events.RoomSessionQueueEvent;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetRoomQueueUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomQueueMessage;
   import flash.events.Event;
   
   public class RoomQueueWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var _isDisposed:Boolean = false;
      
      public function RoomQueueWidgetHandler()
      {
         super();
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_293;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         _container = param1;
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = false;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:* = null;
         if(_container == null || true)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomSessionQueueEvent.const_392:
               _loc2_ = param1 as RoomSessionQueueEvent;
               if(_loc2_ == null)
               {
                  return;
               }
               switch(_loc2_.queueSetTarget)
               {
                  case RoomSessionQueueEvent.const_792:
                     _loc3_ = "null";
                     break;
                  case RoomSessionQueueEvent.const_841:
                     _loc3_ = "null";
               }
               if(_loc3_ == null)
               {
                  return;
               }
               _loc4_ = true;
               if(false)
               {
                  _loc4_ = _container.inventory.clubDays > 0;
               }
               _loc5_ = _loc2_.queueTypes;
               _loc7_ = false;
               if(_loc5_.length > 1)
               {
                  if(_loc4_ && _loc2_.queueTypes.indexOf(RoomSessionQueueEvent.const_843) != -1)
                  {
                     _loc6_ = _loc2_.getQueueSize(RoomSessionQueueEvent.const_843) + 1;
                     _loc7_ = true;
                  }
                  else
                  {
                     _loc6_ = _loc2_.getQueueSize(RoomSessionQueueEvent.const_1228) + 1;
                  }
               }
               else
               {
                  _loc6_ = _loc2_.getQueueSize(_loc5_[0]) + 1;
               }
               _loc8_ = new RoomWidgetRoomQueueUpdateEvent(_loc3_,_loc6_,_loc4_,_loc2_.isActive,_loc7_);
               _container.events.dispatchEvent(_loc8_);
               break;
         }
      }
      
      public function getWidgetMessages() : Array
      {
         var _loc1_:* = [];
         _loc1_.push(RoomWidgetRoomQueueMessage.const_638);
         _loc1_.push(RoomWidgetRoomQueueMessage.CHANGE_TO_SPECTATOR_QUEUE);
         _loc1_.push(RoomWidgetRoomQueueMessage.const_728);
         _loc1_.push(RoomWidgetRoomQueueMessage.const_618);
         return _loc1_;
      }
      
      public function update() : void
      {
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         if(_container == null || true)
         {
            return null;
         }
         var _loc2_:RoomWidgetRoomQueueMessage = param1 as RoomWidgetRoomQueueMessage;
         if(_loc2_ == null)
         {
            return null;
         }
         switch(param1.type)
         {
            case RoomWidgetRoomQueueMessage.const_638:
               _container.roomSession.quit();
               break;
            case RoomWidgetRoomQueueMessage.CHANGE_TO_SPECTATOR_QUEUE:
               _container.roomSession.changeQueue(RoomSessionQueueEvent.const_841);
               break;
            case RoomWidgetRoomQueueMessage.const_728:
               _container.roomSession.changeQueue(RoomSessionQueueEvent.const_792);
               break;
            case RoomWidgetRoomQueueMessage.const_618:
               if(false)
               {
                  _container.catalog.openCatalogPage(CatalogPageName.const_320,true);
               }
         }
         return null;
      }
      
      public function getProcessedEvents() : Array
      {
         return [RoomSessionQueueEvent.const_392];
      }
      
      public function dispose() : void
      {
         _isDisposed = true;
         _container = null;
      }
   }
}
