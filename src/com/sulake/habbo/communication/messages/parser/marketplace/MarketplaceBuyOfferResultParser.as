package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceBuyOfferResultParser implements IMessageParser
   {
       
      
      private var var_1806:int = -1;
      
      private var var_1805:int = -1;
      
      private var var_1807:int = -1;
      
      private var _result:int;
      
      public function MarketplaceBuyOfferResultParser()
      {
         super();
      }
      
      public function get newPrice() : int
      {
         return var_1805;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get requestedOfferId() : int
      {
         return var_1806;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _result = param1.readInteger();
         var_1807 = param1.readInteger();
         var_1805 = param1.readInteger();
         var_1806 = param1.readInteger();
         return true;
      }
      
      public function get result() : int
      {
         return _result;
      }
      
      public function get offerId() : int
      {
         return var_1807;
      }
   }
}
