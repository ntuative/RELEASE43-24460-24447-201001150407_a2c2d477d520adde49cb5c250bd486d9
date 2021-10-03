package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var _removeSetType:String;
      
      private var var_1364:int = -1;
      
      private var var_1108:Boolean;
      
      private var var_1109:String;
      
      private var var_1719:String;
      
      public function PartDefinition(param1:XML)
      {
         super();
         var_1719 = String(param1["set-type"]);
         var_1109 = String(param1["flipped-set-type"]);
         _removeSetType = String(param1["remove-set-type"]);
         var_1108 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return var_1364 >= 0;
      }
      
      public function get flippedSetType() : String
      {
         return var_1109;
      }
      
      public function get staticId() : int
      {
         return var_1364;
      }
      
      public function set staticId(param1:int) : void
      {
         var_1364 = param1;
      }
      
      public function get appendToFigure() : Boolean
      {
         return var_1108;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         var_1108 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         var_1109 = param1;
      }
      
      public function get setType() : String
      {
         return var_1719;
      }
      
      public function get removeSetType() : String
      {
         return _removeSetType;
      }
   }
}
