package com.sulake.habbo.widget.infostand
{
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import flash.display.BitmapData;
   
   public class InfoStandPetData
   {
       
      
      private var var_1610:int;
      
      private var var_1613:int;
      
      private var var_1619:int;
      
      private var _type:int;
      
      private var var_1188:int = -1;
      
      private var var_1617:int;
      
      private var _nutrition:int;
      
      private var var_1615:int;
      
      private var _energy:int;
      
      private var var_1612:int;
      
      private var var_1614:int;
      
      private var var_1620:int;
      
      private var var_1616:int;
      
      private var _petRespect:int;
      
      private var _canOwnerBeKicked:Boolean;
      
      private var _image:BitmapData;
      
      private var _ownerName:String;
      
      private var var_1618:Boolean;
      
      private var _name:String = "";
      
      private var var_1611:int;
      
      public function InfoStandPetData()
      {
         super();
      }
      
      public function get isOwnPet() : Boolean
      {
         return var_1618;
      }
      
      public function get level() : int
      {
         return var_1610;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get experienceMax() : int
      {
         return var_1615;
      }
      
      public function get id() : int
      {
         return var_1188;
      }
      
      public function get nutritionMax() : int
      {
         return var_1619;
      }
      
      public function get ownerId() : int
      {
         return var_1611;
      }
      
      public function setData(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         _name = param1.name;
         var_1188 = param1.id;
         _type = param1.petType;
         var_1612 = param1.petRace;
         _image = param1.image;
         var_1618 = param1.isOwnPet;
         var_1611 = param1.ownerId;
         _ownerName = param1.ownerName;
         _canOwnerBeKicked = param1.canOwnerBeKicked;
         var_1610 = param1.level;
         var_1617 = param1.levelMax;
         var_1613 = param1.experience;
         var_1615 = param1.experienceMax;
         _energy = param1.energy;
         var_1614 = param1.energyMax;
         _nutrition = param1.nutrition;
         var_1619 = param1.nutritionMax;
         _petRespect = param1.petRespect;
         var_1620 = param1.roomIndex;
         var_1616 = param1.age;
      }
      
      public function get roomIndex() : int
      {
         return var_1620;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get energyMax() : int
      {
         return var_1614;
      }
      
      public function get levelMax() : int
      {
         return var_1617;
      }
      
      public function get petRespect() : int
      {
         return _petRespect;
      }
      
      public function get race() : int
      {
         return var_1612;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get canOwnerBeKicked() : Boolean
      {
         return _canOwnerBeKicked;
      }
      
      public function get experience() : int
      {
         return var_1613;
      }
      
      public function get age() : int
      {
         return var_1616;
      }
   }
}
