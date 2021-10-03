package com.sulake.habbo.widget.messages
{
   import flash.display.BitmapData;
   
   public class RoomWidgetSetToolbarIconMessage extends RoomWidgetMessage
   {
      
      public static const const_1215:String = "me_menu";
      
      public static const const_865:String = "RWCM_MESSAGE_SET_TOOLBAR_ICON";
       
      
      private var _icon:BitmapData;
      
      private var var_2157:String;
      
      public function RoomWidgetSetToolbarIconMessage(param1:String, param2:BitmapData)
      {
         super(const_865);
         var_2157 = param1;
         _icon = param2;
      }
      
      public function get icon() : BitmapData
      {
         return _icon;
      }
      
      public function get widgetType() : String
      {
         return var_2157;
      }
   }
}
