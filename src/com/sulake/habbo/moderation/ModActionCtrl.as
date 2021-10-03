package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.moderation.INamed;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceData;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModAlertMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModBanMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModKickMessageComposer;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class ModActionCtrl implements IDisposable, TrackedWindow
   {
      
      private static var var_134:Array;
       
      
      private var _disposed:Boolean;
      
      private var var_771:IButtonWindow;
      
      private var var_1167:int;
      
      private var var_57:ModerationManager;
      
      private var var_641:OffenceCategoryData;
      
      private var var_383:ITextFieldWindow;
      
      private var var_769:IButtonWindow;
      
      private var var_1166:String;
      
      private var var_297:Boolean = true;
      
      private var var_1328:String;
      
      private var var_770:IDropMenuWindow;
      
      private var var_60:IFrameWindow;
      
      private var var_642:OffenceData;
      
      public function ModActionCtrl(param1:ModerationManager, param2:int, param3:String, param4:String)
      {
         super();
         var_57 = param1;
         var_1167 = param2;
         var_1328 = param3;
         var_1166 = param4;
         if(var_134 == null)
         {
            var_134 = new Array();
            var_134.push(new BanDefinition("2 hours",2));
            var_134.push(new BanDefinition("4 hours",4));
            var_134.push(new BanDefinition("12 hours",12));
            var_134.push(new BanDefinition("24 hours",24));
            var_134.push(new BanDefinition("2 days",48));
            var_134.push(new BanDefinition("3 days",72));
            var_134.push(new BanDefinition("1 week",168));
            var_134.push(new BanDefinition("2 weeks",336));
            var_134.push(new BanDefinition("3 weeks",504));
            var_134.push(new BanDefinition("1 month",720));
            var_134.push(new BanDefinition("2 months",1440));
            var_134.push(new BanDefinition("1 year",8760));
            var_134.push(new BanDefinition("2 years",17520));
            var_134.push(new BanDefinition("Permanent",100000));
         }
         var_771 = IButtonWindow(var_57.getXmlWindow("modact_offence"));
         var_769 = IButtonWindow(var_57.getXmlWindow("modact_offencectg"));
      }
      
      public static function hideChildren(param1:IWindowContainer) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.numChildren)
         {
            param1.getChildAt(_loc2_).visible = false;
            _loc2_++;
         }
      }
      
      private function onBanButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Ban...");
         if(!isMsgGiven())
         {
            return;
         }
         if(this.var_770.selection < 0)
         {
            var_57.windowManager.alert("Alert","You must select ban lenght",0,onAlertClose);
            return;
         }
         var_57.connection.send(new ModBanMessageComposer(var_1167,var_383.text,getBanLength(),var_1166));
         this.dispose();
      }
      
      public function getId() : String
      {
         return var_1328;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_241)
         {
            return;
         }
         if(!var_297)
         {
            return;
         }
         var_383.text = "";
         var_297 = false;
      }
      
      private function getBanLength() : int
      {
         var _loc1_:int = this.var_770.selection;
         var _loc2_:BanDefinition = var_134[_loc1_];
         return _loc2_.banLengthHours;
      }
      
      private function prepareBanSelect(param1:IDropMenuWindow) : void
      {
         var _loc3_:* = null;
         var _loc2_:Array = new Array();
         for each(_loc3_ in var_134)
         {
            _loc2_.push(_loc3_.name);
         }
         param1.populate(_loc2_);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      private function refreshButtons(param1:String, param2:int, param3:Array, param4:IWindow, param5:Function) : void
      {
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc6_:IWindowContainer = IWindowContainer(var_60.findChildByName(param1));
         hideChildren(_loc6_);
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         for each(_loc11_ in param3)
         {
            _loc12_ = "" + _loc7_;
            _loc13_ = IButtonWindow(_loc6_.findChildByName(_loc12_));
            if(_loc13_ == null)
            {
               _loc13_ = IButtonWindow(param4.clone());
               _loc13_.procedure = param5;
               _loc13_.x = _loc9_ * (param4.width + 5);
               _loc13_.y = _loc8_ * (param4.height + 5);
               _loc13_.name = _loc12_;
               _loc6_.addChild(_loc13_);
            }
            _loc13_.caption = _loc11_.name;
            _loc13_.visible = true;
            _loc7_++;
            _loc9_++;
            if(_loc9_ >= param2)
            {
               _loc9_ = 0;
               _loc8_++;
            }
         }
         _loc6_.height = RoomToolCtrl.getLowestPoint(_loc6_);
         _loc6_.visible = true;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_60 != null)
         {
            var_60.destroy();
            var_60 = null;
         }
         if(var_771 != null)
         {
            var_771.destroy();
            var_771 = null;
         }
         if(var_769 != null)
         {
            var_769.destroy();
            var_769 = null;
         }
         var_770 = null;
         var_383 = null;
         var_57 = null;
      }
      
      private function onSendCautionButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Sending caution...");
         if(!isMsgGiven())
         {
            return;
         }
         var_57.connection.send(new ModAlertMessageComposer(var_1167,var_383.text,var_1166));
         this.dispose();
      }
      
      private function onAlertClose(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1187;
      }
      
      private function onChangeCategorizationButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(var_642 != null)
         {
            var_642 = null;
         }
         else
         {
            var_641 = null;
         }
         this.refreshCategorization();
      }
      
      private function onOffenceCtgButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = int(param2.name);
         var_641 = var_57.initMsg.offenceCategories[_loc3_];
         this.refreshCategorization();
      }
      
      public function getFrame() : IFrameWindow
      {
         return var_60;
      }
      
      private function isMsgGiven() : Boolean
      {
         if(var_297 || false)
         {
            var_57.windowManager.alert("Alert","You must input a message to the user",0,onAlertClose);
            return false;
         }
         return true;
      }
      
      private function onKickButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Kick...");
         if(!isMsgGiven())
         {
            return;
         }
         var_57.connection.send(new ModKickMessageComposer(var_1167,var_383.text,var_1166));
         this.dispose();
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         dispose();
      }
      
      public function refreshCategorization() : void
      {
         var _loc1_:IWindowContainer = IWindowContainer(var_60.findChildByName("categorization_cont"));
         hideChildren(_loc1_);
         _loc1_.findChildByName("categorization_caption_txt").visible = true;
         _loc1_.findChildByName("change_categorization_but").visible = var_641 != null;
         if(this.var_642 != null)
         {
            var_60.findChildByName("offence_txt").caption = this.var_642.name;
            var_60.findChildByName("offence_category").visible = true;
         }
         else if(this.var_641 != null)
         {
            this.refreshButtons("offences_cont",2,var_641.offences,var_771,onOffenceButton);
         }
         else
         {
            this.refreshButtons("offence_categories_cont",3,var_57.initMsg.offenceCategories,var_769,onOffenceCtgButton);
            _loc1_.height = RoomToolCtrl.getLowestPoint(_loc1_);
         }
      }
      
      private function onOffenceButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = int(param2.name);
         var_642 = var_641.offences[_loc3_];
         var_383.text = var_642.msg;
         var_297 = false;
         this.refreshCategorization();
      }
      
      public function show() : void
      {
         var_60 = IFrameWindow(var_57.getXmlWindow("modact_summary"));
         var_60.caption = "Mod action on: " + var_1328;
         var_60.findChildByName("send_caution_but").procedure = onSendCautionButton;
         var_60.findChildByName("kick_but").procedure = onKickButton;
         var_60.findChildByName("ban_but").procedure = onBanButton;
         var_60.findChildByName("change_categorization_but").procedure = onChangeCategorizationButton;
         var_57.disableButton(var_57.initMsg.alertPermission,var_60,"send_caution_but");
         var_57.disableButton(var_57.initMsg.kickPermission,var_60,"kick_but");
         var_57.disableButton(var_57.initMsg.banPermission,var_60,"ban_but");
         var_383 = ITextFieldWindow(var_60.findChildByName("message_input"));
         var_383.procedure = onInputClick;
         var_770 = IDropMenuWindow(var_60.findChildByName("banLengthSelect"));
         prepareBanSelect(var_770);
         var _loc1_:IWindow = var_60.findChildByTag("close");
         _loc1_.procedure = onClose;
         refreshCategorization();
         var_60.visible = true;
      }
   }
}
