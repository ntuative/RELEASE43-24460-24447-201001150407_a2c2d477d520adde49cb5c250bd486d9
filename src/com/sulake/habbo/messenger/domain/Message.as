package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_556:int = 2;
      
      public static const const_899:int = 6;
      
      public static const const_678:int = 1;
      
      public static const const_719:int = 3;
      
      public static const const_855:int = 4;
      
      public static const const_660:int = 5;
       
      
      private var var_2066:String;
      
      private var var_967:int;
      
      private var var_1666:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_967 = param2;
         var_1666 = param3;
         var_2066 = param4;
      }
      
      public function get time() : String
      {
         return var_2066;
      }
      
      public function get senderId() : int
      {
         return var_967;
      }
      
      public function get messageText() : String
      {
         return var_1666;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
