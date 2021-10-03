package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_92:Number = 0;
      
      private var var_225:int = 0;
      
      private var var_1920:int = 0;
      
      private var var_2004:Number = 0;
      
      private var var_2007:Number = 0;
      
      private var var_2005:Number = 0;
      
      private var var_2008:Number = 0;
      
      private var var_2006:Boolean = false;
      
      private var var_91:Number = 0;
      
      private var _id:int = 0;
      
      private var var_192:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_192 = [];
         super();
         _id = param1;
         var_91 = param2;
         _y = param3;
         var_92 = param4;
         var_2008 = param5;
         var_225 = param6;
         var_1920 = param7;
         var_2004 = param8;
         var_2007 = param9;
         var_2005 = param10;
         var_2006 = param11;
         var_192 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_92;
      }
      
      public function get dir() : int
      {
         return var_225;
      }
      
      public function get localZ() : Number
      {
         return var_2008;
      }
      
      public function get isMoving() : Boolean
      {
         return var_2006;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_1920;
      }
      
      public function get targetX() : Number
      {
         return var_2004;
      }
      
      public function get targetY() : Number
      {
         return var_2007;
      }
      
      public function get targetZ() : Number
      {
         return var_2005;
      }
      
      public function get x() : Number
      {
         return var_91;
      }
      
      public function get actions() : Array
      {
         return var_192.slice();
      }
   }
}
