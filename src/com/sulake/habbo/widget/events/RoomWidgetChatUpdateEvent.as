package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetChatUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_103:int = 1;
      
      public static const const_229:int = 4;
      
      public static const const_234:int = 3;
      
      public static const const_129:int = 0;
      
      public static const const_562:String = "RWCUE_EVENT_CHAT";
      
      public static const const_96:int = 2;
       
      
      private var var_1691:int;
      
      private var var_204:String = "";
      
      private var var_1692:BitmapData;
      
      private var _userName:String;
      
      private var var_1197:int = 0;
      
      private var var_1688:uint;
      
      private var _userId:int = 0;
      
      private var _roomCategory:int;
      
      private var var_1690:Number;
      
      private var var_1689:Number;
      
      private var _roomId:int;
      
      public function RoomWidgetChatUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:int, param6:Number, param7:Number, param8:BitmapData, param9:uint, param10:int, param11:int, param12:int = 0, param13:Boolean = false, param14:Boolean = false)
      {
         super(param1,param13,param14);
         _userId = param2;
         var_204 = param3;
         var_1197 = param12;
         _userName = param4;
         var_1691 = param5;
         var_1690 = param6;
         var_1689 = param7;
         var_1692 = param8;
         var_1688 = param9;
         _roomId = param10;
         _roomCategory = param11;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get userImage() : BitmapData
      {
         return var_1692;
      }
      
      public function get text() : String
      {
         return var_204;
      }
      
      public function get userX() : Number
      {
         return var_1690;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
      
      public function get userCategory() : int
      {
         return var_1691;
      }
      
      public function get chatType() : int
      {
         return var_1197;
      }
      
      public function get userColor() : uint
      {
         return var_1688;
      }
      
      public function get userY() : Number
      {
         return var_1689;
      }
   }
}
