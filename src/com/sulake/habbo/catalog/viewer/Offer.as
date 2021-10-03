package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer
   {
      
      public static const const_902:String = "price_type_none";
      
      public static const const_443:String = "pricing_model_multi";
      
      public static const const_365:String = "price_type_credits";
      
      public static const const_352:String = "price_type_credits_and_pixels";
      
      public static const const_409:String = "pricing_model_bundle";
      
      public static const const_439:String = "pricing_model_single";
      
      public static const const_591:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1138:String = "pricing_model_unknown";
      
      public static const const_452:String = "price_type_pixels";
       
      
      private var var_833:int;
      
      private var _offerId:int;
      
      private var var_834:int;
      
      private var var_409:String;
      
      private var var_561:String;
      
      private var var_2045:int;
      
      private var var_702:ICatalogPage;
      
      private var var_1250:String;
      
      private var var_410:IProductContainer;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _offerId = param1.offerId;
         var_1250 = param1.localizationId;
         var_833 = param1.priceInCredits;
         var_834 = param1.priceInPixels;
         var_702 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(_loc4_.productType);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_409;
      }
      
      public function get page() : ICatalogPage
      {
         return var_702;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_2045 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_410;
      }
      
      public function get localizationId() : String
      {
         return var_1250;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_834;
      }
      
      public function dispose() : void
      {
         _offerId = 0;
         var_1250 = "";
         var_833 = 0;
         var_834 = 0;
         var_702 = null;
         if(var_410 != null)
         {
            var_410.dispose();
            var_410 = null;
         }
      }
      
      public function get priceType() : String
      {
         return var_561;
      }
      
      public function get previewCallbackId() : int
      {
         return var_2045;
      }
      
      public function get priceInCredits() : int
      {
         return var_833;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_409 = const_439;
            }
            else
            {
               var_409 = const_443;
            }
         }
         else if(param1.length > 1)
         {
            var_409 = const_409;
         }
         else
         {
            var_409 = const_1138;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_409)
         {
            case const_439:
               var_410 = new SingleProductContainer(this,param1);
               break;
            case const_443:
               var_410 = new MultiProductContainer(this,param1);
               break;
            case const_409:
               var_410 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_409);
         }
      }
      
      private function analyzePriceType() : void
      {
         if(var_833 > 0 && var_834 > 0)
         {
            var_561 = const_352;
         }
         else if(var_833 > 0)
         {
            var_561 = const_365;
         }
         else if(var_834 > 0)
         {
            var_561 = const_452;
         }
         else
         {
            var_561 = const_902;
         }
      }
   }
}
