package com.sulake.core.window.graphics.renderer
{
   import flash.geom.Rectangle;
   
   public class SkinLayoutEntity implements ISkinLayoutEntity
   {
      
      public static const const_258:uint = 1;
      
      public static const const_349:uint = 0;
      
      public static const const_972:uint = 8;
      
      public static const const_251:uint = 4;
      
      public static const const_411:uint = 2;
       
      
      private var var_380:uint;
      
      private var var_1933:uint;
      
      private var _color:uint;
      
      private var _name:String;
      
      private var var_1932:uint;
      
      private var var_103:Rectangle;
      
      private var var_583:Array;
      
      private var _id:uint;
      
      public function SkinLayoutEntity(param1:uint, param2:String, param3:Rectangle, param4:uint = 4.294967295E9, param5:uint = 100, param6:uint = 0, param7:uint = 0)
      {
         super();
         _id = param1;
         _name = param2;
         var_103 = param3;
         _color = param4;
         var_380 = param5;
         var_1933 = param6;
         var_1932 = param7;
         var_583 = new Array();
      }
      
      public function get scaleH() : uint
      {
         return var_1933;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get blend() : uint
      {
         return var_380;
      }
      
      public function get scaleV() : uint
      {
         return var_1932;
      }
      
      public function get tags() : Array
      {
         return var_583;
      }
      
      public function get id() : uint
      {
         return _id;
      }
      
      public function dispose() : void
      {
         var_103 = null;
         var_583 = null;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get region() : Rectangle
      {
         return var_103;
      }
   }
}
