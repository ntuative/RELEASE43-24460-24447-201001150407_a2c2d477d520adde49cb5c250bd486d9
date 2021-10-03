package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1551:int;
      
      private var var_886:int;
      
      private var var_1555:int;
      
      private var var_1554:int;
      
      private var var_1552:int;
      
      private var var_1321:int;
      
      private var var_1553:Boolean;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get offerMaxPrice() : int
      {
         return var_1551;
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_886;
      }
      
      public function get offerMinPrice() : int
      {
         return var_1554;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get expirationHours() : int
      {
         return var_1552;
      }
      
      public function get tokenBatchSize() : int
      {
         return var_1321;
      }
      
      public function get commission() : int
      {
         return var_1555;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1553;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1553 = param1.readBoolean();
         var_1555 = param1.readInteger();
         var_886 = param1.readInteger();
         var_1321 = param1.readInteger();
         var_1554 = param1.readInteger();
         var_1551 = param1.readInteger();
         var_1552 = param1.readInteger();
         return true;
      }
   }
}
