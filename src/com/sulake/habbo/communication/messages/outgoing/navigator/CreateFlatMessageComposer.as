package com.sulake.habbo.communication.messages.outgoing.navigator
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class CreateFlatMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_41:Array;
      
      public function CreateFlatMessageComposer(param1:String, param2:String)
      {
         var_41 = new Array();
         super();
         this.var_41.push(param1);
         this.var_41.push(param2);
         this.var_41.push("open");
         this.var_41.push(true);
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function getMessageArray() : Array
      {
         return this.var_41;
      }
      
      public function dispose() : void
      {
         this.var_41 = null;
      }
   }
}
