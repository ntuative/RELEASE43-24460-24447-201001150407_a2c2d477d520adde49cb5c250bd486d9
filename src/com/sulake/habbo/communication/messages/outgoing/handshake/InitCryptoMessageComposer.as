package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class InitCryptoMessageComposer implements IMessageComposer
   {
       
      
      private var var_35:Array;
      
      public function InitCryptoMessageComposer(param1:int)
      {
         super();
         var_35 = new Array();
         var_35.push(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_35;
      }
   }
}
