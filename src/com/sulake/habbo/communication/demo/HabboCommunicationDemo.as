package com.sulake.habbo.communication.demo
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.ICoreCommunicationManager;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.encryption.CryptoTools;
   import com.sulake.core.communication.encryption.IEncryption;
   import com.sulake.core.communication.handshake.DiffieHellman;
   import com.sulake.core.communication.handshake.IKeyExchange;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IIDLogger;
   import com.sulake.core.runtime.ILogger;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.encryption.PseudoRandom;
   import com.sulake.habbo.communication.encryption.RC4_R27;
   import com.sulake.habbo.communication.enum.HabboCommunicationEvent;
   import com.sulake.habbo.communication.enum.HabboConnectionType;
   import com.sulake.habbo.communication.messages.incoming.error.ErrorReportEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.AuthenticationOKMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.DisconnectReasonEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.GenericErrorEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.HelloMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.InitCryptoMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.PingMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.SecretKeyEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.SessionParamsMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UniqueMachineIDEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
   import com.sulake.habbo.communication.messages.incoming.room.engine.RoomEntryInfoMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.handshake.GenerateSecretKeyMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.handshake.GetSessionParametersMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.handshake.InfoRetrieveMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.handshake.InitCryptoMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.handshake.PongMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.handshake.SSOTicketMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.handshake.TryLoginMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.handshake.UniqueIDMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.handshake.VersionCheckMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.users.ScrGetUserInfoMessageComposer;
   import com.sulake.habbo.communication.messages.parser.error.ErrorReportMessageParser;
   import com.sulake.habbo.communication.messages.parser.handshake.GenericErrorParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.configuration.enum.HabboConfigurationEvent;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.net.SharedObject;
   import flash.utils.ByteArray;
   import iid.IIDHabboWindowManager;
   
   public class HabboCommunicationDemo extends Component
   {
       
      
      private var var_178:HabboHotelView;
      
      private var var_1875:Boolean;
      
      private var _view:HabboLoginDemoView;
      
      private var var_958:Boolean;
      
      private var var_34:IRoomSessionManager;
      
      private var var_1877:PseudoRandom;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _habboConfiguration:IHabboConfigurationManager;
      
      private var var_1424:ILogger;
      
      private var var_1171:String;
      
      private var var_1876:String;
      
      private const const_1403:String = "fuselogin";
      
      private var var_650:ICoreCommunicationManager;
      
      private var var_458:IKeyExchange;
      
      private var var_959:String = "";
      
      private var var_960:String;
      
      private var var_644:String;
      
      private var var_76:IHabboCommunicationManager;
      
      public function HabboCommunicationDemo(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         if(param1 is CoreComponent)
         {
            (param1 as CoreComponent).events.addEventListener(Component.COMPONENT_EVENT_RUNNING,onComponentsRunning);
         }
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
         queueInterface(new IIDHabboCommunicationManager(),onHabboCommunication);
         queueInterface(new IIDLogger(),receiveLoggerInterface);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
      }
      
      private static function xor(param1:String, param2:String) : String
      {
         var _loc6_:* = 0;
         var _loc3_:String = "";
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            _loc6_ = uint(param1.charCodeAt(_loc5_));
            _loc3_ += String.fromCharCode(_loc6_ ^ param2.charCodeAt(_loc4_));
            _loc4_++;
            if(_loc4_ == param2.length)
            {
               _loc4_ = 0;
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      private static function decode(param1:ByteArray, param2:uint, param3:uint, param4:Point, param5:Point) : String
      {
         var _loc12_:int = 0;
         var _loc13_:* = 0;
         var _loc14_:int = 0;
         var _loc15_:* = 0;
         var _loc16_:* = 0;
         var _loc6_:String = "";
         var _loc7_:int = 0;
         var _loc8_:* = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         if(param3 == 4)
         {
            _loc10_ = 1;
         }
         var _loc11_:int = param4.y;
         while(_loc11_ < param4.y + param5.y)
         {
            _loc12_ = param4.x;
            while(_loc12_ < param4.x + param5.x)
            {
               _loc13_ = uint(((_loc11_ + _loc9_) * param2 + _loc12_) * param3);
               _loc14_ = _loc10_;
               while(_loc14_ < param3)
               {
                  param1.position = _loc13_ + _loc14_;
                  _loc15_ = uint(param1.readUnsignedByte());
                  _loc16_ = uint(_loc15_ & 1);
                  _loc8_ |= _loc16_ << 7 - _loc7_;
                  if(_loc7_ == 7)
                  {
                     _loc6_ += String.fromCharCode(_loc8_);
                     _loc8_ = 0;
                     _loc7_ = 0;
                  }
                  else
                  {
                     _loc7_++;
                  }
                  _loc14_++;
               }
               if(_loc12_ % 2 == 0)
               {
                  _loc9_++;
               }
               _loc12_++;
            }
            _loc9_ = 0;
            _loc11_++;
         }
         return _loc6_;
      }
      
      public function get habboConfiguration() : IHabboConfigurationManager
      {
         return _habboConfiguration;
      }
      
      private function onDisconnectReason(param1:IMessageEvent) : void
      {
         var _loc2_:String = (param1 as DisconnectReasonEvent).reason;
         var _loc3_:String = "";
         if(var_958)
         {
            dispatchLoginStepEvent(HabboCommunicationEvent.const_19);
         }
         switch(_loc2_)
         {
            case DisconnectReasonEvent.const_286:
               _loc3_ = _habboConfiguration.getKey("logout.banned.url");
               break;
            case DisconnectReasonEvent.const_936:
               _loc3_ = _habboConfiguration.getKey("logout.concurrent.url");
               break;
            case DisconnectReasonEvent.const_988:
               _loc3_ = _habboConfiguration.getKey("logout.url");
               break;
            case DisconnectReasonEvent.const_884:
               _loc3_ = _habboConfiguration.getKey("logout.timeout.url");
               break;
            default:
               _loc3_ = _habboConfiguration.getKey("logout.disconnect.url");
         }
         if(_loc3_.length == 0)
         {
            _loc3_ = _habboConfiguration.getKey("logout.disconnect.url");
         }
         var_1875 = true;
         if(_loc3_.length > 0)
         {
            _loc3_ = setOriginProperty(_loc3_);
            HabboWebTools.openWebPage(_loc3_,"_self");
         }
      }
      
      private function onConnectionDisconnected(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(var_958)
         {
            dispatchLoginStepEvent(HabboCommunicationEvent.const_19);
         }
         if(param1.type == Event.CLOSE && !var_1875)
         {
            _loc2_ = _habboConfiguration.getKey("logout.disconnect.url");
            if(_habboConfiguration.keyExists("facebook.user"))
            {
               _loc3_ = _loc2_.indexOf("?") == -1 ? "?" : "&";
               _loc2_ = _loc2_ + _loc3_ + "facebookuser=1";
            }
            _loc2_ = setOriginProperty(_loc2_);
            HabboWebTools.openWebPage(_loc2_,"_self");
         }
      }
      
      private function onSessionParamsEvent(param1:IMessageEvent) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var_958 = false;
         var _loc2_:IConnection = param1.connection;
         var _loc3_:SessionParamsMessageEvent = param1 as SessionParamsMessageEvent;
         if(var_644 != null)
         {
            _loc4_ = new SSOTicketMessageComposer(var_644);
            _loc2_.send(_loc4_);
            dispatchLoginStepEvent(HabboCommunicationEvent.const_12);
         }
         else if(_view != null)
         {
            _loc5_ = "null";
            _loc6_ = "null";
            if(_loc5_.length > 0 && _loc6_.length > 0)
            {
               _loc7_ = new TryLoginMessageComposer(_loc5_,_loc6_);
               _loc2_.send(_loc7_);
               dispatchLoginStepEvent(HabboCommunicationEvent.const_12);
            }
         }
         else
         {
            Logger.log("[HabboCommunicationDemo] Error, no login window nor ticket");
         }
      }
      
      private function sendConnectionParameters(param1:IConnection) : void
      {
         var_958 = true;
         dispatchLoginStepEvent(HabboCommunicationEvent.const_13);
         param1.send(new VersionCheckMessageComposer(401,var_1171,var_1876));
         var _loc2_:String = "";
         var _loc3_:SharedObject = SharedObject.getLocal(const_1403,"/");
         if(_loc3_.data.machineid != null)
         {
            _loc2_ = _loc3_.data.machineid;
         }
         param1.send(new UniqueIDMessageComposer(_loc2_));
         param1.send(new GetSessionParametersMessageComposer());
      }
      
      public function set shockwaveClientUrl(param1:String) : void
      {
         var_1171 = param1;
      }
      
      private function onErrorReport(param1:IMessageEvent) : void
      {
         var event:IMessageEvent = param1;
         var parser:ErrorReportMessageParser = (event as ErrorReportEvent).getParser();
         var errorCode:int = parser.errorCode;
         var messageId:int = parser.messageId;
         var time:String = parser.timestamp;
         out("ERRORREPORT: Error code " + errorCode + " / Message id " + messageId);
         Logger.log("SERVER ERROR! Error code:" + errorCode + "Message id:" + messageId);
         _windowManager.registerLocalizationParameter("connection.server.error.desc","errorCode",String(errorCode));
         _windowManager.alert("${connection.server.error.title}","${connection.server.error.desc}",0,function(param1:IAlertDialog, param2:Event):void
         {
            param1.dispose();
         });
      }
      
      private function onSecretKeyEvent(param1:IMessageEvent) : void
      {
         var _loc2_:IConnection = param1.connection;
         var _loc3_:SecretKeyEvent = param1 as SecretKeyEvent;
         var _loc4_:String = _loc3_.serverPublicKey;
         var_458.generateSharedKey(_loc4_,10);
         var _loc5_:String = var_458.getSharedKey(16).toUpperCase();
         var _loc6_:RC4_R27 = new RC4_R27(null,null);
         var _loc7_:IEncryption = new RC4_R27(_loc6_,var_1877);
         var _loc8_:ByteArray = CryptoTools.hexStringToByteArray(_loc5_);
         _loc8_.position = 0;
         _loc6_.init(_loc8_);
         _loc8_.position = 0;
         _loc7_.initFromState(_loc6_);
         _loc2_.setEncryption(_loc7_);
         sendConnectionParameters(_loc2_);
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      private function onUniqueMachineId(param1:UniqueMachineIDEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:SharedObject = SharedObject.getLocal(const_1403,"/");
         _loc2_.data.machineid = param1.machineID;
         _loc2_.flush();
      }
      
      private function setOriginProperty(param1:String) : String
      {
         if(param1.indexOf("%origin%") != -1)
         {
            return param1.replace("%origin%",_habboConfiguration.getKey("flash.client.origin","popup"));
         }
         return param1;
      }
      
      private function onComponentsRunning(param1:Event = null) : void
      {
         var_644 = _habboConfiguration.getKey("sso.ticket",null);
         var_1171 = _habboConfiguration.getKey("flash.client.url","");
         var_1876 = _habboConfiguration.getKey("external.variables.txt","");
         if(var_178 == null)
         {
            var_178 = new HabboHotelView(_windowManager,assets,Component(context).events);
         }
         if(var_644 != null)
         {
            var_76.mode = HabboConnectionType.const_454;
            var_76.initConnection(HabboConnectionType.const_268);
         }
      }
      
      private function receiveLoggerInterface(param1:IID, param2:IUnknown) : void
      {
         var_1424 = param2 as ILogger;
      }
      
      override public function dispose() : void
      {
         if(_view != null)
         {
            _view.dispose();
            _view = null;
         }
         if(var_178 != null)
         {
            var_178.dispose();
            var_178 = null;
         }
      }
      
      private function onRoomEntryInfoEvent(param1:RoomEntryInfoMessageEvent) : void
      {
         if(var_178)
         {
            if(true)
            {
               var_178.hide();
            }
         }
      }
      
      private function showHotelView() : void
      {
         if(var_178)
         {
            if(true)
            {
               var_178.show();
            }
         }
      }
      
      private function onHelloEvent(param1:IMessageEvent) : void
      {
      }
      
      private function onHabboCommunication(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:* = null;
         if(param2 != null)
         {
            var_76 = param2 as IHabboCommunicationManager;
            _loc3_ = var_76.getHabboMainConnection(null);
            if(_loc3_ != null)
            {
               _loc3_.addEventListener(Event.CONNECT,onConnectionEstablished);
               _loc3_.addEventListener(Event.CLOSE,onConnectionDisconnected);
            }
            var_76.addHabboConnectionMessageEvent(new HelloMessageEvent(onHelloEvent));
            var_76.addHabboConnectionMessageEvent(new InitCryptoMessageEvent(onInitCrypto));
            var_76.addHabboConnectionMessageEvent(new SecretKeyEvent(onSecretKeyEvent));
            var_76.addHabboConnectionMessageEvent(new SessionParamsMessageEvent(onSessionParamsEvent));
            var_76.addHabboConnectionMessageEvent(new AuthenticationOKMessageEvent(onAuthenticationOK));
            var_76.addHabboConnectionMessageEvent(new PingMessageEvent(onPing));
            var_76.addHabboConnectionMessageEvent(new ErrorReportEvent(onErrorReport));
            var_76.addHabboConnectionMessageEvent(new UserObjectEvent(onUserObject));
            var_76.addHabboConnectionMessageEvent(new GenericErrorEvent(onGenericError));
            var_76.addHabboConnectionMessageEvent(new DisconnectReasonEvent(onDisconnectReason));
            var_76.addHabboConnectionMessageEvent(new RoomEntryInfoMessageEvent(onRoomEntryInfoEvent));
            var_76.addHabboConnectionMessageEvent(new UniqueMachineIDEvent(onUniqueMachineId));
         }
      }
      
      private function onUserObject(param1:IMessageEvent) : void
      {
         param1.connection.send(new ScrGetUserInfoMessageComposer("habbo_club"));
      }
      
      private function onConnectionEstablished(param1:Event = null) : void
      {
         var _loc3_:* = null;
         var _loc2_:IConnection = var_76.getHabboMainConnection(null);
         if(_loc2_ != null)
         {
            dispatchLoginStepEvent(HabboCommunicationEvent.const_542);
            _loc3_ = new InitCryptoMessageComposer(var_76.mode);
            _loc2_.send(_loc3_);
         }
      }
      
      private function onInitCrypto(param1:IMessageEvent) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc2_:IConnection = param1.connection;
         var _loc3_:InitCryptoMessageEvent = param1 as InitCryptoMessageEvent;
         var _loc4_:String = _loc3_.token;
         var _loc5_:Boolean = _loc3_.isServerEncrypted;
         var_1877 = new PseudoRandom(parseInt(_loc4_.substring(_loc4_.length - 4),16),65536);
         switch(var_76.mode)
         {
            case HabboConnectionType.const_454:
               _loc6_ = "";
               _loc6_ = _habboConfiguration.getKey("url.prefix",_loc6_);
               _loc6_ = _loc6_.replace("http://","");
               _loc6_ = _loc6_.replace("https://","");
               _loc7_ = _habboConfiguration.getKey("hotelview.banner.url","http:/\nsitename$/gamedata/banner");
               _loc7_ = _loc7_.replace("$sitename$",_loc6_);
               var_959 = _loc4_;
               var_178.loadBannerImage(_loc7_ + "?token=" + var_959,onHotelViewBannerLoaded);
               break;
            case HabboConnectionType.const_1348:
               sendConnectionParameters(_loc2_);
               break;
            case HabboConnectionType.const_1165:
               var_960 = generateRandomHexString(30);
               var_458 = new DiffieHellman(new BigInteger(_habboConfiguration.getKey("connection.development.prime"),16),new BigInteger(_habboConfiguration.getKey("connection.development.generator"),16));
               var_458.init(var_960);
               _loc8_ = var_458.getPublicKey(10);
               _loc2_.send(new GenerateSecretKeyMessageComposer(_loc8_.toUpperCase()));
               break;
            default:
               Logger.log("[HabboCommunicationDemo] Unknown Connection Mode: undefined");
         }
      }
      
      private function onConfigurationLoaded(param1:Event = null) : void
      {
         var_178 = new HabboHotelView(_windowManager,assets,Component(context).events);
         var _loc2_:String = _habboConfiguration.getKey("client.hotel_view.image");
         var _loc3_:String = _habboConfiguration.getKey("image.library.url");
         if(_loc2_ != null && _loc3_ != null)
         {
            var_178.loadHotelViewImage(_loc3_ + _loc2_);
         }
      }
      
      private function onWindowManagerReady(param1:IID, param2:IUnknown) : void
      {
         _windowManager = param2 as IHabboWindowManager;
         queueInterface(new IIDHabboConfigurationManager(),onHabboConfigurationInit);
      }
      
      private function onHotelViewBannerLoaded(param1:BitmapData) : void
      {
         var _loc2_:ByteArray = param1.getPixels(param1.rect);
         var _loc3_:String = decode(_loc2_,param1.width,4,new Point(4,39),new Point(80,30));
         var _loc4_:String = xor(_loc3_,var_959);
         var _loc5_:uint = _loc4_.charCodeAt(0);
         var _loc6_:uint = _loc4_.charCodeAt(_loc5_ + 1);
         var _loc7_:String = _loc4_.substr(1,_loc5_);
         var _loc8_:String = _loc4_.substr(_loc5_ + 2,_loc6_);
         var _loc9_:IConnection = var_76.getHabboMainConnection(null);
         var _loc10_:BigInteger = new BigInteger();
         var _loc11_:BigInteger = new BigInteger();
         var _loc12_:String = "";
         _loc10_.fromRadix(_loc7_,10);
         _loc11_.fromRadix(_loc8_,10);
         var_458 = new DiffieHellman(_loc10_,_loc11_);
         var _loc13_:int = 100;
         while(_loc12_.length < 64)
         {
            var_960 = generateRandomHexString(30);
            var_458.init(var_960);
            _loc12_ = var_458.getPublicKey(10);
            _loc13_--;
            if(_loc13_ == 0)
            {
            }
         }
         _loc9_.send(new GenerateSecretKeyMessageComposer(_loc12_.toUpperCase()));
         var_959 = "";
      }
      
      private function onInitConnection(param1:Event = null) : void
      {
         dispatchLoginStepEvent(HabboCommunicationEvent.INIT);
         if(var_644 != null)
         {
            var_76.mode = HabboConnectionType.const_454;
         }
         else
         {
            var_76.mode = HabboConnectionType.const_454;
         }
         var_76.initConnection(HabboConnectionType.const_268);
      }
      
      public function out(param1:String) : void
      {
         if(var_1424 != null)
         {
            var_1424.out(param1);
         }
      }
      
      private function onAuthenticationOK(param1:IMessageEvent) : void
      {
         var _loc2_:IConnection = param1.connection;
         var _loc3_:AuthenticationOKMessageEvent = param1 as AuthenticationOKMessageEvent;
         out("Authentication success!");
         var _loc4_:InfoRetrieveMessageComposer = new InfoRetrieveMessageComposer();
         _loc2_.send(_loc4_);
         if(_view != null)
         {
            _view.closeLoginWindow();
         }
         dispatchLoginStepEvent(HabboCommunicationEvent.const_21);
      }
      
      private function generateRandomHexString(param1:uint = 16) : String
      {
         var _loc4_:* = 0;
         var _loc2_:String = "";
         var _loc3_:int = 0;
         while(_loc3_ < param1)
         {
            _loc4_ = uint(uint(Math.random() * 255));
            _loc2_ += _loc4_.toString(16);
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function dispatchLoginStepEvent(param1:String) : void
      {
         if(Component(context) == null || Component(context).events == null)
         {
            return;
         }
         Component(context).events.dispatchEvent(new Event(param1));
      }
      
      public function get habboCommunication() : IHabboCommunicationManager
      {
         return var_76;
      }
      
      private function onRoomSessionEnded(param1:RoomSessionEvent) : void
      {
         if(true)
         {
            showHotelView();
         }
      }
      
      private function onHabboConfigurationInit(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 != null)
         {
            _habboConfiguration = param2 as IHabboConfigurationManager;
            Component(_habboConfiguration).events.addEventListener(HabboConfigurationEvent.const_17,onConfigurationLoaded);
         }
      }
      
      private function onGenericError(param1:IMessageEvent) : void
      {
         var event:IMessageEvent = param1;
         var parser:GenericErrorParser = (event as GenericErrorEvent).getParser();
         switch(parser.errorCode)
         {
            case -3:
               _windowManager.alert("${connection.error.id.title}","${connection.login.error.-3.desc}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               break;
            case -400:
               _windowManager.alert("${connection.error.id.title}","${connection.login.error.-400.desc}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
         }
      }
      
      private function onPing(param1:IMessageEvent) : void
      {
         var _loc2_:IConnection = param1.connection;
         var _loc3_:PingMessageEvent = param1 as PingMessageEvent;
         var _loc4_:PongMessageComposer = new PongMessageComposer();
         _loc2_.send(_loc4_);
      }
      
      private function onRoomSessionManagerReady(param1:IID, param2:IUnknown) : void
      {
         var_34 = param2 as IRoomSessionManager;
         var_34.events.addEventListener(RoomSessionEvent.const_99,onRoomSessionEnded);
      }
      
      public function set ssoTicket(param1:String) : void
      {
         var_644 = param1;
      }
      
      public function get communicationManager() : ICoreCommunicationManager
      {
         return var_650;
      }
   }
}
