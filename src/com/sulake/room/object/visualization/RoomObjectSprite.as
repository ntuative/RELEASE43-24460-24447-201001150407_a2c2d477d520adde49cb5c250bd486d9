package com.sulake.room.object.visualization
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public final class RoomObjectSprite implements IRoomObjectSprite
   {
       
      
      private var var_1022:Boolean = false;
      
      private var var_1647:Boolean = false;
      
      private var var_1134:String = "normal";
      
      private var var_1210:String = "";
      
      private var var_1645:Boolean = false;
      
      private var _offset:Point;
      
      private var var_355:Boolean = true;
      
      private var var_1646:Boolean = true;
      
      private var var_973:Number = 0;
      
      private var _height:int = 0;
      
      private var _width:int = 0;
      
      private var var_1638:String = "";
      
      private var var_1640:uint = 255;
      
      private var _color:uint = 16777215;
      
      private var var_721:IAsset = null;
      
      private var var_1023:Boolean = false;
      
      public function RoomObjectSprite()
      {
         _offset = new Point(0,0);
         super();
      }
      
      public function get flipV() : Boolean
      {
         return var_1022;
      }
      
      public function get clickHandling() : Boolean
      {
         return var_1645;
      }
      
      public function set flipV(param1:Boolean) : void
      {
         var_1022 = param1;
      }
      
      public function get tag() : String
      {
         return var_1638;
      }
      
      public function dispose() : void
      {
         var_721 = null;
         _width = 0;
         _height = 0;
      }
      
      public function get offsetX() : int
      {
         return _offset.x;
      }
      
      public function get offsetY() : int
      {
         return _offset.y;
      }
      
      public function get height() : int
      {
         return _height;
      }
      
      public function set blendMode(param1:String) : void
      {
         var_1134 = param1;
      }
      
      public function set capturesMouse(param1:Boolean) : void
      {
         var_1646 = param1;
      }
      
      public function get blendMode() : String
      {
         return var_1134;
      }
      
      public function set relativeDepth(param1:Number) : void
      {
         var_973 = param1;
      }
      
      public function set tag(param1:String) : void
      {
         var_1638 = param1;
      }
      
      public function set alpha(param1:uint) : void
      {
         if(param1 > 255)
         {
            param1 = 255;
         }
         var_1640 = param1;
      }
      
      public function get assetName() : String
      {
         return var_1210;
      }
      
      public function get capturesMouse() : Boolean
      {
         return var_1646;
      }
      
      public function get varyingDepth() : Boolean
      {
         return var_1647;
      }
      
      public function set assetName(param1:String) : void
      {
         var_1210 = param1;
      }
      
      public function set offsetX(param1:int) : void
      {
         _offset.x = param1;
      }
      
      public function set offsetY(param1:int) : void
      {
         _offset.y = param1;
      }
      
      public function get width() : int
      {
         return _width;
      }
      
      public function get relativeDepth() : Number
      {
         return var_973;
      }
      
      public function get alpha() : uint
      {
         return var_1640;
      }
      
      public function set asset(param1:IAsset) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 is BitmapDataAsset)
         {
            var_721 = param1;
            _width = 0;
            _height = 0;
            if(param1 != null)
            {
               _loc2_ = param1 as BitmapDataAsset;
               _loc3_ = _loc2_.content as BitmapData;
               if(_loc3_ != null)
               {
                  _width = _loc3_.width;
                  _height = _loc3_.height;
               }
            }
         }
         else if(param1 == null)
         {
            var_721 = null;
            _width = 0;
            _height = 0;
         }
      }
      
      public function set color(param1:uint) : void
      {
         param1 &= 16777215;
         _color = param1;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function set varyingDepth(param1:Boolean) : void
      {
         var_1647 = param1;
      }
      
      public function set clickHandling(param1:Boolean) : void
      {
         var_1645 = param1;
      }
      
      public function get asset() : IAsset
      {
         return var_721;
      }
      
      public function set visible(param1:Boolean) : void
      {
         var_355 = param1;
      }
      
      public function set flipH(param1:Boolean) : void
      {
         var_1023 = param1;
      }
      
      public function get visible() : Boolean
      {
         return var_355;
      }
      
      public function get flipH() : Boolean
      {
         return var_1023;
      }
   }
}
