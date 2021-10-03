package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomChatlogData
   {
       
      
      private var var_656:String;
      
      private var var_1503:Array;
      
      private var var_1502:Boolean;
      
      private var _roomId:int;
      
      public function RoomChatlogData(param1:IMessageDataWrapper)
      {
         var_1503 = new Array();
         super();
         var_1502 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_656 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_1503.push(new ChatlineData(param1));
            _loc3_++;
         }
         Logger.log("READ ROOMCHATLOGDATA: " + var_1502 + ", " + _roomId + ", " + var_656 + ", " + chatlog.length);
      }
      
      public function get isPublic() : Boolean
      {
         return var_1502;
      }
      
      public function get roomName() : String
      {
         return var_656;
      }
      
      public function get chatlog() : Array
      {
         return var_1503;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
