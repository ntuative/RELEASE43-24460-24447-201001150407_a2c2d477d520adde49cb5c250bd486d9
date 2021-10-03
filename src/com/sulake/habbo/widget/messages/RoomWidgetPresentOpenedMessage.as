package com.sulake.habbo.widget.messages
{
   public class RoomWidgetPresentOpenedMessage extends RoomWidgetMessage
   {
      
      public static const const_1149:String = "RWPOMD_PRESENT_OPENED";
       
      
      private var var_1187:int;
      
      private var var_924:String;
      
      public function RoomWidgetPresentOpenedMessage(param1:String, param2:String, param3:int)
      {
         super(param1);
         var_924 = param2;
         var_1187 = param3;
      }
      
      public function get classId() : int
      {
         return var_1187;
      }
      
      public function get itemType() : String
      {
         return var_924;
      }
   }
}
