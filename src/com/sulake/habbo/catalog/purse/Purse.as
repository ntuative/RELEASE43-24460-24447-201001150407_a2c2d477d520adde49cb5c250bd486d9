package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_1784:int = 0;
      
      private var var_1786:int = 0;
      
      private var var_1787:int = 0;
      
      private var var_1785:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get pixels() : int
      {
         return var_1786;
      }
      
      public function set pixels(param1:int) : void
      {
         var_1786 = param1;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1784 = param1;
      }
      
      public function get credits() : int
      {
         return var_1787;
      }
      
      public function get clubDays() : int
      {
         return var_1784;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1785 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_1787 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return var_1785;
      }
   }
}
