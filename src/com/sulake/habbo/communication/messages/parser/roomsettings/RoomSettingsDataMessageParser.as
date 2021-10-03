package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.roomsettings.FlatControllerData;
   import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsData;
   
   public class RoomSettingsDataMessageParser implements IMessageParser
   {
       
      
      private var var_105:RoomSettingsData;
      
      public function RoomSettingsDataMessageParser()
      {
         super();
      }
      
      public function get data() : RoomSettingsData
      {
         return var_105;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_105 = new RoomSettingsData();
         var_105.roomId = param1.readInteger();
         var_105.name = param1.readString();
         var_105.description = param1.readString();
         var_105.doorMode = param1.readInteger();
         var_105.categoryId = param1.readInteger();
         var_105.maximumVisitors = param1.readInteger();
         var_105.maximumVisitorsLimit = param1.readInteger();
         var_105.showOwnerName = param1.readInteger() == 1;
         var_105.allowFurniMoving = param1.readInteger() == 1;
         var_105.allowTrading = param1.readInteger() == 1;
         var_105.tags = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_105.tags.push(param1.readString());
            _loc3_++;
         }
         var_105.controllers = [];
         var _loc4_:int = param1.readInteger();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            var_105.controllers.push(new FlatControllerData(param1));
            _loc5_++;
         }
         var_105.controllerCount = param1.readInteger();
         var_105.allowPets = param1.readInteger() == 1;
         var_105.allowFoodConsume = param1.readInteger() == 1;
         return true;
      }
      
      public function flush() : Boolean
      {
         var_105 = null;
         return true;
      }
   }
}
