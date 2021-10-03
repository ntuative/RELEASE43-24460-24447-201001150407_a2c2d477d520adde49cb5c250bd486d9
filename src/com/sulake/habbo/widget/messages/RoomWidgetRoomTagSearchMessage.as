package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_549:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_1638:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_549);
         var_1638 = param1;
      }
      
      public function get tag() : String
      {
         return var_1638;
      }
   }
}
