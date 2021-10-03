package com.sulake.habbo.ui
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.ICoreUpdateReceiver;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.advertisement.IAdManager;
   import com.sulake.habbo.advertisement.events.AdEvent;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.IHabboAvatarEditor;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.friendlist.IHabboFriendList;
   import com.sulake.habbo.help.IHabboHelp;
   import com.sulake.habbo.inventory.IHabboInventory;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.moderation.IHabboModeration;
   import com.sulake.habbo.navigator.IHabboNavigator;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.events.RoomEngineDimmerStateEvent;
   import com.sulake.habbo.room.events.RoomEngineEvent;
   import com.sulake.habbo.room.events.RoomEngineObjectEvent;
   import com.sulake.habbo.room.events.RoomEngineRoomColorEvent;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.RoomSessionChatEvent;
   import com.sulake.habbo.session.events.RoomSessionDimmerPresetsEvent;
   import com.sulake.habbo.session.events.RoomSessionDoorbellEvent;
   import com.sulake.habbo.session.events.RoomSessionErrorMessageEvent;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.session.events.RoomSessionPollEvent;
   import com.sulake.habbo.session.events.RoomSessionPresentEvent;
   import com.sulake.habbo.session.events.RoomSessionQueueEvent;
   import com.sulake.habbo.session.events.RoomSessionUserBadgesEvent;
   import com.sulake.habbo.session.events.RoomSessionVoteEvent;
   import com.sulake.habbo.sound.IHabboSoundManager;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.widget.IRoomWidgetFactory;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboAdManager;
   import com.sulake.iid.IIDHabboAvatarEditor;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboFriendList;
   import com.sulake.iid.IIDHabboHelp;
   import com.sulake.iid.IIDHabboInventory;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboModeration;
   import com.sulake.iid.IIDHabboNavigator;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboRoomWidget;
   import com.sulake.iid.IIDHabboSoundManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDRoomEngine;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.events.Event;
   import iid.IIDHabboWindowManager;
   
   public class RoomUI extends Component implements IRoomUI, ICoreUpdateReceiver
   {
       
      
      private var var_729:IHabboSoundManager;
      
      private var var_1671:IHabboAvatarEditor = null;
      
      private var var_434:IAdManager;
      
      private var var_728:IRoomWidgetFactory;
      
      private var var_34:IRoomSessionManager;
      
      private var _roomEngine:IRoomEngine;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1220:IAvatarRenderManager;
      
      private var var_248:Map;
      
      private var var_188:IHabboToolbar;
      
      private var var_1338:IHabboModeration;
      
      private var var_528:ISessionDataManager;
      
      private var _navigator:IHabboNavigator;
      
      private var var_90:IHabboCatalog;
      
      private var var_25:IHabboInventory;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_1339:int = -1;
      
      private var _localization:IHabboLocalizationManager;
      
      private var _friendList:IHabboFriendList;
      
      private var _connection:IConnection;
      
      private var var_1672:IHabboHelp;
      
      public function RoomUI(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
         queueInterface(new IIDRoomEngine(),onRoomEngineReady);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
         queueInterface(new IIDHabboRoomWidget(),onRoomWidgetFactoryReady);
         queueInterface(new IIDSessionDataManager(),onSessionDataManagerReady);
         queueInterface(new IIDHabboFriendList(),onFriendListReady);
         queueInterface(new IIDAvatarRenderManager(),onAvatarRenderManagerReady);
         queueInterface(new IIDHabboInventory(),onInventoryReady);
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
         queueInterface(new IIDHabboNavigator(),onNavigatorReady);
         queueInterface(new IIDHabboAvatarEditor(),onAvatarEditorReady);
         queueInterface(new IIDHabboCatalog(),onCatalogReady);
         queueInterface(new IIDHabboAdManager(),onAdManagerReady);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationManagerReady);
         queueInterface(new IIDHabboHelp(),onHabboHelpReady);
         queueInterface(new IIDHabboModeration(),onHabboModerationReady);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationManagerReady);
         queueInterface(new IIDHabboSoundManager(),onSoundManagerReady);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationReady);
         var_248 = new Map();
         registerUpdateReceiver(this,0);
      }
      
      public function createDesktop(param1:IRoomSession) : IRoomDesktop
      {
         if(param1 == null)
         {
            return null;
         }
         if(_roomEngine == null)
         {
            return null;
         }
         var _loc2_:String = getRoomIdentifier(param1.roomId,param1.roomCategory);
         var _loc3_:RoomDesktop = getDesktop(_loc2_) as RoomDesktop;
         if(_loc3_ != null)
         {
            return _loc3_;
         }
         _loc3_ = new RoomDesktop(param1,assets,_connection);
         _loc3_.roomEngine = _roomEngine;
         _loc3_.windowManager = _windowManager;
         _loc3_.roomWidgetFactory = var_728;
         _loc3_.sessionDataManager = var_528;
         _loc3_.roomSessionManager = var_34;
         _loc3_.friendList = _friendList;
         _loc3_.avatarRenderManager = var_1220;
         _loc3_.inventory = var_25;
         _loc3_.toolbar = var_188;
         _loc3_.navigator = _navigator;
         _loc3_.avatarEditor = var_1671;
         _loc3_.catalog = var_90;
         _loc3_.adManager = var_434;
         _loc3_.localization = _localization;
         _loc3_.habboHelp = var_1672;
         _loc3_.moderation = var_1338;
         _loc3_.config = _config;
         _loc3_.soundManager = var_729;
         var _loc4_:XmlAsset = _assets.getAssetByName("room_desktop_layout_xml") as XmlAsset;
         if(_loc4_ != null)
         {
            _loc3_.layout = _loc4_.content as XML;
         }
         _loc3_.createWidget(RoomWidgetEnum.const_419);
         _loc3_.createWidget(RoomWidgetEnum.const_527);
         _loc3_.init();
         var_248.add(_loc2_,_loc3_);
         return _loc3_;
      }
      
      public function processWidgetMessage(param1:int, param2:int, param3:RoomWidgetMessage) : void
      {
         if(param3 == null)
         {
            return;
         }
         if(_roomEngine == null)
         {
            return;
         }
         var _loc4_:String = getRoomIdentifier(param1,param2);
         var _loc5_:RoomDesktop = getDesktop(_loc4_) as RoomDesktop;
         if(_loc5_ == null)
         {
            return;
         }
         _loc5_.processWidgetMessage(param3);
      }
      
      private function onSoundManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_729 = param2 as IHabboSoundManager;
      }
      
      public function getDesktop(param1:String) : IRoomDesktop
      {
         return var_248.getValue(param1) as RoomDesktop;
      }
      
      private function onCatalogReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_90 = param2 as IHabboCatalog;
      }
      
      private function roomSessionStateEventHandler(param1:RoomSessionEvent) : void
      {
         var _loc2_:* = null;
         if(_roomEngine == null)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomSessionEvent.const_316:
               _loc2_ = createDesktop(param1.session);
               break;
            case RoomSessionEvent.const_89:
               break;
            case RoomSessionEvent.const_99:
               if(param1.session != null)
               {
                  disposeDesktop(getRoomIdentifier(param1.session.roomId,param1.session.roomCategory));
                  var_188.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_170,HabboToolbarIconEnum.ZOOM));
                  var_188.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_170,HabboToolbarIconEnum.MEMENU));
                  var_188.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_170,HabboToolbarIconEnum.INVENTORY));
               }
         }
      }
      
      private function onAdManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_434 = param2 as IAdManager;
         if(var_434 != null && false)
         {
            var_434.events.addEventListener(AdEvent.const_355,adEventHandler);
            var_434.events.addEventListener(AdEvent.const_371,adEventHandler);
            var_434.events.addEventListener(AdEvent.const_348,adEventHandler);
         }
      }
      
      private function adEventHandler(param1:AdEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:String = getRoomIdentifier(param1.roomId,param1.roomCategory);
         var _loc3_:RoomDesktop = getDesktop(_loc2_) as RoomDesktop;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.processEvent(param1);
      }
      
      private function onConnectionReady(param1:IConnection) : void
      {
         if(disposed)
         {
            return;
         }
         if(param1 != null)
         {
            _connection = param1;
         }
      }
      
      private function onRoomWidgetFactoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_728 = param2 as IRoomWidgetFactory;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_windowManager != null)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         if(_roomEngine != null)
         {
            _roomEngine.release(new IIDRoomEngine());
            _roomEngine = null;
         }
         if(var_34 != null)
         {
            var_34.release(new IIDHabboRoomSessionManager());
            var_34 = null;
         }
         if(var_728 != null)
         {
            var_728.release(new IIDHabboRoomWidget());
            var_728 = null;
         }
         if(var_25 != null)
         {
            var_25.release(new IIDHabboInventory());
            var_25 = null;
         }
         if(var_188 != null)
         {
            var_188.release(new IIDHabboToolbar());
            var_188 = null;
         }
         if(_config != null)
         {
            _config.release(new IIDHabboConfigurationManager());
            _config = null;
         }
         if(var_729 != null)
         {
            var_729.release(new IIDHabboSoundManager());
            var_729 = null;
         }
         if(var_248)
         {
            while(false)
            {
               _loc1_ = var_248.getKey(0) as String;
               _loc2_ = var_248.remove(_loc1_) as RoomDesktop;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
            }
            var_248.dispose();
            var_248 = null;
         }
         removeUpdateReceiver(this);
         super.dispose();
      }
      
      public function disposeDesktop(param1:String) : void
      {
         var _loc3_:int = 0;
         var _loc2_:RoomDesktop = var_248.remove(param1) as RoomDesktop;
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.getWidgetState(RoomWidgetEnum.const_225);
            if(_loc3_ != RoomDesktop.const_583)
            {
               var_1339 = _loc3_;
            }
            _loc2_.dispose();
         }
      }
      
      private function onHabboHelpReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_1672 = param2 as IHabboHelp;
      }
      
      private function onCommunicationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var _loc3_:IHabboCommunicationManager = param2 as IHabboCommunicationManager;
         if(_loc3_ != null)
         {
            _connection = _loc3_.getHabboMainConnection(onConnectionReady);
            if(_connection != null)
            {
               onConnectionReady(_connection);
            }
         }
      }
      
      private function onHabboModerationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_1338 = param2 as IHabboModeration;
         Logger.log("XXXX GOT HABBO MODERATION: " + var_1338);
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_528 = param2 as ISessionDataManager;
      }
      
      private function roomSessionEventHandler(param1:RoomSessionEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(_roomEngine == null)
         {
            return;
         }
         if(param1.session != null)
         {
            _loc2_ = getRoomIdentifier(param1.session.roomId,param1.session.roomCategory);
            _loc3_ = getDesktop(_loc2_);
            if(_loc3_ != null)
            {
               _loc3_.processEvent(param1);
            }
         }
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _localization = param2 as IHabboLocalizationManager;
      }
      
      private function onRoomEngineReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _roomEngine = param2 as IRoomEngine;
         initializeRoomEngineEvents();
         if(var_34 != null && _roomEngine != null && false)
         {
            var_34.roomEngineReady = true;
         }
      }
      
      private function onFriendListReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _friendList = param2 as IHabboFriendList;
      }
      
      private function onNavigatorReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _navigator = param2 as IHabboNavigator;
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < var_248.length)
         {
            _loc3_ = var_248.getWithIndex(_loc2_) as RoomDesktop;
            if(_loc3_ != null)
            {
               _loc3_.update();
            }
            _loc2_++;
         }
      }
      
      private function roomEventHandler(param1:RoomEngineEvent) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(param1 == null)
         {
            return;
         }
         if(_roomEngine == null)
         {
            return;
         }
         var _loc2_:String = getRoomIdentifier(param1.roomId,param1.roomCategory);
         var _loc3_:RoomDesktop = getDesktop(_loc2_) as RoomDesktop;
         if(_loc3_ == null)
         {
            if(var_34 == null)
            {
               return;
            }
            _loc4_ = var_34.getSession(param1.roomId,param1.roomCategory);
            if(_loc4_ != null)
            {
               _loc3_ = createDesktop(_loc4_) as RoomDesktop;
            }
         }
         if(_loc3_ == null)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomEngineEvent.const_606:
               _loc3_.createRoomView(getActiveCanvasId(param1.roomId,param1.roomCategory));
               if(!_roomEngine.isPublicRoomWorldType(_roomEngine.getWorldType(param1.roomId,param1.roomCategory)))
               {
                  _loc6_ = new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_174,HabboToolbarIconEnum.ZOOM);
                  _loc6_.iconState = "2";
                  var_188.events.dispatchEvent(_loc6_);
               }
               _loc3_.createWidget(RoomWidgetEnum.const_293);
               _loc3_.createWidget(RoomWidgetEnum.const_373);
               if(!_loc3_.session.isSpectatorMode)
               {
                  _loc3_.createWidget(RoomWidgetEnum.const_395);
                  _loc3_.createWidget(RoomWidgetEnum.CHAT_INPUT_WIDGET);
               }
               _loc3_.createWidget(RoomWidgetEnum.const_697);
               _loc3_.createWidget(RoomWidgetEnum.const_359);
               _loc3_.createWidget(RoomWidgetEnum.const_396);
               _loc3_.createWidget(RoomWidgetEnum.const_389);
               _loc3_.createWidget(RoomWidgetEnum.const_369);
               _loc3_.createWidget(RoomWidgetEnum.const_405);
               _loc3_.createWidget(RoomWidgetEnum.const_102);
               _loc3_.createWidget(RoomWidgetEnum.const_374);
               _loc3_.createWidget(RoomWidgetEnum.const_110);
               _loc3_.createWidget(RoomWidgetEnum.const_225);
               _loc3_.createWidget(RoomWidgetEnum.const_408);
               if(var_1339 != RoomDesktop.const_583)
               {
                  _loc3_.initializeWidget(RoomWidgetEnum.const_225,var_1339);
               }
               if(var_434 != null)
               {
                  var_434.showRoomAd();
               }
               if(_roomEngine != null)
               {
                  _roomEngine.setActiveRoom(param1.roomId,param1.roomCategory);
               }
               break;
            case RoomEngineEvent.const_647:
               disposeDesktop(_loc2_);
               break;
            case RoomEngineRoomColorEvent.const_623:
               _loc5_ = param1 as RoomEngineRoomColorEvent;
               if(_loc5_ == null)
               {
                  break;
               }
               if(_loc5_.bgOnly)
               {
                  _loc3_.setRoomViewColor(16777215,255);
               }
               else
               {
                  _loc3_.setRoomViewColor(_loc5_.color,_loc5_.brightness);
               }
               break;
            case RoomEngineDimmerStateEvent.DIMMER_STATE:
               _loc3_.processEvent(param1);
         }
      }
      
      private function roomSessionDialogEventHandler(param1:RoomSessionEvent) : void
      {
         var errorMessage:String = null;
         var event:RoomSessionEvent = param1;
         var errorTitle:String = "${error.title}";
         switch(event.type)
         {
            case RoomSessionErrorMessageEvent.const_195:
               errorMessage = "${room.error.cant_trade_stuff}";
               break;
            case RoomSessionErrorMessageEvent.const_202:
               errorMessage = "${room.error.cant_set_item}";
               break;
            case RoomSessionErrorMessageEvent.const_685:
               errorMessage = "${room.error.cant_set_not_owner}";
               break;
            case RoomSessionErrorMessageEvent.const_190:
               errorMessage = "${room.error.max_furniture}";
               break;
            case RoomSessionErrorMessageEvent.const_162:
               errorMessage = "${room.error.max_pets}";
               break;
            case RoomSessionErrorMessageEvent.const_205:
               errorMessage = "${room.error.max_queuetiles}";
               break;
            case RoomSessionErrorMessageEvent.const_208:
               errorMessage = "${room.error.max_soundfurni}";
               break;
            case RoomSessionErrorMessageEvent.const_207:
               errorMessage = "${room.error.max_stickies}";
               break;
            case RoomSessionErrorMessageEvent.const_200:
               errorMessage = "${room.error.kicked}";
               errorTitle = "${generic.alert.title}";
               break;
            case RoomSessionErrorMessageEvent.const_196:
               errorMessage = "${room.error.guide.not.available}";
               break;
            case RoomSessionErrorMessageEvent.const_185:
               errorMessage = "${room.error.guide.already.exists}";
               break;
            case RoomSessionErrorMessageEvent.const_652:
               errorMessage = "${room.error.pets.forbidden_in_hotel}";
               break;
            case RoomSessionErrorMessageEvent.const_658:
               errorMessage = "${room.error.pets.forbidden_in_flat}";
               break;
            case RoomSessionErrorMessageEvent.const_555:
               errorMessage = "${room.error.pets.no_free_tiles}";
               break;
            case RoomSessionErrorMessageEvent.const_511:
               errorMessage = "${room.error.pets.selected_tile_not_free}";
               break;
            default:
               return;
         }
         _windowManager.alert(errorTitle,errorMessage,0,function(param1:IAlertDialog, param2:Event):void
         {
            param1.dispose();
         });
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _windowManager = param2 as IHabboWindowManager;
      }
      
      public function getActiveCanvasId(param1:int, param2:int) : int
      {
         return 1;
      }
      
      private function initializeRoomEngineEvents() : void
      {
         if(_roomEngine != null && false)
         {
            _roomEngine.events.addEventListener(RoomEngineEvent.ROOM_ENGINE_INITIALIZED,roomEngineEventHandler);
            _roomEngine.events.addEventListener(RoomEngineEvent.const_606,roomEventHandler);
            _roomEngine.events.addEventListener(RoomEngineEvent.const_647,roomEventHandler);
            _roomEngine.events.addEventListener(RoomEngineDimmerStateEvent.DIMMER_STATE,roomEventHandler);
            _roomEngine.events.addEventListener(RoomEngineRoomColorEvent.const_623,roomEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_565,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_458,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_267,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_659,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_204,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_574,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_125,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_122,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.ROOM_OBJECT_WIDGET_REQUEST_PRESENT,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_128,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_123,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_109,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_108,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_341,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_435,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_394,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_424,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_86,roomObjectEventHandler);
         }
      }
      
      private function onAvatarRenderManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_1220 = param2 as IAvatarRenderManager;
      }
      
      private function onInventoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_25 = param2 as IHabboInventory;
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_188 = param2 as IHabboToolbar;
      }
      
      private function getRoomIdentifier(param1:int, param2:int) : String
      {
         return "hard_coded_room_id";
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _config = param2 as IHabboConfigurationManager;
      }
      
      private function roomObjectEventHandler(param1:RoomEngineObjectEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(_roomEngine == null)
         {
            return;
         }
         var _loc2_:String = getRoomIdentifier(param1.roomId,param1.roomCategory);
         var _loc3_:RoomDesktop = getDesktop(_loc2_) as RoomDesktop;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.roomObjectEventHandler(param1);
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_34 = param2 as IRoomSessionManager;
         registerSessionEvents();
         if(var_34 != null && _roomEngine != null && false)
         {
            var_34.roomEngineReady = true;
         }
      }
      
      private function registerSessionEvents() : void
      {
         if(var_34)
         {
            var_34.events.addEventListener(RoomSessionEvent.const_316,roomSessionStateEventHandler);
            var_34.events.addEventListener(RoomSessionEvent.const_89,roomSessionStateEventHandler);
            var_34.events.addEventListener(RoomSessionEvent.const_99,roomSessionStateEventHandler);
            var_34.events.addEventListener(RoomSessionChatEvent.const_145,roomSessionEventHandler);
            var_34.events.addEventListener(RoomSessionUserBadgesEvent.const_121,roomSessionEventHandler);
            var_34.events.addEventListener(RoomSessionDoorbellEvent.const_102,roomSessionEventHandler);
            var_34.events.addEventListener(RoomSessionDoorbellEvent.const_114,roomSessionEventHandler);
            var_34.events.addEventListener(RoomSessionDoorbellEvent.const_116,roomSessionEventHandler);
            var_34.events.addEventListener(RoomSessionPresentEvent.const_254,roomSessionEventHandler);
            var_34.events.addEventListener(RoomSessionErrorMessageEvent.const_195,roomSessionDialogEventHandler);
            var_34.events.addEventListener(RoomSessionErrorMessageEvent.const_202,roomSessionDialogEventHandler);
            var_34.events.addEventListener(RoomSessionErrorMessageEvent.const_685,roomSessionDialogEventHandler);
            var_34.events.addEventListener(RoomSessionErrorMessageEvent.const_989,roomSessionDialogEventHandler);
            var_34.events.addEventListener(RoomSessionErrorMessageEvent.const_834,roomSessionDialogEventHandler);
            var_34.events.addEventListener(RoomSessionErrorMessageEvent.const_190,roomSessionDialogEventHandler);
            var_34.events.addEventListener(RoomSessionErrorMessageEvent.const_205,roomSessionDialogEventHandler);
            var_34.events.addEventListener(RoomSessionErrorMessageEvent.const_208,roomSessionDialogEventHandler);
            var_34.events.addEventListener(RoomSessionErrorMessageEvent.const_207,roomSessionDialogEventHandler);
            var_34.events.addEventListener(RoomSessionErrorMessageEvent.const_200,roomSessionDialogEventHandler);
            var_34.events.addEventListener(RoomSessionErrorMessageEvent.const_185,roomSessionDialogEventHandler);
            var_34.events.addEventListener(RoomSessionErrorMessageEvent.const_196,roomSessionDialogEventHandler);
            var_34.events.addEventListener(RoomSessionErrorMessageEvent.const_652,roomSessionDialogEventHandler);
            var_34.events.addEventListener(RoomSessionErrorMessageEvent.const_658,roomSessionDialogEventHandler);
            var_34.events.addEventListener(RoomSessionErrorMessageEvent.const_162,roomSessionDialogEventHandler);
            var_34.events.addEventListener(RoomSessionErrorMessageEvent.const_555,roomSessionDialogEventHandler);
            var_34.events.addEventListener(RoomSessionErrorMessageEvent.const_511,roomSessionDialogEventHandler);
            var_34.events.addEventListener(RoomSessionQueueEvent.const_392,roomSessionEventHandler);
            var_34.events.addEventListener(RoomSessionVoteEvent.const_120,roomSessionEventHandler);
            var_34.events.addEventListener(RoomSessionVoteEvent.const_113,roomSessionEventHandler);
            var_34.events.addEventListener(RoomSessionPollEvent.const_127,roomSessionEventHandler);
            var_34.events.addEventListener(RoomSessionPollEvent.const_60,roomSessionEventHandler);
            var_34.events.addEventListener(RoomSessionPollEvent.const_119,roomSessionEventHandler);
            var_34.events.addEventListener(RoomSessionDimmerPresetsEvent.const_366,roomSessionEventHandler);
         }
      }
      
      private function roomEngineEventHandler(param1:RoomEngineEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.type == RoomEngineEvent.ROOM_ENGINE_INITIALIZED)
         {
            if(var_34 != null)
            {
               var_34.roomEngineReady = true;
            }
         }
      }
      
      private function onAvatarEditorReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_1671 = param2 as IHabboAvatarEditor;
      }
   }
}
