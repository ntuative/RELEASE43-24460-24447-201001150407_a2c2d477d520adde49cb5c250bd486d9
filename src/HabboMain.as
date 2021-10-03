package
{
   import com.sulake.core.Core;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.ICore;
   import com.sulake.core.runtime.ICoreConfigStatusListener;
   import com.sulake.habbo.tracking.HabboLoginTrackingStep;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   
   public class HabboMain extends Sprite implements IHabboMain
   {
       
      
      private var var_884:ICore;
      
      private var var_1537:ICoreConfigStatusListener;
      
      public function HabboMain(param1:ICoreConfigStatusListener)
      {
         super();
         var_1537 = param1;
         addEventListener(Event.ADDED_TO_STAGE,onStageInit);
         Logger.log("Core version: undefined");
      }
      
      public function initializeCore() : void
      {
         try
         {
            var_884.initialize();
         }
         catch(error:Error)
         {
            Core.crash("Failed to initialize the core: " + error.message,CoreComponent.const_1298,error);
         }
      }
      
      public function onCoreError(param1:Event) : void
      {
         trackLoginStep(HabboLoginTrackingStep.const_18);
      }
      
      protected function onStageInit(param1:Event = null) : void
      {
         initCore("config_habbo.xml",Core.const_987);
      }
      
      private function trackLoginStep(param1:String) : void
      {
         if(loaderInfo == null)
         {
            return;
         }
         if(loaderInfo.parameters["processlog.enabled"] != "1")
         {
            return;
         }
         Logger.log("* HabboMain Login Step: " + param1);
         if(false)
         {
            ExternalInterface.call("FlashExternalInterface.logLoginStep",param1);
         }
         else
         {
            Logger.log("HabboMain: ExternalInterface is not available, tracking is disabled");
         }
      }
      
      private function prepareBakedInComponent(param1:Class) : void
      {
         var xmlClass:Class = null;
         var resource:Class = param1;
         try
         {
            xmlClass = (resource as Object).manifest as Class;
            if(xmlClass == null)
            {
               return;
            }
         }
         catch(e:Error)
         {
            Logger.log("Failed to find embedded manifest.xml in " + resource + "!");
            return;
         }
         var bytes:ByteArray = new xmlClass() as ByteArray;
         var manifest:XML = new XML(bytes.readUTFBytes(bytes.length));
         var_884.prepareComponent(manifest,resource);
      }
      
      private function initBakedInComponents() : void
      {
         prepareBakedInComponent(CoreCommunicationFrameworkLib);
         prepareBakedInComponent(HabboRoomObjectLogicLib);
         prepareBakedInComponent(HabboRoomObjectVisualizationLib);
         prepareBakedInComponent(RoomManagerLib);
         prepareBakedInComponent(RoomSpriteRendererLib);
         prepareBakedInComponent(HabboRoomSessionManagerLib);
         prepareBakedInComponent(HabboAvatarRenderLib);
         prepareBakedInComponent(HabboRoomWidgetLib);
         prepareBakedInComponent(HabboSessionDataManagerLib);
         prepareBakedInComponent(HabboTrackingLib);
         prepareBakedInComponent(HabboConfigurationCom);
         prepareBakedInComponent(HabboLocalizationCom);
         prepareBakedInComponent(HabboWindowManagerCom);
         prepareBakedInComponent(HabboCommunicationCom);
         prepareBakedInComponent(HabboCommunicationDemoCom);
         prepareBakedInComponent(HabboNavigatorCom);
         prepareBakedInComponent(HabboFriendListCom);
         prepareBakedInComponent(HabboMessengerCom);
         prepareBakedInComponent(HabboInventoryCom);
         prepareBakedInComponent(HabboToolbarCom);
         prepareBakedInComponent(HabboCatalogCom);
         prepareBakedInComponent(HabboRoomEngineCom);
         prepareBakedInComponent(HabboRoomUICom);
         prepareBakedInComponent(HabboAvatarEditorCom);
         prepareBakedInComponent(HabboNotificationsCom);
         prepareBakedInComponent(HabboHelpCom);
         prepareBakedInComponent(HabboAdManagerCom);
         prepareBakedInComponent(HabboModerationCom);
         Logger.log("Sound manager embed...");
         Logger.log("Trying to embed Flash 9 version");
         prepareBakedInComponent(HabboSoundManagerCom);
      }
      
      private function initCore(param1:String, param2:uint) : void
      {
         trackLoginStep(HabboLoginTrackingStep.const_24);
         var_884 = Core.instantiate(this,param2);
         initBakedInComponents();
         var_884.events.addEventListener(Component.COMPONENT_EVENT_ERROR,onCoreError);
         var_884.loadExternalConfigDocument(new URLRequest(param1),var_1537);
      }
   }
}
