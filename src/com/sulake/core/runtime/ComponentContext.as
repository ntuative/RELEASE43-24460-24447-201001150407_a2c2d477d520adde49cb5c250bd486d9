package com.sulake.core.runtime
{
   import com.sulake.core.assets.AssetLibrary;
   import com.sulake.core.assets.AssetTypeDeclaration;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.events.ErrorEvent;
   import com.sulake.core.runtime.exceptions.InvalidComponentException;
   import com.sulake.core.utils.LibraryLoader;
   import com.sulake.core.utils.LibraryLoaderEvent;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   public class ComponentContext extends Component implements IContext
   {
       
      
      protected var var_358:Array;
      
      protected var var_244:Array;
      
      protected var var_1305:Boolean = false;
      
      protected var var_281:Array;
      
      public function ComponentContext(param1:Component, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(this,param2 | 0,param3);
         var_281 = new Array();
         var_358 = new Array();
      }
      
      protected function loadDebugHandler(param1:LibraryLoaderEvent) : void
      {
         var _loc2_:LibraryLoader = param1.target as LibraryLoader;
         var _loc3_:String = _loc2_.getLastDebugMessage();
         debug(_loc3_);
      }
      
      protected final function addQueueeForInterface(param1:IID, param2:Function) : void
      {
         var _loc3_:* = null;
         if(hasQueueForInterface(param1))
         {
            _loc3_ = getQueueForInterface(param1);
         }
         else
         {
            _loc3_ = new ComponentInterfaceQueue(param1);
            var_358.push(_loc3_);
         }
         _loc3_.receivers.splice(0,0,param2);
      }
      
      public function error(param1:String, param2:Boolean, param3:int = -1, param4:Error = null) : void
      {
         var_872 = param1;
         if(events == null)
         {
            trace("Failed to dispatch an error because events was null. Message: " + param1);
         }
         else
         {
            events.dispatchEvent(new ErrorEvent(Component.COMPONENT_EVENT_ERROR,param1,param2));
         }
      }
      
      protected function removeLibraryLoader(param1:LibraryLoader) : void
      {
         param1.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,loadReadyHandler,false);
         param1.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,loadReadyHandler,false);
         var _loc2_:int = 0;
         while(_loc2_ < var_244.length)
         {
            if(var_244[_loc2_] == param1)
            {
               var_244.splice(_loc2_,1);
               break;
            }
            _loc2_++;
         }
      }
      
      protected final function announceInterfaceAvailability(param1:IID, param2:Component) : void
      {
         var _loc4_:* = null;
         var _loc3_:ComponentInterfaceQueue = this.getQueueForInterface(param1);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc5_:uint = _loc3_.receivers.length;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = param2.queueInterface(param1);
            if(_loc4_ == null)
            {
               error("Interface " + param1 + " still unavailabe!",true,CoreComponent.const_1273);
            }
            _loc3_.receivers.pop()(param1,_loc4_);
            _loc6_++;
         }
      }
      
      public function prepareAssetLibrary(param1:XML, param2:Class) : Boolean
      {
         return _assets.loadFromResource(param1,param2);
      }
      
      public final function loadFromFile(param1:URLRequest, param2:LoaderContext) : LibraryLoader
      {
         if(var_244 == null)
         {
            var_244 = new Array();
         }
         var _loc3_:int = 0;
         while(_loc3_ < var_244.length)
         {
            if(var_244[_loc3_].url == param1.url)
            {
               return var_244[_loc3_].loadFromFile(param1);
            }
            _loc3_++;
         }
         var _loc4_:LibraryLoader = new LibraryLoader(var_1305);
         _loc4_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,loadReadyHandler,false);
         _loc4_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,loadErrorHandler,false);
         _loc4_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_DEBUG,loadDebugHandler,false);
         _loc4_.load(param1,param2);
         var_244.push(_loc4_);
         return _loc4_;
      }
      
      protected function debug(param1:String) : void
      {
         var_2189 = param1;
         if(var_1305)
         {
            _events.dispatchEvent(new Event(Component.COMPONENT_EVENT_DEBUG));
         }
      }
      
      override public function toXMLString(param1:uint = 0) : String
      {
         var _loc6_:* = null;
         var _loc10_:* = null;
         var _loc2_:* = "";
         var _loc3_:int = 0;
         while(_loc3_ < param1)
         {
            _loc2_ += "\t";
            _loc3_++;
         }
         var _loc4_:String = getQualifiedClassName(this);
         var _loc5_:String = "";
         _loc5_ += _loc2_ + "<context class=\"" + _loc4_ + "\" >\n";
         var _loc7_:Array = new Array();
         var _loc8_:uint = var_184.mapStructsByImplementor(this,_loc7_);
         var _loc9_:int = 0;
         while(_loc9_ < _loc8_)
         {
            _loc6_ = _loc7_[_loc9_];
            _loc5_ += _loc2_ + "\t<interface iid=\"" + _loc6_.iis + "\" refs=\"" + _loc6_.references + "\"/>\n";
            _loc9_++;
         }
         var _loc11_:int = 0;
         while(_loc11_ < var_281.length)
         {
            _loc10_ = var_281[_loc11_] as Component;
            if(_loc10_ != this)
            {
               _loc5_ += _loc10_.toXMLString(param1 + 1);
            }
            _loc11_++;
         }
         return _loc5_ + (_loc2_ + "</context>\n");
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(!disposed)
         {
            super.dispose();
            if(var_281 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  IUnknown(var_281.pop()).dispose();
               }
               var_281 = null;
            }
            if(var_358 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  IDisposable(var_358.pop()).dispose();
               }
               var_358 = null;
            }
            if(var_244 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  _loc2_ = var_244[0];
                  removeLibraryLoader(_loc2_);
                  _loc2_.dispose();
               }
               var_244 = null;
            }
         }
      }
      
      protected final function hasQueueForInterface(param1:IID) : Boolean
      {
         var _loc2_:String = getQualifiedClassName(param1);
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(getQualifiedClassName(var_358[_loc4_].identifier) == _loc2_)
            {
               return true;
            }
            _loc4_++;
         }
         return false;
      }
      
      protected final function getQueueForInterface(param1:IID) : ComponentInterfaceQueue
      {
         var _loc3_:* = null;
         var _loc2_:String = getQualifiedClassName(param1);
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = var_358[_loc5_];
            if(getQualifiedClassName(_loc3_.identifier) == _loc2_)
            {
               return _loc3_;
            }
            _loc5_++;
         }
         return null;
      }
      
      protected final function loadReadyHandler(param1:LibraryLoaderEvent) : void
      {
         var _loc2_:LibraryLoader = param1.target as LibraryLoader;
         removeLibraryLoader(_loc2_);
         if(_loc2_.manifest == null)
         {
            return;
         }
         prepareComponent(_loc2_.manifest,_loc2_.resource,_loc2_.domain);
      }
      
      protected function loadErrorHandler(param1:LibraryLoaderEvent) : void
      {
         var _loc2_:LibraryLoader = param1.target as LibraryLoader;
         var _loc3_:String = _loc2_.getLastErrorMessage();
         removeLibraryLoader(_loc2_);
         error("Failed to download component resource \"" + _loc2_.url + "\"!" + "\r" + _loc3_,true,CoreComponent.const_1175);
      }
      
      public final function detachComponent(param1:Component) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = var_184.getIndexByImplementor(param1);
         while(_loc3_ > -1)
         {
            _loc2_ = var_184.remove(_loc3_);
            _loc3_ = var_184.getIndexByImplementor(param1);
         }
         var _loc4_:int = 0;
         while(_loc4_ < var_281.length)
         {
            if(var_281[_loc4_] == param1)
            {
               var_281.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
      }
      
      override public function queueInterface(param1:IID, param2:Function = null) : IUnknown
      {
         var _loc3_:InterfaceStruct = var_184.getStructByInterface(param1);
         if(_loc3_ != null)
         {
            return _loc3_.unknown.queueInterface(param1,param2);
         }
         if(param2 != null)
         {
            addQueueeForInterface(param1,param2);
         }
         return null;
      }
      
      public final function attachComponent(param1:Component, param2:Array) : void
      {
         var _loc3_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(var_281.indexOf(param1) > -1)
         {
            error("Component " + param1 + " already attached to context!",false);
            return;
         }
         var_281.push(param1);
         var _loc4_:uint = param2.length;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = param2[_loc3_];
            if(param1.iids.find(_loc5_) == null)
            {
               param1.iids.insert(new InterfaceStruct(_loc5_,param1));
            }
            var_184.insert(new InterfaceStruct(_loc5_,param1));
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc6_ = param2[_loc3_];
            if(hasQueueForInterface(_loc6_))
            {
               announceInterfaceAvailability(_loc6_,param1);
            }
            _loc3_++;
         }
      }
      
      public final function prepareComponent(param1:XML, param2:Class, param3:ApplicationDomain = null) : Boolean
      {
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:* = null;
         var _loc24_:* = 0;
         var _loc25_:* = null;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         if(param3 == null)
         {
            param3 = ApplicationDomain.currentDomain;
         }
         var _loc5_:XMLList = param1.child("component");
         var _loc18_:int = 0;
         while(_loc18_ < _loc5_.length())
         {
            _loc15_ = _loc5_[_loc18_];
            _loc16_ = _loc15_.attribute("version");
            _loc19_ = _loc15_.child("assets");
            _loc24_ = uint(_loc19_.length());
            _loc25_ = null;
            if(_loc24_ > 0)
            {
               _loc19_ = _loc19_.child("asset");
               _loc24_ = uint(_loc19_.length());
               _loc25_ = new AssetLibrary("_assets@" + _loc7_);
               _loc26_ = 0;
               while(_loc26_ < _loc24_)
               {
                  _loc20_ = _loc19_[_loc26_];
                  _loc21_ = _loc20_.attribute("name");
                  _loc22_ = _loc25_.getAssetTypeDeclarationByMimeType(_loc20_.attribute("mimeType"));
                  _loc23_ = new _loc22_.assetClass(_loc22_);
                  _loc23_.setUnknownContent(param2[_loc21_]);
                  if(!_loc25_.setAsset(_loc21_,_loc23_))
                  {
                     error("Manifest for component " + _loc7_ + " contains broken asset \"" + _loc21_ + "\"!",true,CoreComponent.const_512);
                  }
                  _loc26_++;
               }
            }
            _loc7_ = _loc15_.attribute("class");
            _loc6_ = param3.getDefinition(_loc7_) as Class;
            if(_loc6_ == null)
            {
               _loc6_ = getDefinitionByName(_loc7_) as Class;
            }
            if(_loc6_ == null)
            {
               error("Invalid component class " + _loc7_ + "!",true,CoreComponent.const_512);
               return false;
            }
            _loc4_ = _loc25_ == null ? new _loc6_(this as IContext,Component.COMPONENT_FLAG_NULL) : new _loc6_(this as IContext,Component.COMPONENT_FLAG_NULL,_loc25_);
            if(_loc4_ != null)
            {
               if(_loc25_ != null)
               {
                  if(_loc4_.assets != _loc25_)
                  {
                     _loc25_.dispose();
                     error("Component \"" + _loc7_ + "\" did not save provided asset library!",true,CoreComponent.const_512);
                  }
               }
               _loc8_ = _loc15_.child("interface");
               _loc12_ = new Array();
               _loc27_ = 0;
               while(_loc27_ < _loc8_.length())
               {
                  _loc14_ = _loc8_[_loc27_].attribute("iid");
                  _loc13_ = param3.getDefinition(_loc14_) as Class;
                  if(_loc13_ == null)
                  {
                     _loc13_ = getDefinitionByName(_loc14_) as Class;
                  }
                  if(_loc13_ == null)
                  {
                     throw new InvalidComponentException("Identifier class defined in manifest not found: " + _loc14_);
                  }
                  _loc11_ = new _loc13_();
                  _loc17_ = _loc4_ as IUnknown;
                  _loc4_.iids.insert(new InterfaceStruct(_loc11_,_loc4_));
                  _loc12_.push(_loc11_);
                  _loc27_++;
               }
               attachComponent(_loc4_,_loc12_);
            }
            _loc18_++;
         }
         return true;
      }
   }
}
