package com.sulake.habbo.communication.messages.outgoing.friendlist
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class SendRoomInviteMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_1404:String;
      
      private var var_720:Array;
      
      public function SendRoomInviteMessageComposer(param1:String)
      {
         var_720 = new Array();
         super();
         this.var_1404 = param1;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function getMessageArray() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push(this.var_720.length);
         var _loc2_:int = 0;
         while(_loc2_ < this.var_720.length)
         {
            _loc1_.push(this.var_720[_loc2_]);
            _loc2_++;
         }
         _loc1_.push(this.var_1404);
         return _loc1_;
      }
      
      public function dispose() : void
      {
         this.var_720 = null;
      }
      
      public function addInvitedFriend(param1:int) : void
      {
         this.var_720.push(param1);
      }
   }
}
