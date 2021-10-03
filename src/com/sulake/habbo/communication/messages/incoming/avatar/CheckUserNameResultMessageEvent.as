package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.avatar.CheckUserNameResultMessageParser;
   
   public class CheckUserNameResultMessageEvent extends MessageEvent implements IMessageEvent
   {
      
      public static var var_1044:int = 3;
      
      public static var var_1043:int = 5;
      
      public static var var_870:int = 0;
      
      public static var var_1039:int = 4;
      
      public static var var_1040:int = 2;
      
      public static var var_1042:int = 1;
       
      
      public function CheckUserNameResultMessageEvent(param1:Function)
      {
         super(param1,CheckUserNameResultMessageParser);
      }
      
      public function getParser() : CheckUserNameResultMessageParser
      {
         return var_21 as CheckUserNameResultMessageParser;
      }
   }
}
