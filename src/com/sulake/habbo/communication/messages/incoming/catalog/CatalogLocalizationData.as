package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogLocalizationData
   {
       
      
      private var var_577:Array;
      
      private var var_863:Array;
      
      public function CatalogLocalizationData(param1:IMessageDataWrapper)
      {
         super();
         var_863 = new Array();
         var_577 = new Array();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_863.push(param1.readString());
            _loc3_++;
         }
         var _loc4_:int = param1.readInteger();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            var_577.push(param1.readString());
            _loc5_++;
         }
      }
      
      public function get texts() : Array
      {
         return var_577;
      }
      
      public function get images() : Array
      {
         return var_863;
      }
   }
}
