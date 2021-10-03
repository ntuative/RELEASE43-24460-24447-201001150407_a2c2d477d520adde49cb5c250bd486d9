package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarActionUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetCreditBalanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFrameUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetWaveUpdateEvent;
   import com.sulake.habbo.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class MeMenuWidget extends RoomWidgetBase
   {
      
      public static const const_720:String = "me_menu_settings_view";
      
      private static const const_741:int = 10;
      
      public static const const_515:String = "me_menu_effects_view";
      
      public static const const_115:String = "me_menu_top_view";
      
      public static const const_1183:String = "me_menu_rooms_view";
      
      public static const const_832:String = "me_menu_dance_moves_view";
      
      public static const const_239:String = "me_menu_my_clothes_view";
       
      
      private var var_1694:Boolean = false;
      
      private var _isAnimating:Boolean = false;
      
      private var _eventDispatcher:IEventDispatcher;
      
      private var var_1352:int = 0;
      
      private var var_1697:int = 0;
      
      private var var_1699:Boolean = false;
      
      private var var_250:Boolean = false;
      
      private var var_1696:int = 0;
      
      private var var_1695:Number = 0;
      
      private var _mainContainer:IWindowContainer;
      
      private var var_515:Boolean = false;
      
      private var var_98:ClubPromoView;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_1097:int = 0;
      
      private var var_1698:Boolean = false;
      
      private var var_901:Point;
      
      private var var_42:IMeMenuView;
      
      public function MeMenuWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IEventDispatcher, param5:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         _config = param5;
         var_901 = new Point(0,0);
         _eventDispatcher = param4;
         if(param5 != null && false)
         {
            var_1698 = param5.getKey("client.news.embed.enabled","com.sulake.habbo.inventory.recycler") == "true";
         }
         changeView(const_115);
         hide();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetWaveUpdateEvent.const_690,onWaveEvent);
         param1.addEventListener(RoomWidgetDanceUpdateEvent.const_496,onDanceEvent);
         param1.addEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_566,onUpdateEffects);
         param1.addEventListener(RoomWidgetToolbarClickedUpdateEvent.const_624,onToolbarClicked);
         param1.addEventListener(RoomWidgetFrameUpdateEvent.const_283,onUpdate);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_723,onAvatarEditorClosed);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_461,onShowAvatarEditorClubPromo);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_838,onHideAvatarEditorClubPromo);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_214,onAvatarDeselected);
         param1.addEventListener(RoomWidgetHabboClubUpdateEvent.const_189,onHabboClubEvent);
         param1.addEventListener(RoomWidgetAvatarActionUpdateEvent.const_531,onAvatarActionEvent);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_217,onUserInfo);
         param1.addEventListener(RoomWidgetSettingsUpdateEvent.const_318,onSettingsUpdate);
         param1.addEventListener(RoomWidgetTutorialEvent.const_94,onTutorialEvent);
         param1.addEventListener(RoomWidgetTutorialEvent.const_440,onTutorialEvent);
         param1.addEventListener(RoomWidgetCreditBalanceUpdateEvent.const_168,onCreditBalance);
         super.registerUpdateEvents(param1);
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         if(!_isAnimating)
         {
            return;
         }
      }
      
      override public function get mainWindow() : IWindow
      {
         return _mainContainer;
      }
      
      public function get hasEffectOn() : Boolean
      {
         return var_515;
      }
      
      private function onSettingsUpdate(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         if(!var_250)
         {
            return;
         }
         if(var_42.window.name == const_720)
         {
            (var_42 as MeMenuSettingsView).updateSettings(param1);
         }
      }
      
      public function get isHabboClubActive() : Boolean
      {
         return var_1097 > 0;
      }
      
      private function onWaveEvent(param1:RoomWidgetWaveUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Wave Event received");
      }
      
      private function onCreditBalance(param1:RoomWidgetCreditBalanceUpdateEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var_1352 = param1.balance;
         localizations.registerParameter("widget.memenu.credits","credits",var_1352.toString());
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(!(var_250 && var_42.window.name == const_239))
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_705);
            if(messageListener != null)
            {
               messageListener.processWidgetMessage(_loc2_);
            }
         }
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetWaveUpdateEvent.const_690,onWaveEvent);
         param1.removeEventListener(RoomWidgetDanceUpdateEvent.const_496,onDanceEvent);
         param1.removeEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_566,onUpdateEffects);
         param1.removeEventListener(RoomWidgetToolbarClickedUpdateEvent.const_624,onToolbarClicked);
         param1.removeEventListener(RoomWidgetFrameUpdateEvent.const_283,onUpdate);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_214,onAvatarDeselected);
         param1.removeEventListener(RoomWidgetHabboClubUpdateEvent.const_189,onHabboClubEvent);
         param1.removeEventListener(RoomWidgetAvatarActionUpdateEvent.const_531,onAvatarActionEvent);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_723,onAvatarEditorClosed);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_461,onShowAvatarEditorClubPromo);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_838,onHideAvatarEditorClubPromo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_217,onUserInfo);
         param1.removeEventListener(RoomWidgetSettingsUpdateEvent.const_318,onSettingsUpdate);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_440,onTutorialEvent);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_94,onTutorialEvent);
         param1.removeEventListener(RoomWidgetCreditBalanceUpdateEvent.const_168,onCreditBalance);
      }
      
      override public function dispose() : void
      {
         hide();
         _eventDispatcher = null;
         if(var_42 != null)
         {
            var_42.dispose();
            var_42 = null;
         }
         super.dispose();
      }
      
      public function get allowHabboClubDances() : Boolean
      {
         return var_1694;
      }
      
      public function changeToOutfit(param1:int) : void
      {
         var_1695 = new Date().valueOf();
         this.messageListener.processWidgetMessage(new RoomWidgetSelectOutfitMessage(param1));
      }
      
      private function onHideAvatarEditorClubPromo(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_98 != null)
         {
            var_98.dispose();
            var_98 = null;
         }
         updateSize();
      }
      
      public function get isDancing() : Boolean
      {
         return var_1699;
      }
      
      public function get creditBalance() : int
      {
         return var_1352;
      }
      
      private function onTutorialEvent(param1:RoomWidgetTutorialEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetTutorialEvent.const_440:
               Logger.log("* MeMenuWidget: onHighlightClothesIcon " + var_250 + " view: " + var_42.window.name);
               if(var_250 != true || var_42.window.name != const_115)
               {
                  return;
               }
               (var_42 as MeMenuMainView).setIconAssets("clothes_icon",const_115,"clothes_highlighter_blue");
               break;
            case RoomWidgetTutorialEvent.const_94:
               hide();
         }
      }
      
      public function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = new Date().valueOf();
         return _loc1_ - var_1695 > 5000;
      }
      
      public function get habboClubPeriods() : int
      {
         return var_1697;
      }
      
      private function onAvatarActionEvent(param1:RoomWidgetAvatarActionUpdateEvent) : void
      {
         switch(param1.actionType)
         {
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_ACTIVE:
               var_515 = true;
               break;
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_INACTIVE:
               var_515 = false;
               break;
            default:
               trace("MeMenuWidget: unknown avatar action event: " + param1.actionType);
         }
      }
      
      private function onHabboClubEvent(param1:RoomWidgetHabboClubUpdateEvent) : void
      {
         var _loc2_:* = var_1097 > 0;
         var_1097 = param1.daysLeft;
         var_1697 = param1.periodsLeft;
         var_1696 = param1.pastPeriods;
         var_1694 = param1.allowClubDances;
         if(_loc2_ != param1.daysLeft > 0)
         {
            if(var_42 != null)
            {
               changeView(var_42.window.name);
            }
         }
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         var_1699 = param1;
      }
      
      private function onAvatarDeselected(param1:Event) : void
      {
         if(var_42 != null && var_42.window.name != const_239)
         {
            hide();
         }
      }
      
      private function onShowAvatarEditorClubPromo(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(var_42 != null && var_42.window.name == const_239)
         {
            if(param1.promoMode == RoomWidgetAvatarEditorUpdateEvent.const_997)
            {
               var_98 = new ClubPromoView(this,param1.promoImageUrl,ClubPromoView.const_1368);
            }
            else
            {
               var_98 = new ClubPromoView(this,param1.promoImageUrl,ClubPromoView.const_407);
            }
            _loc2_ = _mainContainer.getChildByName(var_42.window.name);
            if(_loc2_ != null)
            {
               var_98.window.x = _loc2_.width + const_741;
               _mainContainer.addChild(var_98.window);
               _mainContainer.width = var_98.window.x + var_98.window.width;
            }
         }
      }
      
      private function onUpdateEffects(param1:RoomWidgetUpdateEffectsUpdateEvent) : void
      {
         var _loc2_:* = null;
         var_515 = false;
         for each(_loc2_ in param1.effects)
         {
            if(_loc2_.isInUse)
            {
               var_515 = true;
            }
         }
         if(var_42 != null && var_42.window.name == const_515)
         {
            (var_42 as MeMenuEffectsView).updateEffects(param1.effects);
         }
      }
      
      public function get habboClubPastPeriods() : int
      {
         return var_1696;
      }
      
      public function get habboClubDays() : int
      {
         return var_1097;
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(_mainContainer == null)
         {
            _mainContainer = windowManager.createWindow("me_menu_main_container","",HabboWindowType.const_1226,HabboWindowStyle.const_787,HabboWindowParam.const_40,new Rectangle(0,0,170,260)) as IWindowContainer;
            _mainContainer.tags.push("room_widget_me_menu");
         }
         return _mainContainer;
      }
      
      private function onToolbarClicked(param1:RoomWidgetToolbarClickedUpdateEvent) : void
      {
         switch(param1.iconType)
         {
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU:
               var_250 = !var_250;
               break;
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO:
               var_250 = false;
               break;
            default:
               return;
         }
         if(var_250)
         {
            show();
         }
         else
         {
            hide();
         }
      }
      
      private function onDanceEvent(param1:RoomWidgetDanceUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Dance Event received, style: " + param1.style);
      }
      
      public function hide(param1:RoomWidgetRoomObjectUpdateEvent = null) : void
      {
         var _loc2_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_497);
         _loc2_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc2_);
         }
         if(var_42 != null)
         {
            _mainContainer.removeChild(var_42.window);
            var_42.dispose();
            var_42 = null;
         }
         var_250 = false;
         _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE));
      }
      
      private function onAvatarEditorClosed(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_42 != null && var_42.window.name == const_239)
         {
            if(var_98 != null)
            {
               var_98.dispose();
               var_98 = null;
            }
            changeView(const_115);
         }
      }
      
      public function get isNewsEnabled() : Boolean
      {
         return var_1698;
      }
      
      public function changeView(param1:String) : void
      {
         var _loc2_:* = null;
         if(var_98 != null)
         {
            var_98.dispose();
            var_98 = null;
         }
         switch(param1)
         {
            case const_115:
               _loc2_ = new MeMenuMainView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT));
               break;
            case const_515:
               _loc2_ = new MeMenuEffectsView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS));
               break;
            case const_832:
               _loc2_ = new MeMenuDanceView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE));
               break;
            case const_239:
               _loc2_ = new MeMenuClothesView();
               break;
            case const_1183:
               _loc2_ = new MeMenuRoomsView();
               break;
            case const_720:
               _loc2_ = new MeMenuSettingsView();
               break;
            default:
               Logger.log("Me Menu Change view: unknown view: " + param1);
         }
         if(_loc2_ != null)
         {
            if(var_42 != null)
            {
               _mainContainer.removeChild(var_42.window);
               var_42.dispose();
               var_42 = null;
            }
            var_42 = _loc2_;
            var_42.init(this,param1);
         }
         updateSize();
      }
      
      public function updateSize() : void
      {
         if(var_42 != null)
         {
            var_901.x = var_42.window.width + 10;
            var_901.y = var_42.window.height;
            var_42.window.x = 5;
            var_42.window.y = 0;
            _mainContainer.width = var_901.x;
            _mainContainer.height = var_901.y;
            if(var_98 != null)
            {
               _mainContainer.width = var_98.window.x + var_98.window.width + const_741;
            }
         }
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return _config;
      }
      
      private function show() : void
      {
         changeView(const_115);
         var _loc1_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_657);
         _loc1_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
         var_250 = true;
      }
   }
}
