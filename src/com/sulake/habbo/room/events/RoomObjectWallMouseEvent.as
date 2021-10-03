package com.sulake.habbo.room.events
{
   import com.sulake.room.events.RoomObjectMouseEvent;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObjectWallMouseEvent extends RoomObjectMouseEvent
   {
       
      
      private var _direction:Number;
      
      private var var_1422:Vector3d = null;
      
      private var var_1421:Vector3d = null;
      
      private var var_1423:Vector3d = null;
      
      private var var_91:Number;
      
      private var _y:Number;
      
      public function RoomObjectWallMouseEvent(param1:String, param2:int, param3:String, param4:IVector3d, param5:IVector3d, param6:IVector3d, param7:Number, param8:Number, param9:Number, param10:Boolean = false, param11:Boolean = false)
      {
         super(param1,param2,param3,param10,param11);
         var_1423 = new Vector3d();
         var_1423.assign(param4);
         var_1421 = new Vector3d();
         var_1421.assign(param5);
         var_1422 = new Vector3d();
         var_1422.assign(param6);
         var_91 = param7;
         _y = param8;
         _direction = param9;
      }
      
      public function get direction() : Number
      {
         return _direction;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get wallHeight() : IVector3d
      {
         return var_1422;
      }
      
      public function get x() : Number
      {
         return var_91;
      }
      
      public function get wallWidth() : IVector3d
      {
         return var_1421;
      }
      
      public function get wallLocation() : IVector3d
      {
         return var_1423;
      }
   }
}
