package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomForwardMessageParser implements IMessageParser
   {
       
      
      private var var_1756:Boolean;
      
      private var _roomId:int;
      
      public function RoomForwardMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1756 = param1.readBoolean();
         _roomId = param1.readInteger();
         return true;
      }
      
      public function get publicRoom() : Boolean
      {
         return var_1756;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
   }
}
