package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionUserFigureUpdateEvent extends RoomSessionEvent
   {
      
      public static const const_148:String = "RSUBE_FIGURE";
       
      
      private var var_520:String = "";
      
      private var _userId:int = 0;
      
      public function RoomSessionUserFigureUpdateEvent(param1:IRoomSession, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false)
      {
         super(const_148,param1,param4,param5);
         _userId = param2;
         var_520 = param3;
      }
      
      public function get figure() : String
      {
         return var_520;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
