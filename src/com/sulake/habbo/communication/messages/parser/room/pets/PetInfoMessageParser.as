package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1616:int;
      
      private var var_520:String;
      
      private var var_1610:int;
      
      private var var_1673:int;
      
      private var var_1613:int;
      
      private var var_1923:int;
      
      private var _nutrition:int;
      
      private var var_1188:int;
      
      private var var_1922:int;
      
      private var var_1924:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_1611:int;
      
      private var var_1921:int;
      
      public function PetInfoMessageParser()
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
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get maxEnergy() : int
      {
         return var_1923;
      }
      
      public function flush() : Boolean
      {
         var_1188 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return var_1922;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_1924;
      }
      
      public function get maxNutrition() : int
      {
         return var_1921;
      }
      
      public function get figure() : String
      {
         return var_520;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_1673;
      }
      
      public function get petId() : int
      {
         return var_1188;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1188 = param1.readInteger();
         _name = param1.readString();
         var_1610 = param1.readInteger();
         var_1922 = param1.readInteger();
         var_1613 = param1.readInteger();
         var_1924 = param1.readInteger();
         _energy = param1.readInteger();
         var_1923 = param1.readInteger();
         _nutrition = param1.readInteger();
         var_1921 = param1.readInteger();
         var_520 = param1.readString();
         var_1673 = param1.readInteger();
         var_1611 = param1.readInteger();
         var_1616 = param1.readInteger();
         _ownerName = param1.readString();
         return true;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get experience() : int
      {
         return var_1613;
      }
      
      public function get ownerId() : int
      {
         return var_1611;
      }
      
      public function get age() : int
      {
         return var_1616;
      }
   }
}
