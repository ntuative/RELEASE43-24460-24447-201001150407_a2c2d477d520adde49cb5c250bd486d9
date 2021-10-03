package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1284:String = "F";
      
      public static const const_870:String = "M";
       
      
      private var var_91:Number = 0;
      
      private var var_520:String = "";
      
      private var var_2112:int = 0;
      
      private var var_2114:String = "";
      
      private var var_2111:int = 0;
      
      private var var_1742:int = 0;
      
      private var var_2113:String = "";
      
      private var var_1123:String = "";
      
      private var _id:int = 0;
      
      private var var_206:Boolean = false;
      
      private var var_225:int = 0;
      
      private var var_2110:String = "";
      
      private var _name:String = "";
      
      private var var_1747:int = 0;
      
      private var _y:Number = 0;
      
      private var var_92:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_92;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_225;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_206)
         {
            var_225 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_206)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_2112;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_206)
         {
            var_2111 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_2110;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_206)
         {
            var_2113 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_206)
         {
            var_2110 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_206)
         {
            var_1742 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_206)
         {
            var_520 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_206)
         {
            var_2112 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_206)
         {
            var_1123 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_2111;
      }
      
      public function get groupID() : String
      {
         return var_2113;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_206)
         {
            var_1747 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_206)
         {
            var_2114 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_206 = true;
      }
      
      public function get sex() : String
      {
         return var_1123;
      }
      
      public function get figure() : String
      {
         return var_520;
      }
      
      public function get webID() : int
      {
         return var_1747;
      }
      
      public function get custom() : String
      {
         return var_2114;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_206)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_206)
         {
            var_92 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_206)
         {
            var_91 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_91;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_1742;
      }
   }
}
