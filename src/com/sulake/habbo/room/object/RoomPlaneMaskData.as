package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_1560:Number = 0;
      
      private var var_1561:Number = 0;
      
      private var var_1562:Number = 0;
      
      private var var_1563:Number = 0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_1561 = param1;
         var_1562 = param2;
         var_1560 = param3;
         var_1563 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1561;
      }
      
      public function get leftSideLength() : Number
      {
         return var_1560;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_1562;
      }
      
      public function get rightSideLength() : Number
      {
         return var_1563;
      }
   }
}
