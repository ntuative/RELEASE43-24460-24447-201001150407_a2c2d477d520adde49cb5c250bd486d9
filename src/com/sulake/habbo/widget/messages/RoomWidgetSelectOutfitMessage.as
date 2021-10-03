package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_845:String = "select_outfit";
       
      
      private var var_2155:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_845);
         var_2155 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_2155;
      }
   }
}
