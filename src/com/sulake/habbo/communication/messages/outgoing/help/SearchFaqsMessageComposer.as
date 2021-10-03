package com.sulake.habbo.communication.messages.outgoing.help
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class SearchFaqsMessageComposer implements IMessageComposer
   {
       
      
      private var var_1911:String;
      
      public function SearchFaqsMessageComposer(param1:String)
      {
         super();
         var_1911 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_1911];
      }
   }
}
