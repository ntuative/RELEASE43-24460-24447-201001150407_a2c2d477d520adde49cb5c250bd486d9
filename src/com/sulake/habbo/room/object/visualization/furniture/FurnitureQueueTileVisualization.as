package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1095:int = 1;
      
      private static const const_1028:int = 3;
      
      private static const const_1094:int = 2;
      
      private static const const_1096:int = 15;
       
      
      private var var_839:int;
      
      private var var_226:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_226 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1094)
         {
            var_226 = new Array();
            var_226.push(const_1095);
            var_839 = const_1096;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_839 > 0)
         {
            --var_839;
         }
         if(var_839 == 0)
         {
            if(false)
            {
               super.setAnimation(var_226.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
