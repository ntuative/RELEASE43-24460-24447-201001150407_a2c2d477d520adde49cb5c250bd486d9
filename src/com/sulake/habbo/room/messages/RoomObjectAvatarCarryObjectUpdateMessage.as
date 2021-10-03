package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_924:int;
      
      private var var_1135:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_924 = param1;
         var_1135 = param2;
      }
      
      public function get itemType() : int
      {
         return var_924;
      }
      
      public function get itemName() : String
      {
         return var_1135;
      }
   }
}
