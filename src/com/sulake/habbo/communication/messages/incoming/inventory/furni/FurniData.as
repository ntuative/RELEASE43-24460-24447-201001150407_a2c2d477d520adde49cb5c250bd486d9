package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1301:String;
      
      private var var_924:String;
      
      private var var_2167:Boolean;
      
      private var var_1331:int;
      
      private var var_1897:int;
      
      private var var_2168:Boolean;
      
      private var var_1884:String = "";
      
      private var var_2068:Boolean;
      
      private var _category:int;
      
      private var _objId:int;
      
      private var var_1187:int;
      
      private var var_2067:Boolean;
      
      private var var_1838:int = -1;
      
      private var var_1547:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         var_1897 = param1;
         var_924 = param2;
         _objId = param3;
         var_1187 = param4;
         _category = param5;
         var_1301 = param6;
         var_2167 = param7;
         var_2068 = param8;
         var_2067 = param9;
         var_2168 = param10;
         var_1547 = param11;
      }
      
      public function get slotId() : String
      {
         return var_1884;
      }
      
      public function get extra() : int
      {
         return var_1331;
      }
      
      public function get classId() : int
      {
         return var_1187;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isSellable() : Boolean
      {
         return var_2168;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_2167;
      }
      
      public function get stripId() : int
      {
         return var_1897;
      }
      
      public function get stuffData() : String
      {
         return var_1301;
      }
      
      public function get songId() : int
      {
         return var_1838;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         var_1884 = param1;
         var_1331 = param2;
      }
      
      public function get itemType() : String
      {
         return var_924;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get expiryTime() : int
      {
         return var_1547;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_2067;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_2068;
      }
   }
}
