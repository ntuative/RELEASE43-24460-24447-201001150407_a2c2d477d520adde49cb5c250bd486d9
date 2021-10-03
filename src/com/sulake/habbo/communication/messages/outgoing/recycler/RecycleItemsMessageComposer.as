package com.sulake.habbo.communication.messages.outgoing.recycler
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RecycleItemsMessageComposer implements IMessageComposer
   {
       
      
      private var var_724:Array;
      
      public function RecycleItemsMessageComposer(param1:Array)
      {
         super();
         var_724 = new Array();
         var_724.push(param1.length);
         var_724 = var_724.concat(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_724;
      }
   }
}
