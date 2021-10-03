package com.sulake.habbo.communication.messages.outgoing.help
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class CallForHelpMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_41:Array;
      
      public function CallForHelpMessageComposer(param1:String, param2:int, param3:int, param4:int)
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
