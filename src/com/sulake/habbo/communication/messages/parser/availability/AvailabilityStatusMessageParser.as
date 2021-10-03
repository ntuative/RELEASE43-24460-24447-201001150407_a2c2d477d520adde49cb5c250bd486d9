package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityStatusMessageParser implements IMessageParser
   {
       
      
      private var var_978:Boolean;
      
      private var var_1065:Boolean;
      
      public function AvailabilityStatusMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_978 = param1.readInteger() > 0;
         var_1065 = param1.readInteger() > 0;
         return true;
      }
      
      public function get method_1() : Boolean
      {
         return var_978;
      }
      
      public function get onShutDown() : Boolean
      {
         return var_1065;
      }
      
      public function flush() : Boolean
      {
         var_978 = false;
         var_1065 = false;
         return true;
      }
   }
}
