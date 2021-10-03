package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1069:int = 31;
      
      private static const const_1028:int = 32;
      
      private static const const_483:int = 30;
      
      private static const const_753:int = 20;
      
      private static const const_482:int = 10;
       
      
      private var var_574:Boolean = false;
      
      private var var_226:Array;
      
      public function FurnitureValRandomizerVisualization()
      {
         var_226 = new Array();
         super();
         super.setAnimation(const_483);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            var_574 = true;
            var_226 = new Array();
            var_226.push(const_1069);
            var_226.push(const_1028);
            return;
         }
         if(param1 > 0 && param1 <= const_482)
         {
            if(var_574)
            {
               var_574 = false;
               var_226 = new Array();
               if(_direction == 2)
               {
                  var_226.push(const_753 + 5 - param1);
                  var_226.push(const_482 + 5 - param1);
               }
               else
               {
                  var_226.push(const_753 + param1);
                  var_226.push(const_482 + param1);
               }
               var_226.push(const_483);
               return;
            }
            super.setAnimation(const_483);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(11))
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
