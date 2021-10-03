package com.sulake.habbo.communication.messages.incoming.marketplace
{
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceMakeOfferResultParser;
   
   public class MarketplaceMakeOfferResult extends MessageEvent
   {
       
      
      public function MarketplaceMakeOfferResult(param1:Function)
      {
         super(param1,MarketplaceMakeOfferResultParser);
      }
      
      public function getParser() : MarketplaceMakeOfferResultParser
      {
         return var_21 as MarketplaceMakeOfferResultParser;
      }
   }
}
