package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_113:String = "RSPE_VOTE_RESULT";
      
      public static const const_120:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1243:int = 0;
      
      private var var_892:String = "";
      
      private var var_640:Array;
      
      private var var_996:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         var_996 = [];
         var_640 = [];
         super(param1,param2,param7,param8);
         var_892 = param3;
         var_996 = param4;
         var_640 = param5;
         if(var_640 == null)
         {
            var_640 = [];
         }
         var_1243 = param6;
      }
      
      public function get votes() : Array
      {
         return var_640.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1243;
      }
      
      public function get question() : String
      {
         return var_892;
      }
      
      public function get choices() : Array
      {
         return var_996.slice();
      }
   }
}
