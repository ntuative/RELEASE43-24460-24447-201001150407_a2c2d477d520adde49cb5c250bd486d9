package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_1421:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1484:String = "ROE_MOUSE_ENTER";
      
      public static const const_347:String = "ROE_MOUSE_MOVE";
      
      public static const const_1503:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_212:String = "ROE_MOUSE_CLICK";
      
      public static const const_449:String = "ROE_MOUSE_DOWN";
       
      
      private var var_2075:Boolean;
      
      private var var_2079:Boolean;
      
      private var var_2076:Boolean;
      
      private var var_2078:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param2,param3,param8,param9);
         var_2076 = param4;
         var_2078 = param5;
         var_2075 = param6;
         var_2079 = param7;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_2079;
      }
      
      public function get altKey() : Boolean
      {
         return var_2076;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_2078;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_2075;
      }
   }
}
