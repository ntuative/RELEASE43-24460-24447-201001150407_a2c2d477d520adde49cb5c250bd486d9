package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FlatCatMessageParser implements IMessageParser
   {
       
      
      private var var_418:int;
      
      private var var_1172:int;
      
      public function FlatCatMessageParser()
      {
         super();
      }
      
      public function get flatId() : int
      {
         return var_418;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_418 = param1.readInteger();
         var_1172 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         var_418 = 0;
         var_1172 = 0;
         return true;
      }
      
      public function get nodeId() : int
      {
         return var_1172;
      }
   }
}
