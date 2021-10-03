package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct
   {
       
      
      private var var_1013:IID;
      
      private var var_411:uint;
      
      private var var_1259:IUnknown;
      
      private var var_1258:String;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_1013 = param1;
         var_1258 = getQualifiedClassName(var_1013);
         var_1259 = param2;
         var_411 = 0;
      }
      
      public function get iid() : IID
      {
         return var_1013;
      }
      
      public function get references() : uint
      {
         return var_411;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_411) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_1259;
      }
      
      public function get iis() : String
      {
         return var_1258;
      }
      
      public function reserve() : uint
      {
         return ++var_411;
      }
      
      public function dispose() : void
      {
         var_1013 = null;
         var_1258 = null;
         var_1259 = null;
         var_411 = 0;
      }
   }
}
