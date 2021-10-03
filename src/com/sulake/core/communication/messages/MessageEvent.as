package com.sulake.core.communication.messages
{
   import com.sulake.core.communication.connection.IConnection;
   
   public class MessageEvent implements IMessageEvent
   {
       
      
      private var _parserClass:Class;
      
      protected var var_187:Function;
      
      protected var _connection:IConnection;
      
      protected var var_21:IMessageParser;
      
      public function MessageEvent(param1:Function, param2:Class)
      {
         super();
         var_187 = param1;
         _parserClass = param2;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get callback() : Function
      {
         return var_187;
      }
      
      public function dispose() : void
      {
         var_187 = null;
         _parserClass = null;
         _connection = null;
         var_21 = null;
      }
      
      public function get connection() : IConnection
      {
         return _connection;
      }
      
      public function set parser(param1:IMessageParser) : void
      {
         var_21 = param1;
      }
      
      public function get parserClass() : Class
      {
         return _parserClass;
      }
   }
}
