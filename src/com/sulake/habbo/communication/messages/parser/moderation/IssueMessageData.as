package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_141:int = 1;
      
      public static const const_1219:int = 3;
      
      public static const const_460:int = 2;
       
      
      private var var_1861:int;
      
      private var var_1854:int;
      
      private var var_1857:int;
      
      private var var_1580:int;
      
      private var _state:int;
      
      private var var_418:int;
      
      private var var_1093:int;
      
      private var var_1853:int;
      
      private var var_984:int;
      
      private var _roomResources:String;
      
      private var var_1859:int;
      
      private var var_1863:int;
      
      private var var_1862:String;
      
      private var var_1856:String;
      
      private var var_1855:int = 0;
      
      private var var_1222:String;
      
      private var _message:String;
      
      private var var_1849:int;
      
      private var var_1858:String;
      
      private var var_1070:int;
      
      private var var_656:String;
      
      private var var_1860:String;
      
      private var var_1414:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_984 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         var_1855 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return var_1863;
      }
      
      public function set roomName(param1:String) : void
      {
         var_656 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         var_1859 = param1;
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      public function get roomResources() : String
      {
         return _roomResources;
      }
      
      public function set roomResources(param1:String) : void
      {
         _roomResources = param1;
      }
      
      public function get roomName() : String
      {
         return var_656;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function set worldId(param1:int) : void
      {
         var_1580 = param1;
      }
      
      public function set state(param1:int) : void
      {
         _state = param1;
      }
      
      public function get unitPort() : int
      {
         return var_1854;
      }
      
      public function get priority() : int
      {
         return var_1861 + var_1855;
      }
      
      public function set issueId(param1:int) : void
      {
         var_1853 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return var_1856;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - var_1414) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return var_1070;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         var_1863 = param1;
      }
      
      public function get roomType() : int
      {
         return var_1093;
      }
      
      public function set flatType(param1:String) : void
      {
         var_1862 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return var_1859;
      }
      
      public function set message(param1:String) : void
      {
         _message = param1;
      }
      
      public function get worldId() : int
      {
         return var_1580;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         var_1860 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1222 = param1;
      }
      
      public function get issueId() : int
      {
         return var_1853;
      }
      
      public function set priority(param1:int) : void
      {
         var_1861 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         var_1854 = param1;
      }
      
      public function get flatType() : String
      {
         return var_1862;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         var_1857 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         var_1856 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         var_1849 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1222;
      }
      
      public function set roomType(param1:int) : void
      {
         var_1093 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return var_1857;
      }
      
      public function set flatId(param1:int) : void
      {
         var_418 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1070 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_1414 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return var_1849;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         var_1858 = param1;
      }
      
      public function get timeStamp() : int
      {
         return var_1414;
      }
      
      public function get reportedUserId() : int
      {
         return var_984;
      }
      
      public function get flatId() : int
      {
         return var_418;
      }
      
      public function get flatOwnerName() : String
      {
         return var_1860;
      }
      
      public function get reporterUserName() : String
      {
         return var_1858;
      }
   }
}
