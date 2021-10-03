package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_991:PetData;
      
      private var var_1470:Boolean;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1470 = param1.readBoolean();
         var_991 = new PetData(param1);
         Logger.log("Got PetReceived: " + var_1470 + ", " + var_991.id + ", " + var_991.name + ", " + pet.figure + ", " + var_991.type);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return var_1470;
      }
      
      public function get pet() : PetData
      {
         return var_991;
      }
   }
}
