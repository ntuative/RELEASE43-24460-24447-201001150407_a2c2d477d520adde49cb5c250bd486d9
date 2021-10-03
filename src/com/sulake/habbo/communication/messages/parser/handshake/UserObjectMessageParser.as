package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_520:String;
      
      private var var_2239:String;
      
      private var var_2235:int;
      
      private var var_2236:int;
      
      private var var_1123:String;
      
      private var var_1154:String;
      
      private var _name:String;
      
      private var var_455:int;
      
      private var var_765:int;
      
      private var var_2237:int;
      
      private var _respectTotal:int;
      
      private var var_2238:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2236;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1154;
      }
      
      public function get customData() : String
      {
         return this.var_2239;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_455;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2235;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2238;
      }
      
      public function get figure() : String
      {
         return this.var_520;
      }
      
      public function get respectTotal() : int
      {
         return this._respectTotal;
      }
      
      public function get sex() : String
      {
         return this.var_1123;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_520 = param1.readString();
         this.var_1123 = param1.readString();
         this.var_2239 = param1.readString();
         this.var_1154 = param1.readString();
         this.var_2237 = param1.readInteger();
         this.var_2238 = param1.readString();
         this.var_2235 = param1.readInteger();
         this.var_2236 = param1.readInteger();
         this._respectTotal = param1.readInteger();
         this.var_765 = param1.readInteger();
         this.var_455 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2237;
      }
      
      public function get respectLeft() : int
      {
         return this.var_765;
      }
   }
}
