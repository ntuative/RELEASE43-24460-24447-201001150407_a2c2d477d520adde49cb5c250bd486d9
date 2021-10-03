package com.sulake.habbo.widget.roomchat
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.ICoreUpdateReceiver;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetChatUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomViewUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetChatSelectAvatarMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class RoomChatWidget extends RoomWidgetBase implements ICoreUpdateReceiver
   {
      
      private static const const_775:int = 10;
      
      private static const const_491:int = 25;
      
      private static const const_1122:int = 6000;
      
      private static const const_1120:int = 9;
      
      private static const const_776:int = 4000;
      
      private static const const_1121:int = 3;
      
      private static const const_93:int = 18;
      
      private static const const_1049:int = 25;
      
      private static const const_1119:int = 1;
      
      private static const const_273:int = 9;
      
      private static const const_489:int = 8;
      
      private static const const_340:int = 0;
      
      private static const const_490:int = (const_489 + const_340) * const_93 + const_93;
       
      
      private var var_862:Number = 1;
      
      private var _disposed:Boolean = false;
      
      private var var_575:int = 18;
      
      private var var_353:IItemListWindow;
      
      private var var_699:int = 0;
      
      private var var_44:IWindowContainer;
      
      private var _isAnimating:Boolean = false;
      
      private var var_163:int;
      
      private var var_2138:int = 0;
      
      private var var_1280:Boolean = false;
      
      private var var_147:IWindowContainer;
      
      private var _itemList:Array;
      
      private var var_38:RoomChatHistoryViewer;
      
      private var var_2139:int = 150;
      
      private var var_492:Number = 1;
      
      private var var_71:Array;
      
      private var var_239:Array;
      
      private var var_697:int = 0;
      
      private var var_2140:int;
      
      private var var_698:Point;
      
      private var var_1515:Number = 0;
      
      private var var_43:Component = null;
      
      public function RoomChatWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IHabboConfigurationManager, param5:int, param6:Component)
      {
         _itemList = new Array();
         var_71 = new Array();
         var_239 = new Array();
         var_698 = new Point();
         var_163 = const_490 + const_273;
         super(param1,param2,param3);
         var_2140 = param5;
         var_44 = param1.createWindow("chat_container","",HabboWindowType.const_53,HabboWindowStyle.const_39,HabboWindowParam.const_40,new Rectangle(0,0,200,var_163 + RoomChatHistoryPulldown.const_69),null,0) as IWindowContainer;
         var_44.background = true;
         var_44.color = 33554431;
         var_44.tags.push("room_widget_chat");
         var_353 = param1.createWindow("chat_contentlist","",HabboWindowType.const_953,HabboWindowStyle.const_40,0 | 0,new Rectangle(0,0,200,var_163),null,0) as IItemListWindow;
         var_44.addChild(var_353);
         var_147 = param1.createWindow("chat_active_content","",HabboWindowType.const_53,HabboWindowStyle.const_40,HabboWindowParam.const_64,new Rectangle(0,0,200,var_163),null,0) as IWindowContainer;
         var_353.addListItem(var_147);
         var_38 = new RoomChatHistoryViewer(this,param1,var_44,param2);
         var_2139 = int(param4.getKey("chat.history.item.max.count","150"));
         var _loc7_:Boolean = int(param4.getKey("chat.history.disabled","0")) == 1 ? true : false;
         if(var_38 != null)
         {
            var_38.disabled = _loc7_;
         }
         if(param6 != null)
         {
            var_43 = param6;
            var_43.registerUpdateReceiver(this,1);
         }
      }
      
      public function onPulldownCloseButtonClicked(param1:WindowMouseEvent) : void
      {
         if(var_38 != null)
         {
            var_38.hideHistoryViewer();
         }
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetChatUpdateEvent.const_562,onChatMessage);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_246,onRoomViewUpdate);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_694,onRoomViewUpdate);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_677,onRoomViewUpdate);
         super.registerUpdateEvents(param1);
      }
      
      override public function get mainWindow() : IWindow
      {
         return var_44;
      }
      
      public function onItemMouseOver(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
      }
      
      public function resetArea() : void
      {
         if(var_38 == null)
         {
            return;
         }
         animationStop();
         var_163 = const_490 + const_273;
         var_44.height = var_163 + var_38.pulldownBarHeight;
         var_353.width = 0 - 0;
         var_353.height = var_163;
         var_147.width = 0 - 0;
         if(historyViewerActive())
         {
            var_147.height = getTotalContentHeight() + const_273;
         }
         else
         {
            var_147.height = var_163;
         }
         var_353.scrollV = 1;
         if(!historyViewerActive())
         {
            var_38.containerResized(var_44.rectangle);
         }
         purgeItems();
         alignItems();
      }
      
      public function resizeContainerToLowestItem() : void
      {
         var _loc4_:* = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < _itemList.length)
         {
            _loc4_ = _itemList[_loc2_];
            if(_loc4_.y > _loc1_)
            {
               _loc1_ = _loc4_.y;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < var_71.length)
         {
            _loc4_ = var_71[_loc2_];
            if(_loc4_.y > _loc1_)
            {
               _loc1_ = _loc4_.y;
            }
            _loc2_++;
         }
         _loc1_ += const_491;
         _loc1_ = _loc1_ < 0 ? 0 : int(_loc1_);
         var _loc3_:int = var_44.rectangle.bottom;
         stretchAreaBottomTo(var_44.rectangle.top + _loc1_);
         _loc3_ -= var_44.rectangle.bottom;
         if(Math.abs(_loc3_) < RoomChatHistoryViewer.const_979)
         {
            resetArea();
            return;
         }
         _loc2_ = 0;
         while(_loc2_ < _itemList.length)
         {
            _loc4_ = _itemList[_loc2_];
            _loc4_.y += _loc3_;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < var_71.length)
         {
            _loc4_ = var_71[_loc2_];
            _loc4_.y += _loc3_;
            _loc2_++;
         }
         var_1280 = true;
      }
      
      private function processBuffer() : void
      {
         if(_isAnimating)
         {
            return;
         }
         if(false)
         {
            return;
         }
         while(var_71.length > const_1119 || historyViewerActive() && false)
         {
            activateItemFromBuffer();
         }
         var _loc1_:Boolean = false;
         if(false)
         {
            _loc1_ = true;
         }
         else
         {
            _loc1_ = checkLastItemAllowsAdding(var_71[0]);
         }
         if(_loc1_)
         {
            activateItemFromBuffer();
            var_699 = getTimer() + const_776;
         }
         else
         {
            if(false && false)
            {
               var_575 = getItemSpacing(_itemList["-1"],var_71[0]);
            }
            else
            {
               var_575 = const_93;
            }
            animationStart();
         }
      }
      
      private function setChatItemLocHorizontal(param1:RoomChatItem) : void
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         if(param1 == null || var_38 == null)
         {
            return;
         }
         var _loc2_:Number = (param1.senderX + var_698.x) * var_862;
         var _loc3_:Number = _loc2_ - param1.width / 2;
         var _loc4_:Number = _loc3_ + param1.width;
         var _loc5_:Number = 0 - const_775;
         var _loc6_:Number = 0 + const_775 - 0;
         var _loc7_:Boolean = _loc3_ >= _loc5_ && _loc3_ <= _loc6_;
         var _loc8_:Boolean = _loc4_ >= _loc5_ && _loc4_ <= _loc6_;
         if(_loc7_ && _loc8_)
         {
            _loc9_ = _loc3_;
            _loc10_ = _loc9_;
         }
         else if(_loc2_ >= 0)
         {
            _loc9_ = _loc6_ - param1.width;
         }
         else
         {
            _loc9_ = _loc5_;
         }
         param1.x = _loc9_ + 0 + var_44.x;
         if(_loc2_ < _loc5_ || _loc2_ > _loc6_)
         {
            param1.hidePointer();
         }
         else
         {
            param1.setPointerOffset(_loc3_ - _loc9_);
         }
      }
      
      public function onItemMouseOut(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
      }
      
      private function checkLastItemAllowsAdding(param1:RoomChatItem) : Boolean
      {
         if(false)
         {
            return true;
         }
         var _loc2_:RoomChatItem = _itemList["-1"];
         if(param1 == null || _loc2_ == null)
         {
            return false;
         }
         if(_loc2_.view == null)
         {
            return true;
         }
         if(var_147.rectangle.bottom - (var_147.y + _loc2_.y + _loc2_.height) <= getItemSpacing(_loc2_,param1))
         {
            return false;
         }
         return true;
      }
      
      public function mouseUp() : void
      {
         var _loc1_:Number = var_44.rectangle.bottom - 0;
         if(_loc1_ < const_490)
         {
            if(_loc1_ <= var_163 + var_44.y)
            {
               if(historyViewerActive())
               {
                  hideHistoryViewer();
               }
               resetArea();
               return;
            }
         }
         if(var_1280 && !historyViewerActive())
         {
            resetArea();
            var_1280 = false;
         }
      }
      
      private function getFreeItemId() : String
      {
         return "chat_" + var_2140.toString() + "_item_" + (var_2138++).toString();
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(_disposed)
         {
            return;
         }
         while(false)
         {
            _loc1_ = var_239.shift();
         }
         var_38.dispose();
         var_38 = null;
         while(false)
         {
            _loc1_ = _itemList.shift();
            _loc1_.dispose();
         }
         while(false)
         {
            _loc1_ = var_71.shift();
            _loc1_.dispose();
         }
         var_44.dispose();
         if(var_43 != null)
         {
            var_43.removeUpdateReceiver(this);
            var_43 = null;
         }
         super.dispose();
         _disposed = true;
      }
      
      private function animationStop() : void
      {
         _isAnimating = false;
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetChatUpdateEvent.const_562,onChatMessage);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_246,onRoomViewUpdate);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_694,onRoomViewUpdate);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_677,onRoomViewUpdate);
      }
      
      public function onPulldownMouseDown(param1:WindowMouseEvent) : void
      {
         if(var_38 != null)
         {
            var_38.beginDrag(param1.stageY,true);
         }
      }
      
      private function alignItems() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(var_38 == null)
         {
            return;
         }
         _loc1_ = -1;
         while(_loc1_ >= 0)
         {
            _loc2_ = _itemList[_loc1_];
            if(_loc2_ != null)
            {
               setChatItemLocHorizontal(_loc2_);
               setChatItemLocVertical(_loc2_);
            }
            _loc1_--;
         }
         _loc1_ = 0;
         while(_loc1_ < _itemList.length)
         {
            _loc2_ = _itemList[_loc1_];
            if(_loc2_ != null)
            {
               setChatItemRenderable(_loc2_);
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < var_71.length)
         {
            _loc2_ = var_71[_loc1_];
            if(_loc2_ != null)
            {
               setChatItemLocHorizontal(_loc2_);
            }
            _loc1_++;
         }
      }
      
      private function onChatMessage(param1:RoomWidgetChatUpdateEvent) : void
      {
         var _loc2_:RoomChatItem = new RoomChatItem(this,windowManager,assets,getFreeItemId(),localizations);
         _loc2_.define(param1);
         if(var_862 != 1)
         {
            _loc2_.senderX /= var_862;
         }
         _loc2_.senderX -= 0;
         setChatItemLocHorizontal(_loc2_);
         var_71.push(_loc2_);
         processBuffer();
      }
      
      private function setChatItemLocVertical(param1:RoomChatItem) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(param1 != null)
         {
            _loc2_ = _itemList.indexOf(param1);
            _loc3_ = !!historyViewerActive() ? 0 : Number(var_492);
            if(_loc2_ == -1)
            {
               param1.y = getAreaBottom() - (_loc3_ + 1) * const_93 - const_273;
            }
            else
            {
               _loc4_ = _itemList[_loc2_ + 1].aboveLevels;
               if(_loc4_ < 2)
               {
                  param1.y = _itemList[_loc2_ + 1].y - getItemSpacing(param1,_itemList[_loc2_ + 1]);
               }
               else
               {
                  param1.y = _itemList[_loc2_ + 1].y - _loc4_ * const_93;
               }
            }
         }
      }
      
      public function disableDragTooltips() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < _itemList.length)
         {
            _loc1_ = _itemList[_loc2_];
            _loc1_.disableTooltip();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < var_71.length)
         {
            _loc1_ = var_71[_loc2_];
            _loc1_.disableTooltip();
            _loc2_++;
         }
      }
      
      private function animationStart() : void
      {
         if(_isAnimating)
         {
            return;
         }
         selectItemsToMove();
         _isAnimating = true;
      }
      
      public function hideHistoryViewer() : void
      {
         if(var_38 != null)
         {
            var_38.hideHistoryViewer();
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:int = 0;
         if(getTimer() > var_699 && var_699 > 0)
         {
            var_699 = -1;
            animationStart();
         }
         if(_isAnimating)
         {
            _loc2_ = param1 / const_1049 * const_1121;
            if(_loc2_ + var_697 > var_575)
            {
               _loc2_ = var_575 - var_697;
            }
            if(_loc2_ > 0)
            {
               moveItemsUp(_loc2_);
               var_697 += _loc2_;
            }
            if(var_697 >= var_575)
            {
               var_575 = const_93;
               var_697 = 0;
               animationStop();
               processBuffer();
               var_699 = getTimer() + const_776;
            }
         }
         if(var_38 != null)
         {
            var_38.update(param1);
         }
      }
      
      public function getTotalContentHeight() : int
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _itemList.length)
         {
            _loc1_ = _itemList[_loc3_];
            if(_loc1_ != null)
            {
               if(_loc3_ == 0)
               {
                  _loc2_ += const_93;
               }
               else
               {
                  _loc2_ += getItemSpacing(_itemList[_loc3_ - 1],_loc1_);
               }
               _loc2_ += (_loc1_.aboveLevels - 1) * const_93;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function onRoomViewUpdate(param1:RoomWidgetRoomViewUpdateEvent) : void
      {
         var _loc2_:Rectangle = param1.rect;
         if(param1.scale > 0)
         {
            if(var_1515 == 0)
            {
               var_1515 = param1.scale;
            }
            else
            {
               var_862 = param1.scale / var_1515;
            }
         }
         if(param1.positionDelta != null)
         {
            var_698.x += param1.positionDelta.x / var_862;
            var_698.y += param1.positionDelta.y / var_862;
         }
         if(param1.rect != null)
         {
            if(var_38 == null)
            {
               return;
            }
            var_44.x = _loc2_.x;
            var_44.y = _loc2_.y;
            var_44.width = _loc2_.width;
            var_44.height = var_163 + var_38.pulldownBarHeight;
            var_353.width = 0 - 0;
            var_353.height = var_163;
            var_353.x = var_44.x;
            var_353.y = var_44.y;
            var_147.width = 0 - 0;
            var_147.height = var_163;
            if(historyViewerActive())
            {
               reAlignItemsToHistoryContent();
            }
            var_38.containerResized(var_44.rectangle,true);
         }
         alignItems();
      }
      
      private function getAreaBottom() : Number
      {
         if(historyViewerActive())
         {
            return var_147.height;
         }
         return var_163 + var_44.y;
      }
      
      private function purgeItems() : void
      {
         var _loc2_:* = null;
         if(historyViewerActive())
         {
            return;
         }
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         while(_itemList.length > var_2139)
         {
            _loc2_ = _itemList.shift();
            _loc3_ = var_239.indexOf(_loc2_);
            if(_loc3_ > -1)
            {
               var_239.splice(_loc3_,1);
            }
            if(_loc2_.view != null)
            {
               var_147.removeChild(_loc2_.view);
               _loc2_.hideView();
            }
            _loc2_.dispose();
            _loc2_ = null;
         }
         var _loc4_:Boolean = false;
         _loc1_ = 0;
         for(; _loc1_ < _itemList.length; _loc1_++)
         {
            _loc2_ = _itemList[_loc1_];
            if(_loc2_ != null)
            {
               if(_loc2_.y > -const_491)
               {
                  _loc4_ = true;
               }
               _loc2_.aboveLevels = 1;
               if(_loc2_.view != null)
               {
                  _loc3_ = var_239.indexOf(_loc2_);
                  if(_loc3_ > -1)
                  {
                     var_239.splice(_loc3_,1);
                  }
                  var_147.removeChild(_loc2_.view);
                  _loc2_.hideView();
               }
               continue;
               break;
            }
         }
         if(false)
         {
            _loc4_ = true;
         }
         if(getTotalContentHeight() > const_93 && !_loc4_ && !historyViewerActive())
         {
            if(var_38 != null)
            {
               stretchAreaBottomTo(var_44.y);
               alignItems();
               if(!historyViewerActive())
               {
                  var_38.showHistoryViewer();
               }
               if(!historyViewerVisible())
               {
                  var_38.visible = true;
               }
            }
         }
         else if(historyViewerVisible())
         {
            var_38.visible = false;
         }
      }
      
      public function stretchAreaBottomBy(param1:Number) : void
      {
         var _loc2_:Number = var_44.rectangle.bottom + param1 - 0;
         stretchAreaBottomTo(_loc2_);
      }
      
      private function activateItemFromBuffer() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(false)
         {
            return;
         }
         if(historyViewerMinimized())
         {
            resetArea();
            hideHistoryViewer();
         }
         if(!checkLastItemAllowsAdding(var_71[0]))
         {
            selectItemsToMove();
            moveItemsUp(getItemSpacing(_itemList["-1"],var_71[0]));
            if(!checkLastItemAllowsAdding(var_71[0]))
            {
               var_147.height += const_93;
               if(var_38 != null)
               {
                  var_38.containerResized(var_44.rectangle);
               }
            }
         }
         _loc1_ = var_71.shift();
         if(_loc1_ != null)
         {
            _loc1_.renderView();
            _loc2_ = _loc1_.view;
            if(_loc2_ != null)
            {
               var_147.addChild(_loc2_);
               _loc1_.timestamp = new Date().time;
               _itemList.push(_loc1_);
               _loc3_ = 0;
               if(false)
               {
                  _loc3_ = _itemList["-2"].screenLevel;
                  if(historyViewerActive())
                  {
                     _loc1_.screenLevel = _loc3_ + 1;
                  }
                  else
                  {
                     _loc1_.screenLevel = _loc3_ + Math.max(var_492,1);
                  }
               }
               else
               {
                  _loc1_.screenLevel = 100;
               }
               _loc1_.aboveLevels = var_492;
               if(_loc1_.aboveLevels > const_489 + const_340 + 2)
               {
                  _loc1_.aboveLevels = const_489 + const_340 + 2;
               }
               var_492 = 0;
               setChatItemLocHorizontal(_loc1_);
               setChatItemLocVertical(_loc1_);
               setChatItemRenderable(_loc1_);
            }
         }
      }
      
      public function stretchAreaBottomTo(param1:Number) : void
      {
         var _loc2_:int = var_44.context.getDesktopWindow().height - 0;
         param1 = Math.min(param1,_loc2_);
         var_163 = param1 - 0;
         var_44.height = var_163 + RoomChatHistoryPulldown.const_69;
         if(var_38 != null)
         {
            var_38.containerResized(var_44.rectangle);
         }
      }
      
      public function onItemMouseClick(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
         if(param5.shiftKey)
         {
            if(var_38 != null)
            {
               var_38.toggleHistoryViewer();
            }
            return;
         }
         var _loc6_:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_311,param1,param2);
         messageListener.processWidgetMessage(_loc6_);
         var _loc7_:RoomWidgetChatSelectAvatarMessage = new RoomWidgetChatSelectAvatarMessage(RoomWidgetChatSelectAvatarMessage.const_588,param1,param3,param4);
         messageListener.processWidgetMessage(_loc7_);
      }
      
      private function selectItemsToMove() : void
      {
         var _loc4_:* = null;
         if(_isAnimating)
         {
            return;
         }
         purgeItems();
         var_239 = new Array();
         var _loc1_:int = new Date().time;
         var _loc2_:int = 0;
         if(false)
         {
            var_492 = 1;
            return;
         }
         if(historyViewerActive())
         {
            return;
         }
         ++var_492;
         var _loc3_:int = -1;
         while(_loc3_ >= 0)
         {
            _loc4_ = _itemList[_loc3_];
            if(_loc4_.view != null)
            {
               if(_loc4_.screenLevel > const_340 || _loc4_.screenLevel == _loc2_ - 1 || _loc1_ - _loc4_.timestamp >= const_1122)
               {
                  _loc4_.timestamp = _loc1_;
                  _loc2_ = _loc4_.screenLevel;
                  --_loc4_.screenLevel;
                  var_239.push(_loc4_);
               }
            }
            _loc3_--;
         }
      }
      
      public function enableDragTooltips() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < _itemList.length)
         {
            _loc1_ = _itemList[_loc2_];
            _loc1_.enableTooltip();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < var_71.length)
         {
            _loc1_ = var_71[_loc2_];
            _loc1_.enableTooltip();
            _loc2_++;
         }
      }
      
      public function reAlignItemsToHistoryContent() : void
      {
         if(historyViewerActive())
         {
            var_147.height = getTotalContentHeight() + const_273;
            alignItems();
         }
      }
      
      private function setChatItemRenderable(param1:RoomChatItem) : void
      {
         if(param1 != null)
         {
            if(param1.y < -const_491)
            {
               if(param1.view != null)
               {
                  var_147.removeChild(param1.view);
                  param1.hideView();
               }
            }
            else if(param1.view == null)
            {
               param1.renderView();
               if(param1.view != null)
               {
                  var_147.addChild(param1.view);
               }
            }
         }
      }
      
      private function historyViewerMinimized() : Boolean
      {
         return true;
      }
      
      private function moveItemsUp(param1:int) : void
      {
         var _loc3_:Boolean = false;
         if(var_239 == null)
         {
            return;
         }
         if(false)
         {
            return;
         }
         var _loc2_:* = null;
         var _loc4_:int = -1;
         var _loc5_:int = -1;
         while(_loc5_ >= 0)
         {
            _loc2_ = var_239[_loc5_];
            if(_loc2_ != null)
            {
               if(_loc4_ == -1)
               {
                  _loc4_ = _itemList.indexOf(_loc2_);
               }
               else
               {
                  _loc4_++;
               }
               _loc3_ = true;
               if(historyViewerActive())
               {
                  if(_loc2_.y - param1 + _loc2_.height < 0)
                  {
                     _loc3_ = false;
                  }
               }
               if(_loc4_ > 0)
               {
                  if(_itemList[_loc4_ - 1].view != null)
                  {
                     if(_loc2_.y - param1 - _itemList[_loc4_ - 1].y < getItemSpacing(_itemList[_loc4_ - 1],_loc2_))
                     {
                        _loc3_ = false;
                     }
                  }
               }
               if(_loc3_)
               {
                  _loc2_.y -= param1;
               }
            }
            _loc5_--;
         }
      }
      
      private function historyViewerActive() : Boolean
      {
         return var_38 == null ? false : Boolean(var_38.active);
      }
      
      private function getItemSpacing(param1:RoomChatItem, param2:RoomChatItem) : Number
      {
         if(param1.checkOverlap(param2.x,param1.y,param2.width,param2.height))
         {
            return const_93;
         }
         return const_1120;
      }
      
      public function onItemMouseDown(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
         if(historyViewerVisible())
         {
            return;
         }
         if(var_38 != null)
         {
            var_38.beginDrag(param5.stageY);
         }
      }
      
      private function historyViewerVisible() : Boolean
      {
         return var_38 == null ? false : Boolean(var_38.visible);
      }
   }
}
