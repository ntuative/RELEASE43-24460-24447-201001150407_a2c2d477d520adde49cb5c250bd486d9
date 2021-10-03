package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var var_2042:UserRegistry;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_144:TutorialUI;
      
      private var var_1479:IHabboLocalizationManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_65:HelpUI;
      
      private var var_1481:IHabboConfigurationManager;
      
      private var var_188:IHabboToolbar;
      
      private var var_650:IHabboCommunicationManager;
      
      private var var_831:FaqIndex;
      
      private var var_1905:String = "";
      
      private var var_1480:IncomingMessages;
      
      private var var_1247:CallForHelpData;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_1247 = new CallForHelpData();
         var_2042 = new UserRegistry();
         super(param1,param2,param3);
         _assetLibrary = param3;
         var_831 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return var_188;
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(var_65 != null)
         {
            var_65.tellUI(param1,param2);
         }
      }
      
      private function toggleHelpUI() : void
      {
         if(var_65 == null)
         {
            if(!createHelpUI())
            {
               return;
            }
         }
         var_65.toggleUI();
      }
      
      private function removeTutorialUI() : void
      {
         if(var_144 != null)
         {
            var_144.dispose();
            var_144 = null;
         }
      }
      
      public function get ownUserName() : String
      {
         return var_1905;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         var_1247.reportedUserId = param1;
         var_1247.reportedUserName = param2;
         var_65.showUI(HabboHelpViewEnum.const_291);
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return var_1479;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_89:
               if(var_65 != null)
               {
                  var_65.setRoomSessionStatus(true);
               }
               if(var_144 != null)
               {
                  var_144.setRoomSessionStatus(true);
               }
               break;
            case RoomSessionEvent.const_99:
               if(var_65 != null)
               {
                  var_65.setRoomSessionStatus(false);
               }
               if(var_144 != null)
               {
                  var_144.setRoomSessionStatus(false);
               }
               userRegistry.unregisterRoom();
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(var_65 != null)
         {
            var_65.updateCallForGuideBotUI(true);
         }
      }
      
      public function get userRegistry() : UserRegistry
      {
         return var_2042;
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(var_65 != null)
         {
            var_65.showCallForHelpResult(param1);
         }
      }
      
      override public function dispose() : void
      {
         if(var_65 != null)
         {
            var_65.dispose();
            var_65 = null;
         }
         if(var_144 != null)
         {
            var_144.dispose();
            var_144 = null;
         }
         var_1480 = null;
         if(var_831 != null)
         {
            var_831.dispose();
            var_831 = null;
         }
         if(_windowManager)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         super.dispose();
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(var_188 != null)
         {
            var_188.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_111,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function createTutorialUI() : Boolean
      {
         if(var_144 == null && _assetLibrary != null && _windowManager != null)
         {
            var_144 = new TutorialUI(this);
         }
         return var_144 != null;
      }
      
      private function createHelpUI() : Boolean
      {
         if(var_65 == null && _assetLibrary != null && _windowManager != null)
         {
            var_65 = new HelpUI(this,_assetLibrary,_windowManager,var_1479,var_188);
         }
         return var_65 != null;
      }
      
      public function set ownUserName(param1:String) : void
      {
         var_1905 = param1;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return var_1247;
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_1479 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationManagerReady);
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            removeTutorialUI();
            return;
         }
         if(var_144 == null)
         {
            if(!createTutorialUI())
            {
               return;
            }
         }
         var_144.update(param1,param2,param3);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_650 = IHabboCommunicationManager(param2);
         var_1480 = new IncomingMessages(this,var_650);
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
      }
      
      public function showUI(param1:String = null) : void
      {
         if(var_65 != null)
         {
            var_65.showUI(param1);
         }
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(var_650 != null && param1 != null)
         {
            var_650.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return var_831;
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(var_65 != null)
         {
            var_65.updateCallForGuideBotUI(false);
         }
      }
      
      public function hideUI() : void
      {
         if(var_65 != null)
         {
            var_65.hideUI();
         }
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_188 = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_1481 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return var_144;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_78)
         {
            setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_61)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               toggleHelpUI();
               return;
            }
         }
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_89,onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_99,onRoomSessionEvent);
         var_188.events.addEventListener(HabboToolbarEvent.const_78,onHabboToolbarEvent);
         var_188.events.addEventListener(HabboToolbarEvent.const_61,onHabboToolbarEvent);
         createHelpUI();
         setHabboToolbarIcon();
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(var_65 != null)
         {
            var_65.showCallForHelpReply(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(var_1481 == null)
         {
            return param1;
         }
         return var_1481.getKey(param1,param2,param3);
      }
   }
}
