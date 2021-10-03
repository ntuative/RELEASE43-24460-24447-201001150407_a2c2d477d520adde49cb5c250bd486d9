package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1900:int;
      
      private var var_2027:String;
      
      private var var_2026:int;
      
      private var var_2025:int;
      
      private var var_622:Boolean;
      
      private var var_1629:Boolean;
      
      private var var_418:int;
      
      private var var_1060:String;
      
      private var var_1625:int;
      
      private var var_1070:int;
      
      private var _ownerName:String;
      
      private var var_656:String;
      
      private var var_2023:int;
      
      private var var_2024:RoomThumbnailData;
      
      private var var_1628:Boolean;
      
      private var var_583:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_583 = new Array();
         super();
         var_418 = param1.readInteger();
         var_622 = param1.readBoolean();
         var_656 = param1.readString();
         _ownerName = param1.readString();
         var_1625 = param1.readInteger();
         var_1900 = param1.readInteger();
         var_2023 = param1.readInteger();
         var_1060 = param1.readString();
         var_2026 = param1.readInteger();
         var_1628 = param1.readBoolean();
         var_2025 = param1.readInteger();
         var_1070 = param1.readInteger();
         var_2027 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_583.push(_loc4_);
            _loc3_++;
         }
         var_2024 = new RoomThumbnailData(param1);
         var_1629 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_2023;
      }
      
      public function get roomName() : String
      {
         return var_656;
      }
      
      public function get userCount() : int
      {
         return var_1900;
      }
      
      public function get score() : int
      {
         return var_2025;
      }
      
      public function get eventCreationTime() : String
      {
         return var_2027;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1628;
      }
      
      public function get tags() : Array
      {
         return var_583;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1629;
      }
      
      public function get event() : Boolean
      {
         return var_622;
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
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1070;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_2026;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_2024;
      }
      
      public function get doorMode() : int
      {
         return var_1625;
      }
      
      public function get flatId() : int
      {
         return var_418;
      }
      
      public function get description() : String
      {
         return var_1060;
      }
   }
}
