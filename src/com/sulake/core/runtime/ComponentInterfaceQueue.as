package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1185:IID;
      
      private var _isDisposed:Boolean;
      
      private var var_785:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         var_1185 = param1;
         var_785 = new Array();
         _isDisposed = false;
      }
      
      public function get receivers() : Array
      {
         return var_785;
      }
      
      public function get identifier() : IID
      {
         return var_1185;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function dispose() : void
      {
         if(!_isDisposed)
         {
            _isDisposed = true;
            var_1185 = null;
            while(false)
            {
               var_785.pop();
            }
            var_785 = null;
         }
      }
   }
}
