package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_441:int = 0;
      
      public static const const_104:int = 2;
      
      public static const const_153:int = 1;
      
      public static const const_538:Array = ["open","closed","password"];
       
      
      private var _name:String;
      
      private var var_1957:int;
      
      private var var_1958:int;
      
      private var var_1626:Array;
      
      private var var_1623:Boolean;
      
      private var var_1629:Boolean;
      
      private var var_1060:String;
      
      private var var_1624:Boolean;
      
      private var var_1627:int;
      
      private var var_1625:int;
      
      private var var_1070:int;
      
      private var var_1630:Boolean;
      
      private var _roomId:int;
      
      private var var_1628:Boolean;
      
      private var var_583:Array;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get maximumVisitors() : int
      {
         return var_1627;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_1627 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get tags() : Array
      {
         return var_583;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1629;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1628;
      }
      
      public function set controllerCount(param1:int) : void
      {
         var_1957 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_1626 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_583 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_1623;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return var_1958;
      }
      
      public function get categoryId() : int
      {
         return var_1070;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_1629 = param1;
      }
      
      public function set allowTrading(param1:Boolean) : void
      {
         var_1628 = param1;
      }
      
      public function set showOwnerName(param1:Boolean) : void
      {
         var_1630 = param1;
      }
      
      public function set allowFurniMoving(param1:Boolean) : void
      {
         var_1624 = param1;
      }
      
      public function get controllerCount() : int
      {
         return var_1957;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_1626;
      }
      
      public function get showOwnerName() : Boolean
      {
         return var_1630;
      }
      
      public function get allowFurniMoving() : Boolean
      {
         return var_1624;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1625 = param1;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_1623 = param1;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         var_1958 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_1625;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1070 = param1;
      }
      
      public function set description(param1:String) : void
      {
         var_1060 = param1;
      }
      
      public function get description() : String
      {
         return var_1060;
      }
   }
}
