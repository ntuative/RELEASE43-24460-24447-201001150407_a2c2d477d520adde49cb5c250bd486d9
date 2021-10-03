package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   
   public class FurnitureGiftWrappedVisualization extends FurnitureVisualization
   {
       
      
      public function FurnitureGiftWrappedVisualization()
      {
         super();
      }
      
      override protected function getFrameNumber(param1:int, param2:int) : int
      {
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc4_:String = "0";
         var _loc5_:IRoomObject = object;
         if(_loc5_ != null)
         {
            _loc7_ = _loc5_.getModel();
            if(_loc7_ != null)
            {
               _loc4_ = _loc7_.getString(RoomObjectVariableEnum.const_423);
            }
         }
         if(!isNaN(Number(_loc4_)))
         {
            _loc6_ = int(_loc4_);
         }
         if(param1 <= 1)
         {
            return Math.floor(_loc6_ / 1000);
         }
         return _loc6_ % 1000;
      }
      
      override protected function getSpriteAssetName(param1:int, param2:Number) : String
      {
         if(_data == null)
         {
            return "";
         }
         var _loc3_:int = _data.getSize(param2);
         var _loc4_:String = _type;
         var _loc5_:String = "";
         if(param1 < spriteCount - 1)
         {
            _loc5_ = String.fromCharCode("a".charCodeAt() + param1);
         }
         else
         {
            _loc5_ = "sd";
         }
         var _loc6_:int = getFrameNumber(param1,param2);
         _loc4_ += "_" + _loc3_ + "_" + _loc5_ + "_" + _direction;
         return _loc4_ + ("_" + _loc6_);
      }
   }
}
