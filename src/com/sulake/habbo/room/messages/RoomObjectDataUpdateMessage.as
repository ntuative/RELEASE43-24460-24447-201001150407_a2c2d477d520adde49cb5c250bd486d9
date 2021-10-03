package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class RoomObjectDataUpdateMessage extends RoomObjectUpdateMessage
   {
       
      
      private var var_1331:Number = NaN;
      
      private var _state:int;
      
      private var _data:String;
      
      public function RoomObjectDataUpdateMessage(param1:int, param2:String, param3:Number = NaN)
      {
         super(null,null);
         _state = param1;
         _data = param2;
         var_1331 = param3;
      }
      
      public function get extra() : Number
      {
         return var_1331;
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      public function get data() : String
      {
         return _data;
      }
   }
}
