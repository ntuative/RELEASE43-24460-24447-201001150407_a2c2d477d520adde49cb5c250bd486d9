package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_984:int;
      
      private var var_1693:int;
      
      private var var_1346:int;
      
      private var var_116:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1346 = param1.readInteger();
         var_1693 = param1.readInteger();
         var_984 = param1.readInteger();
         var_116 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1346);
      }
      
      public function get reportedUserId() : int
      {
         return var_984;
      }
      
      public function get callerUserId() : int
      {
         return var_1693;
      }
      
      public function get callId() : int
      {
         return var_1346;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_116;
      }
   }
}
