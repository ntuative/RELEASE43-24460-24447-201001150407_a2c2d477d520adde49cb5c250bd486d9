package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1492:GarbageMonitor = null;
      
      private var var_1208:int = 0;
      
      private var var_1227:Boolean = false;
      
      private var var_1994:String = "";
      
      private var var_1493:String = "";
      
      private var var_352:Number = 0;
      
      private var var_1265:int = 10;
      
      private var var_2240:Array;
      
      private var var_589:int = 0;
      
      private var var_1266:int = 60;
      
      private var var_1016:int = 0;
      
      private var var_1017:int = 0;
      
      private var var_1996:String = "";
      
      private var var_2082:Number = 0;
      
      private var var_1264:int = 1000;
      
      private var var_2083:Boolean = true;
      
      private var var_2081:Number = 0.15;
      
      private var var_176:IHabboConfigurationManager = null;
      
      private var var_1992:String = "";
      
      private var var_1263:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         var_2240 = [];
         super();
         var_1493 = Capabilities.version;
         var_1994 = Capabilities.os;
         var_1227 = Capabilities.isDebugger;
         var_1992 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         var_1492 = new GarbageMonitor();
         updateGarbageMonitor();
         var_1208 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1492.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_1492.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return var_352;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         var_1266 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return var_1493;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++var_1017;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > var_1264)
         {
            ++var_1016;
            _loc3_ = true;
         }
         else
         {
            ++var_589;
            if(var_589 <= 1)
            {
               var_352 = param1;
            }
            else
            {
               _loc4_ = Number(var_589);
               var_352 = var_352 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - var_1208 > var_1266 * 1000 && var_1263 < var_1265)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / var_352);
            _loc5_ = true;
            if(var_2083 && var_1263 > 0)
            {
               _loc6_ = differenceInPercents(var_2082,var_352);
               if(_loc6_ < var_2081)
               {
                  _loc5_ = false;
               }
            }
            var_1208 = getTimer();
            if(_loc5_ || _loc3_)
            {
               var_2082 = var_352;
               if(sendReport())
               {
                  ++var_1263;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         var_1265 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         var_1264 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,var_1992,var_1493,var_1994,var_1996,var_1227,_loc4_,_loc3_,var_1017,var_352,var_1016);
            _connection.send(_loc1_);
            var_1017 = 0;
            var_352 = 0;
            var_589 = 0;
            var_1016 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_176 = param1;
         var_1266 = int(var_176.getKey("performancetest.interval","60"));
         var_1264 = int(var_176.getKey("performancetest.slowupdatelimit","1000"));
         var_1265 = int(var_176.getKey("performancetest.reportlimit","10"));
         var_2081 = Number(var_176.getKey("performancetest.distribution.deviancelimit.percent","10"));
         var_2083 = Boolean(int(var_176.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
