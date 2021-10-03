package com.sulake.core.runtime
{
   public interface ICoreConfigStatusListener extends IDisposable
   {
       
      
      function complete() : void;
      
      function set percent(param1:Number) : void;
   }
}
