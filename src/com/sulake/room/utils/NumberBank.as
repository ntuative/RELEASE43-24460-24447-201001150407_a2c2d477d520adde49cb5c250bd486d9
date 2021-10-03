package com.sulake.room.utils
{
   public class NumberBank
   {
       
      
      private var var_2223:int = 0;
      
      private var var_787:Array;
      
      private var _freeNumbers:Array;
      
      public function NumberBank(param1:int)
      {
         var_787 = [];
         _freeNumbers = [];
         super();
         if(param1 < 0)
         {
            param1 = 0;
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1)
         {
            _freeNumbers.push(_loc2_);
            _loc2_++;
         }
      }
      
      public function dispose() : void
      {
         var_787 = null;
         _freeNumbers = null;
         var_2223 = 0;
      }
      
      public function reserveNumber() : int
      {
         var _loc1_:int = 0;
         if(false)
         {
            _loc1_ = _freeNumbers.pop() as int;
            var_787.push(_loc1_);
            return _loc1_;
         }
         return -1;
      }
      
      public function freeNumber(param1:int) : void
      {
         var _loc2_:int = var_787.indexOf(param1);
         if(_loc2_ >= 0)
         {
            var_787.splice(_loc2_,1);
            _freeNumbers.push(param1);
         }
      }
   }
}
