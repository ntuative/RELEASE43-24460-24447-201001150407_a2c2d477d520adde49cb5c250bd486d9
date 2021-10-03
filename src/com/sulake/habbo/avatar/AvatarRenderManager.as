package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.enum.AvatarRenderEvent;
   import com.sulake.habbo.avatar.enum.AvatarType;
   import com.sulake.habbo.avatar.enum.RenderMode;
   import com.sulake.habbo.avatar.palette.PaletteManager;
   import com.sulake.habbo.avatar.pets.IPetDataManager;
   import com.sulake.habbo.avatar.pets.PetDataManager;
   import com.sulake.habbo.avatar.structure.IFigureData;
   import com.sulake.habbo.avatar.structure.parts.PartOffsetData;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.configuration.enum.HabboConfigurationEvent;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import flash.events.Event;
   
   public class AvatarRenderManager extends Component implements IAvatarRenderManager
   {
       
      
      private var var_601:String;
      
      private var var_884:CoreComponent;
      
      private var var_32:AssetAliasCollection;
      
      private var var_942:PaletteManager;
      
      private var var_632:PetDataManager;
      
      private var _habboConfiguration:IHabboConfigurationManager;
      
      private var var_293:Map;
      
      public function AvatarRenderManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_293 = new Map();
         param2 |= const_823;
         super(param1,param2,param3);
         var_601 = RenderMode.const_1217;
         if(param1 is CoreComponent)
         {
            var_884 = CoreComponent(param1);
            var_884.events.addEventListener(Component.COMPONENT_EVENT_RUNNING,onComponentsRunning);
         }
         queueInterface(new IIDHabboConfigurationManager(),onHabboConfigurationReady);
      }
      
      private function onConfigurationInit(param1:Event = null) : void
      {
         var _loc2_:* = null;
         _loc2_ = var_293.getValue(AvatarType.const_92) as AvatarStructure;
         if(_loc2_ != null)
         {
            _loc2_.initConfiguration(_habboConfiguration);
         }
         _loc2_ = var_293.getValue(AvatarType.PET) as AvatarStructure;
         if(_loc2_ != null)
         {
            _loc2_.initConfiguration(_habboConfiguration);
         }
      }
      
      private function onStructureInit(param1:Event = null) : void
      {
         this.events.dispatchEvent(new Event(AvatarRenderEvent.AVATAR_RENDER_READY));
      }
      
      private function init() : void
      {
         var _loc5_:* = null;
         var _loc1_:AssetLibraryCollection = var_884.assets as AssetLibraryCollection;
         var _loc2_:int = 0;
         var _loc3_:Array = new Array();
         while(_loc1_.hasAssetLibrary("lib-" + _loc2_))
         {
            _loc3_.push("lib-" + _loc2_);
            _loc2_++;
         }
         if(_loc1_.hasAssetLibrary("PetData"))
         {
            _loc3_.push("PetData");
            _loc2_++;
         }
         if(_loc1_.hasAssetLibrary("PaletteData"))
         {
            _loc3_.push("PaletteData");
            _loc2_++;
         }
         var_32 = new AssetAliasCollection(_loc1_,_loc3_);
         var_632 = new PetDataManager(_loc1_,_loc3_);
         var_942 = new PaletteManager(_loc1_,_loc3_);
         var _loc4_:XML = _assets.getAssetByName("HabboAvatarPetFigure").content as XML;
         var_632.populateFigureData(_loc4_);
         _loc5_ = new AvatarStructure(this,assets,_loc1_,AvatarType.const_92);
         _loc5_.addEventListener(AvatarStructure.AVATAR_STRUCTURE_INIT,onStructureInit);
         var_293.add(AvatarType.const_92,_loc5_);
         _loc5_ = new AvatarStructure(this,assets,_loc1_,AvatarType.PET);
         _loc5_.addEventListener(AvatarStructure.AVATAR_STRUCTURE_INIT,onStructureInit);
         var_293.add(AvatarType.PET,_loc5_);
         initHardCodedAliases();
      }
      
      public function get petDataManager() : IPetDataManager
      {
         return var_632 as IPetDataManager;
      }
      
      public function set mode(param1:String) : void
      {
         var_601 = param1;
         if(var_601 == RenderMode.const_1159)
         {
            init();
         }
      }
      
      public function createPetImage(param1:String, param2:String) : IAvatarImage
      {
         if(param1.indexOf(" ") == -1)
         {
            return null;
         }
         var _loc3_:Array = param1.split(" ");
         if(_loc3_.length == 0)
         {
            return null;
         }
         var _loc4_:int = int(_loc3_[0]);
         var _loc5_:int = int(_loc3_[1]);
         var _loc6_:uint = parseInt(_loc3_[2],16);
         return createPetImageNew(_loc4_,_loc5_,_loc6_,param2);
      }
      
      public function getAssetByName(param1:String) : IAsset
      {
         return var_32.getAssetByName(param1);
      }
      
      private function onHabboConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 != null)
         {
            _habboConfiguration = param2 as IHabboConfigurationManager;
            (_habboConfiguration as Component).events.addEventListener(HabboConfigurationEvent.INIT,onConfigurationInit);
         }
      }
      
      public function createPetImageNew(param1:int, param2:int, param3:uint, param4:String) : IAvatarImage
      {
         var _loc5_:String = var_632.createAvatarFigureStringNew(param1,param2,param3);
         var _loc6_:AvatarStructure = var_293.getValue(AvatarType.PET) as AvatarStructure;
         if(_loc6_ == null)
         {
            return null;
         }
         return new AvatarImage(_loc6_,var_32,_loc5_,param4,AvatarType.PET);
      }
      
      private function onComponentsRunning(param1:Event = null) : void
      {
         init();
      }
      
      public function getFigureData(param1:String) : IFigureData
      {
         var _loc2_:AvatarStructure = var_293.getValue(param1) as AvatarStructure;
         if(_loc2_ != null)
         {
            return _loc2_.figureData;
         }
         return null;
      }
      
      public function createAvatarImage(param1:String, param2:String) : IAvatarImage
      {
         var _loc3_:AvatarStructure = var_293.getValue(AvatarType.const_92) as AvatarStructure;
         if(_loc3_ == null)
         {
            return null;
         }
         return new AvatarImage(_loc3_,var_32,param1,param2,AvatarType.const_92);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(var_293 != null)
         {
            var_293.dispose();
            var_293 = null;
         }
         if(var_632 != null)
         {
            var_632 = null;
         }
         if(var_942 != null)
         {
            var_942 = null;
         }
         PartOffsetData.dispose();
      }
      
      public function get paletteManager() : PaletteManager
      {
         return var_942;
      }
      
      private function initHardCodedAliases() : void
      {
         var_32.addAlias("h_crr_ri_419_0_0","h_std_fx5_1_1_0_0");
         var_32.addAlias("h_crr_ri_419_1_0","h_std_fx5_1_1_1_0");
         var_32.addAlias("h_crr_ri_419_2_0","h_std_fx5_1_1_2_0");
         var_32.addAlias("h_crr_ri_419_3_0","h_std_fx5_1_1_3_0");
         var_32.addAlias("h_crr_ri_419_4_0","h_std_fx5_1_1_4_0");
         var_32.addAlias("h_crr_ri_419_5_0","h_std_fx5_1_1_5_0");
         var_32.addAlias("h_drk_ri_469_0_0","h_std_fx16_1_1_0_0");
         var_32.addAlias("h_drk_ri_469_1_0","h_std_fx16_1_1_1_0");
         var_32.addAlias("h_drk_ri_469_2_0","h_std_fx16_1_1_2_0");
         var_32.addAlias("h_drk_ri_469_3_0","h_std_fx16_1_1_3_0");
         var_32.addAlias("h_drk_ri_469_4_0","h_std_fx16_1_1_4_0");
         var_32.addAlias("h_drk_ri_469_5_0","h_std_fx16_1_1_5_0");
         var_32.addAlias("h_drk_ri_469_6_0","h_std_fx16_1_1_6_0");
         var_32.addAlias("h_crr_ri_470_0_0","h_std_fx26_1_1_0_0");
         var_32.addAlias("h_crr_ri_470_1_0","h_std_fx26_1_1_1_0");
         var_32.addAlias("h_crr_ri_470_2_0","h_std_fx26_1_1_2_0");
         var_32.addAlias("h_crr_ri_470_3_0","h_std_fx26_1_1_3_0");
         var_32.addAlias("h_crr_ri_470_4_0","h_std_fx26_1_1_4_0");
         var_32.addAlias("h_crr_ri_470_5_0","h_std_fx26_1_1_5_0");
         var_32.addAlias("sh_crr_ri_419_0_0","sh_std_fx5_1_1_0_0");
         var_32.addAlias("sh_crr_ri_419_1_0","sh_std_fx5_1_1_1_0");
         var_32.addAlias("sh_crr_ri_419_2_0","sh_std_fx5_1_1_2_0");
         var_32.addAlias("sh_crr_ri_419_3_0","sh_std_fx5_1_1_3_0");
         var_32.addAlias("sh_crr_ri_419_4_0","sh_std_fx5_1_1_4_0");
         var_32.addAlias("sh_crr_ri_419_5_0","sh_std_fx5_1_1_5_0");
         var_32.addAlias("sh_drk_ri_469_0_0","sh_std_fx16_1_1_0_0");
         var_32.addAlias("sh_drk_ri_469_1_0","sh_std_fx16_1_1_1_0");
         var_32.addAlias("sh_drk_ri_469_2_0","sh_std_fx16_1_1_2_0");
         var_32.addAlias("sh_drk_ri_469_3_0","sh_std_fx16_1_1_3_0");
         var_32.addAlias("sh_drk_ri_469_4_0","sh_std_fx16_1_1_4_0");
         var_32.addAlias("sh_drk_ri_469_5_0","sh_std_fx16_1_1_5_0");
         var_32.addAlias("sh_drk_ri_469_6_0","sh_std_fx16_1_1_6_0");
         var_32.addAlias("sh_crr_ri_470_0_0","sh_std_fx26_1_1_0_0");
         var_32.addAlias("sh_crr_ri_470_1_0","sh_std_fx26_1_1_1_0");
         var_32.addAlias("sh_crr_ri_470_2_0","sh_std_fx26_1_1_2_0");
         var_32.addAlias("sh_crr_ri_470_3_0","sh_std_fx26_1_1_3_0");
         var_32.addAlias("sh_crr_ri_470_4_0","sh_std_fx26_1_1_4_0");
         var_32.addAlias("sh_crr_ri_470_5_0","sh_std_fx26_1_1_5_0");
         var_32.addAlias("h_drk_ri_fx16_1_0_0","h_std_fx16_1_1_0_0");
         var_32.addAlias("h_drk_ri_fx16_1_1_0","h_std_fx16_1_1_1_0");
         var_32.addAlias("h_drk_ri_fx16_1_2_0","h_std_fx16_1_1_2_0");
         var_32.addAlias("h_drk_ri_fx16_1_3_0","h_std_fx16_1_1_3_0");
         var_32.addAlias("h_drk_ri_fx16_1_4_0","h_std_fx16_1_1_4_0");
         var_32.addAlias("h_drk_ri_fx16_1_5_0","h_std_fx16_1_1_5_0");
         var_32.addAlias("h_drk_ri_fx16_1_6_0","h_std_fx16_1_1_6_0");
      }
      
      public function get mode() : String
      {
         return var_601;
      }
   }
}
