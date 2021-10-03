package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketPlaceOffer;
   
   public class MarketPlaceOffersParser implements IMessageParser
   {
       
      
      private var var_941:Array;
      
      private const const_1611:int = 1000;
      
      public function MarketPlaceOffersParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_941 = null;
         return true;
      }
      
      public function get offers() : Array
      {
         return var_941;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc10_:* = null;
         var_941 = new Array();
         var _loc8_:int = param1.readInteger();
         var _loc9_:int = 0;
         while(_loc9_ < _loc8_)
         {
            _loc2_ = param1.readInteger();
            _loc3_ = param1.readInteger();
            _loc4_ = param1.readInteger();
            _loc5_ = param1.readInteger();
            _loc6_ = param1.readInteger();
            _loc7_ = param1.readInteger();
            _loc10_ = new MarketPlaceOffer(_loc2_,_loc5_,_loc4_,_loc6_,_loc3_,_loc7_);
            if(_loc9_ < const_1611)
            {
               var_941.push(_loc10_);
            }
            _loc9_++;
         }
         return true;
      }
   }
}
