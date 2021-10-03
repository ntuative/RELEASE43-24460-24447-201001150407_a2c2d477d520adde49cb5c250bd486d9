package com.sulake.habbo.navigator.domain
{
   import com.sulake.core.window.IWindowContainer;
   
   public class RoomLayout
   {
       
      
      private var _view:IWindowContainer;
      
      private var _name:String;
      
      private var var_2064:int;
      
      private var var_2065:Boolean;
      
      public function RoomLayout(param1:Boolean, param2:int, param3:String)
      {
         super();
         var_2065 = param1;
         var_2064 = param2;
         _name = param3;
      }
      
      public function get hc() : Boolean
      {
         return var_2065;
      }
      
      public function get view() : IWindowContainer
      {
         return _view;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get tileSize() : int
      {
         return var_2064;
      }
      
      public function set view(param1:IWindowContainer) : void
      {
         _view = param1;
      }
   }
}
