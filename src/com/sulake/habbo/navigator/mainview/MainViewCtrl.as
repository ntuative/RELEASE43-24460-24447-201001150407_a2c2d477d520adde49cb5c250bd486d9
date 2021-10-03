package com.sulake.habbo.navigator.mainview
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.ICoreUpdateReceiver;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ITabButtonWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.navigator.GetOfficialRoomsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.GetPopularRoomTagsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.LatestEventsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyFavouriteRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyFriendsRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyRoomHistorySearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.PopularRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomTagSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomTextSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomsWhereMyFriendsAreSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomsWithHighestScoreSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.session.QuitMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.IViewCtrl;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.domain.Tab;
   import com.sulake.habbo.navigator.domain.Tabs;
   import com.sulake.habbo.navigator.events.HabboNavigatorTrackingEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class MainViewCtrl implements ICoreUpdateReceiver
   {
      
      public static const const_627:int = 2;
      
      public static const const_877:int = 4;
      
      private static const const_485:int = 2;
      
      private static const const_763:int = 1;
      
      public static const const_1524:int = 3;
      
      private static const const_1089:int = 4;
      
      private static const const_480:int = 22;
      
      public static const const_417:int = 1;
      
      private static const const_764:int = 3;
       
      
      private var var_2030:int = 0;
      
      private var var_1237:IRegionWindow;
      
      private var var_408:int;
      
      private var var_1239:Boolean = true;
      
      private var var_1475:GuestRoomListCtrl;
      
      private var var_28:IFrameWindow;
      
      private var var_472:Timer;
      
      private var var_269:IWindowContainer;
      
      private var var_203:IWindowContainer;
      
      private var var_230:IWindowContainer;
      
      private var var_12:IWindow;
      
      private var var_1240:Boolean;
      
      private var var_2029:OfficialRoomListCtrl;
      
      private var var_35:IWindowContainer;
      
      private var var_1474:PopularTagsListCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_1238:int = 0;
      
      private var var_216:ITabContextWindow;
      
      public function MainViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_1474 = new PopularTagsListCtrl(_navigator);
         var_1475 = new GuestRoomListCtrl(_navigator);
         var_2029 = new OfficialRoomListCtrl(_navigator);
         var_472 = new Timer(300,1);
         var_472.addEventListener(TimerEvent.TIMER,onResizeTimer);
      }
      
      private function getSearchMsg(param1:int, param2:String) : IMessageComposer
      {
         if(param1 == Tabs.const_655)
         {
            return new MyFavouriteRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_713)
         {
            return new MyFriendsRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_613)
         {
            return new MyRoomHistorySearchMessageComposer();
         }
         if(param1 == Tabs.const_209)
         {
            return new MyRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_284)
         {
            return new PopularRoomsSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_698)
         {
            return new RoomsWhereMyFriendsAreSearchMessageComposer();
         }
         if(param1 == Tabs.const_635)
         {
            return new RoomsWithHighestScoreSearchMessageComposer();
         }
         if(param1 == Tabs.const_280)
         {
            return new RoomTagSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_218)
         {
            return new RoomTextSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_406)
         {
            return new LatestEventsSearchMessageComposer(param2);
         }
         Logger.log("No message for searchType: " + param1);
         return null;
      }
      
      private function prepare() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var_28 = IFrameWindow(_navigator.getXmlWindow("grs_main_window"));
         var_216 = ITabContextWindow(var_28.findChildByName("tab_context"));
         var_35 = IWindowContainer(var_28.findChildByName("tab_content"));
         var_230 = IWindowContainer(var_28.findChildByName("custom_content"));
         var_203 = IWindowContainer(var_28.findChildByName("list_content"));
         var_269 = IWindowContainer(var_28.findChildByName("custom_footer"));
         var_12 = var_28.findChildByName("loading_text");
         var _loc1_:IWindow = var_28.findChildByTag("close");
         _loc1_.procedure = onWindowClose;
         var_1237 = IRegionWindow(var_28.findChildByName("to_hotel_view"));
         var_1237.procedure = onHotelView;
         refreshToHotelViewButton(false);
         var_28.procedure = onWindow;
         for each(_loc2_ in _navigator.tabs.tabs)
         {
            _loc3_ = var_216.getTabItemByID(_loc2_.id);
            _loc3_.setParamFlag(HabboWindowParam.const_38,true);
            _loc3_.procedure = onTabClick;
            _loc2_.button = _loc3_;
         }
         var_28.scaler.setParamFlag(HabboWindowParam.const_578,false);
         var_28.scaler.setParamFlag(HabboWindowParam.const_1336,true);
      }
      
      public function get mainWindow() : IFrameWindow
      {
         return var_28;
      }
      
      private function onTabClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_56)
         {
            return;
         }
         var _loc3_:int = param2.id;
         if(var_1240)
         {
            var_1240 = false;
            return;
         }
         var _loc4_:Tab = _navigator.tabs.getTab(_loc3_);
         _loc4_.sendSearchRequest();
         switch(_loc4_.id)
         {
            case Tabs.const_297:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_EVENTS));
               break;
            case Tabs.const_222:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ME));
               break;
            case Tabs.const_300:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_OFFICIAL));
               break;
            case Tabs.const_265:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ROOMS));
               break;
            case Tabs.const_197:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCH));
         }
      }
      
      private function refreshScrollbar(param1:IViewCtrl) : void
      {
         if(param1.content == null || !param1.content.visible)
         {
            return;
         }
         var _loc2_:IItemListWindow = IItemListWindow(param1.content.findChildByName("item_list"));
         var _loc3_:IWindow = param1.content.findChildByName("scroller");
         var _loc4_:* = _loc2_.scrollableRegion.height > _loc2_.height;
         if(_loc3_.visible)
         {
            if(_loc4_)
            {
               return;
            }
            _loc3_.visible = false;
            _loc2_.width += const_480;
         }
         else
         {
            if(!_loc4_)
            {
               return;
            }
            _loc3_.visible = true;
            _loc2_.width -= const_480;
         }
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Close window");
         this.close();
      }
      
      private function sendTrackingEvent(param1:int) : void
      {
         switch(param1)
         {
            case Tabs.const_406:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_LATEST_EVENTS));
               break;
            case Tabs.const_655:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FAVOURITES));
               break;
            case Tabs.const_713:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FRIENDS_ROOMS));
               break;
            case Tabs.const_613:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_HISTORY));
               break;
            case Tabs.const_209:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_ROOMS));
               break;
            case Tabs.const_625:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_OFFICIALROOMS));
               break;
            case Tabs.const_284:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_POPULAR_ROOMS));
               break;
            case Tabs.const_698:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WHERE_MY_FRIENDS_ARE));
               break;
            case Tabs.const_635:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WITH_HIGHEST_SCORE));
               break;
            case Tabs.const_280:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TAG_SEARCH));
               break;
            case Tabs.const_218:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TEXT_SEARCH));
         }
      }
      
      private function refreshList(param1:Boolean, param2:Boolean, param3:IViewCtrl, param4:String) : void
      {
         var _loc5_:* = null;
         if(!param2)
         {
            return;
         }
         if(param3.content == null)
         {
            _loc5_ = var_203.getChildByName(param4);
            param3.content = IWindowContainer(_loc5_);
         }
         if(param1)
         {
            param3.refresh();
         }
         param3.content.visible = true;
      }
      
      public function method_1() : Boolean
      {
         return var_28 != null && false;
      }
      
      private function refreshListContent(param1:Boolean) : void
      {
         Util.hideChildren(var_203);
         refreshGuestRooms(param1,_navigator.data.guestRoomSearchArrived);
         refreshPopularTags(param1,_navigator.data.popularTagsArrived);
         refreshOfficialRooms(param1,_navigator.data.officialRoomsArrived);
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         refreshScrollbar(var_1474);
         refreshScrollbar(var_1475);
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function stretchNewEntryIfNeeded(param1:IViewCtrl, param2:IWindowContainer) : void
      {
         var _loc3_:IWindow = param1.content.findChildByName("scroller");
         if(_loc3_.visible)
         {
            return;
         }
         param2.width += const_480;
      }
      
      public function startSearch(param1:int, param2:int, param3:String = "-1", param4:int = 1) : void
      {
         var _loc5_:Tab = _navigator.tabs.getSelected();
         _navigator.tabs.setSelectedTab(param1);
         var _loc6_:Tab = _navigator.tabs.getSelected();
         ErrorReportStorage.addDebugData("StartSearch","Start search " + _loc5_.id + " => " + _loc6_.id);
         this.var_1239 = _loc5_ != _loc6_;
         if(_loc5_ != _loc6_)
         {
            _loc6_.tabPageDecorator.tabSelected();
         }
         _navigator.data.startLoading();
         if(param4 == const_417)
         {
            _navigator.send(getSearchMsg(param2,param3));
         }
         else if(param4 == const_627)
         {
            _navigator.send(new GetPopularRoomTagsMessageComposer());
         }
         else
         {
            _navigator.send(new GetOfficialRoomsMessageComposer());
         }
         if(!method_1())
         {
            open();
            this.var_408 = const_485;
            this.var_203.blend = 0;
            if(this.var_230.visible)
            {
               this.var_230.blend = 0;
               this.var_269.blend = 0;
            }
         }
         else
         {
            this.var_408 = const_763;
         }
         this.var_1238 = 0;
         _navigator.registerUpdateReceiver(this,2);
         sendTrackingEvent(param2);
      }
      
      private function refreshCustomContent() : void
      {
         Util.hideChildren(var_230);
         var _loc1_:Tab = _navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.refreshCustomContent(var_230);
         if(Util.hasVisibleChildren(var_230))
         {
            var_230.visible = true;
         }
         else
         {
            var_230.visible = false;
            var_230.blend = 1;
         }
      }
      
      public function dispose() : void
      {
      }
      
      private function onWindow(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_43 || param2 != var_28)
         {
            return;
         }
         if(!this.var_472.running)
         {
            this.var_472.reset();
            this.var_472.start();
         }
      }
      
      private function refreshOfficialRooms(param1:Boolean, param2:Boolean) : void
      {
         refreshList(param1,param2,var_2029,"official_rooms");
      }
      
      private function refreshPopularTags(param1:Boolean, param2:Boolean) : void
      {
         refreshList(param1,param2,var_1474,"popular_tags");
      }
      
      private function refreshGuestRooms(param1:Boolean, param2:Boolean) : void
      {
         refreshList(param1,param2,var_1475,"guest_rooms");
      }
      
      private function refreshTab() : void
      {
         var _loc1_:Tab = _navigator.tabs.getSelected();
         var _loc2_:ISelectableWindow = var_216.selector.getSelected();
         if(_loc1_.button != _loc2_)
         {
            var_1240 = true;
            var_216.selector.setSelected(_loc1_.button);
         }
      }
      
      public function onNavigatorToolBarIconClick() : Boolean
      {
         if(method_1())
         {
            close();
            return false;
         }
         var _loc1_:Tab = _navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.navigatorOpenedWhileInTab();
         return true;
      }
      
      public function open() : void
      {
         var _loc1_:Boolean = false;
         if(this.var_28 == null)
         {
            prepare();
            _loc1_ = true;
         }
         refresh();
         var_28.visible = true;
         var_28.activate();
         if(_loc1_)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_44,HabboToolbarIconEnum.NAVIGATOR,var_28));
         }
      }
      
      private function refreshFooter() : void
      {
         Util.hideChildren(var_269);
         var _loc1_:Tab = _navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.refreshFooter(var_269);
         if(Util.hasVisibleChildren(var_269))
         {
            var_269.visible = true;
         }
         else
         {
            var_269.visible = false;
         }
      }
      
      public function reloadRoomList(param1:int) : Boolean
      {
         ErrorReportStorage.addDebugData("MainViewCtrl","Reloading RoomList");
         if(this.method_1() && this._navigator.data.guestRoomSearchResults != null && this._navigator.data.guestRoomSearchResults.searchType == param1)
         {
            startSearch(_navigator.tabs.getSelected().id,param1,"");
            return true;
         }
         return false;
      }
      
      private function onHotelView(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            refreshToHotelViewButton(true);
         }
         else if(param1.type == WindowMouseEvent.const_28)
         {
            refreshToHotelViewButton(false);
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            _navigator.send(new QuitMessageComposer());
         }
      }
      
      public function refresh() : void
      {
         if(var_28 == null)
         {
            return;
         }
         refreshTab();
         refreshCustomContent();
         refreshListContent(true);
         refreshFooter();
         var_230.height = Util.getLowestPoint(var_230);
         var_269.height = Util.getLowestPoint(var_269);
         var _loc1_:int = 0;
         Util.moveChildrenToColumn(var_35,["custom_content","list_content"],var_230.y,8);
         var_203.height = var_203.height + _loc1_ - 0 - 0 + var_2030;
         Util.moveChildrenToColumn(var_35,["list_content","custom_footer"],var_203.y,8);
         var_2030 = var_269.height;
         onResizeTimer(null);
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:Number = NaN;
         if(this.var_203 == null)
         {
            return;
         }
         var _loc2_:Number = param1 / 150;
         if(var_408 == const_763)
         {
            _loc3_ = Math.min(1,Math.max(0,this.var_203.blend - _loc2_));
            this.var_203.blend = _loc3_;
            this.var_230.blend = !!var_1239 ? Number(_loc3_) : Number(1);
            this.var_269.blend = !!var_1239 ? Number(_loc3_) : Number(1);
            if(_loc3_ == 0)
            {
               var_408 = const_485;
            }
         }
         else if(var_408 == const_485)
         {
            if(var_1238 % 10 == 1)
            {
               var_12.visible = true;
            }
            ++var_1238;
            if(!_navigator.data.isLoading())
            {
               var_408 = const_764;
            }
         }
         else if(var_408 == const_764)
         {
            this.refresh();
            var_408 = const_1089;
         }
         else
         {
            var_12.visible = false;
            _loc3_ = Math.min(1,Math.max(0,this.var_203.blend + _loc2_));
            this.var_203.blend = _loc3_;
            this.var_230.blend = !!var_1239 ? Number(_loc3_) : Number(1);
            this.var_269.blend = !!var_1239 ? Number(_loc3_) : Number(1);
            if(false)
            {
               _navigator.removeUpdateReceiver(this);
            }
         }
      }
      
      private function refreshToHotelViewButton(param1:Boolean) : void
      {
         _navigator.refreshButton(var_1237,"icon_hotelview",!param1,null,0);
         _navigator.refreshButton(var_1237,"icon_hotelview_reactive",param1,null,0);
      }
      
      public function close() : void
      {
         if(var_28 != null)
         {
            var_28.visible = false;
         }
      }
   }
}
