package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_587:String = "Rectangle";
      
      public static const const_54:String = "Boolean";
      
      public static const const_665:String = "Number";
      
      public static const const_58:String = "int";
      
      public static const const_172:String = "String";
      
      public static const const_621:String = "Point";
      
      public static const const_983:String = "Array";
      
      public static const const_904:String = "uint";
      
      public static const const_393:String = "hex";
      
      public static const const_831:String = "Map";
       
      
      private var var_554:String;
      
      private var var_181:Object;
      
      private var var_2231:Boolean;
      
      private var _type:String;
      
      private var var_2000:Boolean;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean)
      {
         super();
         var_554 = param1;
         var_181 = param2;
         _type = param3;
         var_2000 = param4;
         var_2231 = param3 == const_831 || param3 == const_983 || param3 == const_621 || param3 == const_587;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function toString() : String
      {
         switch(_type)
         {
            case const_393:
               return "0x" + uint(var_181).toString(16);
            case const_54:
               return Boolean(var_181) == true ? "true" : "com.sulake.habbo.inventory.recycler";
            case const_621:
               return "Point(" + Point(var_181).x + ", " + Point(var_181).y + ")";
            case const_587:
               return "Rectangle(" + Rectangle(var_181).x + ", " + Rectangle(var_181).y + ", " + Rectangle(var_181).width + ", " + Rectangle(var_181).height + ")";
            default:
               return String(value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(_type)
         {
            case const_831:
               _loc3_ = var_181 as Map;
               _loc1_ = "<var key=\"" + var_554 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_983:
               _loc4_ = var_181 as Array;
               _loc1_ = "<var key=\"" + var_554 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_621:
               _loc5_ = var_181 as Point;
               _loc1_ = "<var key=\"" + var_554 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_58 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_58 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_587:
               _loc6_ = var_181 as Rectangle;
               _loc1_ = "<var key=\"" + var_554 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_58 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_58 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_58 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_58 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_393:
               _loc1_ = "<var key=\"" + var_554 + "\" value=\"" + "0x" + uint(var_181).toString(16) + "\" type=\"" + _type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + var_554 + "\" value=\"" + var_181 + "\" type=\"" + _type + "\" />";
         }
         return _loc1_;
      }
      
      public function get value() : Object
      {
         return var_181;
      }
      
      public function get valid() : Boolean
      {
         return var_2000;
      }
      
      public function get key() : String
      {
         return var_554;
      }
   }
}
