package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1337:String = "DisconnectReasonPeerConnectionLost";
      
      public static const const_884:String = "DisconnectReasonTimeout";
      
      public static const const_581:String = "DisconnectReasonDisconnected";
      
      public static const const_286:String = "DisconnectReasonBanned";
      
      public static const const_988:String = "DisconnectReasonLoggedOut";
      
      public static const const_936:String = "DisconnectReasonConcurrentLogin";
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : String
      {
         var _loc1_:int = (this.var_21 as DisconnectReasonParser).reason;
         switch(_loc1_)
         {
            case -1:
               return const_581;
            case 0:
               return const_581;
            case 1:
               return const_988;
            case 1009:
            case 2:
               return const_936;
            case 3:
               return const_884;
            case 4:
               return const_1337;
            default:
               return const_581;
         }
      }
   }
}
