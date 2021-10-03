package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomShortData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1579:String;
      
      private var var_1580:int;
      
      public function PublicRoomShortData(param1:IMessageDataWrapper)
      {
         super();
         var_1579 = param1.readString();
         var_1580 = param1.readInteger();
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
      
      public function get worldId() : int
      {
         return var_1580;
      }
   }
}
