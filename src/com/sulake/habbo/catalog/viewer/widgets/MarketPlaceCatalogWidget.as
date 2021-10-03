package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.marketplace.IMarketPlace;
   import com.sulake.habbo.catalog.marketplace.IMarketPlaceVisualization;
   import com.sulake.habbo.catalog.marketplace.MarketPlaceOfferData;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class MarketPlaceCatalogWidget extends CatalogWidget implements ICatalogWidget, IGetImageListener, IMarketPlaceVisualization
   {
       
      
      private const const_1076:int = 1;
      
      private const const_1410:int = 40;
      
      private const const_755:Array = [2,3,4,6,8,10,15,20,30,50,100];
      
      private const const_1618:int = 2;
      
      private const const_1407:int = 2;
      
      public function MarketPlaceCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function updateList(param1:Map) : void
      {
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         if(!window)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(!marketPlace)
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
         var _loc4_:XML = getAssetXML("marketplace_offers_item");
         if(!_loc4_)
         {
            return;
         }
         var _loc5_:IHabboWindowManager = marketPlace.windowManager;
         if(_loc5_ == null)
         {
            return;
         }
         var _loc6_:IWindowContainer = _loc5_.buildFromXML(_loc4_) as IWindowContainer;
         if(_loc6_ == null)
         {
            return;
         }
         var _loc7_:Array = param1.getKeys();
         if(_loc7_ == null)
         {
            return;
         }
         updateStatusDisplay(const_1407,_loc7_.length);
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_.length)
         {
            _loc9_ = _loc7_[_loc8_];
            _loc10_ = param1.getValue(_loc9_) as MarketPlaceOfferData;
            if(_loc10_ != null)
            {
               if(_loc10_.window == null)
               {
                  _loc11_ = _loc6_.clone() as IWindowContainer;
                  _loc10_.window = _loc11_;
               }
               else
               {
                  _loc11_ = _loc10_.window;
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
                     _loc15_ = _loc2_.getKey("catalog.marketplace.offer.price_public_item");
                     _loc15_ = _loc15_.replace("%price%",_loc10_.price);
                     _loc14_.text = _loc15_;
                  }
                  if(_loc10_.image == null)
                  {
                     _loc16_ = getFurniImageResult(_loc10_.furniId,_loc10_.furniType);
                     if(_loc16_ != null && _loc16_.data != null)
                     {
                        _loc10_.image = _loc16_.data as BitmapData;
                        _loc10_.imageCallback = _loc16_.id;
                     }
                  }
                  if(_loc10_.image != null)
                  {
                     _loc17_ = _loc11_.findChildByName("item_image") as IBitmapWrapperWindow;
                     if(_loc17_ != null)
                     {
                        _loc18_ = new Point((_loc17_.width - _loc10_.image.width) / 2,(_loc17_.height - _loc10_.image.height) / 2);
                        if(_loc17_.bitmap == null)
                        {
                           _loc17_.bitmap = new BitmapData(_loc17_.width,_loc17_.height,true,0);
                        }
                        _loc17_.bitmap.copyPixels(_loc10_.image,_loc10_.image.rect,_loc18_);
                     }
                  }
                  _loc3_.addListItem(_loc11_);
                  _loc11_.procedure = onGridEvent;
               }
            }
            _loc8_++;
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
         var _loc3_:Map = marketPlace.latestOffers();
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:Array = _loc3_.getKeys();
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:int = 0;
         for(; _loc5_ < _loc4_.length; _loc5_++)
         {
            _loc6_ = _loc4_[_loc5_];
            _loc7_ = _loc3_.getValue(_loc6_) as MarketPlaceOfferData;
            if(_loc7_ != null)
            {
               if(_loc7_.imageCallback == param1)
               {
                  _loc7_.image = param2;
                  _loc8_ = _loc7_.window;
                  if(_loc8_ != null)
                  {
                     _loc9_ = _loc8_.findChildByName("item_image") as IBitmapWrapperWindow;
                     if(_loc9_ != null)
                     {
                        _loc9_.bitmap = new BitmapData(_loc9_.width,_loc9_.height,true,16777215);
                        _loc10_ = new Point((_loc9_.width - param2.width) / 2,(_loc9_.height - param2.height) / 2);
                        _loc9_.bitmap.copyPixels(param2,param2.rect,_loc10_,null,null,true);
                     }
                  }
                  continue;
                  return;
               }
            }
         }
      }
      
      private function onGridEvent(param1:WindowEvent, param2:IWindow = null) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(!window || !marketPlace || !param2)
            {
               return;
            }
            if(param2.name == "buy_button")
            {
               _loc3_ = window.findChildByName("item_list") as IItemListWindow;
               if(_loc3_ == null)
               {
                  return;
               }
               _loc4_ = _loc3_.getListItemIndex(param1.window.parent);
               _loc5_ = marketPlace.latestOffers();
               if(!_loc5_)
               {
                  return;
               }
               _loc6_ = _loc5_.getWithIndex(_loc4_) as MarketPlaceOfferData;
               if(_loc6_)
               {
                  marketPlace.buyOffer(_loc6_.offerId);
               }
            }
         }
      }
      
      override public function init() : void
      {
         super.init();
         if(marketPlace == null)
         {
            return;
         }
         marketPlace.registerVisualization(this);
         displayMainView();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      public function displayMainView() : void
      {
         var _loc1_:XML = getAssetXML("marketPlaceWidget");
         if(_loc1_ == null)
         {
            return;
         }
         window.removeChildAt(0);
         if(!window || !page || true || !page.viewer.catalog)
         {
            return;
         }
         window.addChild(page.viewer.catalog.windowManager.buildFromXML(_loc1_));
         window.procedure = onWidgetEvent;
         var _loc2_:IDropMenuWindow = window.findChildByName("search_drop") as IDropMenuWindow;
         if(_loc2_ != null)
         {
            _loc2_.populate(const_755);
            _loc2_.selection = 0;
         }
      }
      
      private function get marketPlace() : IMarketPlace
      {
         if(page && false && page.viewer.catalog)
         {
            return page.viewer.catalog.getMarketPlace();
         }
         return null;
      }
      
      public function listUpdatedNotify() : void
      {
         if(marketPlace == null)
         {
            return;
         }
         updateList(marketPlace.latestOffers());
      }
      
      private function onWidgetEvent(param1:WindowEvent, param2:IWindow = null) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(!window || !marketPlace)
         {
            return;
         }
         if(param2 == null)
         {
            param2 = param1.target as IWindow;
         }
         var _loc3_:ICoreLocalizationManager = marketPlace.localization;
         var _loc4_:ITextWindow = window.findChildByName("search_input") as ITextWindow;
         if(param1.type == WindowEvent.const_56)
         {
            if(param2.name == "search_drop")
            {
               _loc5_ = (window.findChildByName("search_drop") as IDropMenuWindow).selection;
               _loc6_ = 0;
               if(marketPlace)
               {
                  marketPlace.requestOffersByPrice(_loc6_);
                  updateStatusDisplay(const_1076);
               }
            }
         }
         else if(param1.type == WindowKeyboardEvent.const_112)
         {
            if(param2.name == "search_input")
            {
               if(_loc4_ && _loc4_.text.length >= const_1410)
               {
                  _loc4_.text = _loc4_.text.substr(0,const_1410);
               }
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "search_input":
                  if(_loc3_ && _loc4_ && _loc4_.text == _loc3_.getKey("catalog.marketplace.search_name"))
                  {
                     _loc4_.text = "";
                  }
                  break;
               case "search_button":
                  if(_loc3_ && _loc4_ && _loc4_.text == _loc3_.getKey("catalog.marketplace.search_name"))
                  {
                     return;
                  }
                  if(marketPlace && _loc4_.text.length >= const_1618)
                  {
                     marketPlace.requestOffersByName(_loc4_.text);
                     updateStatusDisplay(const_1076);
                  }
                  break;
            }
         }
      }
      
      private function updateStatusDisplay(param1:int, param2:int = -1) : void
      {
         var _loc5_:* = null;
         var _loc3_:ICoreLocalizationManager = marketPlace.localization;
         if(!_loc3_)
         {
            return;
         }
         if(!window || !page || true || !page.viewer.catalog)
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
