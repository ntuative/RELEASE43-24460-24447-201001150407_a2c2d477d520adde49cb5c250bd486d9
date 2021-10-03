package com.sulake.habbo.moderation
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ICheckBoxWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.moderator.GetCfhChatlogMessageComposer;
   import com.sulake.habbo.communication.messages.parser.moderation.IssueMessageData;
   
   public class IssueHandler implements TrackedWindow
   {
       
      
      private var _disposed:Boolean;
      
      private var _window:IFrameWindow;
      
      private var var_399:UserInfoCtrl;
      
      private var var_64:ModerationManager;
      
      private var var_979:UserInfoCtrl;
      
      private var var_118:IssueBundle;
      
      public function IssueHandler(param1:ModerationManager, param2:IssueBundle)
      {
         super();
         var_64 = param1;
         var_118 = param2;
      }
      
      private function onRelease(param1:WindowMouseEvent) : void
      {
         Logger.log("Release clicked");
         var_64.issueManager.releaseBundle(var_118.id);
         checkAutoHandling();
         dispose();
      }
      
      private function createView() : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(_window != null)
         {
            return;
         }
         if(true || true)
         {
            return;
         }
         var _loc1_:XmlAsset = var_64.assets.getAssetByName("issue_handler_xml") as XmlAsset;
         if(_loc1_ == null || _loc1_.content == null)
         {
            return;
         }
         _window = var_64.windowManager.buildFromXML(_loc1_.content as XML) as IFrameWindow;
         if(_window == null)
         {
            return;
         }
         var _loc2_:IWindow = _window.findChildByTag("close");
         if(_loc2_ != null)
         {
            _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onClose);
         }
         _loc2_ = _window.findChildByName("issue_cont");
         if(_loc2_ != null)
         {
            _loc2_.addEventListener(WindowEvent.const_43,onResized);
         }
         setProc("close_useless",onCloseUseless);
         setProc("close_abusive",onCloseAbusive);
         setProc("close_resolved",onCloseResolved);
         setProc("release",onRelease);
         setProc("move_to_player_support",onMoveToPlayerSupport);
         setProc("show_chatlog",onShowChatlog);
         var_64.disableButton(var_64.initMsg.chatlogsPermission,_window,"show_chatlog");
         _loc2_ = _window.findChildByName("move_to_player_support");
         if(_loc2_ != null)
         {
            _loc2_.disable();
         }
         var _loc3_:IssueMessageData = var_118.getHighestPriorityIssue();
         var_399 = new UserInfoCtrl(_window,var_64,_loc3_.message);
         var_979 = new UserInfoCtrl(_window,var_64,_loc3_.message);
         var_399.load(IWindowContainer(_window.findChildByName("caller_user_info")),var_118.getHighestPriorityIssue().reporterUserId);
         var _loc4_:IWindowContainer = IWindowContainer(_window.findChildByName("reported_user_info"));
         if(false)
         {
            var_979.load(_loc4_,var_118.reportedUserId);
         }
         else
         {
            _loc6_ = IItemListWindow(_window.findChildByName("issue_cont"));
            _loc7_ = _window.findChildByName("reported_user_info_caption");
            _loc6_.removeListItem(_loc7_);
            _loc6_.removeListItem(_loc4_);
         }
         var _loc5_:ICheckBoxWindow = _window.findChildByName("handle_next_checkbox") as ICheckBoxWindow;
         if(_loc5_ != null)
         {
            _loc5_.select();
         }
         Logger.log("HARASSER: undefined");
         updateIssueList();
         updateMessages();
      }
      
      private function onMoveToPlayerSupport(param1:WindowMouseEvent) : void
      {
         Logger.log("Move to player support clicked");
      }
      
      private function onCloseUseless(param1:WindowMouseEvent) : void
      {
         Logger.log("Close useless clicked");
         var_64.issueManager.closeBundle(var_118.id,1);
         checkAutoHandling();
         dispose();
      }
      
      public function update() : void
      {
         updateIssueList();
         updateMessages();
      }
      
      public function show() : void
      {
         createView();
      }
      
      private function updateIssueList() : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(_window == null)
         {
            return;
         }
         var _loc1_:IItemListWindow = _window.findChildByName("issues_item_list") as IItemListWindow;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.removeListItems();
         var _loc2_:XmlAsset = var_64.assets.getAssetByName("issue_handler_issue_info_xml") as XmlAsset;
         if(_loc2_ == null || _loc2_.content == null)
         {
            return;
         }
         var _loc3_:IWindowContainer = var_64.windowManager.buildFromXML(_loc2_.content as XML) as IWindowContainer;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:Array = var_118.issues;
         var _loc5_:int = 0;
         for each(_loc6_ in _loc4_)
         {
            _loc7_ = _loc3_.clone() as IWindowContainer;
            if(_loc7_ == null)
            {
               return;
            }
            _loc7_.background = _loc5_++ % 2 == 0;
            _loc1_.addListItem(_loc7_);
            _loc8_ = _loc7_.findChildByName("reporter");
            if(_loc8_ != null)
            {
               _loc8_.caption = _loc6_.reporterUserName;
               _loc8_.id = _loc6_.reporterUserId;
               _loc8_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onReporterClicked);
            }
            setCaption(_loc7_.findChildByName("category"),IssueCategoryNames.getCategoryName(_loc6_.reportedCategoryId));
            setCaption(_loc7_.findChildByName("room"),_loc6_.roomName);
            setCaption(_loc7_.findChildByName("time_open"),_loc6_.getOpenTime());
         }
      }
      
      private function onShowChatlog(param1:WindowMouseEvent) : void
      {
         Logger.log("Show chatlog clicked");
         var _loc2_:int = var_118.getHighestPriorityIssue().issueId;
         var_64.windowTracker.show(new ChatlogCtrl(new GetCfhChatlogMessageComposer(_loc2_),var_64,WindowTracker.const_927,_loc2_),_window,false,false,true);
      }
      
      public function getId() : String
      {
         return "undefined";
      }
      
      private function onClose(param1:WindowMouseEvent) : void
      {
         if(var_64 != null && false && var_118 != null)
         {
            var_64.issueManager.removeHandler(var_118.id);
         }
         this.dispose();
      }
      
      private function checkAutoHandling() : void
      {
         if(_window == null || var_64 == null || true)
         {
            return;
         }
         var _loc1_:ICheckBoxWindow = _window.findChildByName("handle_next_checkbox") as ICheckBoxWindow;
         if(_loc1_ != null && _loc1_.isSelected)
         {
            var_64.issueManager.autoPick();
         }
      }
      
      private function onResized(param1:WindowEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:IItemListWindow = param1.window as IItemListWindow;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IItemListWindow = _loc2_.getListItemByName("issues_item_list") as IItemListWindow;
         var _loc4_:IItemListWindow = _loc2_.getListItemByName("msg_item_list") as IItemListWindow;
         if(_loc3_ == null || _loc4_ == null)
         {
            return;
         }
         var _loc5_:int = (_loc2_.height - _loc2_.scrollableRegion.height + _loc3_.height + _loc4_.height) * 0.5;
         _loc2_.autoArrangeItems = false;
         _loc3_.height = _loc5_;
         _loc4_.height = _loc5_;
         _loc2_.autoArrangeItems = true;
      }
      
      private function setCaption(param1:IWindow, param2:String) : void
      {
         if(param1 != null)
         {
            param1.caption = param2;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(this.var_399 != null)
         {
            this.var_399.dispose();
            this.var_399 = null;
         }
         if(this.var_979 != null)
         {
            this.var_979.dispose();
            this.var_979 = null;
         }
         var_64 = null;
         var_118 = null;
      }
      
      private function setProc(param1:String, param2:Function) : void
      {
         _window.findChildByName(param1).addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,param2);
      }
      
      private function onReporterClicked(param1:WindowMouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = param1.window.id;
         if(_loc2_ != 0)
         {
            if(var_399 != null)
            {
               var_399.dispose();
            }
            _loc3_ = var_118.getHighestPriorityIssue();
            var_399 = new UserInfoCtrl(_window,var_64,_loc3_.message);
            var_399.load(IWindowContainer(_window.findChildByName("caller_user_info")),_loc2_);
         }
      }
      
      private function onCloseAbusive(param1:WindowMouseEvent) : void
      {
         Logger.log("Close abusive clicked");
         var_64.issueManager.closeBundle(var_118.id,2);
         checkAutoHandling();
         dispose();
      }
      
      private function onCloseResolved(param1:WindowMouseEvent) : void
      {
         Logger.log("Close resolved clicked");
         var_64.issueManager.closeBundle(var_118.id,3);
         checkAutoHandling();
         dispose();
      }
      
      private function updateMessages() : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(_window == null)
         {
            return;
         }
         var _loc1_:IItemListWindow = _window.findChildByName("msg_item_list") as IItemListWindow;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.removeListItems();
         var _loc2_:XmlAsset = var_64.assets.getAssetByName("issue_handler_message_list_item_xml") as XmlAsset;
         if(_loc2_ == null || _loc2_.content == null)
         {
            return;
         }
         var _loc3_:ITextWindow = var_64.windowManager.buildFromXML(_loc2_.content as XML) as ITextWindow;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:Array = var_118.issues;
         var _loc5_:int = 0;
         for each(_loc6_ in _loc4_)
         {
            _loc7_ = _loc3_.clone() as ITextWindow;
            if(_loc7_ == null)
            {
               return;
            }
            _loc1_.addListItem(_loc7_);
            _loc7_.width = _loc1_.width;
            _loc7_.background = _loc5_++ % 2 == 0;
            _loc7_.caption = _loc6_.reporterUserName + ": " + _loc6_.message;
            _loc7_.height = _loc7_.textHeight + 10;
         }
      }
      
      public function getFrame() : IFrameWindow
      {
         return _window;
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1204;
      }
   }
}
