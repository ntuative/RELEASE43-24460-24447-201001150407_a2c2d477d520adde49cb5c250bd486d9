package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_1769:Array;
      
      private var var_1709:String;
      
      private var var_1767:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         var_1709 = param1;
         var_1769 = param2;
         var_1767 = param3;
      }
      
      public function get menuId() : String
      {
         return var_1709;
      }
      
      public function get yieldList() : Array
      {
         return var_1769;
      }
      
      public function get lockToIcon() : Boolean
      {
         return var_1767;
      }
   }
}
