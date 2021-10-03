package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1255:String = "WN_CREATED";
      
      public static const const_968:String = "WN_DISABLE";
      
      public static const const_873:String = "WN_DEACTIVATED";
      
      public static const const_825:String = "WN_OPENED";
      
      public static const const_929:String = "WN_CLOSED";
      
      public static const const_903:String = "WN_DESTROY";
      
      public static const const_1449:String = "WN_ARRANGED";
      
      public static const const_474:String = "WN_PARENT_RESIZED";
      
      public static const const_901:String = "WN_ENABLE";
      
      public static const const_1003:String = "WN_RELOCATE";
      
      public static const const_966:String = "WN_FOCUS";
      
      public static const const_827:String = "WN_PARENT_RELOCATED";
      
      public static const const_399:String = "WN_PARAM_UPDATED";
      
      public static const const_595:String = "WN_PARENT_ACTIVATED";
      
      public static const const_238:String = "WN_RESIZED";
      
      public static const const_914:String = "WN_CLOSE";
      
      public static const const_954:String = "WN_PARENT_REMOVED";
      
      public static const const_259:String = "WN_CHILD_RELOCATED";
      
      public static const const_715:String = "WN_ENABLED";
      
      public static const const_237:String = "WN_CHILD_RESIZED";
      
      public static const const_853:String = "WN_MINIMIZED";
      
      public static const const_530:String = "WN_DISABLED";
      
      public static const const_187:String = "WN_CHILD_ACTIVATED";
      
      public static const const_356:String = "WN_STATE_UPDATED";
      
      public static const const_637:String = "WN_UNSELECTED";
      
      public static const const_475:String = "WN_STYLE_UPDATED";
      
      public static const const_1424:String = "WN_UPDATE";
      
      public static const const_471:String = "WN_PARENT_ADDED";
      
      public static const const_704:String = "WN_RESIZE";
      
      public static const const_656:String = "WN_CHILD_REMOVED";
      
      public static const const_1446:String = "";
      
      public static const const_781:String = "WN_RESTORED";
      
      public static const const_310:String = "WN_SELECTED";
      
      public static const const_982:String = "WN_MINIMIZE";
      
      public static const const_895:String = "WN_FOCUSED";
      
      public static const const_1267:String = "WN_LOCK";
      
      public static const const_275:String = "WN_CHILD_ADDED";
      
      public static const const_816:String = "WN_UNFOCUSED";
      
      public static const const_361:String = "WN_RELOCATED";
      
      public static const const_967:String = "WN_DEACTIVATE";
      
      public static const const_1152:String = "WN_CRETAE";
      
      public static const const_876:String = "WN_RESTORE";
      
      public static const const_307:String = "WN_ACTVATED";
      
      public static const const_1373:String = "WN_LOCKED";
      
      public static const const_444:String = "WN_SELECT";
      
      public static const const_785:String = "WN_MAXIMIZE";
      
      public static const const_867:String = "WN_OPEN";
      
      public static const const_502:String = "WN_UNSELECT";
      
      public static const const_1498:String = "WN_ARRANGE";
      
      public static const const_1148:String = "WN_UNLOCKED";
      
      public static const const_1532:String = "WN_UPDATED";
      
      public static const const_991:String = "WN_ACTIVATE";
      
      public static const const_1155:String = "WN_UNLOCK";
      
      public static const const_925:String = "WN_MAXIMIZED";
      
      public static const const_986:String = "WN_DESTROYED";
      
      public static const const_880:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1535,cancelable);
      }
   }
}
