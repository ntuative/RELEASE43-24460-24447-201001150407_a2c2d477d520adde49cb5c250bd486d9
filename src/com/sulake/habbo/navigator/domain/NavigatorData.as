package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.navigator.NavigatorSettingsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1420:int = 10;
       
      
      private var var_1522:NavigatorSettingsMessageParser;
      
      private var var_1285:int;
      
      private var var_2161:Boolean;
      
      private var var_2163:int;
      
      private var var_866:Dictionary;
      
      private var var_2250:int;
      
      private var var_2162:int;
      
      private var var_2127:int;
      
      private var var_344:Array;
      
      private var var_2159:int;
      
      private var var_580:PublicRoomShortData;
      
      private var var_417:RoomEventData;
      
      private var var_148:MsgWithRequestId;
      
      private var var_1829:Boolean;
      
      private var _navigator:HabboNavigator;
      
      private var var_2160:Boolean;
      
      private var var_207:GuestRoomData;
      
      private var var_703:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_344 = new Array();
         var_866 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get createdFlatId() : int
      {
         return var_2163;
      }
      
      public function get eventMod() : Boolean
      {
         return var_2160;
      }
      
      public function startLoading() : void
      {
         this.var_703 = true;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_2160 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_417 != null)
         {
            var_417.dispose();
         }
         var_417 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_148 != null && var_148 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_148 != null && var_148 as GuestRoomSearchResultData != null;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_148 = param1;
         var_703 = false;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_148 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_207;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_580 = null;
         var_207 = null;
         _currentRoomOwner = false;
         if(param1.guestRoom)
         {
            _currentRoomOwner = param1.owner;
         }
         else
         {
            var_580 = param1.publicSpace;
            var_417 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(var_417 != null)
         {
            var_417.dispose();
            var_417 = null;
         }
         if(var_580 != null)
         {
            var_580.dispose();
            var_580 = null;
         }
         if(var_207 != null)
         {
            var_207.dispose();
            var_207 = null;
         }
         _currentRoomOwner = false;
      }
      
      public function get settings() : NavigatorSettingsMessageParser
      {
         return var_1522;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_148 = param1;
         var_703 = false;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return _currentRoomOwner;
      }
      
      public function getCategoryByIndex(param1:int) : FlatCategory
      {
         if(var_344.length > param1)
         {
            return var_344[param1] as FlatCategory;
         }
         return null;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2250 = param1.limit;
         this.var_1285 = param1.favouriteRoomIds.length;
         this.var_866 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_866[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_148 as PopularRoomTagsData;
      }
      
      public function get categories() : Array
      {
         return var_344;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_580;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_2127 = param1;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_2161;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_148 = param1;
         var_703 = false;
      }
      
      public function getCategoryIndexById(param1:int) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < var_344.length)
         {
            if((var_344[_loc2_] as FlatCategory).nodeId == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_207 != null && _currentRoomOwner;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_703;
      }
      
      public function set categories(param1:Array) : void
      {
         var_344 = param1;
      }
      
      public function get currentRoomRating() : int
      {
         return var_2162;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_2159;
      }
      
      public function set settings(param1:NavigatorSettingsMessageParser) : void
      {
         var_1522 = param1;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_148 == null)
         {
            return;
         }
         var_148.dispose();
         var_148 = null;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_417;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_866[param1] = !!param2 ? "yes" : null;
         var_1285 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_148 as OfficialRoomsData;
      }
      
      public function get avatarId() : int
      {
         return var_2127;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_148 != null && var_148 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_2161 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_2162 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_1829 = param1;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_207 != null)
         {
            var_207.dispose();
         }
         var_207 = param1;
      }
      
      public function getCategoryById(param1:int) : FlatCategory
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_344)
         {
            if(_loc2_.nodeId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_207 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1522.homeRoomId == _loc1_;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1285 >= var_2250;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_2159 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_1829;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_207 != null && !_currentRoomOwner;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_2163 = param1;
      }
   }
}
