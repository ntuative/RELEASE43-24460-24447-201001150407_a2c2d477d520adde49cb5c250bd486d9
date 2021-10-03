package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_1673:int;
      
      private var var_1095:PetData;
      
      private var var_1677:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_1673;
      }
      
      public function get petData() : PetData
      {
         return var_1095;
      }
      
      public function flush() : Boolean
      {
         var_1095 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_1677;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1673 = param1.readInteger();
         var_1677 = param1.readInteger();
         var_1095 = new PetData(param1);
         return true;
      }
   }
}
