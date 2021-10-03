package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_2121:XML;
      
      private var var_1507:ITextWindow;
      
      private var var_1505:ITextWindow;
      
      private var var_2119:XML;
      
      private var var_858:IWindowContainer;
      
      private var var_2244:ITextWindow;
      
      private var var_2120:String = "";
      
      private var var_2300:IButtonWindow;
      
      private var var_2122:XML;
      
      private var var_1506:ITextWindow;
      
      private var var_2118:XML;
      
      private var var_857:IButtonWindow;
      
      private var var_158:Offer;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_365:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2119) as IWindowContainer;
               break;
            case Offer.const_452:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2118) as IWindowContainer;
               break;
            case Offer.const_352:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2121) as IWindowContainer;
               break;
            case Offer.const_591:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2122) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach...undefined");
         }
         if(_loc2_ != null)
         {
            if(var_858 != null)
            {
               _window.removeChild(var_858);
               var_858.dispose();
            }
            var_858 = _loc2_;
            _window.addChild(_loc2_);
            var_858.x = 0;
            var_858.y = 0;
         }
         var_1506 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         var_1505 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         var_1507 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         var_2244 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         var_857 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(var_857 != null)
         {
            var_857.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onPurchase);
            var_857.disable();
         }
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(var_158 != null)
         {
            Logger.log("Init Purchase: undefined undefined");
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(var_158,page,var_2120);
         }
      }
      
      override public function init() : void
      {
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            var_2119 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            var_2118 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            var_2121 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         if(_loc4_ != null)
         {
            var_2122 = _loc4_.content as XML;
         }
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,onSelectProduct);
         events.addEventListener(WidgetEvent.const_918,onSetParameter);
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         var_2120 = param1.parameter;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var_158 = param1.offer;
         attachStub(var_158.priceType);
         if(var_1506 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(var_158.priceInCredits));
            var_1506.caption = "${catalog.purchase.price.credits}";
         }
         if(var_1505 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.pixels","pixels",String(var_158.priceInPixels));
            var_1505.caption = "${catalog.purchase.price.pixels}";
         }
         if(var_1507 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","credits",String(var_158.priceInCredits));
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","pixels",String(var_158.priceInPixels));
            var_1507.caption = "${catalog.purchase.price.credits+pixels}";
         }
         if(var_857 != null)
         {
            var_857.enable();
         }
      }
   }
}
