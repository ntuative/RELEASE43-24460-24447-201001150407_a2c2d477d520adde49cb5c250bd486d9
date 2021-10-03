package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1592:int = 9;
      
      public static const const_1451:int = 4;
      
      public static const const_1584:int = 1;
      
      public static const const_1322:int = 10;
      
      public static const const_1548:int = 2;
      
      public static const const_1280:int = 7;
      
      public static const const_1232:int = 11;
      
      public static const const_1587:int = 3;
      
      public static const const_1197:int = 8;
      
      public static const const_1344:int = 5;
      
      public static const const_1531:int = 6;
      
      public static const const_1358:int = 12;
       
      
      private var var_1648:String;
      
      private var _roomId:int;
      
      private var var_1089:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_1648;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1089 = param1.readInteger();
         var_1648 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1089;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
