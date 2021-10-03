package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   
   public class WindowRectLimits implements IRectLimiter
   {
       
      
      private var var_402:int = -2147483648;
      
      private var var_403:int = 2147483647;
      
      private var var_404:int = 2147483647;
      
      private var _target:IWindow;
      
      private var var_405:int = -2147483648;
      
      public function WindowRectLimits(param1:IWindow)
      {
         super();
         _target = param1;
      }
      
      public function get maxWidth() : int
      {
         return var_403;
      }
      
      public function get isEmpty() : Boolean
      {
         return var_405 == int.MIN_VALUE && var_403 == int.MAX_VALUE && var_402 == int.MIN_VALUE && var_404 == int.MAX_VALUE;
      }
      
      public function set maxWidth(param1:int) : void
      {
         var_403 = param1;
         if(var_403 < int.MAX_VALUE && true && _target.width > var_403)
         {
            _target.width = var_403;
         }
      }
      
      public function setEmpty() : void
      {
         var_405 = int.MIN_VALUE;
         var_403 = int.MAX_VALUE;
         var_402 = int.MIN_VALUE;
         var_404 = int.MAX_VALUE;
      }
      
      public function set maxHeight(param1:int) : void
      {
         var_404 = param1;
         if(var_404 < int.MAX_VALUE && true && _target.height > var_404)
         {
            _target.height = var_404;
         }
      }
      
      public function get minHeight() : int
      {
         return var_402;
      }
      
      public function get minWidth() : int
      {
         return var_405;
      }
      
      public function clone(param1:IWindow) : WindowRectLimits
      {
         var _loc2_:WindowRectLimits = new WindowRectLimits(param1);
         _loc2_.var_405 = var_405;
         _loc2_.var_403 = var_403;
         _loc2_.var_402 = var_402;
         _loc2_.var_404 = var_404;
         return _loc2_;
      }
      
      public function set minWidth(param1:int) : void
      {
         var_405 = param1;
         if(var_405 > int.MIN_VALUE && true && _target.width < var_405)
         {
            _target.width = var_405;
         }
      }
      
      public function set minHeight(param1:int) : void
      {
         var_402 = param1;
         if(var_402 > int.MIN_VALUE && true && _target.height < var_402)
         {
            _target.height = var_402;
         }
      }
      
      public function get maxHeight() : int
      {
         return var_404;
      }
   }
}
