package com.sulake.habbo.avatar.structure
{
   import com.sulake.habbo.avatar.actions.ActionDefinition;
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.parts.ActivePartSet;
   import com.sulake.habbo.avatar.structure.parts.PartDefinition;
   import flash.utils.Dictionary;
   
   public class PartSetsData implements IStructureData
   {
       
      
      private var var_519:Dictionary;
      
      private var var_799:Dictionary;
      
      public function PartSetsData()
      {
         super();
         var_519 = new Dictionary();
         var_799 = new Dictionary();
      }
      
      public function get parts() : Dictionary
      {
         return var_519;
      }
      
      public function getPartDefinition(param1:String) : PartDefinition
      {
         return var_519[param1] as PartDefinition;
      }
      
      public function getActiveParts(param1:IActionDefinition) : Array
      {
         var _loc2_:ActivePartSet = var_799[param1.activePartSet];
         if(_loc2_ != null)
         {
            return _loc2_.parts;
         }
         return [];
      }
      
      public function addPartDefinition(param1:XML) : PartDefinition
      {
         var _loc2_:String = String(param1["set-type"]);
         if(true)
         {
            var_519[_loc2_] = new PartDefinition(param1);
         }
         return var_519[_loc2_];
      }
      
      public function get activePartSets() : Dictionary
      {
         return var_799;
      }
      
      public function parse(param1:XML) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 == null)
         {
            return false;
         }
         for each(_loc2_ in param1.partSet[0].part)
         {
            var_519[String(_loc2_["set-type"])] = new PartDefinition(_loc2_);
         }
         for each(_loc3_ in param1.activePartSet)
         {
            var_799[String(_loc3_.@id)] = new ActivePartSet(_loc3_);
         }
         return true;
      }
      
      public function getActivePartSet(param1:ActionDefinition) : ActivePartSet
      {
         return var_799[param1.activePartSet] as ActivePartSet;
      }
      
      public function append(param1:XML) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 == null)
         {
            return false;
         }
         for each(_loc2_ in param1.partSet[0].part)
         {
            var_519[String(_loc2_["set-type"])] = new PartDefinition(_loc2_);
         }
         for each(_loc3_ in param1.activePartSet)
         {
            var_799[String(_loc3_.@id)] = new ActivePartSet(_loc3_);
         }
         return false;
      }
   }
}
