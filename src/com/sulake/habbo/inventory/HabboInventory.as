package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.handshake.AuthenticationOKMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.inventory.purse.GetCreditsInfoComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.purse.GetInfoComposer;
   import com.sulake.habbo.communication.messages.outgoing.users.ScrGetUserInfoMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.inventory.achievements.AchievementsModel;
   import com.sulake.habbo.inventory.badges.BadgesModel;
   import com.sulake.habbo.inventory.effects.EffectsModel;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.inventory.enum.InventorySubCategory;
   import com.sulake.habbo.inventory.events.HabboInventoryEffectsEvent;
   import com.sulake.habbo.inventory.events.HabboInventoryTrackingEvent;
   import com.sulake.habbo.inventory.furni.FurniModel;
   import com.sulake.habbo.inventory.marketplace.MarketplaceModel;
   import com.sulake.habbo.inventory.pets.PetsModel;
   import com.sulake.habbo.inventory.purse.Purse;
   import com.sulake.habbo.inventory.recycler.RecyclerModel;
   import com.sulake.habbo.inventory.trading.TradingModel;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.session.events.RoomSessionPropertyUpdateEvent;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDRoomEngine;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.events.Event;
   import iid.IIDHabboWindowManager;
   
   public class HabboInventory extends Component implements IHabboInventory
   {
       
      
      private var var_208:Purse;
      
      private var var_55:Map;
      
      private var _avatarRenderer:IAvatarRenderManager;
      
      private var _config:IHabboConfigurationManager;
      
      private var _localization:IHabboLocalizationManager;
      
      private var _roomSession:IRoomSession;
      
      private var _view:InventoryMainView;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_34:IRoomSessionManager;
      
      private var _roomEngine:IRoomEngine;
      
      private var _windowManager:IHabboWindowManager;
      
      private const const_1625:int = 500;
      
      private var var_528:ISessionDataManager;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_852:Array;
      
      private var var_1480:IncomingMessages;
      
      public function HabboInventory(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         _assetLibrary = param3;
         var_208 = new Purse();
         var_55 = new Map();
         var_852 = new Array();
         if(param1 is CoreComponent)
         {
            (param1 as CoreComponent).events.addEventListener(Component.COMPONENT_EVENT_RUNNING,onComponentsRunning);
         }
      }
      
      public function getActivatedAvatarEffects() : Array
      {
         return effectsModel.getEffects(1);
      }
      
      public function setEffectDeselected(param1:int) : void
      {
         var _loc2_:EffectsModel = effectsModel;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.stopUsingEffect(param1,true);
         notifyChangedEffects();
      }
      
      public function toggleInventoryPage(param1:String) : void
      {
         _view.toggleCategoryView(param1,false);
         inventoryViewOpened(param1);
         if(!isVisible)
         {
            _events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_CLOSED));
         }
      }
      
      override public function dispose() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         super.dispose();
         var _loc1_:Array = var_55.getKeys();
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = _loc1_[_loc2_];
            _loc4_ = var_55.getValue(_loc3_) as IInventoryModel;
            if(_loc4_ != null)
            {
               _loc4_.dispose();
            }
            _loc2_++;
         }
         var_55.dispose();
         _roomSession = null;
         if(_communication != null)
         {
            release(new IIDHabboCommunicationManager());
            _communication = null;
         }
         if(var_1480 != null)
         {
            var_1480.dispose();
         }
         if(_windowManager != null)
         {
            release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         if(_localization != null)
         {
            release(new IIDHabboLocalizationManager());
            _localization = null;
         }
         if(_view != null)
         {
            _view.dispose();
            _view = null;
         }
         if(_roomEngine != null)
         {
            release(new IIDRoomEngine());
            _roomEngine = null;
         }
         if(var_34 != null)
         {
            var_34.events.removeEventListener(RoomSessionEvent.const_89,roomSessionEventHandler);
            var_34.events.removeEventListener(RoomSessionEvent.const_99,roomSessionEventHandler);
            var_34.events.removeEventListener(RoomSessionPropertyUpdateEvent.const_376,roomSessionEventHandler);
            release(new IIDHabboRoomSessionManager());
            var_34 = null;
         }
      }
      
      public function get recyclerModel() : RecyclerModel
      {
         return RecyclerModel(var_55.getValue(InventorySubCategory.RECYCLER));
      }
      
      private function roomSessionEventHandler(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_89:
               _roomSession = param1.session;
               _view.setHabboToolbarIcon();
               petsModel.updatePetsAllowed();
               break;
            case RoomSessionEvent.const_99:
               _roomSession = null;
               break;
            case RoomSessionPropertyUpdateEvent.const_376:
               petsModel.updatePetsAllowed();
         }
      }
      
      private function onLocalizationManagerReady(param1:IID, param2:IUnknown) : void
      {
         _localization = param2 as IHabboLocalizationManager;
         queueInterface(new IIDRoomEngine(),onRoomEngineReady);
      }
      
      public function get clubDays() : int
      {
         return var_208.clubDays;
      }
      
      public function canUserOfferToTrade() : Boolean
      {
         var _loc1_:TradingModel = tradingModel;
         return !!_loc1_ ? Boolean(_loc1_.ownUserCanTrade) : false;
      }
      
      public function get roomSession() : IRoomSession
      {
         return _roomSession;
      }
      
      public function showView() : void
      {
         _view.showInventory();
      }
      
      public function get clubPeriods() : int
      {
         return var_208.clubPeriods;
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationManagerReady);
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_208.creditBalance = param1;
         if(_view == null)
         {
            return;
         }
         _view.setCreditBalance(creditBalance);
      }
      
      public function get effectsModel() : EffectsModel
      {
         return EffectsModel(var_55.getValue(InventoryCategory.const_642));
      }
      
      public function get furniModel() : FurniModel
      {
         return FurniModel(var_55.getValue(InventoryCategory.const_70));
      }
      
      public function getCategoryViewId() : String
      {
         return _view.getCategoryViewId();
      }
      
      public function setClubStatus(param1:int, param2:int, param3:Boolean) : void
      {
         var_208.clubPeriods = param1;
         var_208.clubDays = param2;
         var_208.clubHasEverBeenMember = param3;
         _view.setClubStatus(clubPeriods,clubDays);
      }
      
      public function checkCategoryInitilization(param1:String) : Boolean
      {
         if(isInventoryCategoryInit(param1))
         {
            return true;
         }
         requestInventoryCategoryInit(param1);
         return false;
      }
      
      public function requestSelectedFurniToRecycler() : int
      {
         if(recyclerModel != null)
         {
            return recyclerModel.lockSelectedFurni();
         }
         return 0;
      }
      
      public function notifyChangedEffects() : void
      {
         events.dispatchEvent(new HabboInventoryEffectsEvent(HabboInventoryEffectsEvent.const_900));
      }
      
      public function get petsModel() : PetsModel
      {
         return PetsModel(var_55.getValue(InventoryCategory.const_160));
      }
      
      public function getCategoryWindowContainer(param1:String) : IWindowContainer
      {
         var _loc2_:IInventoryModel = IInventoryModel(var_55.getValue(param1));
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.getWindowContainer();
      }
      
      public function get sessionData() : ISessionDataManager
      {
         return var_528;
      }
      
      public function requestInventoryCategoryInit(param1:String) : void
      {
         var _loc2_:IInventoryModel = var_55.getValue(param1) as IInventoryModel;
         if(_loc2_ != null)
         {
            _loc2_.requestInitialization(const_1625);
         }
      }
      
      public function get achievementsModel() : AchievementsModel
      {
         return AchievementsModel(var_55.getValue(InventoryCategory.const_287));
      }
      
      public function setInventoryCategoryInit(param1:String, param2:Boolean = true) : void
      {
         var _loc3_:int = 0;
         if(param2)
         {
            if(var_852.indexOf(param1) == -1)
            {
               var_852.push(param1);
            }
         }
         else
         {
            _loc3_ = var_852.indexOf(param1);
            if(_loc3_ >= 0)
            {
               var_852.splice(_loc3_,1);
            }
         }
      }
      
      public function closingInventoryView() : void
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         while(_loc1_ < var_55.length)
         {
            _loc2_ = var_55.getWithIndex(_loc1_) as IInventoryModel;
            _loc2_.closingInventoryView();
            _loc1_++;
         }
         _events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_CLOSED));
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _view.setToolbar(IHabboToolbar(param2) as IHabboToolbar);
      }
      
      public function setEffectSelected(param1:int) : void
      {
         var _loc2_:EffectsModel = effectsModel;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.useEffect(param1);
         notifyChangedEffects();
      }
      
      public function toggleInventorySubPage(param1:String) : void
      {
         var _loc3_:* = null;
         _view.toggleSubCategoryView(param1,false);
         var _loc2_:int = 0;
         while(_loc2_ < var_55.length)
         {
            _loc3_ = var_55.getWithIndex(_loc2_) as IInventoryModel;
            _loc3_.subCategorySwitch(param1);
            _loc2_++;
         }
         switch(param1)
         {
            case InventorySubCategory.const_256:
               _view.toggleCategoryView(InventoryCategory.const_70,false);
         }
      }
      
      public function get pixelBalance() : int
      {
         return var_208.pixelBalance;
      }
      
      public function get tradingActive() : Boolean
      {
         var _loc1_:TradingModel = tradingModel;
         if(!_loc1_)
         {
            return false;
         }
         return _loc1_.running;
      }
      
      public function get tradingModel() : TradingModel
      {
         return TradingModel(var_55.getValue(InventorySubCategory.const_256));
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_528 = ISessionDataManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationManagerReady);
      }
      
      public function isInventoryCategoryInit(param1:String) : Boolean
      {
         if(var_852.indexOf(param1) >= 0)
         {
            return true;
         }
         return false;
      }
      
      public function get creditBalance() : int
      {
         return var_208.creditBalance;
      }
      
      public function get marketplaceModel() : MarketplaceModel
      {
         return var_55.getValue(InventoryCategory.const_387) as MarketplaceModel;
      }
      
      private function onComponentsRunning(param1:Event) : void
      {
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationComponentInit);
      }
      
      public function getCategorySubWindowContainer(param1:String) : IWindowContainer
      {
         var _loc2_:IInventoryModel = IInventoryModel(var_55.getValue(param1));
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.getWindowContainer();
      }
      
      private function onCommunicationComponentInit(param1:IID = null, param2:IUnknown = null) : void
      {
         _communication = IHabboCommunicationManager(param2);
         var_1480 = new IncomingMessages(this);
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
      }
      
      public function deselectAllEffects() : void
      {
         var _loc1_:EffectsModel = effectsModel;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.stopUsingAllEffects();
         notifyChangedEffects();
      }
      
      public function closeView() : void
      {
         _view.hideInventory();
      }
      
      private function onRoomEngineReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _roomEngine = IRoomEngine(param2);
         queueInterface(new IIDSessionDataManager(),onSessionDataManagerReady);
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_208.clubHasEverBeenMember;
      }
      
      public function get clubPastPeriods() : int
      {
         return var_208.clubPastPeriods;
      }
      
      public function getAvatarEffects() : Array
      {
         return effectsModel.getEffects();
      }
      
      public function get communication() : IHabboCommunicationManager
      {
         return _communication;
      }
      
      public function get badgesModel() : BadgesModel
      {
         return BadgesModel(var_55.getValue(InventoryCategory.const_260));
      }
      
      public function setupRecycler(param1:Boolean) : void
      {
         if(recyclerModel != null)
         {
            if(param1)
            {
               recyclerModel.startRecycler();
            }
            else
            {
               recyclerModel.stopRecycler();
            }
         }
      }
      
      public function get isVisible() : Boolean
      {
         return _view.isVisible;
      }
      
      public function inventoryViewOpened(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < var_55.length)
         {
            _loc3_ = var_55.getWithIndex(_loc2_) as IInventoryModel;
            _loc3_.categorySwitch(param1);
            _loc2_++;
         }
      }
      
      private function onAvatarRenderManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _avatarRenderer = param2 as IAvatarRenderManager;
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_208.pixelBalance = param1;
         if(_view == null)
         {
            return;
         }
         _view.setPixelBalance(pixelBalance);
      }
      
      private function onInventoryInit(param1:IMessageEvent) : void
      {
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
         _communication.getHabboMainConnection(null).send(new GetInfoComposer());
         _communication.getHabboMainConnection(null).send(new GetCreditsInfoComposer());
         _communication.getHabboMainConnection(null).send(new ScrGetUserInfoMessageComposer("habbo_club"));
      }
      
      public function getSubCategoryViewId() : String
      {
         return _view.getSubCategoryViewId();
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_34 = IRoomSessionManager(param2);
         var_34.events.addEventListener(RoomSessionEvent.const_89,roomSessionEventHandler);
         var_34.events.addEventListener(RoomSessionEvent.const_99,roomSessionEventHandler);
         var_34.events.addEventListener(RoomSessionPropertyUpdateEvent.const_376,roomSessionEventHandler);
         _view = new InventoryMainView(this,_windowManager,_assetLibrary);
         var_55 = new Map();
         var _loc3_:MarketplaceModel = new MarketplaceModel(this,_windowManager,_communication,_assetLibrary,_roomEngine,_localization,_config);
         var_55.add(InventoryCategory.const_387,_loc3_);
         var _loc4_:FurniModel = new FurniModel(this,_loc3_,_windowManager,_communication,_assetLibrary,_roomEngine,_localization,_config);
         var_55.add(InventoryCategory.const_70,_loc4_);
         var _loc5_:BadgesModel = new BadgesModel(this,_windowManager,_communication,_assetLibrary,_localization,var_528);
         var_55.add(InventoryCategory.const_260,_loc5_);
         var _loc6_:EffectsModel = new EffectsModel(this,_windowManager,_communication,_assetLibrary,_localization);
         var_55.add(InventoryCategory.const_642,_loc6_);
         var _loc7_:AchievementsModel = new AchievementsModel(this,_windowManager,_communication,_assetLibrary,_localization,var_528);
         var_55.add(InventoryCategory.const_287,_loc7_);
         var _loc8_:TradingModel = new TradingModel(this,_windowManager,_communication,_assetLibrary,_roomEngine,_localization);
         var_55.add(InventorySubCategory.const_256,_loc8_);
         var _loc9_:RecyclerModel = new RecyclerModel(this,_windowManager,_communication,_assetLibrary,_roomEngine,_localization);
         var_55.add(InventorySubCategory.RECYCLER,_loc9_);
         var _loc10_:PetsModel = new PetsModel(this,_windowManager,_communication,_assetLibrary,_localization,_roomEngine,_avatarRenderer);
         var_55.add(InventoryCategory.const_160,_loc10_);
         _communication.addHabboConnectionMessageEvent(new AuthenticationOKMessageEvent(onInventoryInit));
      }
      
      public function setupTrading(param1:int, param2:String) : void
      {
         var _loc3_:TradingModel = tradingModel;
         if(_loc3_)
         {
            _loc3_.requestOpenTrading(param1);
         }
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _config = param2 as IHabboConfigurationManager;
         queueInterface(new IIDAvatarRenderManager(),onAvatarRenderManagerReady);
      }
      
      public function returnInventoryFurniFromRecycler(param1:int) : Boolean
      {
         if(recyclerModel != null)
         {
            return recyclerModel.releaseFurni(param1);
         }
         return false;
      }
      
      public function updateSubView() : void
      {
         _view.updateSubCategoryView();
      }
   }
}
