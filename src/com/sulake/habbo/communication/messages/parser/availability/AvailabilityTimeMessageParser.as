package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityTimeMessageParser implements IMessageParser
   {
       
      
      private var var_978:Boolean;
      
      private var var_1158:int;
      
      public function AvailabilityTimeMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_978 = param1.readInteger() > 0;
         var_1158 = param1.readInteger();
         return true;
      }
      
      public function get method_1() : Boolean
      {
         return var_978;
      }
      
      public function flush() : Boolean
      {
         var_978 = false;
         var_1158 = 0;
         return true;
      }
      
      public function get minutesUntilChange() : int
      {
         return var_1158;
      }
   }
}
