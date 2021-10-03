package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.marketplace.IMarketPlace;
   import com.sulake.habbo.catalog.marketplace.IMarketPlaceVisualization;
   import com.sulake.habbo.catalog.marketplace.MarketPlaceOfferData;
   import com.sulake.habbo.catalog.marketplace.MarketPlaceOfferState;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class MarketPlaceOwnItemsCatalogWidget extends CatalogWidget implements ICatalogWidget, IGetImageListener, IMarketPlaceVisualization
   {
       
      
      private const const_1076:int = 1;
      
      private var _itemTemplates:Map;
      
      private const const_1407:int = 2;
      
      public function MarketPlaceOwnItemsCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
         _itemTemplates = new Map();
      }
      
      private function updateList(param1:Map) : void
      {
         var _loc4_:* = null;
         var _loc5_:Boolean = false;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:* = null;
         var _loc24_:* = null;
         var _loc25_:* = null;
         var _loc26_:* = null;
         if(!param1 || !marketPlace || !window)
         {
            return;
         }
         var _loc2_:ICoreLocalizationManager = marketPlace.localization;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:IItemListWindow = window.findChildByName("item_list") as IItemListWindow;
         if(!_loc3_)
         {
            return;
         }
         _loc3_.removeListItems();
         var _loc6_:Array = param1.getKeys();
         if(!_loc6_)
         {
            return;
         }
         updateStatusDisplay(const_1407,_loc6_.length);
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_.length)
         {
            _loc9_ = _loc6_[_loc7_];
            _loc10_ = param1.getValue(_loc9_) as MarketPlaceOfferData;
            if(_loc10_.status == MarketPlaceOfferState.const_375)
            {
               _loc5_ = true;
            }
            _loc4_ = _itemTemplates.getValue(_loc10_.status);
            if(_loc4_)
            {
               _loc11_ = _loc4_.clone() as IWindowContainer;
               if(_loc10_.window == null)
               {
                  _loc10_.window = _loc11_;
               }
               if(!(!_loc11_ || _loc11_.disposed))
               {
                  _loc12_ = _loc11_.findChildByName("item_name") as ITextWindow;
                  if(_loc12_ != null)
                  {
                     _loc12_.text = "${roomItem.name." + _loc10_.furniId + "}";
                  }
                  _loc13_ = _loc11_.findChildByName("item_desc") as ITextWindow;
                  if(_loc13_ != null)
                  {
                     _loc13_.text = "${roomItem.desc." + _loc10_.furniId + "}";
                  }
                  _loc14_ = _loc11_.findChildByName("item_price") as ITextWindow;
                  if(_loc14_ != null)
                  {
                     _loc15_ = _loc2_.getKey("catalog.marketplace.offer.price_own_item");
                     _loc15_ = _loc15_.replace("%price%",_loc10_.price);
                     _loc14_.text = _loc15_;
                  }
                  if(_loc10_.status == MarketPlaceOfferState.const_1007)
                  {
                     _loc16_ = _loc11_.findChildByName("item_time") as ITextWindow;
                     if(_loc16_ != null)
                     {
                        _loc17_ = Math.max(1,_loc10_.timeLeftMinutes);
                        _loc18_ = Math.floor(_loc17_ / 60);
                        _loc19_ = _loc17_ - _loc18_ * 60;
                        _loc20_ = _loc19_ + " " + _loc2_.getKey("catalog.marketplace.offer.minutes");
                        if(_loc18_ > 0)
                        {
                           _loc20_ = _loc18_ + " " + _loc2_.getKey("catalog.marketplace.offer.hours") + " " + _loc20_;
                        }
                        _loc21_ = _loc2_.getKey("catalog.marketplace.offer.time_left");
                        _loc21_ = _loc21_.replace("%time%",_loc20_);
                        _loc16_.text = _loc21_;
                     }
                  }
                  if(_loc10_.status == MarketPlaceOfferState.const_375)
                  {
                     _loc22_ = _loc11_.findChildByName("item_sold") as ITextWindow;
                     if(_loc22_ != null)
                     {
                        _loc22_.text = _loc2_.getKey("catalog.marketplace.offer.sold");
                     }
                  }
                  if(_loc10_.status == MarketPlaceOfferState.const_797)
                  {
                     _loc23_ = _loc11_.findChildByName("item_expired") as ITextWindow;
                     if(_loc23_ != null)
                     {
                        _loc23_.text = _loc2_.getKey("catalog.marketplace.offer.expired");
                     }
                  }
                  if(_loc10_.image == null)
                  {
                     _loc24_ = getFurniImageResult(_loc10_.furniId,_loc10_.furniType);
                     if(_loc24_ != null && _loc24_.data != null)
                     {
                        _loc10_.image = _loc24_.data as BitmapData;
                        _loc10_.imageCallback = _loc24_.id;
                     }
                  }
                  if(_loc10_.image != null)
                  {
                     _loc25_ = _loc11_.findChildByName("item_image") as IBitmapWrapperWindow;
                     if(_loc25_ != null)
                     {
                        _loc26_ = new Point((_loc25_.width - _loc10_.image.width) / 2,(_loc25_.height - _loc10_.image.height) / 2);
                        if(_loc25_.bitmap == null)
                        {
                           _loc25_.bitmap = new BitmapData(_loc25_.width,_loc25_.height,true,0);
                        }
                        _loc25_.bitmap.copyPixels(_loc10_.image,_loc10_.image.rect,_loc26_);
                     }
                  }
                  _loc3_.addListItem(_loc11_);
                  _loc11_.procedure = onGridEvent;
               }
            }
            _loc7_++;
         }
         var _loc8_:IButtonWindow = window.findChildByName("redeem_sold") as IButtonWindow;
         if(_loc8_)
         {
            if(_loc5_)
            {
               _loc8_.enable();
            }
            else
            {
               _loc8_.disable();
            }
         }
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         if(!marketPlace || !param2)
         {
            return;
         }
         var _loc3_:Map = marketPlace.latestOwnOffers();
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:Array = _loc3_.getKeys();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc6_ = _loc4_[_loc5_];
            _loc7_ = _loc3_.getValue(_loc6_) as MarketPlaceOfferData;
            if(_loc7_.imageCallback == param1)
            {
               _loc7_.image = param2;
               _loc8_ = _loc7_.window;
               _loc9_ = _loc8_.findChildByName("item_image") as IBitmapWrapperWindow;
               if(_loc9_ != null)
               {
                  _loc9_.bitmap = new BitmapData(_loc9_.width,_loc9_.height,true,16777215);
                  _loc10_ = new Point((_loc9_.width - param2.width) / 2,(_loc9_.height - param2.height) / 2);
                  _loc9_.bitmap.copyPixels(param2,param2.rect,_loc10_,null,null,true);
               }
               return;
            }
            _loc5_++;
         }
      }
      
      override public function init() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.init();
         if(marketPlace == null)
         {
            return;
         }
         var _loc1_:IHabboWindowManager = marketPlace.windowManager;
         if(_loc1_ == null)
         {
            return;
         }
         _loc3_ = getAssetXML("marketplace_ongoing_item");
         if(_loc3_ != null)
         {
            _loc2_ = _loc1_.buildFromXML(_loc3_) as IWindowContainer;
            if(_loc2_)
            {
               _itemTemplates.add(MarketPlaceOfferState.const_1007,_loc2_);
            }
         }
         _loc3_ = getAssetXML("marketplace_sold_item");
         if(_loc3_ != null)
         {
            _loc2_ = _loc1_.buildFromXML(_loc3_) as IWindowContainer;
            if(_loc2_)
            {
               _itemTemplates.add(MarketPlaceOfferState.const_375,_loc2_);
            }
         }
         _loc3_ = getAssetXML("marketplace_expired_item");
         if(_loc3_ != null)
         {
            _loc2_ = _loc1_.buildFromXML(_loc3_) as IWindowContainer;
            if(_loc2_)
            {
               _itemTemplates.add(MarketPlaceOfferState.const_797,_loc2_);
            }
         }
         marketPlace.registerVisualization(this);
         displayMainView();
         marketPlace.requestOwnItems();
         updateStatusDisplay(const_1076);
      }
      
      private function onGridEvent(param1:WindowEvent, param2:IWindow = null) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(!marketPlace || !param2 || !window)
            {
               return;
            }
            if(param2.name == "pick_button")
            {
               _loc3_ = window.findChildByName("item_list") as IItemListWindow;
               if(_loc3_ == null)
               {
                  return;
               }
               _loc4_ = _loc3_.getListItemIndex(param1.window.parent);
               _loc5_ = marketPlace.latestOwnOffers();
               if(!_loc5_)
               {
                  return;
               }
               _loc6_ = _loc5_.getWithIndex(_loc4_) as MarketPlaceOfferData;
               if(_loc6_)
               {
                  marketPlace.redeemExpiredOffer(_loc6_.offerId);
               }
            }
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      public function displayMainView() : void
      {
         var _loc1_:XML = getAssetXML("marketPlaceOwnItemsWidget");
         if(!_loc1_ || !window)
         {
            return;
         }
         window.removeChildAt(0);
         if(!page || true || !page.viewer.catalog || !page.viewer.catalog.windowManager)
         {
            return;
         }
         window.addChild(page.viewer.catalog.windowManager.buildFromXML(_loc1_));
         window.procedure = onWidgetEvent;
      }
      
      private function get marketPlace() : IMarketPlace
      {
         if(!page || true || !page.viewer.catalog)
         {
            return null;
         }
         return page.viewer.catalog.getMarketPlace();
      }
      
      public function listUpdatedNotify() : void
      {
         if(marketPlace == null)
         {
            return;
         }
         updateList(marketPlace.latestOwnOffers());
      }
      
      private function updateStatusDisplay(param1:int, param2:int = -1) : void
      {
         var _loc5_:* = null;
         if(!marketPlace || !window)
         {
            return;
         }
         var _loc3_:ICoreLocalizationManager = marketPlace.localization;
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:ITextWindow = window.findChildByName("status_text") as ITextWindow;
         if(_loc4_ == null)
         {
            return;
         }
         if(param1 == const_1076)
         {
            _loc5_ = _loc3_.getKey("catalog.marketplace.searching");
         }
         else if(const_1407)
         {
            if(param2 > 0)
            {
               _loc5_ = _loc3_.getKey("catalog.marketplace.items_found");
               _loc5_ = _loc5_.replace("%count%",param2);
            }
            else
            {
               _loc5_ = _loc3_.getKey("catalog.marketplace.no_items");
            }
         }
         _loc4_.text = _loc5_;
      }
      
      private function onWidgetEvent(param1:WindowEvent, param2:IWindow) : void
      {
         if(param2 == null)
         {
            param2 = param1.target as IWindow;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "redeem_sold":
                  if(marketPlace)
                  {
                     marketPlace.redeemSoldOffers();
                  }
            }
         }
      }
      
      private function getAssetXML(param1:String) : XML
      {
         if(!page || true || !page.viewer.catalog || !page.viewer.catalog.assets)
         {
            return null;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName(param1) as XmlAsset;
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.content as XML;
      }
      
      private function getFurniImageResult(param1:int, param2:int, param3:String = null) : ImageResult
      {
         if(!page || true || !page.viewer.roomEngine)
         {
            return null;
         }
         if(param2 == 1)
         {
            return page.viewer.roomEngine.getFurnitureIcon(param1,this);
         }
         if(param2 == 2)
         {
            return page.viewer.roomEngine.getWallItemIcon(param1,this,param3);
         }
         return null;
      }
   }
}
