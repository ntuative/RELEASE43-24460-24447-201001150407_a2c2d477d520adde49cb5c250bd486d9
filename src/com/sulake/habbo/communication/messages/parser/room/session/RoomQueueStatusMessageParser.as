package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.Map;
   
   public class RoomQueueStatusMessageParser implements IMessageParser
   {
       
      
      private var var_854:Map;
      
      private var _roomId:int = 0;
      
      private var var_1477:int = 0;
      
      private var _roomCategory:int = 0;
      
      public function RoomQueueStatusMessageParser()
      {
         var_854 = new Map();
         super();
      }
      
      public function flush() : Boolean
      {
         _roomId = 0;
         _roomCategory = 0;
         var_854.reset();
         return true;
      }
      
      public function getQueueSet(param1:int) : RoomQueueSet
      {
         return var_854.getValue(param1) as RoomQueueSet;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var_854.reset();
         var _loc2_:int = param1.readInteger();
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_)
         {
            _loc6_ = param1.readString();
            _loc7_ = param1.readInteger();
            if(_loc5_ == 0)
            {
               var_1477 = _loc7_;
            }
            _loc4_ = new RoomQueueSet(_loc6_,_loc7_);
            _loc3_ = param1.readInteger();
            _loc8_ = 0;
            while(_loc8_ < _loc3_)
            {
               _loc4_.addQueue(param1.readString(),param1.readInteger());
               _loc8_++;
            }
            var_854.add(_loc4_.target,_loc4_);
            _loc5_++;
         }
         return true;
      }
      
      public function get activeTarget() : int
      {
         return var_1477;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function getQueueSetTargets() : Array
      {
         return var_854.getKeys();
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
