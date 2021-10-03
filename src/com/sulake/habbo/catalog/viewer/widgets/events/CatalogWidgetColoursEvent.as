package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetColoursEvent extends Event
   {
       
      
      private var var_1292:Array;
      
      private var var_1943:String;
      
      private var var_1944:String;
      
      private var var_1942:String;
      
      public function CatalogWidgetColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_COLOUR_ARRAY,param5,param6);
         var_1292 = param1;
         var_1943 = param2;
         var_1944 = param3;
         var_1942 = param4;
      }
      
      public function get colours() : Array
      {
         return var_1292;
      }
      
      public function get backgroundAssetName() : String
      {
         return var_1943;
      }
      
      public function get colourAssetName() : String
      {
         return var_1944;
      }
      
      public function get chosenColourAssetName() : String
      {
         return var_1942;
      }
   }
}
