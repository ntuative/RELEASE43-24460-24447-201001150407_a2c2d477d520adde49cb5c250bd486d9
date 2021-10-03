package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_282:String = "WE_CHILD_RESIZED";
      
      public static const const_1163:String = "WE_CLOSE";
      
      public static const const_1274:String = "WE_DESTROY";
      
      public static const const_156:String = "WE_CHANGE";
      
      public static const const_1188:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1465:String = "WE_PARENT_RESIZE";
      
      public static const const_88:String = "WE_UPDATE";
      
      public static const const_1278:String = "WE_MAXIMIZE";
      
      public static const const_367:String = "WE_DESTROYED";
      
      public static const const_946:String = "WE_UNSELECT";
      
      public static const const_1227:String = "WE_MAXIMIZED";
      
      public static const const_1500:String = "WE_UNLOCKED";
      
      public static const const_362:String = "WE_CHILD_REMOVED";
      
      public static const const_151:String = "WE_OK";
      
      public static const const_43:String = "WE_RESIZED";
      
      public static const const_1325:String = "WE_ACTIVATE";
      
      public static const const_257:String = "WE_ENABLED";
      
      public static const const_426:String = "WE_CHILD_RELOCATED";
      
      public static const const_1290:String = "WE_CREATE";
      
      public static const const_598:String = "WE_SELECT";
      
      public static const const_167:String = "";
      
      public static const const_1427:String = "WE_LOCKED";
      
      public static const const_1514:String = "WE_PARENT_RELOCATE";
      
      public static const const_1583:String = "WE_CHILD_REMOVE";
      
      public static const const_1522:String = "WE_CHILD_RELOCATE";
      
      public static const const_1504:String = "WE_LOCK";
      
      public static const const_241:String = "WE_FOCUSED";
      
      public static const const_554:String = "WE_UNSELECTED";
      
      public static const const_941:String = "WE_DEACTIVATED";
      
      public static const const_1185:String = "WE_MINIMIZED";
      
      public static const const_1473:String = "WE_ARRANGED";
      
      public static const const_1474:String = "WE_UNLOCK";
      
      public static const const_1448:String = "WE_ATTACH";
      
      public static const const_1178:String = "WE_OPEN";
      
      public static const const_1372:String = "WE_RESTORE";
      
      public static const const_1475:String = "WE_PARENT_RELOCATED";
      
      public static const const_1194:String = "WE_RELOCATE";
      
      public static const const_1589:String = "WE_CHILD_RESIZE";
      
      public static const const_1457:String = "WE_ARRANGE";
      
      public static const const_1128:String = "WE_OPENED";
      
      public static const const_1236:String = "WE_CLOSED";
      
      public static const const_1461:String = "WE_DETACHED";
      
      public static const const_1535:String = "WE_UPDATED";
      
      public static const const_1311:String = "WE_UNFOCUSED";
      
      public static const const_386:String = "WE_RELOCATED";
      
      public static const const_1254:String = "WE_DEACTIVATE";
      
      public static const const_213:String = "WE_DISABLED";
      
      public static const const_607:String = "WE_CANCEL";
      
      public static const const_592:String = "WE_ENABLE";
      
      public static const const_1339:String = "WE_ACTIVATED";
      
      public static const const_1244:String = "WE_FOCUS";
      
      public static const const_1445:String = "WE_DETACH";
      
      public static const const_1196:String = "WE_RESTORED";
      
      public static const const_1362:String = "WE_UNFOCUS";
      
      public static const const_56:String = "WE_SELECTED";
      
      public static const const_1147:String = "WE_PARENT_RESIZED";
      
      public static const const_1141:String = "WE_CREATED";
      
      public static const const_1590:String = "WE_ATTACHED";
      
      public static const const_1291:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1535:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1307:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1535 = param3;
         var_1307 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1307;
      }
      
      public function get related() : IWindow
      {
         return var_1535;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1307 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
