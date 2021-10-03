package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_199:String = "RWUIUE_PEER";
      
      public static const const_217:String = "RWUIUE_OWN_USER";
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_1184:String = "BOT";
      
      public static const const_963:int = 2;
      
      public static const const_1293:int = 0;
      
      public static const const_887:int = 3;
       
      
      private var var_1155:String = "";
      
      private var var_1740:Boolean = false;
      
      private var var_1742:int = 0;
      
      private var var_1750:int = 0;
      
      private var var_1744:Boolean = false;
      
      private var var_1154:String = "";
      
      private var var_1748:Boolean = false;
      
      private var var_765:int = 0;
      
      private var var_1752:Boolean = true;
      
      private var var_1025:int = 0;
      
      private var var_1749:Boolean = false;
      
      private var var_1298:Boolean = false;
      
      private var var_1751:Boolean = false;
      
      private var var_1741:int = 0;
      
      private var var_1745:Boolean = false;
      
      private var _image:BitmapData = null;
      
      private var var_273:Array;
      
      private var var_1296:Boolean = false;
      
      private var _name:String = "";
      
      private var var_1747:int = 0;
      
      private var var_1753:Boolean = false;
      
      private var var_1743:int = 0;
      
      private var var_1746:String = "";
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         var_273 = [];
         super(param1,param2,param3);
      }
      
      public function get userRoomId() : int
      {
         return var_1750;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_1750 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return var_1740;
      }
      
      public function get canBeKicked() : Boolean
      {
         return var_1752;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         var_1752 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_1748 = param1;
      }
      
      public function get motto() : String
      {
         return var_1155;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_1749 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_1298;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set motto(param1:String) : void
      {
         var_1155 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_1753;
      }
      
      public function get groupBadgeId() : String
      {
         return var_1746;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_1298 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return var_1745;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_1741 = param1;
      }
      
      public function get badges() : Array
      {
         return var_273;
      }
      
      public function get amIController() : Boolean
      {
         return var_1744;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         var_1744 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_1753 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         var_1743 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_1746 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         var_1154 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_1748;
      }
      
      public function get isIgnored() : Boolean
      {
         return var_1749;
      }
      
      public function get carryItem() : int
      {
         return var_1741;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_1296;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_1296 = param1;
      }
      
      public function set respectLeft(param1:int) : void
      {
         var_765 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get canTradeReason() : int
      {
         return var_1743;
      }
      
      public function get realName() : String
      {
         return var_1154;
      }
      
      public function set webID(param1:int) : void
      {
         var_1747 = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         var_273 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         var_1751 = param1;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         var_1745 = param1;
      }
      
      public function get respectLeft() : int
      {
         return var_765;
      }
      
      public function get webID() : int
      {
         return var_1747;
      }
      
      public function set groupId(param1:int) : void
      {
         var_1025 = param1;
      }
      
      public function get xp() : int
      {
         return var_1742;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         var_1740 = param1;
      }
      
      public function get groupId() : int
      {
         return var_1025;
      }
      
      public function get canTrade() : Boolean
      {
         return var_1751;
      }
      
      public function set xp(param1:int) : void
      {
         var_1742 = param1;
      }
   }
}
