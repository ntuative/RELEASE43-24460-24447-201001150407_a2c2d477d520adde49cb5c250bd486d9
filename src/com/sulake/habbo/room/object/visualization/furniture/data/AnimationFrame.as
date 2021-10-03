package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_548:int = -1;
      
      public static const const_814:int = -1;
       
      
      private var _y:int = 0;
      
      private var var_1664:int = -1;
      
      private var var_91:int = 0;
      
      private var var_1086:int = 1;
      
      private var var_727:int = 1;
      
      private var var_1665:Boolean = false;
      
      private var var_1663:int = 0;
      
      private var _id:int = 0;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int = -1, param7:int = 0)
      {
         super();
         _id = param1;
         var_91 = param2;
         _y = param3;
         var_1665 = param5;
         if(param4 < 0)
         {
            param4 = const_548;
         }
         var_727 = param4;
         var_1086 = param4;
         if(param6 >= 0)
         {
            var_1664 = param6;
            var_1663 = param7;
         }
      }
      
      public function get y() : int
      {
         return _y;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(var_727 > 0 && param1 > var_727)
         {
            param1 = var_727;
         }
         var_1086 = param1;
      }
      
      public function get frameRepeats() : int
      {
         return var_727;
      }
      
      public function get activeSequenceOffset() : int
      {
         return var_1663;
      }
      
      public function get id() : int
      {
         if(_id >= 0)
         {
            return _id;
         }
         return -_id * Math.random();
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(var_727 < 0)
         {
            return const_548;
         }
         return var_1086;
      }
      
      public function get activeSequence() : int
      {
         return var_1664;
      }
      
      public function get isLastFrame() : Boolean
      {
         return var_1665;
      }
      
      public function get x() : int
      {
         return var_91;
      }
   }
}
