package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var var_1022:Boolean;
      
      private var _name:String;
      
      private var var_2072:String;
      
      private var var_1023:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         _name = String(param1.@name);
         var_2072 = String(param1.@link);
         var_1023 = Boolean(parseInt(param1.@fliph));
         var_1022 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get flipH() : Boolean
      {
         return var_1023;
      }
      
      public function get flipV() : Boolean
      {
         return var_1022;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get link() : String
      {
         return var_2072;
      }
   }
}
