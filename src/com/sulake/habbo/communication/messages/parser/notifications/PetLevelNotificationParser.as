package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_520:String;
      
      private var var_1610:int;
      
      private var var_1840:String;
      
      private var var_912:int;
      
      private var var_1188:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1188;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1188 = param1.readInteger();
         var_1840 = param1.readString();
         var_1610 = param1.readInteger();
         var_520 = param1.readString();
         var_912 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_1840;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_520;
      }
      
      public function get petType() : int
      {
         return var_912;
      }
      
      public function get level() : int
      {
         return var_1610;
      }
   }
}
