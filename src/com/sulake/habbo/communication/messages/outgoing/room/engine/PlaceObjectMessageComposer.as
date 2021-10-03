package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   
   public class PlaceObjectMessageComposer implements IMessageComposer
   {
       
      
      private var var_160:int;
      
      private var var_225:int = 0;
      
      private var _roomId:int;
      
      private var var_91:int = 0;
      
      private var _y:int = 0;
      
      private var var_1591:int;
      
      private var var_1590:String;
      
      private var _roomCategory:int;
      
      public function PlaceObjectMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int = 0, param8:int = 0)
      {
         super();
         var_160 = param1;
         var_1591 = param2;
         var_1590 = param3;
         var_91 = param4;
         _y = param5;
         var_225 = param6;
         _roomId = param7;
         _roomCategory = param8;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         switch(var_1591)
         {
            case RoomObjectCategoryEnum.const_33:
               return [var_160 + " " + var_91 + " " + _y + " " + var_225];
            case RoomObjectCategoryEnum.const_29:
               return [var_160 + " " + var_1590];
            default:
               return [];
         }
      }
   }
}
