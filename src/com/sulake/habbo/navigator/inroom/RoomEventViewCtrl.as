package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CancelEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.EditEventMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.TextFieldManager;
   import com.sulake.habbo.navigator.Util;
   
   public class RoomEventViewCtrl
   {
       
      
      private var _window:IWindowContainer;
      
      private var _eventNameInput:TextFieldManager;
      
      private var _active:Boolean;
      
      private var var_1959:IButtonWindow;
      
      private var var_1205:IButtonWindow;
      
      private var var_1456:ITextWindow;
      
      private var var_809:TextFieldManager;
      
      private var var_1457:ITextWindow;
      
      private var var_810:TextFieldManager;
      
      private var _navigator:HabboNavigator;
      
      private var var_664:TextFieldManager;
      
      private var var_1455:IWindowContainer;
      
      private var var_1960:ITextWindow;
      
      private var var_1207:IButtonWindow;
      
      private var var_811:IDropMenuWindow;
      
      private var var_1206:IButtonWindow;
      
      public function RoomEventViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
      }
      
      private function endEdit() : void
      {
         _active = false;
         _navigator.roomInfoViewCtrl.reload();
      }
      
      public function get active() : Boolean
      {
         return this._active;
      }
      
      public function set active(param1:Boolean) : void
      {
         this._active = param1;
      }
      
      private function getTagFromEvent(param1:RoomEventData, param2:int) : String
      {
         var _loc3_:String = param1.tags[param2 - 1];
         return _loc3_ == null ? "" : _loc3_;
      }
      
      private function getInput(param1:String) : ITextFieldWindow
      {
         return ITextFieldWindow(_window.findChildByName(param1));
      }
      
      private function clearErrors() : void
      {
         _eventNameInput.clearErrors();
         var_664.clearErrors();
         var_809.clearErrors();
         var_810.clearErrors();
      }
      
      private function onEditButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = _navigator.data.roomEventData.eventType;
         var _loc4_:String = _eventNameInput.getText();
         var _loc5_:String = var_664.getText();
         var _loc6_:Array = new Array();
         addTag(_loc6_,var_809.getText());
         addTag(_loc6_,var_810.getText());
         if(!isMandatoryFieldsFilled())
         {
            return;
         }
         _navigator.send(new EditEventMessageComposer(_loc3_,_loc4_,_loc5_,_loc6_));
         endEdit();
      }
      
      private function editEvent(param1:RoomEventData) : void
      {
         var_811.visible = false;
         var_1455.visible = true;
         var_1960.text = _navigator.getText("roomevent_type_" + param1.eventType);
         _eventNameInput.setText(param1.eventName);
         var_664.setText(param1.eventDescription);
         var_809.setText(getTagFromEvent(param1,1));
         var_810.setText(getTagFromEvent(param1,2));
         var_1205.visible = false;
         var_1206.visible = true;
         var_1207.visible = true;
         var_1457.visible = false;
         var_1456.visible = true;
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
      
      private function onCreateButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = getEventType();
         var _loc4_:String = _eventNameInput.getText();
         var _loc5_:String = var_664.getText();
         var _loc6_:Array = new Array();
         addTag(_loc6_,var_809.getText());
         addTag(_loc6_,var_810.getText());
         if(!isMandatoryFieldsFilled())
         {
            return;
         }
         _navigator.send(new CreateEventMessageComposer(_loc3_,_loc4_,_loc5_,_loc6_));
         endEdit();
      }
      
      private function getEventType() : int
      {
         var _loc1_:int = 0;
         return _loc1_ + 1;
      }
      
      private function addTag(param1:Array, param2:String) : void
      {
         if(param2 != "")
         {
            param1.push(param2);
         }
      }
      
      private function prepareWindow(param1:IWindowContainer) : void
      {
         if(_window == null)
         {
            _window = IWindowContainer(_navigator.getXmlWindow("iro_event_settings"));
            var_1455 = IWindowContainer(find("event_type_disabled_cont"));
            var_1960 = ITextWindow(find("event_type_disabled_text"));
            var_1457 = ITextWindow(find("create_caption"));
            var_1456 = ITextWindow(find("edit_caption"));
            var_1205 = IButtonWindow(find("create_button"));
            var_1206 = IButtonWindow(find("edit_button"));
            var_1959 = IButtonWindow(find("cancel_button"));
            var_1207 = IButtonWindow(find("end_button"));
            var_811 = IDropMenuWindow(find("event_type"));
            prepareEventTypes();
            Util.setProcDirectly(var_1205,onCreateButtonClick);
            Util.setProcDirectly(var_1206,onEditButtonClick);
            Util.setProcDirectly(var_1207,onEndButtonClick);
            Util.setProcDirectly(var_1959,onCancelButtonClick);
            _eventNameInput = new TextFieldManager(_navigator,getInput("event_name"),25);
            var_664 = new TextFieldManager(_navigator,getInput("event_desc"),100);
            var_809 = new TextFieldManager(_navigator,getInput("event_tag_1"),25);
            var_810 = new TextFieldManager(_navigator,getInput("event_tag_2"),25);
            param1.addChild(_window);
         }
      }
      
      public function refresh(param1:IWindowContainer) : void
      {
         if(!_active)
         {
            return;
         }
         prepareWindow(param1);
         clearErrors();
         var _loc2_:RoomEventData = _navigator.data.roomEventData;
         if(_loc2_ == null)
         {
            createEvent();
         }
         else
         {
            editEvent(_loc2_);
         }
         _window.visible = true;
      }
      
      private function onEndButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new CancelEventMessageComposer());
         endEdit();
      }
      
      private function prepareEventTypes() : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = new Array();
         var _loc3_:int = 1;
         while(_loc3_ < 100)
         {
            _loc4_ = "roomevent_type_" + _loc3_;
            _loc5_ = _navigator.getText(_loc4_);
            if(_loc5_ == null || _loc5_ == _loc4_)
            {
               break;
            }
            _loc1_.push(_loc5_);
            _loc3_++;
         }
         var_811.populate(_loc1_);
      }
      
      private function isMandatoryFieldsFilled() : Boolean
      {
         this.clearErrors();
         if(!_eventNameInput.checkMandatory(_navigator.getText("navigator.eventsettings.nameerr")))
         {
            return false;
         }
         if(!var_664.checkMandatory(_navigator.getText("navigator.eventsettings.descerr")))
         {
            return false;
         }
         return true;
      }
      
      private function onCancelButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         endEdit();
      }
      
      private function createEvent() : void
      {
         var_811.visible = true;
         var_1455.visible = false;
         var_1205.visible = true;
         var_1206.visible = false;
         var_1207.visible = false;
         var_664.goBackToInitialState();
         _eventNameInput.goBackToInitialState();
         var_809.goBackToInitialState();
         var_810.goBackToInitialState();
         var_811.selection = 0;
         var_1457.visible = true;
         var_1456.visible = false;
      }
   }
}
