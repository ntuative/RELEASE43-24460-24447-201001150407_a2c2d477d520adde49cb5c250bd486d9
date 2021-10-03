package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_1928:String;
      
      private var var_1181:String;
      
      private var var_1929:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_1929 = param1;
         var_1181 = param2;
         var_1928 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1929,var_1181,var_1928];
      }
      
      public function dispose() : void
      {
      }
   }
}
