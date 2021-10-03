package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteQuestionMessageParser implements IMessageParser
   {
       
      
      private var var_996:Array;
      
      private var var_892:String;
      
      public function VoteQuestionMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_892 = param1.readString();
         var_996 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_996.push(param1.readString());
            _loc3_++;
         }
         return true;
      }
      
      public function get choices() : Array
      {
         return var_996.slice();
      }
      
      public function flush() : Boolean
      {
         var_892 = "";
         var_996 = [];
         return true;
      }
      
      public function get question() : String
      {
         return var_892;
      }
   }
}
