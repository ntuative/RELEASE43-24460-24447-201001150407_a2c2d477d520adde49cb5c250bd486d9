package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_2099:Boolean = false;
      
      private var var_2100:int = 0;
      
      private var var_1784:int = 0;
      
      private var var_2098:int = 0;
      
      private var var_1352:int = 0;
      
      private var var_1785:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_1352 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_2100;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_2099;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_2099 = param1;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_2100 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1784 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_1352;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_2098 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_1784;
      }
      
      public function get pixelBalance() : int
      {
         return var_2098;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1785 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_1785;
      }
   }
}
