package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_193:String = "e";
      
      public static const const_77:String = "i";
      
      public static const const_76:String = "s";
       
      
      private var var_927:String;
      
      private var var_1138:String;
      
      private var var_1139:int;
      
      private var var_1581:int;
      
      private var var_926:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1138 = param1.readString();
         var_1581 = param1.readInteger();
         var_927 = param1.readString();
         var_926 = param1.readInteger();
         var_1139 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_926;
      }
      
      public function get productType() : String
      {
         return var_1138;
      }
      
      public function get expiration() : int
      {
         return var_1139;
      }
      
      public function get furniClassId() : int
      {
         return var_1581;
      }
      
      public function get extraParam() : String
      {
         return var_927;
      }
   }
}
