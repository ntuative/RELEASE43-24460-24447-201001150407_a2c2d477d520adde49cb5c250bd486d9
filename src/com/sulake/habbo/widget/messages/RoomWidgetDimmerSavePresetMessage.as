package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_680:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_1824:int;
      
      private var var_1823:int;
      
      private var var_1825:Boolean;
      
      private var var_952:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_680);
         var_1823 = param1;
         var_1824 = param2;
         _color = param3;
         var_952 = param4;
         var_1825 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_1824;
      }
      
      public function get presetNumber() : int
      {
         return var_1823;
      }
      
      public function get brightness() : int
      {
         return var_952;
      }
      
      public function get apply() : Boolean
      {
         return var_1825;
      }
   }
}
