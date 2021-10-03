package com.sulake.habbo.toolbar
{
   public class StateItem
   {
       
      
      private var var_1168:Boolean;
      
      private var var_1676:String;
      
      private var _frames:XMLList;
      
      private var var_895:String = "-1";
      
      private var var_5:String;
      
      private var var_167:int = 120;
      
      private var var_1091:String = "-1";
      
      private var var_1092:String;
      
      private var var_1675:Boolean;
      
      private var var_1341:String = "-1";
      
      private var _id:String;
      
      public function StateItem(param1:XML, param2:String)
      {
         super();
         _id = param1.@id;
         if(param1.attribute("loop").length() > 0)
         {
            var_1168 = Boolean(param1.@loop);
         }
         if(param1.attribute("bounce").length() > 0)
         {
            var_1675 = Boolean(param1.@loop);
         }
         if(param1.attribute("timer").length() > 0)
         {
            var_167 = int(param1.@timer);
         }
         if(param1.attribute("namebase").length() > 0)
         {
            var_1092 = param1.@namebase;
         }
         else
         {
            var_1092 = param2;
         }
         if(param1.attribute("state_over").length() > 0)
         {
            var_895 = param1.@state_over;
         }
         if(param1.attribute("nextState").length() > 0)
         {
            var_1091 = param1.@nextState;
         }
         else
         {
            var_1091 = _id;
         }
         if(param1.attribute("state_default").length() > 0)
         {
            var_1341 = param1.@state_default;
         }
         if(param1.attribute("tooltip").length() > 0)
         {
            var_1676 = param1.@tooltip;
         }
         if(param1.attribute("background").length() > 0)
         {
            var_5 = param1.@background;
         }
         var _loc3_:XMLList = param1.elements("frame");
         if(_loc3_.length() > 0)
         {
            _frames = _loc3_;
         }
      }
      
      public function get hasStateOver() : Boolean
      {
         return var_895 != "-1";
      }
      
      public function get bounce() : Boolean
      {
         return var_1675;
      }
      
      public function get defaultState() : String
      {
         return var_1341;
      }
      
      public function get hasDefaultState() : Boolean
      {
         return var_1341 != "-1";
      }
      
      public function get tooltip() : String
      {
         return var_1676;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function get timer() : int
      {
         return var_167;
      }
      
      public function get loop() : Boolean
      {
         return var_1168;
      }
      
      public function get nextState() : String
      {
         return var_1091;
      }
      
      public function get frames() : XMLList
      {
         return _frames;
      }
      
      public function get background() : String
      {
         return var_5;
      }
      
      public function get stateOver() : String
      {
         return var_895;
      }
      
      public function get nameBase() : String
      {
         return var_1092;
      }
   }
}
