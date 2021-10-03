package com.sulake.core.runtime.exceptions
{
   import com.sulake.core.runtime.CoreComponent;
   
   public class CrashMeError extends Error
   {
       
      
      public function CrashMeError()
      {
         super("An intentional crash triggered by the user",CoreComponent.const_1308);
      }
   }
}
