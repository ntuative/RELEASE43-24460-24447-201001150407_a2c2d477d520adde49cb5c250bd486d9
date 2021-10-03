package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1243:int;
      
      private var var_892:String;
      
      private var var_640:Array;
      
      private var var_996:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return var_640.slice();
      }
      
      public function flush() : Boolean
      {
         var_892 = "";
         var_996 = [];
         var_640 = [];
         var_1243 = 0;
         return true;
      }
      
      public function get totalVotes() : int
      {
         return var_1243;
      }
      
      public function get question() : String
      {
         return var_892;
      }
      
      public function get choices() : Array
      {
         return var_996.slice();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_892 = param1.readString();
         var_996 = [];
         var_640 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_996.push(param1.readString());
            var_640.push(param1.readInteger());
            _loc3_++;
         }
         var_1243 = param1.readInteger();
         return true;
      }
   }
}
