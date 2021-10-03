package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_617:IWindowContainer;
      
      private var var_909:ITextWindow;
      
      private var var_190:RoomSettingsCtrl;
      
      private var var_1114:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var var_441:Timer;
      
      private var var_1116:ITextWindow;
      
      private var var_325:IWindowContainer;
      
      private var var_1722:IWindowContainer;
      
      private var var_1723:ITextWindow;
      
      private var var_735:IWindowContainer;
      
      private var var_1367:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_656:ITextWindow;
      
      private var var_1366:IWindowContainer;
      
      private var var_1115:IWindowContainer;
      
      private var var_737:ITextWindow;
      
      private var var_907:ITextFieldWindow;
      
      private var var_287:IWindowContainer;
      
      private var var_736:ITextWindow;
      
      private var var_1365:IButtonWindow;
      
      private var var_908:ITextWindow;
      
      private var var_2215:int;
      
      private var var_1111:IContainerButtonWindow;
      
      private var var_738:IWindowContainer;
      
      private var var_1110:ITextWindow;
      
      private var var_1113:IContainerButtonWindow;
      
      private var var_1368:ITextWindow;
      
      private var var_1369:IButtonWindow;
      
      private var var_1006:TagRenderer;
      
      private var var_1720:ITextWindow;
      
      private var var_326:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_616:ITextWindow;
      
      private var var_253:RoomThumbnailCtrl;
      
      private var var_1112:IContainerButtonWindow;
      
      private var var_1721:IWindowContainer;
      
      private var var_254:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_326 = new RoomEventViewCtrl(_navigator);
         var_190 = new RoomSettingsCtrl(_navigator,this,true);
         var_253 = new RoomThumbnailCtrl(_navigator);
         var_1006 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_190);
         var_441 = new Timer(6000,1);
         var_441.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_190.active = true;
         this.var_326.active = false;
         this.var_253.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1367.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1369.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1366.visible = Util.hasVisibleChildren(var_1366);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_656.text = param1.roomName;
         var_656.height = NaN;
         _ownerName.text = param1.ownerName;
         var_737.text = param1.description;
         var_1006.refreshTags(var_325,param1.tags);
         var_737.visible = false;
         if(param1.description != "")
         {
            var_737.height = NaN;
            var_737.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_325,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_325,"thumb_down",_loc3_,onThumbDown,0);
         var_1723.visible = _loc3_;
         var_736.visible = !_loc3_;
         var_1368.visible = !_loc3_;
         var_1368.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_325,"home",param2,null,0);
         _navigator.refreshButton(var_325,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(var_325,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_656.y,0);
         var_325.visible = true;
         var_325.height = Util.getLowestPoint(var_325);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_430,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(0,_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false)
         {
            return;
         }
         var_1365.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1114.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1112.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1111.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1113.visible = _navigator.data.canEditRoomSettings && param1;
         var_1115.visible = Util.hasVisibleChildren(var_1115);
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_441.reset();
         this.var_326.active = false;
         this.var_190.active = false;
         this.var_253.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_44,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this.var_441.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_441.reset();
         this.var_326.active = false;
         this.var_190.active = false;
         this.var_253.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_44,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_430,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_287);
         var_287.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _navigator.data.settings != null && _loc1_ != null && _loc1_.flatId == _navigator.data.settings.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         refreshPublicSpaceDetails(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_190.refresh(var_287);
         this.var_253.refresh(var_287);
         Util.moveChildrenToColumn(var_287,["room_details","room_buttons"],0,2);
         var_287.height = Util.getLowestPoint(var_287);
         var_287.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_907.setSelection(0,var_907.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_254);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_326.refresh(var_254);
         if(Util.hasVisibleChildren(var_254) && !this.var_253.active)
         {
            Util.moveChildrenToColumn(var_254,["event_details","event_buttons"],0,2);
            var_254.height = Util.getLowestPoint(var_254);
            var_254.visible = true;
         }
         else
         {
            var_254.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this.var_441.reset();
         this.var_326.active = true;
         this.var_190.active = false;
         this.var_253.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(0,_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         var_441.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_909.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_909.height = NaN;
         var_1116.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1116.height = NaN;
         Util.moveChildrenToColumn(var_617,["public_space_name","public_space_desc"],var_909.y,0);
         var_617.visible = true;
         var_617.height = Math.max(86,Util.getLowestPoint(var_617));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","com.sulake.habbo.inventory.recycler") == "true";
         if(_loc1_ && true && true && true)
         {
            var_738.visible = true;
            var_907.text = this.getEmbedData();
         }
         else
         {
            var_738.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_441.reset();
         this.var_190.load(param1);
         this.var_190.active = true;
         this.var_326.active = false;
         this.var_253.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_441.reset();
         this.var_190.active = false;
         this.var_326.active = false;
         this.var_253.active = true;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_64,false);
         _window.setParamFlag(HabboWindowParam.const_1328,true);
         var_287 = IWindowContainer(find("room_info"));
         var_325 = IWindowContainer(find("room_details"));
         var_617 = IWindowContainer(find("public_space_details"));
         var_1721 = IWindowContainer(find("owner_name_cont"));
         var_1722 = IWindowContainer(find("rating_cont"));
         var_1115 = IWindowContainer(find("room_buttons"));
         var_656 = ITextWindow(find("room_name"));
         var_909 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_737 = ITextWindow(find("room_desc"));
         var_1116 = ITextWindow(find("public_space_desc"));
         var_908 = ITextWindow(find("owner_caption"));
         var_736 = ITextWindow(find("rating_caption"));
         var_1723 = ITextWindow(find("rate_caption"));
         var_1368 = ITextWindow(find("rating_txt"));
         var_254 = IWindowContainer(find("event_info"));
         var_735 = IWindowContainer(find("event_details"));
         var_1366 = IWindowContainer(find("event_buttons"));
         var_1720 = ITextWindow(find("event_name"));
         var_616 = ITextWindow(find("event_desc"));
         var_1114 = IContainerButtonWindow(find("add_favourite_button"));
         var_1112 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1111 = IContainerButtonWindow(find("make_home_button"));
         var_1113 = IContainerButtonWindow(find("unmake_home_button"));
         var_1365 = IButtonWindow(find("room_settings_button"));
         var_1367 = IButtonWindow(find("create_event_button"));
         var_1369 = IButtonWindow(find("edit_event_button"));
         var_738 = IWindowContainer(find("embed_info"));
         var_1110 = ITextWindow(find("embed_info_txt"));
         var_907 = ITextFieldWindow(find("embed_src_txt"));
         Util.setProcDirectly(var_1114,onAddFavouriteClick);
         Util.setProcDirectly(var_1112,onRemoveFavouriteClick);
         Util.setProcDirectly(var_1365,onRoomSettingsClick);
         Util.setProcDirectly(var_1111,onMakeHomeClick);
         Util.setProcDirectly(var_1113,onUnmakeHomeClick);
         Util.setProcDirectly(var_1367,onEventSettingsClick);
         Util.setProcDirectly(var_1369,onEventSettingsClick);
         Util.setProcDirectly(var_907,onEmbedSrcClick);
         _navigator.refreshButton(var_1114,"favourite",true,null,0);
         _navigator.refreshButton(var_1112,"favourite",true,null,0);
         _navigator.refreshButton(var_1111,"home",true,null,0);
         _navigator.refreshButton(var_1113,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.setProcDirectly(var_287,onHover);
         Util.setProcDirectly(var_254,onHover);
         var_908.width = var_908.textWidth;
         Util.moveChildrenToRow(var_1721,["owner_caption","owner_name"],var_908.x,var_908.y,3);
         var_736.width = var_736.textWidth;
         Util.moveChildrenToRow(var_1722,["rating_caption","rating_txt"],var_736.x,var_736.y,3);
         var_1110.height = NaN;
         Util.moveChildrenToColumn(var_738,["embed_info_txt","embed_src_txt"],var_1110.y,2);
         var_738.height = Util.getLowestPoint(var_738) + 5;
         var_2215 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_1720.text = param1.eventName;
         var_616.text = param1.eventDescription;
         var_1006.refreshTags(var_735,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_616.visible = false;
         if(param1.eventDescription != "")
         {
            var_616.height = NaN;
            var_616.y = Util.getLowestPoint(var_735) + 2;
            var_616.visible = true;
         }
         var_735.visible = true;
         var_735.height = Util.getLowestPoint(var_735);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.getLowestPoint(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_1004,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
