package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_557:Array;
      
      private var var_1143:int;
      
      private var var_1394:Array;
      
      private var var_558:Array;
      
      private var var_1553:Boolean = false;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var_1553 = _loc2_.isWrappingEnabled;
         var_1143 = _loc2_.wrappingPrice;
         var_1394 = _loc2_.stuffTypes;
         var_558 = _loc2_.boxTypes;
         var_557 = _loc2_.method_5;
      }
      
      public function get method_5() : Array
      {
         return var_557;
      }
      
      public function get stuffTypes() : Array
      {
         return var_1394;
      }
      
      public function get price() : int
      {
         return var_1143;
      }
      
      public function get boxTypes() : Array
      {
         return var_558;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1553;
      }
   }
}
