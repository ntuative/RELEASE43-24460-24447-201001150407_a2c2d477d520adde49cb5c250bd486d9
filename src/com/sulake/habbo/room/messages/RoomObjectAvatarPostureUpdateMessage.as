package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1655:String;
      
      private var var_730:String;
      
      public function RoomObjectAvatarPostureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_1655 = param1;
         var_730 = param2;
      }
      
      public function get postureType() : String
      {
         return var_1655;
      }
      
      public function get parameter() : String
      {
         return var_730;
      }
   }
}
