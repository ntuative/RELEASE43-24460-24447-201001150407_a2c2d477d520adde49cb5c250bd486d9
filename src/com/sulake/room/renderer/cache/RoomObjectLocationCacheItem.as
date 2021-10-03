package com.sulake.room.renderer.cache
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObjectLocationCacheItem
   {
       
      
      private var var_1670:int = -1;
      
      private var var_1098:int = -1;
      
      private var var_606:Vector3d = null;
      
      public function RoomObjectLocationCacheItem()
      {
         super();
         var_606 = new Vector3d();
      }
      
      public function get objectUpdateId() : int
      {
         return var_1670;
      }
      
      public function set objectUpdateId(param1:int) : void
      {
         var_1670 = param1;
      }
      
      public function set screenLoc(param1:IVector3d) : void
      {
         var_606.assign(param1);
         var_606.x = Math.round(var_606.x);
         var_606.y = Math.round(var_606.y);
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         var_1098 = param1;
      }
      
      public function get screenLoc() : IVector3d
      {
         return var_606;
      }
      
      public function get geometryUpdateId() : int
      {
         return var_1098;
      }
   }
}
