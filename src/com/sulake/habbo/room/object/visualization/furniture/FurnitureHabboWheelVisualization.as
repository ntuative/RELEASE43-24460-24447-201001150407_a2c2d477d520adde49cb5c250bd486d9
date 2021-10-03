package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1069:int = 31;
      
      private static const const_1028:int = 32;
      
      private static const const_753:int = 10;
      
      private static const const_482:int = 20;
       
      
      private var var_574:Boolean = false;
      
      private var var_226:Array;
      
      public function FurnitureHabboWheelVisualization()
      {
         var_226 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            var_574 = true;
            var_226 = new Array();
            var_226.push(const_1069);
            var_226.push(const_1028);
            return;
         }
         if(param1 > 0 && param1 <= const_753)
         {
            if(var_574)
            {
               var_574 = false;
               var_226 = new Array();
               var_226.push(const_753 + param1);
               var_226.push(const_482 + param1);
               var_226.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
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
