package com.sulake.room.object
{
   import com.sulake.room.object.logic.IRoomObjectEventHandler;
   import com.sulake.room.object.logic.IRoomObjectMouseHandler;
   import com.sulake.room.object.visualization.IRoomObjectVisualization;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObject implements IRoomObjectController
   {
      
      private static var var_1282:int = 0;
       
      
      private var var_77:Vector3d;
      
      private var _updateID:uint;
      
      private var _type:String = "";
      
      private var _visualization:IRoomObjectVisualization;
      
      private var var_93:RoomObjectModel;
      
      private var var_415:IRoomObjectEventHandler;
      
      private var var_1519:Vector3d;
      
      private var var_2143:int = 0;
      
      private var _id:int;
      
      private var var_1518:Vector3d;
      
      private var var_225:Vector3d;
      
      private var var_493:Array;
      
      public function RoomObject(param1:int, param2:uint)
      {
         super();
         _id = param1;
         var_77 = new Vector3d();
         var_225 = new Vector3d();
         var_1519 = new Vector3d();
         var_1518 = new Vector3d();
         var_493 = new Array(param2);
         var _loc3_:Number = param2 - 1;
         while(_loc3_ >= 0)
         {
            var_493[_loc3_] = 0;
            _loc3_--;
         }
         var_93 = new RoomObjectModel();
         _visualization = null;
         var_415 = null;
         _updateID = 0;
         var_2143 = var_1282++;
      }
      
      public function getInstanceId() : int
      {
         return var_2143;
      }
      
      public function getId() : int
      {
         return _id;
      }
      
      public function getUpdateID() : uint
      {
         return _updateID;
      }
      
      public function dispose() : void
      {
         var_77 = null;
         var_225 = null;
         if(var_93 != null)
         {
            var_93.dispose();
            var_93 = null;
         }
         var_493 = null;
         setVisualization(null);
         setEventHandler(null);
      }
      
      public function getType() : String
      {
         return _type;
      }
      
      public function getLocation() : IVector3d
      {
         var_1519.assign(var_77);
         return var_1519;
      }
      
      public function setLocation(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_77.x != param1.x || var_77.y != param1.y || var_77.z != param1.z)
         {
            var_77.x = param1.x;
            var_77.y = param1.y;
            var_77.z = param1.z;
            ++_updateID;
         }
      }
      
      public function setDirection(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_225.x != param1.x || var_225.y != param1.y || var_225.z != param1.z)
         {
            var_225.x = (param1.x % 360 + 360) % 360;
            var_225.y = (param1.y % 360 + 360) % 360;
            var_225.z = (param1.z % 360 + 360) % 360;
            ++_updateID;
         }
      }
      
      public function setType(param1:String) : void
      {
         _type = param1;
      }
      
      public function getEventHandler() : IRoomObjectEventHandler
      {
         return var_415;
      }
      
      public function getDirection() : IVector3d
      {
         var_1518.assign(var_225);
         return var_1518;
      }
      
      public function setState(param1:int, param2:uint) : Boolean
      {
         if(param2 < var_493.length)
         {
            if(var_493[param2] != param1)
            {
               var_493[param2] = param1;
               ++_updateID;
            }
            return true;
         }
         return false;
      }
      
      public function setEventHandler(param1:IRoomObjectEventHandler) : void
      {
         if(param1 == var_415)
         {
            return;
         }
         var _loc2_:IRoomObjectEventHandler = var_415;
         if(_loc2_ != null)
         {
            var_415 = null;
            _loc2_.object = null;
         }
         var_415 = param1;
         if(var_415 != null)
         {
            var_415.object = this;
         }
      }
      
      public function getState(param1:uint) : int
      {
         if(param1 < var_493.length)
         {
            return var_493[param1];
         }
         return -1;
      }
      
      public function setVisualization(param1:IRoomObjectVisualization) : void
      {
         if(param1 != _visualization)
         {
            if(_visualization != null)
            {
               _visualization.dispose();
            }
            _visualization = param1;
            if(_visualization != null)
            {
               _visualization.object = this;
            }
         }
      }
      
      public function getVisualization() : IRoomObjectVisualization
      {
         return _visualization;
      }
      
      public function getModel() : IRoomObjectModel
      {
         return var_93;
      }
      
      public function getModelController() : IRoomObjectModelController
      {
         return var_93;
      }
      
      public function getMouseHandler() : IRoomObjectMouseHandler
      {
         return getEventHandler();
      }
   }
}
