package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatMessage extends RoomWidgetMessage
   {
      
      public static const const_129:int = 0;
      
      public static const const_103:int = 1;
      
      public static const const_96:int = 2;
      
      public static const const_674:String = "RWCM_MESSAGE_CHAT";
       
      
      private var var_1197:int = 0;
      
      private var var_1939:String = "";
      
      private var var_204:String = "";
      
      public function RoomWidgetChatMessage(param1:String, param2:String, param3:int = 0, param4:String = "")
      {
         super(param1);
         var_204 = param2;
         var_1197 = param3;
         var_1939 = param4;
      }
      
      public function get recipientName() : String
      {
         return var_1939;
      }
      
      public function get chatType() : int
      {
         return var_1197;
      }
      
      public function get text() : String
      {
         return var_204;
      }
   }
}
