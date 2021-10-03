package com.sulake.habbo.catalog.marketplace
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketPlaceOffer;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketPlaceOffersEvent;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketPlaceOwnOffersEvent;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceBuyOfferResultEvent;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceCancelOfferResultEvent;
   import com.sulake.habbo.communication.messages.parser.marketplace.MarketPlaceOffersParser;
   import com.sulake.habbo.communication.messages.parser.marketplace.MarketPlaceOwnOffersParser;
   import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceBuyOfferResultParser;
   import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceCancelOfferResultParser;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class MarketPlaceLogic implements IMarketPlace
   {
       
      
      private var var_1985:String;
      
      public const const_1626:int = 3;
      
      public const const_1563:int = 2;
      
      private var var_141:IWindowContainer;
      
      private var _visualization:IMarketPlaceVisualization;
      
      private var _windowManager:IHabboWindowManager;
      
      public const const_1550:int = 1;
      
      private var var_665:Map;
      
      private var var_2295:int;
      
      private var var_90:IHabboCatalog;
      
      private var var_227:Map;
      
      private var var_467:int = -1;
      
      private var var_2294:int = -1;
      
      public function MarketPlaceLogic(param1:IHabboCatalog, param2:IHabboWindowManager)
      {
         super();
         var_90 = param1;
         _windowManager = param2;
      }
      
      private function getAssetXML(param1:String) : XML
      {
         var _loc2_:XmlAsset = var_90.assets.getAssetByName(param1) as XmlAsset;
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.content as XML;
      }
      
      public function requestOwnItems() : void
      {
         var_90.getOwnMarketPlaceOffers();
      }
      
      public function latestOwnOffers() : Map
      {
         return var_665;
      }
      
      private function onConfirmDialogEvent(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(param2 == null)
         {
            param2 = param1.target as IWindow;
         }
         switch(param2.name)
         {
            case "confirm_higher_buy_button":
            case "confirm_buy_button":
               var_90.buyMarketPlaceOffer(var_467);
               if(var_141)
               {
                  var_141.dispose();
               }
               break;
            case "confirm_invalid_cancel_button":
            case "confirm_higher_cancel_button":
            case "confirm_cancel_button":
            case "header_button_close":
               if(var_141)
               {
                  var_141.dispose();
               }
         }
      }
      
      public function get localization() : ICoreLocalizationManager
      {
         return var_90.localization;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      public function dispose() : void
      {
         var_90 = null;
         _windowManager = null;
      }
      
      public function onBuyResult(param1:IMessageEvent) : void
      {
         var newItem:MarketPlaceOfferData = null;
         var updateItem:MarketPlaceOfferData = null;
         var event:IMessageEvent = param1;
         var buyEvent:MarketplaceBuyOfferResultEvent = event as MarketplaceBuyOfferResultEvent;
         var parser:MarketplaceBuyOfferResultParser = buyEvent.getParser() as MarketplaceBuyOfferResultParser;
         if(parser.result == 1)
         {
            if(parser.offerId > 0)
            {
               newItem = var_227.getValue(parser.requestedOfferId) as MarketPlaceOfferData;
               var_227.remove(parser.requestedOfferId);
               newItem.offerId = parser.offerId;
               newItem.price = parser.newPrice;
               var_227.add(parser.offerId,newItem);
            }
            else
            {
               var_227.remove(parser.requestedOfferId);
            }
            var_467 = -1;
            _visualization.listUpdatedNotify();
         }
         else if(parser.result == 2)
         {
            var_227.remove(parser.requestedOfferId);
            var_467 = -1;
            _visualization.listUpdatedNotify();
            if(_windowManager != null)
            {
               _windowManager.alert("${catalog.marketplace.not_available_title}","${catalog.marketplace.not_available_header}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
            }
         }
         else if(parser.result == 3)
         {
            updateItem = var_227.getValue(parser.requestedOfferId) as MarketPlaceOfferData;
            if(updateItem)
            {
               updateItem.offerId = parser.offerId;
               updateItem.price = parser.newPrice;
               var_227.add(parser.offerId,updateItem);
            }
            var_227.remove(parser.requestedOfferId);
            var_467 = parser.offerId;
            showConfirmation(const_1563);
            _visualization.listUpdatedNotify();
         }
         else if(parser.result == 4)
         {
            if(_windowManager != null)
            {
               _windowManager.alert("${catalog.alert.notenough.title}","${catalog.alert.notenough.credits.description}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
            }
         }
      }
      
      public function requestOffersByName(param1:String) : void
      {
         var_90.getPublicMarketPlaceOffers(param1,-1);
      }
      
      public function onCancelResult(param1:IMessageEvent) : void
      {
         var event:IMessageEvent = param1;
         var cancelEvent:MarketplaceCancelOfferResultEvent = event as MarketplaceCancelOfferResultEvent;
         var parser:MarketplaceCancelOfferResultParser = cancelEvent.getParser() as MarketplaceCancelOfferResultParser;
         if(parser.result == 1)
         {
            var_665.remove(parser.offerId);
            _visualization.listUpdatedNotify();
         }
         else if(parser.result == 0)
         {
            if(_windowManager != null)
            {
               _windowManager.alert("${catalog.marketplace.operation_failed.topic}","{{catalog.marketplace.cancel_failed}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
            }
         }
      }
      
      public function onOwnOffers(param1:IMessageEvent) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:MarketPlaceOwnOffersEvent = param1 as MarketPlaceOwnOffersEvent;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:MarketPlaceOwnOffersParser = _loc2_.getParser() as MarketPlaceOwnOffersParser;
         if(_loc3_ == null)
         {
            return;
         }
         var_665 = new Map();
         for each(_loc4_ in _loc3_.offers)
         {
            _loc5_ = new MarketPlaceOfferData(_loc4_.offerId,_loc4_.furniId,_loc4_.furniType,_loc4_.price,_loc4_.status);
            _loc5_.timeLeftMinutes = _loc4_.timeLeftMinutes;
            var_665.add(_loc4_.offerId,_loc5_);
         }
         if(_visualization == null)
         {
            return;
         }
         _visualization.listUpdatedNotify();
      }
      
      public function registerVisualization(param1:IMarketPlaceVisualization = null) : void
      {
         if(param1 == null)
         {
            return;
         }
         _visualization = param1;
      }
      
      public function redeemSoldOffers() : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc1_:Array = var_665.getKeys();
         for each(_loc2_ in _loc1_)
         {
            _loc3_ = var_665.getValue(_loc2_);
            if(_loc3_.status == MarketPlaceOfferState.const_375)
            {
               var_665.remove(_loc2_);
            }
         }
         var_90.redeemSoldMarketPlaceOffers();
         _visualization.listUpdatedNotify();
      }
      
      private function showConfirmation(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(var_141)
         {
            var_141.dispose();
         }
         if(!_windowManager)
         {
            return;
         }
         switch(param1)
         {
            case const_1550:
               _loc2_ = getAssetXML("marketplace_confirm_purchase");
               if(_loc2_ == null)
               {
                  return;
               }
               var_141 = _windowManager.buildFromXML(_loc2_) as IWindowContainer;
               break;
            case const_1563:
               _loc2_ = getAssetXML("marketplace_confirm_purchase_higher");
               if(_loc2_ == null)
               {
                  return;
               }
               var_141 = _windowManager.buildFromXML(_loc2_) as IWindowContainer;
               break;
            case const_1626:
               _loc2_ = getAssetXML("marketplace_confirm_purchase_invalid");
               if(_loc2_ == null)
               {
                  return;
               }
               var_141 = _windowManager.buildFromXML(_loc2_) as IWindowContainer;
               break;
         }
         if(var_141)
         {
            var_141.procedure = onConfirmDialogEvent;
            var_141.visible = true;
            var_141.center();
            _loc3_ = var_227.getValue(var_467) as MarketPlaceOfferData;
            if(!_loc3_)
            {
               return;
            }
            _loc4_ = var_141.findChildByName("item_name") as ITextWindow;
            if(_loc4_ != null)
            {
               _loc4_.text = "${roomItem.name." + _loc3_.furniId + "}";
            }
            _loc5_ = var_141.findChildByName("item_desc") as ITextWindow;
            if(_loc5_ != null)
            {
               _loc5_.text = "${roomItem.desc." + _loc3_.furniId + "}";
            }
            _loc6_ = var_141.findChildByName("item_price") as ITextWindow;
            if(_loc6_ != null)
            {
               _loc7_ = localization.getKey("catalog.marketplace.confirm_price");
               _loc7_ = _loc7_.replace("%price%",_loc3_.price);
               _loc6_.text = _loc7_;
            }
         }
      }
      
      public function requestOffersByPrice(param1:int) : void
      {
         var_90.getPublicMarketPlaceOffers("",param1);
      }
      
      public function onOffers(param1:IMessageEvent) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:MarketPlaceOffersEvent = param1 as MarketPlaceOffersEvent;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:MarketPlaceOffersParser = _loc2_.getParser() as MarketPlaceOffersParser;
         if(_loc3_ == null)
         {
            return;
         }
         if(var_227)
         {
            for each(_loc5_ in var_227)
            {
               _loc5_.dispose();
            }
         }
         var_227 = new Map();
         for each(_loc4_ in _loc3_.offers)
         {
            _loc6_ = new MarketPlaceOfferData(_loc4_.offerId,_loc4_.furniId,_loc4_.furniType,_loc4_.price,_loc4_.status);
            _loc6_.timeLeftMinutes = _loc4_.timeLeftMinutes;
            var_227.add(_loc4_.offerId,_loc6_);
         }
         if(_visualization == null)
         {
            return;
         }
         _visualization.listUpdatedNotify();
      }
      
      public function redeemExpiredOffer(param1:int) : void
      {
         var_90.redeemExpiredMarketPlaceOffer(param1);
      }
      
      public function buyOffer(param1:int) : void
      {
         var_467 = param1;
         showConfirmation(const_1550);
      }
      
      public function latestOffers() : Map
      {
         return var_227;
      }
   }
}
