package com.sulake.habbo.room.events
{
   public class RoomEngineDimmerStateEvent extends RoomEngineEvent
   {
      
      public static const DIMMER_STATE:String = "REDSE_ROOM_COLOR";
       
      
      private var var_953:int;
      
      private var _color:uint;
      
      private var var_952:int;
      
      private var var_1592:int;
      
      private var _state:int;
      
      public function RoomEngineDimmerStateEvent(param1:int, param2:int, param3:int, param4:int, param5:int, param6:uint, param7:uint, param8:Boolean = false, param9:Boolean = false)
      {
         super(DIMMER_STATE,param1,param2,param8,param9);
         _state = param3;
         var_1592 = param4;
         var_953 = param5;
         _color = param6;
         var_952 = param7;
      }
      
      public function get brightness() : uint
      {
         return var_952;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectId() : int
      {
         return var_953;
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      public function get presetId() : int
      {
         return var_1592;
      }
   }
}
