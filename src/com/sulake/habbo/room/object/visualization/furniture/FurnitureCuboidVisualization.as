package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.core.assets.AssetLibrary;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.utils.getTimer;
   
   public class FurnitureCuboidVisualization extends RoomObjectSpriteVisualization
   {
       
      
      private var var_1329:int = 0;
      
      private var _assetLibrary:AssetLibrary = null;
      
      private var var_106:Array;
      
      private var var_1582:Boolean = false;
      
      public function FurnitureCuboidVisualization()
      {
         var_106 = [];
         super();
      }
      
      protected function updatePlanes(param1:IRoomGeometry) : void
      {
         var _loc5_:Boolean = false;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc2_:IRoomObject = object;
         if(_loc2_ == null)
         {
            return;
         }
         if(param1 == null || _assetLibrary == null)
         {
            return;
         }
         ++var_1329;
         var _loc3_:int = getTimer();
         var _loc4_:int = 0;
         while(_loc4_ < var_106.length)
         {
            _loc5_ = false;
            _loc6_ = "plane " + _loc4_ + " " + param1.scale;
            _loc7_ = _assetLibrary.getAssetByName(_loc6_) as BitmapDataAsset;
            if(_loc7_ == null)
            {
               _loc7_ = new BitmapDataAsset(_assetLibrary.getAssetTypeDeclarationByClass(BitmapDataAsset));
               _assetLibrary.setAsset(_loc6_,_loc7_);
            }
            _loc8_ = var_106[_loc4_] as FurniturePlane;
            if(_loc8_ != null)
            {
               _loc10_ = _loc2_.getDirection().x;
               if(_loc10_ / 45 == 2 || _loc10_ / 45 == 6)
               {
                  _loc8_.setRotation(true);
               }
               else
               {
                  _loc8_.setRotation(false);
               }
               if(_loc8_.update(param1,_loc3_))
               {
                  _loc11_ = _loc8_.bitmapData;
                  _loc12_ = _loc7_.content as BitmapData;
                  if(_loc11_ == null)
                  {
                     _loc7_ = null;
                  }
                  else if(_loc12_ != _loc11_)
                  {
                     if(_loc12_ != null)
                     {
                        _loc12_.dispose();
                     }
                     _loc7_.setUnknownContent(_loc11_);
                  }
                  _loc5_ = true;
               }
            }
            else
            {
               _loc7_ = null;
            }
            _loc9_ = getSprite(_loc4_);
            if(_loc9_ != null)
            {
               if(_loc8_ != null)
               {
                  _loc13_ = _loc8_.offset;
                  _loc9_.offsetX = -_loc13_.x;
                  _loc9_.offsetY = -_loc13_.y;
                  _loc9_.color = _loc8_.color;
                  _loc9_.visible = _loc8_.visible;
               }
               else
               {
                  _loc9_.visible = false;
               }
               _loc9_.asset = _loc7_;
               if(_loc5_)
               {
                  _loc9_.assetName = _loc6_ + "_" + _loc2_.getInstanceId() + "_" + var_1329;
               }
               _loc9_.relativeDepth = _loc8_.relativeDepth;
            }
            _loc4_++;
         }
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         super.dispose();
         if(_assetLibrary != null)
         {
            _assetLibrary.dispose();
            _assetLibrary = null;
         }
         if(var_106 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_106.length)
            {
               _loc2_ = var_106[_loc1_] as FurniturePlane;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            var_106 = null;
         }
      }
      
      protected function initializePlanes() : void
      {
         var _loc9_:* = null;
         var _loc10_:* = null;
         if(var_1582)
         {
            return;
         }
         var _loc1_:IRoomObject = object;
         if(_loc1_ == null)
         {
            return;
         }
         var _loc3_:Number = _loc1_.getModel().getNumber(RoomObjectVariableEnum.const_292);
         var _loc4_:Number = _loc1_.getModel().getNumber(RoomObjectVariableEnum.const_432);
         var _loc5_:Number = _loc1_.getModel().getNumber(RoomObjectVariableEnum.const_493);
         if(isNaN(_loc3_) || isNaN(_loc4_) || isNaN(_loc5_))
         {
            return;
         }
         var _loc6_:Vector3d = new Vector3d(_loc3_,0,0);
         var _loc7_:Vector3d = new Vector3d(0,_loc4_,0);
         var _loc8_:Vector3d = new Vector3d(-0.5,-0.5,0);
         if(_loc8_ != null && _loc6_ != null && _loc7_ != null)
         {
            _loc9_ = Vector3d.crossProduct(_loc6_,_loc7_);
            _loc10_ = new FurniturePlane(_loc8_,_loc6_,_loc7_);
            _loc10_.color = 16776960;
            var_106.push(_loc10_);
            var_1582 = true;
            defineSprites();
            return;
         }
      }
      
      override public function update(param1:IRoomGeometry = null) : void
      {
         var _loc2_:IRoomObject = object;
         if(_loc2_ == null)
         {
            return;
         }
         if(_assetLibrary == null)
         {
            _assetLibrary = new AssetLibrary("furniture cuboid visualization - " + _loc2_.getInstanceId());
         }
         if(param1 == null)
         {
            return;
         }
         var _loc3_:IRoomObjectModel = _loc2_.getModel();
         initializePlanes();
         updatePlanes(param1);
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         reset();
         return true;
      }
      
      protected function defineSprites() : void
      {
         createSprites(1);
      }
   }
}
