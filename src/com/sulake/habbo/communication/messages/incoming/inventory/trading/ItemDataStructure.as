package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_924:String;
      
      private var var_1598:int;
      
      private var var_1596:int;
      
      private var var_1331:int;
      
      private var var_1600:int;
      
      private var _category:int;
      
      private var var_2272:int;
      
      private var var_1602:int;
      
      private var var_1601:int;
      
      private var var_1599:int;
      
      private var var_1597:int;
      
      private var var_1603:Boolean;
      
      private var var_1301:String;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         var_1598 = param1;
         var_924 = param2;
         var_1596 = param3;
         var_1599 = param4;
         _category = param5;
         var_1301 = param6;
         var_1331 = param7;
         var_1601 = param8;
         var_1602 = param9;
         var_1597 = param10;
         var_1600 = param11;
         var_1603 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_1599;
      }
      
      public function get extra() : int
      {
         return var_1331;
      }
      
      public function get stuffData() : String
      {
         return var_1301;
      }
      
      public function get groupable() : Boolean
      {
         return var_1603;
      }
      
      public function get creationMonth() : int
      {
         return var_1597;
      }
      
      public function get roomItemID() : int
      {
         return var_1596;
      }
      
      public function get itemType() : String
      {
         return var_924;
      }
      
      public function get itemID() : int
      {
         return var_1598;
      }
      
      public function get songID() : int
      {
         return var_1331;
      }
      
      public function get timeToExpiration() : int
      {
         return var_1601;
      }
      
      public function get creationYear() : int
      {
         return var_1600;
      }
      
      public function get creationDay() : int
      {
         return var_1602;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
