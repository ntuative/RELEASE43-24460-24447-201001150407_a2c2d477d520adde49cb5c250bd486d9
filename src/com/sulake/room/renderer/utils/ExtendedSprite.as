package com.sulake.room.renderer.utils
{
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class ExtendedSprite extends Sprite
   {
       
      
      private var var_951:Boolean = false;
      
      private var var_1645:Boolean = false;
      
      private var var_2220:Point;
      
      private var var_1647:Boolean = false;
      
      private var _bitmap:Bitmap = null;
      
      private var var_1638:String = "";
      
      private var _threshold:uint = 128;
      
      public function ExtendedSprite()
      {
         super();
         var_2220 = new Point();
         enableAlpha();
      }
      
      public function get alphaActive() : Boolean
      {
         return var_951;
      }
      
      override public function set hitArea(param1:Sprite) : void
      {
         if(param1 != null && super.hitArea == null)
         {
            disableAlpha();
         }
         else if(param1 == null && super.hitArea != null)
         {
            enableAlpha();
         }
         super.hitArea = param1;
      }
      
      override public function removeChildAt(param1:int) : DisplayObject
      {
         if(param1 == 0)
         {
            return removeChild(_bitmap);
         }
         return null;
      }
      
      public function get clickHandling() : Boolean
      {
         return var_1645;
      }
      
      public function get alphaTolerance() : uint
      {
         return _threshold;
      }
      
      public function set clickHandling(param1:Boolean) : void
      {
         var_1645 = param1;
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         if(param2 != 0)
         {
            return param1;
         }
         return addChild(param1);
      }
      
      public function set alphaTolerance(param1:uint) : void
      {
         _threshold = Math.min(256,param1);
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(numChildren > 0)
         {
            _loc1_ = removeChildAt(0);
            if(_loc1_ != null && _loc1_ is Bitmap)
            {
               _loc2_ = _loc1_ as Bitmap;
               _loc2_.bitmapData = null;
            }
         }
         _bitmap = null;
      }
      
      public function get tag() : String
      {
         return var_1638;
      }
      
      public function enableAlpha() : void
      {
         disableAlpha();
         if(hitArea != null)
         {
            return;
         }
         var_951 = true;
      }
      
      public function disableAlpha() : void
      {
         var_951 = false;
      }
      
      public function set varyingDepth(param1:Boolean) : void
      {
         var_1647 = param1;
      }
      
      override public function hitTestPoint(param1:Number, param2:Number, param3:Boolean = false) : Boolean
      {
         if(_threshold > 255)
         {
            return false;
         }
         if(numChildren == 0)
         {
            return false;
         }
         var _loc4_:Bitmap = _bitmap;
         if(_loc4_ == null)
         {
            return false;
         }
         if(param1 < 0 || param1 >= _loc4_.bitmapData.width || param2 < 0 || param2 >= _loc4_.bitmapData.height)
         {
            return false;
         }
         if(!var_951 || !_loc4_.bitmapData.transparent)
         {
            return true;
         }
         var _loc5_:uint = _loc4_.bitmapData.getPixel32(param1,param2);
         _loc5_ >>= 24;
         return _loc5_ > _threshold;
      }
      
      public function get varyingDepth() : Boolean
      {
         return var_1647;
      }
      
      public function set tag(param1:String) : void
      {
         var_1638 = param1;
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         if(param1 == null)
         {
            return null;
         }
         if(param1 as Bitmap == _bitmap)
         {
            _bitmap = null;
         }
         return super.removeChild(param1);
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         if(numChildren > 0)
         {
            return param1;
         }
         if(param1 is Bitmap)
         {
            super.addChild(param1);
            _bitmap = param1 as Bitmap;
         }
         return param1;
      }
   }
}
