package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_1727:int;
      
      private var var_1725:int;
      
      private var var_1730:int;
      
      private var _userName:String;
      
      private var var_1729:int;
      
      private var var_1726:int;
      
      private var var_1728:int;
      
      private var _userId:int;
      
      private var var_696:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_1726 = param1.readInteger();
         var_1729 = param1.readInteger();
         var_696 = param1.readBoolean();
         var_1730 = param1.readInteger();
         var_1725 = param1.readInteger();
         var_1727 = param1.readInteger();
         var_1728 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_1728;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_696;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_1729;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_1725;
      }
      
      public function get cautionCount() : int
      {
         return var_1727;
      }
      
      public function get cfhCount() : int
      {
         return var_1730;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_1726;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
