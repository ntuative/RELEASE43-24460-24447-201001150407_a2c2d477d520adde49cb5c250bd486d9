package com.sulake.core.utils
{
   import deng.fzip.FZip;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import flash.utils.getQualifiedClassName;
   
   public class ZipLoader extends LibraryLoader
   {
       
      
      private var var_538:FZip;
      
      private var var_1179:Array;
      
      private var var_1898:uint = 0;
      
      private var var_783:int = 0;
      
      private var var_2290:Array;
      
      public function ZipLoader(param1:Boolean)
      {
         super(param1);
         var_1179 = new Array();
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         Logger.log(param1.text);
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,0));
      }
      
      public function get resources() : Array
      {
         return var_1179;
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         var _loc2_:LoaderInfo = param1.target as LoaderInfo;
         var _loc3_:String = getQualifiedClassName(var_1.content);
         var_1179.push(var_1.contentLoaderInfo.applicationDomain.getDefinition(_loc3_));
         ++var_783;
         if(var_1179.length == var_1898)
         {
            var_1.contentLoaderInfo.removeEventListener(Event.COMPLETE,onLoaderComplete);
            var_1.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,onIOError);
            dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,0));
         }
         else
         {
            var_1.loadBytes(var_538.getFileAt(var_783).content);
         }
      }
      
      override public function load(param1:URLRequest, param2:LoaderContext = null, param3:int = 1) : void
      {
         var_312 = param1;
         var_538 = new FZip();
         var_538.addEventListener(Event.COMPLETE,onComplete);
         var_538.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_538.addEventListener(ProgressEvent.PROGRESS,onProgress);
         var_538.load(var_312);
      }
      
      private function onProgress(param1:ProgressEvent) : void
      {
         dispatchEvent(param1.clone());
      }
      
      private function onComplete(param1:Event) : void
      {
         var_783 = 0;
         var_1898 = var_538.getFileCount();
         removeEventListeners();
         var_1.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoaderComplete);
         var_1.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_1.loadBytes(var_538.getFileAt(var_783).content);
      }
   }
}
