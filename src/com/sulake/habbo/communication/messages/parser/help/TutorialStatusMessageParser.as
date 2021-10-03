package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1010:Boolean;
      
      private var var_1008:Boolean;
      
      private var var_1009:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_1010;
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_1008;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1009 = param1.readBoolean();
         var_1008 = param1.readBoolean();
         var_1010 = param1.readBoolean();
         return true;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_1009;
      }
      
      public function flush() : Boolean
      {
         var_1009 = false;
         var_1008 = false;
         var_1010 = false;
         return true;
      }
   }
}
