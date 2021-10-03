package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var var_2181:Boolean;
      
      protected var var_1331:Number;
      
      protected var var_2179:Boolean;
      
      protected var _type:int;
      
      protected var var_2180:Boolean;
      
      protected var var_1838:int;
      
      protected var var_2183:Boolean;
      
      protected var var_1301:String;
      
      protected var var_1600:int;
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var var_1884:String;
      
      protected var var_1603:Boolean;
      
      protected var _category:int;
      
      protected var var_1597:int;
      
      protected var var_2182:int;
      
      protected var var_1602:int;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         _id = param1;
         _type = param2;
         _ref = param3;
         _category = param4;
         var_1603 = param5;
         var_2183 = param6;
         var_2181 = param7;
         var_2179 = param8;
         var_1301 = param9;
         var_1331 = param10;
         var_2182 = param11;
         var_1602 = param12;
         var_1597 = param13;
         var_1600 = param14;
         var_1884 = param15;
         var_1838 = param16;
      }
      
      public function get locked() : Boolean
      {
         return var_2180;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get extra() : Number
      {
         return var_1331;
      }
      
      public function set locked(param1:Boolean) : void
      {
         var_2180 = param1;
      }
      
      public function get ref() : int
      {
         return _ref;
      }
      
      public function get songId() : int
      {
         return var_1838;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get sellable() : Boolean
      {
         return var_2179;
      }
      
      public function get slotId() : String
      {
         return var_1884;
      }
      
      public function get expires() : int
      {
         return var_2182;
      }
      
      public function get creationYear() : int
      {
         return var_1600;
      }
      
      public function get creationDay() : int
      {
         return var_1602;
      }
      
      public function get stuffData() : String
      {
         return var_1301;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tradeable() : Boolean
      {
         return var_2183;
      }
      
      public function get groupable() : Boolean
      {
         return var_1603;
      }
      
      public function get creationMonth() : int
      {
         return var_1597;
      }
      
      public function get recyclable() : Boolean
      {
         return var_2181;
      }
   }
}
