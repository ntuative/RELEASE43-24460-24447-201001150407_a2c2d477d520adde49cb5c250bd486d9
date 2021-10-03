package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_1394:Array;
      
      private var var_1822:Boolean;
      
      private var var_557:Array;
      
      private var var_1821:int;
      
      private var var_558:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         var_1394 = [];
         var_558 = [];
         var_557 = [];
         var_1822 = param1.readBoolean();
         var_1821 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            var_1394.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            var_558.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            var_557.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
      
      public function get method_5() : Array
      {
         return var_557;
      }
      
      public function get stuffTypes() : Array
      {
         return var_1394;
      }
      
      public function get wrappingPrice() : int
      {
         return var_1821;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get boxTypes() : Array
      {
         return var_558;
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return var_1822;
      }
   }
}
