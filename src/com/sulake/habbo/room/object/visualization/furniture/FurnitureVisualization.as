package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.visualization.furniture.data.ColorData;
   import com.sulake.habbo.room.object.visualization.furniture.data.LayerData;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BlendMode;
   
   public class FurnitureVisualization extends RoomObjectSpriteVisualization
   {
       
      
      protected var _direction:int;
      
      protected var var_2196:int = -1;
      
      protected var _data:FurnitureVisualizationData = null;
      
      protected var _type:String = "";
      
      protected var var_2178:Number = NaN;
      
      public function FurnitureVisualization()
      {
         super();
         reset();
      }
      
      protected function updateSprites(param1:int, param2:Number) : void
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = NaN;
         var _loc13_:int = 0;
         if(_data == null)
         {
            return;
         }
         var _loc3_:int = _data.getLayerCount(param1) + 1;
         if(_loc3_ != spriteCount)
         {
            createSprites(_loc3_);
         }
         var _loc4_:Boolean = false;
         var _loc5_:IRoomObject = object;
         if(_loc5_ != null)
         {
            _loc7_ = _loc5_.getModel();
            if(_loc7_ != null)
            {
               _loc8_ = _loc7_.getString(RoomObjectVariableEnum.const_302);
               if(_loc8_ != null && _loc8_.indexOf("http") == 0)
               {
                  _loc4_ = true;
               }
            }
         }
         var _loc6_:int = spriteCount - 1;
         while(_loc6_ >= 0)
         {
            _loc9_ = getSpriteAssetName(_loc6_,param1);
            _loc10_ = getSprite(_loc6_);
            if(_loc10_ != null)
            {
               _loc11_ = null;
               if(assetCollection != null)
               {
                  _loc11_ = assetCollection.getAsset(_loc9_);
               }
               if(_loc11_ != null)
               {
                  _loc10_.visible = true;
                  _loc10_.asset = _loc11_.asset;
                  _loc10_.flipH = _loc11_.flipH;
                  _loc10_.flipV = _loc11_.flipV;
                  _loc10_.offsetX = _loc11_.offsetX;
                  _loc10_.offsetY = _loc11_.offsetY;
                  _loc12_ = 0;
                  if(_loc6_ < spriteCount - 1)
                  {
                     _loc10_.tag = _data.getTag(_loc6_,_direction,param1);
                     _loc10_.alpha = getSpriteAlpha(_loc6_,_direction,param1);
                     _loc10_.color = getSpriteColor(_loc6_,var_2196,param1);
                     _loc10_.offsetX += getSpriteXOffset(_loc6_,_direction,param1);
                     _loc10_.offsetY += getSpriteYOffset(_loc6_,_direction,param1);
                     _loc10_.capturesMouse = !_data.getIgnoreMouse(_loc6_,_direction,param1);
                     _loc10_.blendMode = getBlendMode(_data.getInk(_loc6_,_direction,param1));
                     _loc12_ = Number(getSpriteZOffset(_loc6_,_direction,param1));
                     _loc12_ -= _loc6_ * 0.001;
                  }
                  else
                  {
                     _loc13_ = 96;
                     if(object != null && object.getModel() != null)
                     {
                        _loc13_ *= object.getModel().getNumber(RoomObjectVariableEnum.const_155);
                     }
                     _loc10_.alpha = _loc13_;
                     _loc10_.capturesMouse = false;
                     _loc12_ = 1;
                  }
                  _loc12_ *= param2;
                  _loc10_.relativeDepth = _loc12_;
                  _loc10_.assetName = _loc9_;
                  _loc10_.clickHandling = _loc4_;
               }
               else
               {
                  _loc10_.asset = null;
                  _loc10_.assetName = "";
                  _loc10_.tag = "";
                  _loc10_.flipH = false;
                  _loc10_.flipV = false;
                  _loc10_.offsetX = 0;
                  _loc10_.offsetY = 0;
                  _loc10_.relativeDepth = 0;
                  _loc10_.clickHandling = false;
               }
            }
            _loc6_--;
         }
      }
      
      protected function getSpriteZOffset(param1:int, param2:int, param3:int) : Number
      {
         if(_data == null)
         {
            return LayerData.const_400;
         }
         return _data.getZOffset(param1,param2,param3);
      }
      
      override protected function reset() : void
      {
         super.reset();
         _direction = -1;
         _data = null;
         this.createSprites(0);
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         reset();
         if(param1 == null || !(param1 is FurnitureVisualizationData))
         {
            return false;
         }
         _data = param1 as FurnitureVisualizationData;
         _type = _data.getType();
         return true;
      }
      
      protected function getBlendMode(param1:int) : String
      {
         var _loc2_:String = "null";
         switch(param1)
         {
            case LayerData.const_879:
               _loc2_ = "null";
               break;
            case LayerData.INK_DARKEN:
               _loc2_ = "null";
               break;
            case LayerData.const_980:
               _loc2_ = "null";
         }
         return _loc2_;
      }
      
      protected function updateModel(param1:Number) : Boolean
      {
         var _loc2_:IRoomObject = object;
         if(_loc2_ == null)
         {
            return false;
         }
         var _loc3_:IRoomObjectModel = _loc2_.getModel();
         if(_loc3_ == null)
         {
            return false;
         }
         if(var_185 != _loc3_.getUpdateID())
         {
            var_2196 = _loc3_.getNumber(RoomObjectVariableEnum.const_186);
            var_185 = _loc3_.getUpdateID();
            return true;
         }
         return false;
      }
      
      protected function getSpriteAlpha(param1:int, param2:int, param3:int) : int
      {
         var _loc6_:* = NaN;
         if(_data == null || object == null)
         {
            return LayerData.const_391;
         }
         var _loc4_:int = _data.getAlpha(param1,param2,param3);
         var _loc5_:IRoomObjectModel = object.getModel();
         if(_loc5_ != null)
         {
            _loc6_ = Number(_loc5_.getNumber(RoomObjectVariableEnum.const_155));
            if(isNaN(_loc6_))
            {
               _loc6_ = 1;
            }
            _loc4_ *= _loc6_;
         }
         return _loc4_;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _data = null;
      }
      
      protected function getFrameNumber(param1:int, param2:int) : int
      {
         return 0;
      }
      
      protected function updateObject(param1:Number, param2:Number) : Boolean
      {
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc3_:IRoomObject = object;
         if(_loc3_ == null)
         {
            return false;
         }
         if(var_283 != _loc3_.getUpdateID() || param1 != var_210 || param2 != var_2178)
         {
            _loc4_ = _loc3_.getDirection().x - (param2 + 135);
            _loc4_ = (_loc4_ % 360 + 360) % 360;
            _loc5_ = _data.getDirectionValue(_loc4_,param1);
            _direction = _loc5_;
            var_283 = _loc3_.getUpdateID();
            var_2178 = param2;
            return true;
         }
         return false;
      }
      
      override public function update(param1:IRoomGeometry = null) : void
      {
         var _loc3_:Number = NaN;
         if(param1 == null)
         {
            return;
         }
         if(_data == null)
         {
            return;
         }
         var _loc2_:Boolean = false;
         if(updateObject(param1.scale,param1.direction.x))
         {
            _loc2_ = true;
         }
         if(updateModel(param1.scale))
         {
            _loc2_ = true;
         }
         if(updateAnimation(param1.scale))
         {
            _loc2_ = true;
         }
         if(_loc2_ || var_210 != param1.scale)
         {
            _loc3_ = Math.sqrt(0.5);
            updateSprites(param1.scale,_loc3_);
            var_210 = param1.scale;
         }
      }
      
      protected function getSpriteAssetName(param1:int, param2:Number) : String
      {
         var _loc6_:int = 0;
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
         if(_loc3_ == 1)
         {
            _loc4_ += "_icon_" + _loc5_;
         }
         else
         {
            _loc6_ = getFrameNumber(param1,param2);
            _loc4_ += "_" + _loc3_ + "_" + _loc5_ + "_" + _direction;
            _loc4_ += "_" + _loc6_;
         }
         return _loc4_;
      }
      
      protected function getSpriteXOffset(param1:int, param2:int, param3:int) : int
      {
         if(_data == null)
         {
            return LayerData.const_360;
         }
         return _data.getXOffset(param1,param2,param3);
      }
      
      protected function getSpriteYOffset(param1:int, param2:int, param3:int) : int
      {
         if(_data == null)
         {
            return LayerData.const_388;
         }
         return _data.getYOffset(param1,param2,param3);
      }
      
      protected function getSpriteColor(param1:int, param2:int, param3:int) : int
      {
         if(_data == null)
         {
            return ColorData.const_65;
         }
         return _data.getColor(param1,param2,param3);
      }
      
      protected function updateAnimation(param1:Number) : Boolean
      {
         return false;
      }
   }
}
