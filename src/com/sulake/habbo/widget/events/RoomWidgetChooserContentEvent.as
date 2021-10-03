package com.sulake.habbo.widget.events
{
   public class RoomWidgetChooserContentEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_468:String = "RWCCE_USER_CHOOSER_CONTENT";
      
      public static const const_378:String = "RWCCE_FURNI_CHOOSER_CONTENT";
       
      
      private var _items:Array;
      
      private var var_2038:Boolean;
      
      public function RoomWidgetChooserContentEvent(param1:String, param2:Array, param3:Boolean = false, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         _items = param2.slice();
         var_2038 = param3;
      }
      
      public function get items() : Array
      {
         return _items;
      }
      
      public function get isAnyRoomController() : Boolean
      {
         return var_2038;
      }
   }
}
