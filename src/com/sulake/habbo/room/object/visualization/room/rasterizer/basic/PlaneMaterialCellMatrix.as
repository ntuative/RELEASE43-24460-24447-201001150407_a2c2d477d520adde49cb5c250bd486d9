package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
   import com.sulake.habbo.room.object.visualization.room.utils.Randomizer;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class PlaneMaterialCellMatrix
   {
      
      public static const MAX_NORMAL_COORDINATE_VALUE:Number = 1;
      
      public static const const_327:int = 1;
      
      public static const const_1235:int = const_327;
      
      public static const const_198:int = 2;
      
      public static const const_221:int = 3;
      
      public static const const_211:int = 5;
      
      public static const const_201:int = 2;
      
      public static const const_100:int = 1;
      
      public static const const_49:Number = -1;
      
      public static const const_192:int = 4;
      
      public static const const_730:int = 6;
      
      public static const const_249:int = const_100;
       
      
      private var var_1382:int = 1;
      
      private var var_1381:int = 1;
      
      private var var_447:int = 0;
      
      private var _normalMaxX:Number = 1;
      
      private var var_1788:Number = 1;
      
      private var var_750:Vector3d = null;
      
      private var _columns:Array;
      
      private var var_1141:Boolean = true;
      
      private var var_39:BitmapData;
      
      private var var_1789:Number = -1;
      
      private var var_1790:Number = -1;
      
      public function PlaneMaterialCellMatrix(param1:int, param2:int = 1, param3:int = 1, param4:Number = -1, param5:Number = 1, param6:Number = -1, param7:Number = 1)
      {
         _columns = [];
         super();
         if(param1 < 1)
         {
            param1 = 1;
         }
         var _loc8_:int = 0;
         while(_loc8_ < param1)
         {
            _columns.push(null);
            _loc8_++;
         }
         var_1382 = param2;
         var_1381 = param3;
         var_1789 = param4;
         _normalMaxX = param5;
         var_1790 = param6;
         var_1788 = param7;
         var_750 = new Vector3d();
         if(var_1382 == const_730)
         {
            var_1141 = false;
         }
      }
      
      private function renderRepeatFirst(param1:BitmapData, param2:Array) : int
      {
         var _loc7_:* = null;
         if(param2 == null || param2.length == 0 || param1 == null)
         {
            return 0;
         }
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = param1.width;
         var _loc6_:Point = renderColumns(param1,param2,_loc5_,false);
         _loc5_ = _loc6_.x;
         if(_loc6_.y > _loc3_)
         {
            _loc3_ = _loc6_.y;
         }
         _loc4_ = param2[0] as BitmapData;
         if(_loc4_ != null)
         {
            _loc7_ = [_loc4_];
            while(_loc5_ >= 0)
            {
               _loc6_ = renderColumns(param1,_loc7_,_loc5_,false);
               _loc5_ = _loc6_.x;
               if(_loc6_.y > _loc3_)
               {
                  _loc3_ = _loc6_.y;
               }
            }
         }
         return _loc3_;
      }
      
      private function renderRepeatBorders(param1:BitmapData, param2:Array) : int
      {
         if(param2 == null || param2.length == 0 || param1 == null)
         {
            return 0;
         }
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = [];
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         _loc7_ = 1;
         while(_loc7_ < param2.length - 1)
         {
            _loc4_ = param2[_loc7_] as BitmapData;
            if(_loc4_ != null)
            {
               _loc6_ += _loc4_.width;
               _loc5_.push(_loc4_);
            }
            _loc7_++;
         }
         if(false)
         {
            _loc4_ = _columns[0] as BitmapData;
            if(_loc4_ != null)
            {
               _loc6_ = _loc4_.width;
               _loc5_.push(_loc4_);
            }
         }
         var _loc8_:* = param1.width - _loc6_ >> 1;
         var _loc9_:* = null;
         _loc9_ = renderColumns(param1,_loc5_,_loc8_,true);
         var _loc10_:int = _loc9_.x;
         if(_loc9_.y > _loc3_)
         {
            _loc3_ = _loc9_.y;
         }
         _loc4_ = param2[0] as BitmapData;
         if(_loc4_ != null)
         {
            _loc5_ = [_loc4_];
            while(_loc8_ >= 0)
            {
               _loc9_ = renderColumns(param1,_loc5_,_loc8_,false);
               _loc8_ = int(_loc9_.x);
               if(_loc9_.y > _loc3_)
               {
                  _loc3_ = _loc9_.y;
               }
            }
         }
         _loc4_ = param2[param2.length - 1] as BitmapData;
         if(_loc4_ != null)
         {
            _loc5_ = [_loc4_];
            while(_loc10_ < param1.height)
            {
               _loc9_ = renderColumns(param1,_loc5_,_loc10_,true);
               _loc10_ = _loc9_.x;
               if(_loc9_.y > _loc3_)
               {
                  _loc3_ = _loc9_.y;
               }
            }
         }
         return _loc3_;
      }
      
      private function renderRepeatLast(param1:BitmapData, param2:Array) : int
      {
         var _loc7_:* = null;
         if(param2 == null || param2.length == 0 || param1 == null)
         {
            return 0;
         }
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:Point = renderColumns(param1,param2,_loc5_,true);
         _loc5_ = _loc6_.x;
         if(_loc6_.y > _loc3_)
         {
            _loc3_ = _loc6_.y;
         }
         _loc4_ = param2[param2.length - 1] as BitmapData;
         if(_loc4_ != null)
         {
            _loc7_ = [_loc4_];
            while(_loc5_ < param1.width)
            {
               _loc6_ = renderColumns(param1,_loc7_,_loc5_,true);
               _loc5_ = _loc6_.x;
               if(_loc6_.y > _loc3_)
               {
                  _loc3_ = _loc6_.y;
               }
            }
         }
         return _loc3_;
      }
      
      private function renderRepeatRandom(param1:BitmapData, param2:Array) : int
      {
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(param2 == null || param2.length == 0 || param1 == null)
         {
            return 0;
         }
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         while(_loc5_ < param1.width)
         {
            _loc6_ = Randomizer.getValues(1,0,param2.length * 17631);
            _loc7_ = _loc6_[0] % param2.length;
            _loc4_ = param2[_loc7_] as BitmapData;
            if(_loc4_ == null)
            {
               return _loc3_;
            }
            _loc8_ = [_loc4_];
            _loc9_ = renderColumns(param1,_loc8_,_loc5_,true);
            _loc5_ = _loc9_.x;
            if(_loc9_.y > _loc3_)
            {
               _loc3_ = _loc9_.y;
            }
         }
         return _loc3_;
      }
      
      public function get normalMaxY() : Number
      {
         return var_1788;
      }
      
      public function get normalMinX() : Number
      {
         return var_1789;
      }
      
      public function get normalMinY() : Number
      {
         return var_1790;
      }
      
      private function renderRepeatAll(param1:BitmapData, param2:Array) : int
      {
         var _loc6_:* = null;
         if(param2 == null || param2.length == 0 || param1 == null)
         {
            return 0;
         }
         var _loc3_:int = 0;
         var _loc4_:int = getColumnsWidth(param2);
         var _loc5_:int = 0;
         if(_loc4_ > param1.width)
         {
         }
         while(_loc5_ < param1.width)
         {
            _loc6_ = renderColumns(param1,param2,_loc5_,true);
            _loc5_ = _loc6_.x;
            if(_loc6_.y > _loc3_)
            {
               _loc3_ = _loc6_.y;
            }
            if(_loc6_.x == 0)
            {
               return _loc3_;
            }
         }
         return _loc3_;
      }
      
      private function copyCachedBitmapOnCanvas(param1:BitmapData, param2:int, param3:int, param4:Boolean) : void
      {
         if(param1 == null || var_39 == null || param1 == var_39)
         {
            return;
         }
         if(!param4)
         {
            param3 = param1.height - param2 - param3;
         }
         var _loc5_:* = null;
         if(var_1381 == const_100)
         {
            _loc5_ = new Rectangle(0,0,var_39.width,var_447);
         }
         else
         {
            _loc5_ = new Rectangle(0,0 - var_447,var_39.width,var_447);
         }
         param1.copyPixels(var_39,_loc5_,new Point(0,param3),null,null,true);
      }
      
      public function render(param1:BitmapData, param2:int, param3:int, param4:IVector3d, param5:Boolean, param6:int, param7:Boolean) : BitmapData
      {
         var _loc11_:* = null;
         var _loc12_:* = null;
         if(param2 < 1)
         {
            param2 = 1;
         }
         if(param3 < 1)
         {
            param3 = 1;
         }
         if(param1 == null || param1.width != param2 || param1.height != param3)
         {
            param1 = null;
         }
         if(isStatic)
         {
            if(var_39 != null)
            {
               if(var_39.width == param2 && var_39.height == param3 && Vector3d.isEqual(var_750,param4))
               {
                  if(param1 != null)
                  {
                     copyCachedBitmapOnCanvas(param1,var_447,param6,param7);
                     return param1;
                  }
                  return var_39;
               }
               var_39.dispose();
               var_39 = null;
            }
         }
         else if(var_39 != null)
         {
            if(var_39.width == param2 && var_39.height == param3)
            {
               var_39.fillRect(var_39.rect,16777215);
            }
            else
            {
               var_39.dispose();
               var_39 = null;
            }
         }
         var_750.assign(param4);
         if(!param5)
         {
            var_447 = param3;
            if(var_39 == null)
            {
               var_39 = new BitmapData(param2,param3,true,4294967295);
            }
            else
            {
               var_39.fillRect(var_39.rect,4294967295);
            }
            if(param1 != null)
            {
               copyCachedBitmapOnCanvas(param1,param3,param6,param7);
               return param1;
            }
            return var_39;
         }
         if(var_39 == null)
         {
            var_447 = param3;
            var_39 = new BitmapData(param2,param3,true,16777215);
         }
         var _loc8_:* = [];
         var _loc9_:int = 0;
         while(_loc9_ < _columns.length)
         {
            _loc11_ = _columns[_loc9_] as PlaneMaterialCellColumn;
            if(_loc11_ != null)
            {
               _loc12_ = _loc11_.render(param3,param4);
               if(_loc12_ != null)
               {
                  _loc8_.push(_loc12_);
               }
            }
            _loc9_++;
         }
         if(_loc8_.length == 0)
         {
            if(param1 != null)
            {
               return param1;
            }
            return var_39;
         }
         var _loc10_:int = 0;
         switch(var_1382)
         {
            case const_201:
               _loc10_ = renderRepeatBorders(var_39,_loc8_);
               break;
            case const_221:
               _loc10_ = renderRepeatCenter(var_39,_loc8_);
               break;
            case const_192:
               _loc10_ = renderRepeatFirst(var_39,_loc8_);
               break;
            case const_211:
               _loc10_ = renderRepeatLast(var_39,_loc8_);
               break;
            case const_730:
               _loc10_ = renderRepeatRandom(var_39,_loc8_);
               break;
            default:
               _loc10_ = renderRepeatAll(var_39,_loc8_);
         }
         var_447 = _loc10_;
         if(param1 != null)
         {
            copyCachedBitmapOnCanvas(param1,_loc10_,param6,param7);
            return param1;
         }
         return var_39;
      }
      
      public function dispose() : void
      {
         if(var_39 != null)
         {
            var_39.dispose();
            var_39 = null;
         }
         if(var_750 != null)
         {
            var_750 = null;
         }
      }
      
      private function renderColumns(param1:BitmapData, param2:Array, param3:int, param4:Boolean) : Point
      {
         var _loc8_:int = 0;
         if(param2 == null || param2.length == 0 || param1 == null)
         {
            return new Point(param3,0);
         }
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         while(_loc7_ < param2.length)
         {
            if(param4)
            {
               _loc6_ = param2[_loc7_] as BitmapData;
            }
            else
            {
               _loc6_ = param2[param2.length - 1 - _loc7_] as BitmapData;
            }
            if(_loc6_ != null)
            {
               if(!param4)
               {
                  param3 -= _loc6_.width;
               }
               _loc8_ = 0;
               if(var_1381 == const_198)
               {
                  _loc8_ = param1.height - _loc6_.height;
               }
               param1.copyPixels(_loc6_,_loc6_.rect,new Point(param3,_loc8_),_loc6_,null,true);
               if(_loc6_.height > _loc5_)
               {
                  _loc5_ = _loc6_.height;
               }
               if(param4)
               {
                  param3 += _loc6_.width;
               }
               if(param4 && param3 >= param1.width || !param4 && param3 <= 0)
               {
                  return new Point(param3,_loc5_);
               }
            }
            _loc7_++;
         }
         return new Point(param3,_loc5_);
      }
      
      private function renderRepeatCenter(param1:BitmapData, param2:Array) : int
      {
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:* = null;
         if(param2 == null || param2.length == 0 || param1 == null)
         {
            return 0;
         }
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = [];
         var _loc6_:* = [];
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         _loc9_ = 0;
         while(_loc9_ < param2.length >> 1)
         {
            _loc4_ = param2[_loc9_] as BitmapData;
            if(_loc4_ != null)
            {
               _loc7_ += _loc4_.width;
               _loc5_.push(_loc4_);
            }
            _loc9_++;
         }
         _loc9_ = (param2.length >> 1) + 1;
         while(_loc9_ < param2.length)
         {
            _loc4_ = param2[_loc9_] as BitmapData;
            if(_loc4_ != null)
            {
               _loc8_ += _loc4_.width;
               _loc6_.push(_loc4_);
            }
            _loc9_++;
         }
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = param1.width;
         if(_loc7_ + _loc8_ > param1.width)
         {
            _loc11_ = _loc7_ + _loc8_ - param1.width;
            _loc12_ -= _loc11_ >> 1;
            _loc13_ += _loc11_ - (_loc11_ >> 1);
         }
         if(_loc11_ == 0)
         {
            _loc4_ = param2[param2.length >> 1] as BitmapData;
            if(_loc4_ != null)
            {
               _loc14_ = _loc4_.width;
               _loc15_ = param1.width - (_loc7_ + _loc8_);
               _loc16_ = Math.ceil(_loc15_ / _loc14_) * _loc14_;
               _loc12_ = _loc7_ - (_loc16_ - _loc15_ >> 1);
               _loc17_ = _loc12_ + _loc16_;
               _loc18_ = [_loc4_];
               while(_loc12_ < _loc17_)
               {
                  _loc10_ = renderColumns(param1,_loc18_,_loc12_,true);
                  _loc12_ = _loc10_.x;
                  if(_loc10_.y > _loc3_)
                  {
                     _loc3_ = _loc10_.y;
                  }
               }
            }
         }
         _loc12_ = 0;
         _loc10_ = renderColumns(param1,_loc5_,_loc12_,true);
         if(_loc10_.y > _loc3_)
         {
            _loc3_ = _loc10_.y;
         }
         _loc10_ = renderColumns(param1,_loc6_,_loc13_,false);
         if(_loc10_.y > _loc3_)
         {
            _loc3_ = _loc10_.y;
         }
         return _loc3_;
      }
      
      public function createColumn(param1:int, param2:int, param3:Array, param4:int = 1) : Boolean
      {
         if(param1 < 0 || param1 >= _columns.length)
         {
            return false;
         }
         var _loc5_:PlaneMaterialCellColumn = new PlaneMaterialCellColumn(param2,param3,param4);
         var _loc6_:PlaneMaterialCellColumn = _columns[param1] as PlaneMaterialCellColumn;
         if(_loc6_ != null)
         {
            _loc6_.dispose();
         }
         _columns[param1] = _loc5_;
         if(_loc5_ != null && !_loc5_.isStatic)
         {
            var_1141 = false;
         }
         return true;
      }
      
      private function getColumnsWidth(param1:Array) : int
      {
         var _loc4_:* = null;
         if(param1 == null || param1.length == 0)
         {
            return 0;
         }
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = param1[_loc3_] as BitmapData;
            if(_loc4_ != null)
            {
               _loc2_ += _loc4_.width;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function get isStatic() : Boolean
      {
         return var_1141;
      }
      
      public function get normalMaxX() : Number
      {
         return _normalMaxX;
      }
   }
}
