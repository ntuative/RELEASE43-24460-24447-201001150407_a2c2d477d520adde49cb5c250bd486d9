package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_2079:Boolean = false;
      
      private var var_2076:Boolean = false;
      
      private var var_2002:String = "";
      
      private var _type:String = "";
      
      private var var_2075:Boolean = false;
      
      private var var_1634:Number = 0;
      
      private var var_2074:Number = 0;
      
      private var var_2080:Number = 0;
      
      private var var_2077:String = "";
      
      private var var_1635:Number = 0;
      
      private var var_2078:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_2077 = param2;
         var_2002 = param3;
         var_2074 = param4;
         var_2080 = param5;
         var_1634 = param6;
         var_1635 = param7;
         var_2078 = param8;
         var_2076 = param9;
         var_2075 = param10;
         var_2079 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_2078;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_2079;
      }
      
      public function get localX() : Number
      {
         return var_1634;
      }
      
      public function get localY() : Number
      {
         return var_1635;
      }
      
      public function get canvasId() : String
      {
         return var_2077;
      }
      
      public function get altKey() : Boolean
      {
         return var_2076;
      }
      
      public function get spriteTag() : String
      {
         return var_2002;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_2074;
      }
      
      public function get screenY() : Number
      {
         return var_2080;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_2075;
      }
   }
}
