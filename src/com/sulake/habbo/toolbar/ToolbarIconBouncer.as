package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_1669:Number;
      
      private var var_511:Number = 0;
      
      private var var_1668:Number;
      
      private var var_510:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_1669 = param1;
         var_1668 = param2;
      }
      
      public function update() : void
      {
         var_510 += var_1668;
         var_511 += var_510;
         if(var_511 > 0)
         {
            var_511 = 0;
            var_510 = var_1669 * -1 * var_510;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_510 = param1;
         var_511 = 0;
      }
      
      public function get location() : Number
      {
         return var_511;
      }
   }
}
