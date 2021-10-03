package com.sulake.habbo.communication.messages.outgoing.sound
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class GetSoundSettingsComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_41:Array;
      
      public function GetSoundSettingsComposer()
      {
         var_41 = new Array();
         super();
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
