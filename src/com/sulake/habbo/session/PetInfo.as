package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1610:int;
      
      private var var_1673:int;
      
      private var var_1613:int;
      
      private var var_1619:int;
      
      private var _nutrition:int;
      
      private var var_1188:int;
      
      private var var_1617:int;
      
      private var var_1615:int;
      
      private var _energy:int;
      
      private var var_1616:int;
      
      private var var_1614:int;
      
      private var _ownerName:String;
      
      private var var_1611:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1610;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function set respect(param1:int) : void
      {
         var_1673 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         _energy = param1;
      }
      
      public function set level(param1:int) : void
      {
         var_1610 = param1;
      }
      
      public function get petId() : int
      {
         return var_1188;
      }
      
      public function get experienceMax() : int
      {
         return var_1615;
      }
      
      public function get nutritionMax() : int
      {
         return var_1619;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_1617 = param1;
      }
      
      public function get ownerId() : int
      {
         return var_1611;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function set petId(param1:int) : void
      {
         var_1188 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         _nutrition = param1;
      }
      
      public function get energyMax() : int
      {
         return var_1614;
      }
      
      public function get respect() : int
      {
         return var_1673;
      }
      
      public function get levelMax() : int
      {
         return var_1617;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_1615 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_1613 = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_1619 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_1611 = param1;
      }
      
      public function get experience() : int
      {
         return var_1613;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_1614 = param1;
      }
      
      public function set age(param1:int) : void
      {
         var_1616 = param1;
      }
      
      public function get age() : int
      {
         return var_1616;
      }
   }
}
