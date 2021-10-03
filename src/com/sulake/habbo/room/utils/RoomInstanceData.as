package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var var_838:LegacyWallGeometry = null;
      
      private var var_563:SelectedRoomObjectData = null;
      
      private var _roomCategory:int = 0;
      
      private var var_564:TileHeightMap = null;
      
      private var var_2063:String = null;
      
      private var _roomId:int = 0;
      
      private var var_837:RoomCamera = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         _roomId = param1;
         _roomCategory = param2;
         var_838 = new LegacyWallGeometry();
         var_837 = new RoomCamera();
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(var_564 != null)
         {
            var_564.dispose();
         }
         var_564 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function set worldType(param1:String) : void
      {
         var_2063 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return var_838;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return var_837;
      }
      
      public function dispose() : void
      {
         if(var_564 != null)
         {
            var_564.dispose();
            var_564 = null;
         }
         if(var_838 != null)
         {
            var_838.dispose();
            var_838 = null;
         }
         if(var_837 != null)
         {
            var_837.dispose();
            var_837 = null;
         }
         if(var_563 != null)
         {
            var_563.dispose();
            var_563 = null;
         }
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return var_564;
      }
      
      public function get worldType() : String
      {
         return var_2063;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_563 != null)
         {
            var_563.dispose();
         }
         var_563 = param1;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return var_563;
      }
   }
}
