package com.sulake.core.runtime
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.utils.LibraryLoader;
   import com.sulake.core.utils.LibraryLoaderEvent;
   import com.sulake.core.utils.profiler.ProfilerViewer;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getTimer;
   
   public final class CoreComponent extends ComponentContext implements ICore
   {
      
      private static const const_150:uint = 3;
      
      private static const const_1111:String = "library";
      
      public static const const_1273:int = 6;
      
      private static const const_1115:String = "library";
      
      public static const const_1308:int = 99;
      
      private static const const_1112:String = "library";
      
      private static const const_1116:String = "zip-libraries";
      
      public static const const_1242:int = 7;
      
      public static const const_995:int = 1;
      
      public static const const_1298:int = 10;
      
      public static const const_1132:int = 2;
      
      private static const const_1117:String = "library";
      
      private static const const_1114:String = "asset-libraries";
      
      public static const const_1175:int = 5;
      
      public static const const_1376:int = 20;
      
      public static const const_561:int = 30;
      
      public static const const_512:int = 4;
      
      public static const const_1277:int = 3;
      
      private static const const_1113:String = "service-libraries";
      
      private static const const_1118:String = "component-libraries";
       
      
      private var var_573:Number = 0;
      
      private var var_112:ICoreConfigStatusListener;
      
      private var var_413:uint;
      
      private var var_277:Array;
      
      private var var_274:uint;
      
      private var var_124:DisplayObjectContainer;
      
      private var var_850:Profiler;
      
      private var var_275:Array;
      
      private var var_238:Array;
      
      private var var_572:Array;
      
      private var var_692:Array;
      
      private var var_276:Array;
      
      private var var_693:ProfilerViewer;
      
      public function CoreComponent(param1:DisplayObjectContainer, param2:uint)
      {
         super(this,Component.COMPONENT_FLAG_CONTEXT,new AssetLibraryCollection("_core_assets"));
         var_1305 = (param2 & 0) != 0;
         var_572 = new Array();
         var_692 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < CoreComponent.const_150)
         {
            var_572.push(new Array());
            var_692.push(0);
            _loc3_++;
         }
         var_413 = getTimer();
         attachComponent(this,[new IIDCore()]);
         var_124 = param1;
         switch(param2 & 0)
         {
            case Core.const_1151:
               debug("Core; using simple frame update handler");
               var_124.addEventListener(Event.ENTER_FRAME,simpleFrameUpdateHandler);
               break;
            case Core.const_987:
               debug("Core; using complex frame update handler");
               var_124.addEventListener(Event.ENTER_FRAME,complexFrameUpdateHandler);
               break;
            case Core.const_1320:
               debug("Core; using profiler frame update handler");
               var_124.addEventListener(Event.ENTER_FRAME,profilerFrameUpdateHandler);
               var_850 = new Profiler(this);
               attachComponent(var_850,[new IIDProfiler()]);
               var_693 = new ProfilerViewer();
               var_124.addChild(var_693);
         }
      }
      
      override public function removeUpdateReceiver(param1:ICoreUpdateReceiver) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         while(_loc4_ < CoreComponent.const_150)
         {
            _loc3_ = var_572[_loc4_] as Array;
            _loc2_ = _loc3_.indexOf(param1);
            if(_loc2_ > -1)
            {
               _loc3_[_loc2_] = null;
               return;
            }
            _loc4_++;
         }
      }
      
      public function getLastErrorMessage() : String
      {
         return var_872;
      }
      
      override public function error(param1:String, param2:Boolean, param3:int = -1, param4:Error = null) : void
      {
         if(param2)
         {
            if(param4 != null)
            {
               ErrorReportStorage.setParameter("error_data",String(param4.getStackTrace()));
            }
            ErrorReportStorage.setParameter("error_cat",String(param3));
            ErrorReportStorage.setParameter("error_desc",param1);
         }
         super.error(param1,param2,param3);
         if(param2)
         {
            dispose();
         }
      }
      
      public function initialize() : void
      {
         _events.dispatchEvent(new Event(Component.COMPONENT_EVENT_RUNNING));
         Logger.log(toXMLString());
      }
      
      private function updateConfigStatusListener() : void
      {
         var _loc1_:* = NaN;
         if(var_112)
         {
            _loc1_ = NaN;
            if(var_573 > 0)
            {
               _loc1_ += var_573 + var_238.length - 1;
            }
            else
            {
               _loc1_ += var_238.length;
            }
            var_112.percent = (Number(var_274) - _loc1_) / Number(var_274);
         }
      }
      
      private function profilerFrameUpdateHandler(param1:Event) : void
      {
         var criticality:uint = 0;
         var receivers:Array = null;
         var receiver:ICoreUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var event:Event = param1;
         var msCurrentTime:uint = getTimer();
         var msSinceLastUpdate:uint = msCurrentTime - var_413;
         var_413 = msCurrentTime;
         var_850.start();
         criticality = 0;
         while(criticality < CoreComponent.const_150)
         {
            var_692[criticality] = 0;
            receivers = var_572[criticality];
            index = 0;
            length = receivers.length;
            while(index != length)
            {
               receiver = ICoreUpdateReceiver(receivers[index]);
               if(receiver == null || receiver.disposed)
               {
                  receivers.splice(index,1);
                  length--;
               }
               else
               {
                  try
                  {
                     var_850.update(receiver,msSinceLastUpdate);
                  }
                  catch(e:Error)
                  {
                     error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                     return;
                  }
                  index++;
               }
            }
            criticality++;
         }
         var_850.stop();
         var_693.refresh(var_850);
      }
      
      private function complexFrameUpdateHandler(param1:Event) : void
      {
         var criticality:uint = 0;
         var receivers:Array = null;
         var receiver:ICoreUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var skip:Boolean = false;
         var t:uint = 0;
         var event:Event = param1;
         var msCurrentTime:uint = getTimer();
         var msSinceLastUpdate:uint = msCurrentTime - var_413;
         var maxTimePerFrame:uint = 1000 / DisplayObject(var_124).stage.frameRate;
         var_413 = msCurrentTime;
         criticality = 0;
         while(criticality < CoreComponent.const_150)
         {
            t = getTimer();
            skip = false;
            if(t - msCurrentTime > maxTimePerFrame)
            {
               if(var_692[criticality] < criticality)
               {
                  ++0;
                  skip = true;
               }
            }
            if(!skip)
            {
               var_692[criticality] = 0;
               receivers = var_572[criticality];
               index = 0;
               length = receivers.length;
               while(index != length)
               {
                  receiver = ICoreUpdateReceiver(receivers[index]);
                  if(receiver == null || receiver.disposed)
                  {
                     receivers.splice(index,1);
                     length--;
                  }
                  else
                  {
                     try
                     {
                        receiver.update(msSinceLastUpdate);
                     }
                     catch(e:Error)
                     {
                        trace(e.getStackTrace());
                        error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                        return;
                     }
                     index++;
                  }
               }
            }
            criticality++;
         }
      }
      
      private function simpleFrameUpdateHandler(param1:Event) : void
      {
         var criticality:uint = 0;
         var receivers:Array = null;
         var receiver:ICoreUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var event:Event = param1;
         var msCurrentTime:uint = getTimer();
         var msSinceLastUpdate:uint = msCurrentTime - var_413;
         var_413 = msCurrentTime;
         criticality = 0;
         while(criticality < CoreComponent.const_150)
         {
            var_692[criticality] = 0;
            receivers = var_572[criticality];
            index = 0;
            length = receivers.length;
            while(index != length)
            {
               receiver = ICoreUpdateReceiver(receivers[index]);
               if(receiver == null || receiver.disposed)
               {
                  receivers.splice(index,1);
                  length--;
               }
               else
               {
                  try
                  {
                     receiver.update(msSinceLastUpdate);
                  }
                  catch(e:Error)
                  {
                     error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                     return;
                  }
                  index++;
               }
            }
            criticality++;
         }
      }
      
      public function loadExternalConfigDocument(param1:URLRequest, param2:ICoreConfigStatusListener = null) : void
      {
         if(var_112)
         {
            if(var_112 != param2)
            {
               var_112.dispose();
            }
         }
         if(param2)
         {
            var_112 = param2;
         }
         var _loc3_:AssetLoaderStruct = _assets.loadAssetFromFile("config.xml",param1);
         debug("Loading config document \"" + _loc3_.assetLoader.url + "\"");
         _loc3_.addEventListener(AssetLoaderEvent.const_31,configLoadedHandler);
         _loc3_.addEventListener(AssetLoaderEvent.const_46,configLoadedHandler);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(!disposed)
         {
            debug("Disposing core");
            var_124.removeEventListener(Event.ENTER_FRAME,simpleFrameUpdateHandler);
            var_124.removeEventListener(Event.ENTER_FRAME,complexFrameUpdateHandler);
            var_124.removeEventListener(Event.ENTER_FRAME,profilerFrameUpdateHandler);
            var_124 = null;
            _loc3_ = 0;
            while(_loc3_ < CoreComponent.const_150)
            {
               _loc2_ = var_572[_loc3_] as Array;
               _loc1_ = uint(_loc2_.length);
               while(_loc1_-- > 0)
               {
                  _loc2_.pop();
               }
               _loc3_++;
            }
            if(var_238 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  var_238.pop();
               }
            }
            if(var_276 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  var_276.pop();
               }
            }
            if(var_277 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  var_277.pop();
               }
            }
            if(var_275 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  var_275.pop();
               }
            }
            if(var_693 != null)
            {
               var_693.dispose();
               var_693 = null;
            }
            if(var_112)
            {
               var_112.dispose();
               var_112 = null;
            }
            super.dispose();
         }
      }
      
      public function readConfigDocument(param1:XML, param2:ICoreConfigStatusListener = null) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(var_112)
         {
            if(var_112 != param2)
            {
               var_112.dispose();
            }
         }
         if(param2)
         {
            var_112 = param2;
         }
         debug("Parsing config document");
         if(var_238 == null)
         {
            var_238 = new Array();
         }
         _loc3_ = param1.child(const_1116)[0];
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.child(const_1111);
            for each(_loc5_ in _loc4_)
            {
               _loc6_ = _loc5_.attribute("url").toString();
               var_238.push(_loc6_);
               ++var_274;
            }
         }
         if(var_276 == null)
         {
            var_276 = new Array();
         }
         _loc3_ = param1.child(const_1114)[0];
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.child(const_1115);
            for each(_loc5_ in _loc4_)
            {
               _loc6_ = _loc5_.attribute("url").toString();
               var_276.push(_loc6_);
               ++var_274;
            }
         }
         if(var_277 == null)
         {
            var_277 = new Array();
         }
         _loc3_ = param1.child(const_1113)[0];
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.child(const_1117);
            for each(_loc5_ in _loc4_)
            {
               _loc6_ = _loc5_.attribute("url").toString();
               var_277.push(_loc6_);
               ++var_274;
            }
         }
         if(var_275 == null)
         {
            var_275 = new Array();
         }
         _loc3_ = param1.child(const_1118)[0];
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.child(const_1112);
            for each(_loc5_ in _loc4_)
            {
               _loc6_ = _loc5_.attribute("url").toString();
               var_275.push(_loc6_);
               ++var_274;
            }
         }
         if(var_112)
         {
            var_112.percent = 0;
         }
         updateLoadingProcess();
      }
      
      private function updateLoadingProcess(param1:LibraryLoaderEvent = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 != null)
         {
            if(param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE || param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR)
            {
               _loc2_ = param1.target as LibraryLoader;
               _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               _loc2_.removeEventListener(ProgressEvent.PROGRESS,updateArchiveLoadingItemProgress);
               _loc3_ = _loc2_.url;
               debug("Loading library \"" + _loc3_ + "\" " + (param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE ? "ready" : "failed\n" + _loc2_.getLastErrorMessage()));
               if(false)
               {
                  if(var_238[0] == _loc3_)
                  {
                     var_573 = 0;
                     var_238.splice(0,1);
                  }
               }
               if(false)
               {
                  if(var_276[0] == _loc3_)
                  {
                     var_276.splice(0,1);
                  }
               }
               if(false)
               {
                  if(var_277[0] == _loc3_)
                  {
                     var_277.splice(0,1);
                  }
               }
               if(false)
               {
                  if(var_275[0] == _loc3_)
                  {
                     var_275.splice(0,1);
                  }
               }
            }
         }
         if(false)
         {
            _loc3_ = "null";
            _loc2_ = _assets.loadFromArchive(new URLRequest(_loc3_),null);
            if(_loc2_.ready)
            {
               var_238.splice(0,1);
               updateLoadingProcess();
            }
            else
            {
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               _loc2_.addEventListener(ProgressEvent.PROGRESS,updateArchiveLoadingItemProgress);
               debug("Loading zip library " + _loc3_);
            }
            updateConfigStatusListener();
            return;
         }
         if(false)
         {
            _loc3_ = "null";
            _loc4_ = new LoaderContext(false,new ApplicationDomain());
            _loc2_ = _assets.loadFromFile(new URLRequest(_loc3_),true,_loc4_);
            if(_loc2_.ready)
            {
               var_276.splice(0,1);
               updateLoadingProcess();
            }
            else
            {
               var_573 = 1;
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               debug("Loading asset library " + _loc3_);
            }
            updateConfigStatusListener();
            return;
         }
         if(false)
         {
            _loc3_ = "null";
            _loc2_ = loadFromFile(new URLRequest(_loc3_),new LoaderContext(false,ApplicationDomain.currentDomain,null));
            if(_loc2_.ready)
            {
               var_277.splice(0,1);
               updateLoadingProcess();
            }
            else
            {
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               debug("Loading service library " + _loc3_);
            }
            updateConfigStatusListener();
            return;
         }
         if(false)
         {
            _loc3_ = "null";
            _loc2_ = loadFromFile(new URLRequest(_loc3_),new LoaderContext(false,ApplicationDomain.currentDomain,null));
            if(_loc2_.ready)
            {
               var_275.splice(0,1);
               updateLoadingProcess();
            }
            else
            {
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               debug("Loading component library " + _loc3_);
            }
            updateConfigStatusListener();
            return;
         }
         if(var_112)
         {
            var_112.complete();
         }
         debug("All libraries loaded, Core is now running");
      }
      
      private function errorInLoadingProcess(param1:LibraryLoaderEvent = null) : void
      {
         var _loc2_:LibraryLoader = LibraryLoader(param1.target);
         error("Failed to download library \"" + _loc2_.url + "\" HTTP status " + param1.status + ": " + _loc2_.getLastErrorMessage(),true,const_1132);
         updateLoadingProcess(param1);
      }
      
      private function updateArchiveLoadingItemProgress(param1:ProgressEvent) : void
      {
         var_573 = 1 - param1.bytesLoaded / param1.bytesTotal;
         if(var_573 > 0)
         {
            updateConfigStatusListener();
         }
      }
      
      public function getLastDebugMessage() : String
      {
         return var_2189;
      }
      
      override public function registerUpdateReceiver(param1:ICoreUpdateReceiver, param2:uint) : void
      {
         removeUpdateReceiver(param1);
         param2 = param2 >= CoreComponent.const_150 ? 4294967295 : uint(param2);
         var _loc3_:Array = var_572[param2] as Array;
         _loc3_.push(param1);
      }
      
      private function configLoadedHandler(param1:AssetLoaderEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         _loc2_ = param1.target as AssetLoaderStruct;
         _loc2_.removeEventListener(AssetLoaderEvent.const_31,configLoadedHandler);
         _loc2_.removeEventListener(AssetLoaderEvent.const_46,configLoadedHandler);
         if(param1.type == AssetLoaderEvent.const_31)
         {
            debug("Config document \"" + _loc2_.assetLoader.url + "\" loaded");
            _loc3_ = _assets.getAssetByName(_loc2_.assetName) as XmlAsset;
            _loc4_ = _loc3_.content as XML;
            readConfigDocument(_loc4_,var_112);
         }
         else
         {
            error("Failed to download external configuration document " + _loc2_.assetLoader.url + "!",true,const_995);
            _events.dispatchEvent(new Event(Component.COMPONENT_EVENT_ERROR));
         }
      }
      
      public function get root() : DisplayObjectContainer
      {
         return var_124;
      }
   }
}
