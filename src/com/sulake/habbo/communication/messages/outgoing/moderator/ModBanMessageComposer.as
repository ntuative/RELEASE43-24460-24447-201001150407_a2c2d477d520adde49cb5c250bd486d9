package com.sulake.habbo.communication.messages.outgoing.moderator
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class ModBanMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_41:Array;
      
      public function ModBanMessageComposer(param1:int, param2:String, param3:int, param4:String)
      {
         var_41 = new Array();
         super();
         this.var_41.push(param1);
         this.var_41.push(param2);
         this.var_41.push(param3);
         this.var_41.push(param4);
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
