package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.visualization.furniture.AnimatedFurnitureVisualization;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.utils.IRoomGeometry;
   
   public class SelectionArrowVisualization extends AnimatedFurnitureVisualization
   {
       
      
      public function SelectionArrowVisualization()
      {
         super();
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         super.initialize(param1);
         setAnimation(0);
         return true;
      }
      
      override public function update(param1:IRoomGeometry = null) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc2_:IRoomObjectModel = object.getModel();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:Boolean = Boolean(_loc2_.getNumber(RoomObjectVariableEnum.const_79));
         if(_loc3_)
         {
            super.update(param1);
         }
         else
         {
            _loc4_ = spriteCount - 1;
            while(_loc4_ >= 0)
            {
               _loc5_ = getSprite(_loc4_);
               if(_loc5_ != null)
               {
                  _loc5_.visible = false;
               }
               _loc4_--;
            }
         }
      }
      
      override protected function updateSprites(param1:int, param2:Number) : void
      {
         var _loc3_:IRoomObjectModel = object.getModel();
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:Boolean = Boolean(_loc3_.getNumber(RoomObjectVariableEnum.const_79));
         if(_loc4_)
         {
            super.updateSprites(param1,param2);
         }
      }
   }
}
