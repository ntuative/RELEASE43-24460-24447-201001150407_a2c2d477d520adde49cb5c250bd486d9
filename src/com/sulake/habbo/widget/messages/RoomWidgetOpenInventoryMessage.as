package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_912:String = "inventory_badges";
      
      public static const const_1237:String = "inventory_clothes";
      
      public static const const_1283:String = "inventory_furniture";
      
      public static const const_721:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_905:String = "inventory_effects";
       
      
      private var var_2102:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_721);
         var_2102 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_2102;
      }
   }
}
