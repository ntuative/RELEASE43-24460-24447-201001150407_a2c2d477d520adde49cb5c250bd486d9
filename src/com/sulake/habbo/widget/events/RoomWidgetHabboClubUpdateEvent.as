package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_189:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2170:Boolean = false;
      
      private var var_2172:int = 0;
      
      private var var_2169:int = 0;
      
      private var var_2171:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_189,param5,param6);
         var_2171 = param1;
         var_2169 = param2;
         var_2172 = param3;
         var_2170 = param4;
      }
      
      public function get pastPeriods() : int
      {
         return var_2172;
      }
      
      public function get periodsLeft() : int
      {
         return var_2169;
      }
      
      public function get daysLeft() : int
      {
         return var_2171;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_2170;
      }
   }
}
