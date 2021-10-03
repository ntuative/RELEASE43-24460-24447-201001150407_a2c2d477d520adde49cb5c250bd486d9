package com.sulake.habbo.session.furniture
{
   public class FurnitureData implements IFurnitureData
   {
      
      public static const const_1513:String = "e";
      
      public static const const_1490:String = "i";
      
      public static const const_1489:String = "s";
       
      
      private var _id:int;
      
      private var _title:String;
      
      private var _type:String;
      
      private var var_1587:int;
      
      private var var_1292:Array;
      
      private var var_1585:int;
      
      private var var_1589:int;
      
      private var var_1588:int;
      
      private var _name:String;
      
      private var var_1586:int;
      
      private var var_1060:String;
      
      public function FurnitureData(param1:String, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Array, param10:String, param11:String)
      {
         super();
         _type = param1;
         _id = param2;
         _name = param3;
         var_1587 = param4;
         var_1586 = param5;
         var_1585 = param6;
         var_1589 = param7;
         var_1588 = param8;
         var_1292 = param9;
         _title = param10;
         var_1060 = param11;
      }
      
      public function get tileSizeY() : int
      {
         return var_1589;
      }
      
      public function get tileSizeZ() : int
      {
         return var_1588;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get title() : String
      {
         return _title;
      }
      
      public function get revision() : int
      {
         return var_1586;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get colourIndex() : int
      {
         return var_1587;
      }
      
      public function get tileSizeX() : int
      {
         return var_1585;
      }
      
      public function get colours() : Array
      {
         return var_1292;
      }
      
      public function get description() : String
      {
         return var_1060;
      }
   }
}
