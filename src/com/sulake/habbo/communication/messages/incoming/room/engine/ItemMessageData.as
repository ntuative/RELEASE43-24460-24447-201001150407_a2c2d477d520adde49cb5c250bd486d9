package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var var_92:Number = 0;
      
      private var _data:String = "";
      
      private var var_1331:int = 0;
      
      private var _state:int = 0;
      
      private var _type:int = 0;
      
      private var _y:Number = 0;
      
      private var var_1631:Boolean = false;
      
      private var var_2271:String = "";
      
      private var _id:int = 0;
      
      private var var_206:Boolean = false;
      
      private var var_225:String = "";
      
      private var var_1632:int = 0;
      
      private var var_1633:int = 0;
      
      private var var_1634:int = 0;
      
      private var var_1635:int = 0;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         _id = param1;
         _type = param2;
         var_1631 = param3;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_206)
         {
            _y = param1;
         }
      }
      
      public function get isOldFormat() : Boolean
      {
         return var_1631;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_206)
         {
            _type = param1;
         }
      }
      
      public function get dir() : String
      {
         return var_225;
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!var_206)
         {
            var_1634 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!var_206)
         {
            var_1632 = param1;
         }
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!var_206)
         {
            var_1633 = param1;
         }
      }
      
      public function set dir(param1:String) : void
      {
         if(!var_206)
         {
            var_225 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!var_206)
         {
            var_1635 = param1;
         }
      }
      
      public function set state(param1:int) : void
      {
         if(!var_206)
         {
            _state = param1;
         }
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get localX() : Number
      {
         return var_1634;
      }
      
      public function set data(param1:String) : void
      {
         if(!var_206)
         {
            _data = param1;
         }
      }
      
      public function get wallX() : Number
      {
         return var_1632;
      }
      
      public function get wallY() : Number
      {
         return var_1633;
      }
      
      public function get localY() : Number
      {
         return var_1635;
      }
      
      public function setReadOnly() : void
      {
         var_206 = true;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_92;
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_206)
         {
            var_92 = param1;
         }
      }
   }
}
