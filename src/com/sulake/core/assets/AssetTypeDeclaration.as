package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_1593:Class;
      
      private var var_1594:Class;
      
      private var var_1595:String;
      
      private var var_1067:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_1595 = param1;
         var_1594 = param2;
         var_1593 = param3;
         if(rest == null)
         {
            var_1067 = new Array();
         }
         else
         {
            var_1067 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_1593;
      }
      
      public function get assetClass() : Class
      {
         return var_1594;
      }
      
      public function get mimeType() : String
      {
         return var_1595;
      }
      
      public function get fileTypes() : Array
      {
         return var_1067;
      }
   }
}
