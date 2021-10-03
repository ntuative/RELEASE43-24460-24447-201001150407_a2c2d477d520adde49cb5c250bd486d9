package com.sulake.room.object.visualization
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomObjectSpriteVisualization implements IRoomObjectSpriteVisualization
   {
       
      
      protected var var_210:int = -1;
      
      private var var_175:Array;
      
      protected var var_283:uint = 4.294967295E9;
      
      private var var_247:IRoomObject;
      
      protected var var_185:uint = 4.294967295E9;
      
      private var _assetCollection:IGraphicAssetCollection;
      
      public function RoomObjectSpriteVisualization()
      {
         super();
         var_175 = [];
         var_247 = null;
         _assetCollection = null;
      }
      
      public function update(param1:IRoomGeometry = null) : void
      {
      }
      
      public function get spriteCount() : int
      {
         return var_175.length;
      }
      
      public function getSprite(param1:uint) : IRoomObjectSprite
      {
         if(param1 < var_175.length)
         {
            return var_175[param1];
         }
         return null;
      }
      
      protected function reset() : void
      {
         var_283 = 4294967295;
         var_185 = 4294967295;
         var_210 = -1;
      }
      
      public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         return false;
      }
      
      public function get image() : BitmapData
      {
         return getImage(0);
      }
      
      public function set assetCollection(param1:IGraphicAssetCollection) : void
      {
         _assetCollection = param1;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(var_175 != null)
         {
            while(false)
            {
               _loc1_ = var_175[0] as RoomObjectSprite;
               if(_loc1_ != null)
               {
                  _loc1_.dispose();
               }
               var_175.pop();
            }
            var_175 = null;
         }
         var_247 = null;
         _assetCollection = null;
      }
      
      public function getImage(param1:uint) : BitmapData
      {
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:* = 0;
         var _loc14_:* = 0;
         var _loc15_:* = 0;
         var _loc16_:* = 0;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc2_:Rectangle = boundingRectangle;
         if(_loc2_.width * _loc2_.height == 0)
         {
            return null;
         }
         var _loc3_:int = spriteCount;
         var _loc4_:* = null;
         var _loc5_:* = [];
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc4_ = getSprite(_loc6_);
            if(_loc4_ != null && _loc4_.visible)
            {
               _loc7_ = _loc4_.asset;
               if(_loc7_ != null)
               {
                  _loc8_ = _loc7_.content as BitmapData;
                  if(_loc8_ != null)
                  {
                     _loc5_.push(_loc4_);
                  }
               }
            }
            _loc6_++;
         }
         _loc5_.sortOn("relativeDepth",0 | 0);
         var _loc9_:BitmapData = new BitmapData(_loc2_.width,_loc2_.height,true,param1);
         _loc6_ = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc4_ = _loc5_[_loc6_] as IRoomObjectSprite;
            _loc7_ = _loc4_.asset;
            _loc8_ = _loc7_.content as BitmapData;
            if(_loc8_ != null)
            {
               _loc13_ = uint(_loc4_.color);
               _loc14_ = uint(_loc13_ >> 16);
               _loc15_ = uint(_loc13_ >> 8 & 255);
               _loc16_ = uint(_loc13_ & 255);
               _loc17_ = null;
               if(_loc14_ < 255 || _loc15_ < 255 || _loc16_ < 255)
               {
                  _loc10_ = _loc14_ / 255;
                  _loc11_ = _loc15_ / 255;
                  _loc12_ = _loc16_ / 255;
                  _loc17_ = new ColorTransform(_loc10_,_loc11_,_loc12_,_loc4_.alpha / 255);
               }
               else if(_loc4_.alpha < 255)
               {
                  _loc17_ = new ColorTransform(1,1,1,_loc4_.alpha / 255);
               }
               if(param1 == 0)
               {
                  if(_loc4_.blendMode == BlendMode.ADD)
                  {
                     if(_loc17_ == null)
                     {
                        _loc17_ = new ColorTransform(1,1,1,0);
                     }
                     else
                     {
                        _loc17_.alphaMultiplier = 0;
                     }
                  }
               }
               _loc18_ = new Matrix();
               if(_loc4_.flipH)
               {
                  _loc18_.scale(-1,1);
                  _loc18_.translate(_loc8_.width,0);
               }
               _loc18_.translate(_loc4_.offsetX - _loc2_.left,_loc4_.offsetY - _loc2_.top);
               _loc9_.draw(_loc8_,_loc18_,_loc17_,_loc4_.blendMode,null,false);
            }
            _loc6_++;
         }
         return _loc9_;
      }
      
      protected function createSprites(param1:uint) : void
      {
         var _loc2_:* = null;
         while(var_175.length > param1)
         {
            _loc2_ = var_175["-1"] as RoomObjectSprite;
            if(_loc2_ != null)
            {
               _loc2_.dispose();
            }
            var_175.pop();
         }
         while(var_175.length < param1)
         {
            _loc2_ = new RoomObjectSprite();
            var_175.push(_loc2_);
         }
      }
      
      public function get boundingRectangle() : Rectangle
      {
         var _loc7_:* = null;
         var _loc1_:int = spriteCount;
         var _loc2_:* = null;
         var _loc3_:Rectangle = new Rectangle();
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         _loc4_ = 0;
         while(_loc4_ < _loc1_)
         {
            _loc2_ = getSprite(_loc4_);
            if(_loc2_ != null && _loc2_.visible)
            {
               _loc5_ = _loc2_.asset;
               if(_loc5_ != null)
               {
                  _loc6_ = _loc5_.content as BitmapData;
                  if(_loc6_ != null)
                  {
                     _loc7_ = new Point(_loc2_.offsetX,_loc2_.offsetY);
                     if(_loc4_ == 0)
                     {
                        _loc3_.left = _loc7_.x;
                        _loc3_.top = _loc7_.y;
                        _loc3_.right = _loc7_.x + _loc2_.width;
                        _loc3_.bottom = _loc7_.y + _loc2_.height;
                     }
                     else
                     {
                        if(_loc7_.x < _loc3_.left)
                        {
                           _loc3_.left = _loc7_.x;
                        }
                        if(_loc7_.y < _loc3_.top)
                        {
                           _loc3_.top = _loc7_.y;
                        }
                        if(_loc7_.x + _loc2_.width > _loc3_.right)
                        {
                           _loc3_.right = _loc7_.x + _loc2_.width;
                        }
                        if(_loc7_.y + _loc2_.height > _loc3_.bottom)
                        {
                           _loc3_.bottom = _loc7_.y + _loc2_.height;
                        }
                     }
                  }
               }
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function get assetCollection() : IGraphicAssetCollection
      {
         return _assetCollection;
      }
      
      public function set object(param1:IRoomObject) : void
      {
         var_247 = param1;
      }
      
      public function get object() : IRoomObject
      {
         return var_247;
      }
   }
}
