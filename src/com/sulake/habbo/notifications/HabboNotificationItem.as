package com.sulake.habbo.notifications
{
   public class HabboNotificationItem
   {
       
      
      private var var_86:HabboNotificationItemStyle;
      
      private var var_35:String;
      
      private var var_43:HabboNotifications;
      
      public function HabboNotificationItem(param1:String, param2:HabboNotificationItemStyle, param3:HabboNotifications)
      {
         super();
         var_35 = param1;
         var_86 = param2;
         var_43 = param3;
      }
      
      public function ExecuteUiLinks() : void
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_86.componentLinks;
         for each(_loc2_ in _loc1_)
         {
            if(var_43 != null)
            {
               var_43.onExecuteLink(_loc2_);
            }
         }
      }
      
      public function get style() : HabboNotificationItemStyle
      {
         return var_86;
      }
      
      public function get content() : String
      {
         return var_35;
      }
   }
}
