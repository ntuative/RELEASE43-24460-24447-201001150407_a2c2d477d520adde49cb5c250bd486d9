package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1720:String;
      
      private var var_418:int;
      
      private var var_1936:String;
      
      private var var_1938:String;
      
      private var var_1935:int;
      
      private var var_1937:String;
      
      private var var_1934:int;
      
      private var var_583:Array;
      
      private var var_896:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         var_583 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_896 = false;
            return;
         }
         this.var_896 = true;
         var_1935 = int(_loc2_);
         var_1936 = param1.readString();
         var_418 = int(param1.readString());
         var_1934 = param1.readInteger();
         var_1720 = param1.readString();
         var_1938 = param1.readString();
         var_1937 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            var_583.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function get eventType() : int
      {
         return var_1934;
      }
      
      public function get eventName() : String
      {
         return var_1720;
      }
      
      public function get eventDescription() : String
      {
         return var_1938;
      }
      
      public function get ownerAvatarName() : String
      {
         return var_1936;
      }
      
      public function get tags() : Array
      {
         return var_583;
      }
      
      public function get creationTime() : String
      {
         return var_1937;
      }
      
      public function get exists() : Boolean
      {
         return var_896;
      }
      
      public function get ownerAvatarId() : int
      {
         return var_1935;
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
         this.var_583 = null;
      }
      
      public function get flatId() : int
      {
         return var_418;
      }
   }
}
