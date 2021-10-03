package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class DeleteRoomMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_41:Array;
      
      public function DeleteRoomMessageComposer(param1:int)
      {
         var_41 = new Array();
         super();
         var_41.push(param1);
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function getMessageArray() : Array
      {
         return var_41;
      }
      
      public function dispose() : void
      {
         var_41 = null;
      }
   }
}
