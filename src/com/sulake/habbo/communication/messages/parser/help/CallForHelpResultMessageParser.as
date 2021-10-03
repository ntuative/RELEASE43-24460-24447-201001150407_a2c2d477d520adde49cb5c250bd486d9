package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CallForHelpResultMessageParser implements IMessageParser
   {
       
      
      private var var_1190:int;
      
      public function CallForHelpResultMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_1190 = -1;
         return true;
      }
      
      public function get resultType() : int
      {
         return var_1190;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1190 = param1.readInteger();
         return true;
      }
   }
}
