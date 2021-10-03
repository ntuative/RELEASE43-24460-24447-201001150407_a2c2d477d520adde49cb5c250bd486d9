package com.sulake.core
{
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.ICore;
   import flash.display.DisplayObjectContainer;
   
   public final class Core
   {
      
      public static const const_1320:uint = 2;
      
      public static const const_1229:uint = 3;
      
      public static const const_1209:uint = 2147483648;
      
      public static const const_1151:uint = 0;
      
      public static const const_987:uint = 1;
      
      private static var _instance:ICore;
       
      
      public function Core()
      {
         super();
      }
      
      public static function get instance() : ICore
      {
         return _instance;
      }
      
      public static function crash(param1:String, param2:int, param3:Error = null) : void
      {
         if(_instance)
         {
            _instance.error(param1,true,param2,param3);
         }
      }
      
      public static function instantiate(param1:DisplayObjectContainer, param2:uint) : ICore
      {
         if(_instance == null)
         {
            _instance = new CoreComponent(param1,param2);
         }
         return _instance;
      }
      
      public static function get version() : String
      {
         return "0.0.2";
      }
      
      public static function dispose() : void
      {
         if(_instance != null)
         {
            _instance.dispose();
            _instance = null;
         }
      }
   }
}
