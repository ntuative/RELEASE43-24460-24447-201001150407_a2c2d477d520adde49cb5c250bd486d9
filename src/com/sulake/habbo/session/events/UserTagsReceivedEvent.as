package com.sulake.habbo.session.events
{
   import flash.events.Event;
   
   public class UserTagsReceivedEvent extends Event
   {
      
      public static const const_143:String = "UTRE_USER_TAGS_RECEIVED";
       
      
      private var _userId:int;
      
      private var var_583:Array;
      
      public function UserTagsReceivedEvent(param1:int, param2:Array, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_143,param3,param4);
         _userId = param1;
         var_583 = param2;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get tags() : Array
      {
         return var_583;
      }
   }
}
