package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_656:String;
      
      private var var_1757:int;
      
      private var var_1502:Boolean;
      
      private var _roomId:int;
      
      private var var_1758:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1502 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_656 = param1.readString();
         var_1758 = param1.readInteger();
         var_1757 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1502;
      }
      
      public function get roomName() : String
      {
         return var_656;
      }
      
      public function get enterMinute() : int
      {
         return var_1757;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_1758;
      }
   }
}
