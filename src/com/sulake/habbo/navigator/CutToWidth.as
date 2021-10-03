package com.sulake.habbo.navigator
{
   import com.sulake.core.window.components.ITextWindow;
   
   public class CutToWidth implements BinarySearchTest
   {
       
      
      private var var_403:int;
      
      private var var_181:String;
      
      private var var_204:ITextWindow;
      
      public function CutToWidth()
      {
         super();
      }
      
      public function beforeSearch(param1:String, param2:ITextWindow, param3:int) : void
      {
         var_181 = param1;
         var_204 = param2;
         var_403 = param3;
      }
      
      public function test(param1:int) : Boolean
      {
         var_204.text = var_181.substring(0,param1) + "...";
         return var_204.textWidth > var_403;
      }
   }
}
