package com.sulake.habbo.catalog.marketplace
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public interface IMarketPlace
   {
       
      
      function registerVisualization(param1:IMarketPlaceVisualization = null) : void;
      
      function onBuyResult(param1:IMessageEvent) : void;
      
      function onOffers(param1:IMessageEvent) : void;
      
      function redeemSoldOffers() : void;
      
      function requestOffersByName(param1:String) : void;
      
      function requestOwnItems() : void;
      
      function requestOffersByPrice(param1:int) : void;
      
      function latestOffers() : Map;
      
      function latestOwnOffers() : Map;
      
      function redeemExpiredOffer(param1:int) : void;
      
      function get windowManager() : IHabboWindowManager;
      
      function buyOffer(param1:int) : void;
      
      function get localization() : ICoreLocalizationManager;
      
      function onCancelResult(param1:IMessageEvent) : void;
      
      function onOwnOffers(param1:IMessageEvent) : void;
   }
}
