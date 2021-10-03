package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_1854:int;
      
      private var var_2109:String;
      
      private var var_1580:int;
      
      private var _disposed:Boolean;
      
      private var var_2108:int;
      
      private var var_1579:String;
      
      private var var_1172:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         var_1579 = param1.readString();
         var_1854 = param1.readInteger();
         var_1580 = param1.readInteger();
         var_2109 = param1.readString();
         var_2108 = param1.readInteger();
         var_1172 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return var_2108;
      }
      
      public function get worldId() : int
      {
         return var_1580;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
      }
      
      public function get unitPropertySet() : String
      {
         return var_1579;
      }
      
      public function get unitPort() : int
      {
         return var_1854;
      }
      
      public function get castLibs() : String
      {
         return var_2109;
      }
      
      public function get nodeId() : int
      {
         return var_1172;
      }
   }
}
