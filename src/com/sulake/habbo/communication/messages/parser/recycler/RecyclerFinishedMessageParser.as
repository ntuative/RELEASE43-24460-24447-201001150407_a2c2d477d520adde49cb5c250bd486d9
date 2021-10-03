package com.sulake.habbo.communication.messages.parser.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RecyclerFinishedMessageParser implements IMessageParser
   {
       
      
      private var _recyclerFinishedStatus:int = -1;
      
      private var var_1136:int = 0;
      
      public function RecyclerFinishedMessageParser()
      {
         super();
      }
      
      public function get recyclerFinishedStatus() : int
      {
         return _recyclerFinishedStatus;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _recyclerFinishedStatus = param1.readInteger();
         var_1136 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         _recyclerFinishedStatus = -1;
         var_1136 = 0;
         return true;
      }
      
      public function get prizeId() : int
      {
         return var_1136;
      }
   }
}
