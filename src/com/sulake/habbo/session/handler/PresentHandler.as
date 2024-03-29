package com.sulake.habbo.session.handler
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.furniture.PresentOpenedMessageEvent;
   import com.sulake.habbo.communication.messages.parser.room.furniture.PresentOpenedMessageParser;
   import com.sulake.habbo.session.IRoomHandlerListener;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.events.RoomSessionPresentEvent;
   
   public class PresentHandler extends BaseHandler
   {
       
      
      public function PresentHandler(param1:IConnection, param2:IRoomHandlerListener)
      {
         super(param1,param2);
         if(param1 == null)
         {
            return;
         }
         param1.addMessageEvent(new PresentOpenedMessageEvent(onPresentOpened));
      }
      
      private function onPresentOpened(param1:IMessageEvent) : void
      {
         var _loc2_:PresentOpenedMessageParser = (param1 as PresentOpenedMessageEvent).getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:int = _loc2_.roomId;
         var _loc4_:int = _loc2_.roomCategory;
         var _loc5_:IRoomSession = listener.getSession(_xxxRoomId,_xxxRoomCategory);
         if(_loc5_ == null)
         {
            return;
         }
         if(listener && false)
         {
            listener.events.dispatchEvent(new RoomSessionPresentEvent(RoomSessionPresentEvent.const_254,_loc5_,_loc2_.classId,_loc2_.itemType));
         }
      }
   }
}
