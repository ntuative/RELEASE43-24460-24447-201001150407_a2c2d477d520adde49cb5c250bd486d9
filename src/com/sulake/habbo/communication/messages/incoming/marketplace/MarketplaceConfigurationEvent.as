package com.sulake.habbo.communication.messages.incoming.marketplace
{
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceConfigurationParser;
   
   public class MarketplaceConfigurationEvent extends MessageEvent
   {
       
      
      public function MarketplaceConfigurationEvent(param1:Function)
      {
         super(param1,MarketplaceConfigurationParser);
      }
      
      public function getParser() : MarketplaceConfigurationParser
      {
         return var_21 as MarketplaceConfigurationParser;
      }
   }
}
