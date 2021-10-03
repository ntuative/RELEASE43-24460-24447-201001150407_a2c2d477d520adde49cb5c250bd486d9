package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomSettingsFlatInfo
   {
      
      public static const const_441:int = 0;
      
      public static const const_104:int = 2;
      
      public static const const_153:int = 1;
      
      public static const const_538:Array = ["open","closed","password"];
       
      
      private var _id:int;
      
      private var var_1624:Boolean;
      
      private var _password:String;
      
      private var var_1625:int;
      
      private var _type:String;
      
      private var _ownerName:String;
      
      private var var_1630:Boolean;
      
      private var var_1658:Boolean;
      
      private var _name:String;
      
      private var var_1628:Boolean;
      
      private var var_1060:String;
      
      public function RoomSettingsFlatInfo()
      {
         super();
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set password(param1:String) : void
      {
         _password = param1;
      }
      
      public function set allowFurniMoving(param1:Boolean) : void
      {
         var_1624 = param1;
      }
      
      public function get categoryAlertKey() : Boolean
      {
         return var_1658;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      public function set showOwnerName(param1:Boolean) : void
      {
         var_1630 = param1;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1628;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get showOwnerName() : Boolean
      {
         return var_1630;
      }
      
      public function get allowFurniMoving() : Boolean
      {
         return var_1624;
      }
      
      public function set categoryAlertKey(param1:Boolean) : void
      {
         var_1658 = param1;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1625 = param1;
      }
      
      public function set allowTrading(param1:Boolean) : void
      {
         var_1628 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_1625;
      }
      
      public function get password() : String
      {
         return _password;
      }
      
      public function set id(param1:int) : void
      {
         _id = param1;
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
