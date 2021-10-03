package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomSettingsFlatInfo;
   
   public class FlatInfoMessageParser implements IMessageParser
   {
       
      
      private var var_213:RoomSettingsFlatInfo;
      
      public function FlatInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_213 = null;
         return true;
      }
      
      public function get flatInfo() : RoomSettingsFlatInfo
      {
         return var_213;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_213 = new RoomSettingsFlatInfo();
         var_213.allowFurniMoving = param1.readInteger() == 1;
         var_213.doorMode = param1.readInteger();
         var_213.id = param1.readInteger();
         var_213.ownerName = param1.readString();
         var_213.type = param1.readString();
         var_213.name = param1.readString();
         var_213.description = param1.readString();
         var_213.showOwnerName = param1.readInteger() == 1;
         var_213.allowTrading = param1.readInteger() == 1;
         var_213.categoryAlertKey = param1.readInteger() == 1;
         return true;
      }
   }
}
