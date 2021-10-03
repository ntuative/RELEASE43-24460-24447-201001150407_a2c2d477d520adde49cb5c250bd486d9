package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1838:int;
      
      private var var_1839:int = 0;
      
      private var var_1836:String;
      
      private var var_1837:int;
      
      private var var_1835:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_1838 = param1;
         var_1837 = param2;
         var_1835 = param3;
         var_1836 = param4;
      }
      
      public function get length() : int
      {
         return var_1837;
      }
      
      public function get name() : String
      {
         return var_1835;
      }
      
      public function get creator() : String
      {
         return var_1836;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_1839;
      }
      
      public function get id() : int
      {
         return var_1838;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_1839 = param1;
      }
   }
}
