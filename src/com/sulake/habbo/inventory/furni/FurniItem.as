package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1897:int;
      
      private var var_2068:Boolean;
      
      private var var_1838:int;
      
      private var var_1301:String;
      
      private var var_2069:Boolean = false;
      
      private var var_1547:int;
      
      private var var_421:int;
      
      private var var_924:String;
      
      private var var_1884:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1187:int;
      
      private var var_2067:Boolean;
      
      private var var_2070:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_1897 = param1;
         var_924 = param2;
         _objId = param3;
         var_1187 = param4;
         var_1301 = param5;
         var_2068 = param6;
         var_2067 = param7;
         var_1547 = param8;
         var_1884 = param9;
         var_1838 = param10;
         var_421 = -1;
      }
      
      public function get songId() : int
      {
         return var_1838;
      }
      
      public function get iconCallbackId() : int
      {
         return var_421;
      }
      
      public function get expiryTime() : int
      {
         return var_1547;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_2070 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_2069 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_421 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_2067;
      }
      
      public function get slotId() : String
      {
         return var_1884;
      }
      
      public function get classId() : int
      {
         return var_1187;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_2068;
      }
      
      public function get stuffData() : String
      {
         return var_1301;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_1897;
      }
      
      public function get isLocked() : Boolean
      {
         return var_2069;
      }
      
      public function get prevCallbackId() : int
      {
         return var_2070;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_924;
      }
   }
}
