package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_113:String = "RWPUE_VOTE_RESULT";
      
      public static const const_120:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1243:int;
      
      private var var_892:String;
      
      private var var_640:Array;
      
      private var var_996:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_892 = param2;
         var_996 = param3;
         var_640 = param4;
         if(var_640 == null)
         {
            var_640 = [];
         }
         var_1243 = param5;
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
