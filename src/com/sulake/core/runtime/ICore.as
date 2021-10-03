package com.sulake.core.runtime
{
   import flash.events.IEventDispatcher;
   import flash.net.URLRequest;
   
   public interface ICore extends IContext
   {
       
      
      function initialize() : void;
      
      function readConfigDocument(param1:XML, param2:ICoreConfigStatusListener = null) : void;
      
      function getLastDebugMessage() : String;
      
      function error(param1:String, param2:Boolean, param3:int = -1, param4:Error = null) : void;
      
      function get events() : IEventDispatcher;
      
      function getLastErrorMessage() : String;
      
      function loadExternalConfigDocument(param1:URLRequest, param2:ICoreConfigStatusListener = null) : void;
   }
}
