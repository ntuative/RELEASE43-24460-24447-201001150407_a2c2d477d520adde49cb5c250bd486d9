package com.sulake.habbo.friendlist.domain
{
   import com.sulake.habbo.communication.messages.incoming.friendlist.HabboSearchResultData;
   import flash.utils.Dictionary;
   
   public class AvatarSearchResults
   {
       
      
      private var var_1372:Array;
      
      private var var_386:IAvatarSearchDeps;
      
      private var _sentRequests:Dictionary;
      
      private var var_223:Array;
      
      public function AvatarSearchResults(param1:IAvatarSearchDeps)
      {
         _sentRequests = new Dictionary();
         super();
         var_386 = param1;
      }
      
      public function setFriendRequestSent(param1:int) : void
      {
         _sentRequests[param1] = "yes";
      }
      
      public function searchReceived(param1:Array, param2:Array) : void
      {
         var_223 = param1;
         var_1372 = param2;
         var_386.view.refreshList();
      }
      
      public function get others() : Array
      {
         return var_1372;
      }
      
      public function getResult(param1:int) : HabboSearchResultData
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         for each(_loc2_ in var_223)
         {
            if(_loc2_.avatarId == param1)
            {
               return _loc2_;
            }
         }
         for each(_loc3_ in var_1372)
         {
            if(_loc3_.avatarId == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function get friends() : Array
      {
         return var_223;
      }
      
      public function isFriendRequestSent(param1:int) : Boolean
      {
         return false;
      }
   }
}
