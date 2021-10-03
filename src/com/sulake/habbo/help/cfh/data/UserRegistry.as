package com.sulake.habbo.help.cfh.data
{
   import com.sulake.core.utils.Map;
   
   public class UserRegistry
   {
      
      private static const const_1070:int = 80;
       
      
      private var var_462:Map;
      
      private var var_656:String = "";
      
      private var var_1193:Array;
      
      public function UserRegistry()
      {
         var_462 = new Map();
         var_1193 = new Array();
         super();
      }
      
      private function addRoomNameForMissing() : void
      {
         var _loc1_:* = null;
         while(false)
         {
            _loc1_ = var_462.getValue(var_1193.shift());
            if(_loc1_ != null)
            {
               _loc1_.roomName = var_656;
            }
         }
      }
      
      public function registerUser(param1:int, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:* = null;
         if(var_462.getValue(param1) != null)
         {
            var_462.remove(param1);
         }
         if(param3)
         {
            _loc4_ = new UserRegistryItem(param1,param2,var_656);
         }
         else
         {
            _loc4_ = new UserRegistryItem(param1,param2);
         }
         if(param3 && var_656 == "")
         {
            var_1193.push(param1);
         }
         var_462.add(param1,_loc4_);
         purgeUserIndex();
      }
      
      public function getRegistry() : Map
      {
         return var_462;
      }
      
      public function unregisterRoom() : void
      {
         var_656 = "";
      }
      
      private function purgeUserIndex() : void
      {
         var _loc1_:int = 0;
         while(var_462.length > const_1070)
         {
            _loc1_ = var_462.getKey(0);
            var_462.remove(_loc1_);
         }
      }
      
      public function method_10(param1:String) : void
      {
         var_656 = param1;
         if(var_656 != "")
         {
            addRoomNameForMissing();
         }
      }
   }
}
