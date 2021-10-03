package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_536:String = "RWUAM_RESPECT_USER";
      
      public static const const_617:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_603:String = "RWUAM_START_TRADING";
      
      public static const const_520:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_731:String = "RWUAM_WHISPER_USER";
      
      public static const const_517:String = "RWUAM_IGNORE_USER";
      
      public static const const_404:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_702:String = "RWUAM_BAN_USER";
      
      public static const const_563:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_415:String = "RWUAM_KICK_USER";
      
      public static const const_543:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_640:String = " RWUAM_RESPECT_PET";
      
      public static const const_418:String = "RWUAM_KICK_BOT";
      
      public static const const_1168:String = "RWUAM_TRAIN_PET";
      
      public static const const_643:String = "RWUAM_PICKUP_PET";
      
      public static const const_673:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_506:String = "RWUAM_REPORT";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         _userId = param2;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
