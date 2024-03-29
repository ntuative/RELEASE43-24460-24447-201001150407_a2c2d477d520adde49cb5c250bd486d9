package com.sulake.habbo.catalog.recycler
{
   import com.sulake.habbo.catalog.enum.ProductTypeEnum;
   import com.sulake.habbo.catalog.viewer.IGridItem;
   import com.sulake.habbo.catalog.viewer.ProductGridItem;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.ImageResult;
   import flash.display.BitmapData;
   
   public class PrizeGridItem extends ProductGridItem implements IGetImageListener, IGridItem
   {
       
      
      public function PrizeGridItem()
      {
         super();
      }
      
      public function initProductIcon(param1:IRoomEngine, param2:String, param3:int, param4:String = "") : void
      {
         var _loc6_:* = null;
         var _loc5_:* = null;
         switch(param2)
         {
            case ProductTypeEnum.const_76:
               _loc6_ = param1.getFurnitureIcon(param3,this);
               break;
            case ProductTypeEnum.const_77:
               _loc6_ = param1.getWallItemIcon(param3,this,param4);
               break;
            default:
               Logger.log("[PrizeItemContainer] Can not yet handle this type of product: " + param2);
               return;
         }
         if(_loc6_ != null)
         {
            _loc5_ = _loc6_.data;
            setIconImage(_loc5_);
         }
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         setIconImage(param2);
      }
   }
}
