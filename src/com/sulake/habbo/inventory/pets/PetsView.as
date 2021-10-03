package com.sulake.habbo.inventory.pets
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   import com.sulake.habbo.inventory.IInventoryView;
   import com.sulake.habbo.inventory.furni.FurniModel;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class PetsView implements IInventoryView
   {
       
      
      private var _view:IWindowContainer;
      
      private var _disposed:Boolean = false;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_295:PetsGridItem;
      
      private var _avatarRenderer:IAvatarRenderManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_544:Map;
      
      private var var_456:IItemGridWindow;
      
      private var var_93:PetsModel;
      
      public function PetsView(param1:PetsModel, param2:IHabboWindowManager, param3:IAssetLibrary, param4:IHabboLocalizationManager, param5:IAvatarRenderManager)
      {
         super();
         var_93 = param1;
         _assetLibrary = param3;
         _windowManager = param2;
         _avatarRenderer = param5;
         var_544 = new Map();
         var _loc6_:XmlAsset = _assetLibrary.getAssetByName("inventory_pets_view_xml") as XmlAsset;
         if(_loc6_ == null || _loc6_.content == null)
         {
            return;
         }
         _view = _windowManager.buildFromXML(_loc6_.content as XML) as IWindowContainer;
         if(_view == null)
         {
            return;
         }
         _view.visible = false;
         _view.procedure = windowEventHandler;
         var_456 = _view.findChildByName("grid") as IItemGridWindow;
         var _loc7_:IButtonWindow = _view.findChildByName("place_button") as IButtonWindow;
         if(_loc7_ != null)
         {
            _loc7_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,placeButtonClickHandler);
         }
         selectPetsTab();
         updatePreview();
      }
      
      private function selectFirst() : void
      {
         if(var_544 == null || false)
         {
            updatePreview();
            return;
         }
         setSelectedGridItem(var_544.getWithIndex(0));
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         if(_view == null)
         {
            return null;
         }
         if(false)
         {
            return null;
         }
         return _view;
      }
      
      public function setSelectedGridItem(param1:PetsGridItem) : void
      {
         if(var_295 != null)
         {
            var_295.setSelected(false);
         }
         var_295 = param1;
         if(var_295 != null)
         {
            var_295.setSelected(true);
         }
         updatePreview(param1);
      }
      
      private function selectPetsTab() : void
      {
         if(_view == null)
         {
            return;
         }
         var _loc1_:ISelectorWindow = _view.findChildByName("category_selector") as ISelectorWindow;
         if(_loc1_ != null)
         {
            _loc1_.setSelected(_loc1_.getSelectableByName("tab_pets"));
         }
      }
      
      public function update() : void
      {
         updateGrid();
         updatePreview(var_295);
      }
      
      private function windowEventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowEvent.const_56)
         {
            switch(param2.name)
            {
               case "tab_floor":
                  var_93.switchCategory(FurniModel.const_41);
                  break;
               case "tab_wall":
                  var_93.switchCategory(FurniModel.const_42);
            }
            selectPetsTab();
         }
      }
      
      private function placeButtonClickHandler(param1:WindowMouseEvent) : void
      {
         if(var_295 == null)
         {
            return;
         }
         var _loc2_:PetData = var_295.pet;
         if(_loc2_ == null)
         {
            return;
         }
         placePetToRoom(_loc2_.id);
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _windowManager = null;
            var_93 = null;
            _view = null;
            _disposed = true;
         }
      }
      
      private function updateGrid() : void
      {
         var _loc2_:* = null;
         if(_view == null)
         {
            return;
         }
         var_456.removeGridItems();
         var_544.reset();
         var _loc1_:Map = var_93.pets;
         if(_loc1_ == null)
         {
            return;
         }
         for each(_loc2_ in _loc1_)
         {
            addPet(_loc2_);
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function placePetToRoom(param1:int, param2:Boolean = false) : void
      {
         var_93.placePetToRoom(param1,param2);
      }
      
      public function removePet(param1:int) : void
      {
         var _loc2_:PetsGridItem = var_544.remove(param1) as PetsGridItem;
         if(_loc2_ == null)
         {
            return;
         }
         var_456.removeGridItem(_loc2_.window);
         if(var_295 == _loc2_)
         {
            var_295 = null;
            selectFirst();
         }
      }
      
      public function addPet(param1:PetData) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_544.getValue(param1.id) != null)
         {
            return;
         }
         var _loc2_:PetsGridItem = new PetsGridItem(this,param1,_windowManager,_assetLibrary,_avatarRenderer);
         if(_loc2_ != null)
         {
            var_456.addGridItem(_loc2_.window);
            var_544.add(param1.id,_loc2_);
            if(var_295 == null)
            {
               selectFirst();
            }
         }
      }
      
      private function updatePreview(param1:PetsGridItem = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:Boolean = false;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:int = 0;
         var _loc15_:* = null;
         if(_view == null)
         {
            return;
         }
         if(param1 == null || param1.pet == null)
         {
            _loc2_ = new BitmapData(1,1);
            _loc3_ = "";
            _loc4_ = "";
            _loc5_ = false;
         }
         else
         {
            _loc12_ = param1.pet;
            _loc13_ = _avatarRenderer.createPetImage(_loc12_.figure,AvatarScaleType.const_50);
            if(_loc13_ == null)
            {
               return;
            }
            _loc13_.setDirection(AvatarSetType.const_37,4);
            _loc2_ = _loc13_.getCroppedImage(AvatarSetType.const_37);
            _loc3_ = _loc12_.name;
            _loc14_ = _loc13_.petRace;
            if(_loc14_ < 10)
            {
               _loc4_ = "${pet.race." + _loc13_.petType + ".00" + _loc14_ + "}";
            }
            else if(_loc14_ < 100)
            {
               _loc4_ = "${pet.race." + _loc13_.petType + ".0" + _loc14_ + "}";
            }
            _loc5_ = true;
         }
         var _loc6_:IBitmapWrapperWindow = _view.findChildByName("preview_image") as IBitmapWrapperWindow;
         if(_loc6_ != null)
         {
            _loc15_ = new BitmapData(_loc6_.width,_loc6_.height);
            _loc15_.fillRect(_loc15_.rect,0);
            _loc15_.copyPixels(_loc2_,_loc2_.rect,new Point(_loc15_.width / 2 - _loc2_.width / 2,_loc15_.height / 2 - _loc2_.height / 2));
            _loc6_.bitmap = _loc15_;
         }
         var _loc7_:ITextWindow = _view.findChildByName("preview_text") as ITextWindow;
         if(_loc7_ != null)
         {
            _loc7_.caption = _loc3_;
         }
         _loc7_ = _view.findChildByName("preview_description") as ITextWindow;
         if(_loc7_ != null)
         {
            _loc7_.caption = _loc4_;
         }
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         if(false)
         {
            _loc8_ = var_93.roomSession.arePetsAllowed;
            _loc9_ = var_93.roomSession.isRoomOwner;
         }
         var _loc10_:String = "";
         if(!_loc9_)
         {
            if(_loc8_)
            {
               _loc10_ = "${inventory.pets.allowed}";
            }
            else
            {
               _loc10_ = "${inventory.pets.forbidden}";
            }
         }
         _loc7_ = _view.findChildByName("preview_info") as ITextWindow;
         if(_loc7_ != null)
         {
            _loc7_.caption = _loc10_;
         }
         var _loc11_:IButtonWindow = _view.findChildByName("place_button") as IButtonWindow;
         if(_loc11_ != null)
         {
            if(_loc5_ && (_loc9_ || _loc8_))
            {
               _loc11_.enable();
            }
            else
            {
               _loc11_.disable();
            }
         }
      }
   }
}
