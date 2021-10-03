package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.pets.IBreed;
   import com.sulake.habbo.avatar.pets.IPetColor;
   import com.sulake.habbo.avatar.pets.IPetData;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetApproveNameResultEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColourIndexEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColoursEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class PetsCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_381:int = 0;
      
      private var var_454:Boolean = false;
      
      private var var_1403:int = 0;
      
      private var var_292:Array;
      
      private var var_761:int = -1;
      
      private var var_534:Array;
      
      private var _name:String;
      
      private var var_941:Map;
      
      public function PetsCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function getPurchaseParameters() : String
      {
         if(_name == null || false)
         {
            page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.empty}",0,function(param1:IAlertDialog, param2:Event):void
            {
               param1.dispose();
            });
            return "";
         }
         if(var_381 >= var_292.length)
         {
            return "";
         }
         var petColor:IPetColor = var_292[var_381] as IPetColor;
         var color:uint = petColor.rgb;
         var breed:IBreed = var_534[var_1403] as IBreed;
         var p:String = _name + String.fromCharCode(10) + addZeroPadding(String(breed.id),3) + String.fromCharCode(10) + addZeroPadding(color.toString(16).toUpperCase(),6);
         return p;
      }
      
      private function getRaceLocalizationKey(param1:int, param2:int) : String
      {
         return "pet.race." + param1 + "." + addZeroPadding(String(param2),3);
      }
      
      private function onColourIndex(param1:CatalogWidgetColourIndexEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var_381 = param1.index;
         if(var_381 < 0 || var_381 > var_292.length)
         {
            var_381 = 0;
         }
         updateImage();
      }
      
      private function onApproveNameResult(param1:CatalogWidgetApproveNameResultEvent) : void
      {
         var event:CatalogWidgetApproveNameResultEvent = param1;
         if(event == null || !var_454)
         {
            return;
         }
         var_454 = false;
         switch(event.result)
         {
            case 1:
               page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.length}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               return;
            case 2:
               page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.chars}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               return;
            case 3:
               page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.bobba}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               return;
            case 4:
               page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.taken}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
         }
         var p:String = getPurchaseParameters();
         if(p == "")
         {
            Logger.log("* Not enough information to buy a pet!");
            return;
         }
         Logger.log("* Will buy pet as " + p);
         (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(var_941.getWithIndex(0),page,p);
      }
      
      override public function init() : void
      {
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         super.init();
         var_454 = false;
         var _loc1_:IWindow = window.findChildByName("ctlg_buy_button");
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onBuyButtonEvent);
         var _loc2_:ITextFieldWindow = window.findChildByName("name_input_text") as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.addEventListener(WindowEvent.const_156,onTextWindowEvent);
         var_941 = new Map();
         var _loc3_:Array = new Array();
         var _loc4_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         if(page.offers.length == 0)
         {
            return;
         }
         var _loc5_:Offer = page.offers[0];
         var_761 = getPetTypeIndexFromProduct(_loc5_.localizationId);
         var_292 = [];
         var_534 = [];
         if(page && false && page.viewer.catalog)
         {
            _loc10_ = page.viewer.catalog as HabboCatalog;
            if(_loc10_ && _loc10_.avatarRenderManager && _loc10_.avatarRenderManager.petDataManager)
            {
               _loc11_ = _loc10_.avatarRenderManager.petDataManager.getPetData(var_761);
               if(_loc11_)
               {
                  var_534 = _loc11_.breeds;
                  var_292 = _loc11_.colors;
                  if(var_292 == null)
                  {
                     var_292 = [];
                  }
               }
            }
         }
         var _loc6_:int = 0;
         while(_loc6_ < var_534.length)
         {
            _loc12_ = var_534[_loc6_] as IBreed;
            _loc3_.push(_loc4_.getKey(getRaceLocalizationKey(var_761,_loc12_.id),getRaceLocalizationKey(var_761,_loc12_.id)));
            _loc6_++;
         }
         var_941.add(var_761,_loc5_);
         var _loc7_:IDropMenuWindow = window.findChildByName("type_drop_menu") as IDropMenuWindow;
         if(_loc7_ == null)
         {
            return;
         }
         if(_loc3_.length > 1)
         {
            _loc7_.populate(_loc3_);
            _loc7_.selection = 0;
            _loc7_.procedure = onDropMenuEvent;
         }
         else
         {
            _loc7_.visible = false;
         }
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,onSelectProduct);
         events.addEventListener(WidgetEvent.CWE_COLOUR_INDEX,onColourIndex);
         events.addEventListener(WidgetEvent.const_924,onApproveNameResult);
         _loc5_ = var_941.getWithIndex(0);
         if(_loc5_ != null)
         {
            events.dispatchEvent(new SelectProductEvent(_loc5_));
         }
         var _loc8_:* = [];
         for each(_loc9_ in var_292)
         {
            _loc8_.push(_loc9_.rgb);
         }
         events.dispatchEvent(new CatalogWidgetColoursEvent(_loc8_,"ctlg_clr_27x22_1","ctlg_clr_27x22_2","ctlg_clr_27x22_3"));
      }
      
      private function getPetTypeIndexFromProduct(param1:String) : int
      {
         if(param1.length == 0)
         {
            return 0;
         }
         return int(param1.charAt(param1.length - 1));
      }
      
      override public function dispose() : void
      {
         var_454 = false;
         super.dispose();
      }
      
      private function onBuyButtonEvent(param1:WindowEvent) : void
      {
         if(var_454)
         {
            Logger.log("* Cannot buy a pet, pending previous name approval.");
         }
         if(getPurchaseParameters() == "")
         {
            return;
         }
         var_454 = true;
         (page.viewer.catalog as HabboCatalog).approveName(_name,1);
      }
      
      private function addZeroPadding(param1:String, param2:int) : String
      {
         while(param1.length < param2)
         {
            param1 = "0" + param1;
         }
         return param1;
      }
      
      public function onDropMenuEvent(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:int = 0;
         if(param1.type == WindowEvent.const_56)
         {
            _loc3_ = IDropMenuWindow(param2).selection;
            if(_loc3_ >= var_534.length)
            {
               return;
            }
            var_1403 = _loc3_;
            updateImage();
         }
      }
      
      private function setPreviewImage(param1:BitmapData) : void
      {
         if(false)
         {
            return;
         }
         if(param1 == null)
         {
            param1 = new BitmapData(1,1);
         }
         var _loc2_:IBitmapWrapperWindow = window.findChildByName("ctlg_teaserimg_1") as IBitmapWrapperWindow;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.bitmap == null)
         {
            _loc2_.bitmap = new BitmapData(_loc2_.width,_loc2_.height,true,16777215);
         }
         _loc2_.bitmap.fillRect(_loc2_.bitmap.rect,16777215);
         var _loc4_:BitmapData = new BitmapData(param1.width * 2,param1.height * 2,true,16777215);
         _loc4_.draw(param1,new Matrix(2,0,0,2));
         var _loc5_:Point = new Point((_loc2_.width - _loc4_.width) / 2,(_loc2_.height - _loc4_.height) / 2);
         _loc2_.bitmap.copyPixels(_loc4_,_loc4_.rect,_loc5_,null,null,true);
         _loc2_.invalidate();
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         updateImage();
      }
      
      private function onTextWindowEvent(param1:WindowEvent) : void
      {
         var _loc2_:ITextFieldWindow = param1.target as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _name = _loc2_.text;
      }
      
      private function updateImage() : void
      {
         var _loc7_:* = null;
         var _loc1_:Offer = var_941.getWithIndex(0);
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:* = 0;
         if(var_381 >= 0 && var_381 < var_292.length)
         {
            _loc7_ = var_292[var_381] as IPetColor;
            if(_loc7_ != null)
            {
               _loc2_ = uint(_loc7_.rgb);
            }
         }
         var _loc3_:IBreed = var_534[var_1403] as IBreed;
         var _loc4_:IAvatarImage = (page.viewer.catalog as HabboCatalog).avatarRenderManager.createPetImageNew(var_761,_loc3_.id,_loc2_,AvatarScaleType.const_50);
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.initActionAppends();
         _loc4_.appendAction(AvatarAction.const_289,AvatarAction.const_645);
         _loc4_.endActionAppends();
         _loc4_.setDirection(AvatarSetType.const_37,2);
         setPreviewImage(_loc4_.getCroppedImage(AvatarSetType.const_37).clone());
         _loc4_.dispose();
         var _loc5_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var _loc6_:ITextWindow = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         if(_loc6_ != null)
         {
            _loc5_.registerParameter("catalog.purchase.price.credits","credits",String(_loc1_.priceInCredits));
            _loc6_.caption = "${catalog.purchase.price.credits}";
         }
      }
   }
}
