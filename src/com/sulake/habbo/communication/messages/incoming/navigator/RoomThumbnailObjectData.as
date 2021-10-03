package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1487:int;
      
      private var var_1486:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function get pos() : int
      {
         return var_1487;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1487 = param1;
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1487 = this.var_1487;
         _loc1_.var_1486 = this.var_1486;
         return _loc1_;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1486 = param1;
      }
      
      public function get imgId() : int
      {
         return var_1486;
      }
   }
}
