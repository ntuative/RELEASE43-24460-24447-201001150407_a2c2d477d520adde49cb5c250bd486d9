package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1575:int;
      
      private var var_419:Boolean;
      
      private var var_1576:Boolean;
      
      private var var_714:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1576 = param1.readBoolean();
         if(var_1576)
         {
            var_1575 = param1.readInteger();
            var_419 = param1.readBoolean();
         }
         else
         {
            var_714 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_714 != null)
         {
            var_714.dispose();
            var_714 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_1575;
      }
      
      public function get owner() : Boolean
      {
         return var_419;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_1576;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_714;
      }
   }
}
