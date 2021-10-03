package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_621:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_621 = new ByteArray();
         var_621.writeShort(param1);
         var_621.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_621.position = 0;
         if(false)
         {
            _loc1_ = var_621.readShort();
            var_621.position = 0;
         }
         return _loc1_;
      }
   }
}
