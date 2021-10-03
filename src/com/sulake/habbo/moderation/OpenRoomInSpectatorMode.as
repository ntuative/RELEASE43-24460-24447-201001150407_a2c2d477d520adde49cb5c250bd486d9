package com.sulake.habbo.moderation
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.navigator.GetPublicSpaceCastLibsMessageComposer;
   
   public class OpenRoomInSpectatorMode
   {
       
      
      private var var_1502:Boolean;
      
      private var _roomId:int;
      
      private var var_57:ModerationManager;
      
      public function OpenRoomInSpectatorMode(param1:ModerationManager, param2:IWindow, param3:Boolean, param4:int)
      {
         super();
         var_57 = param1;
         var_1502 = param3;
         _roomId = param4;
         param2.procedure = onClick;
      }
      
      private function onClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(var_1502)
         {
            var_57.connection.send(new GetPublicSpaceCastLibsMessageComposer(_roomId));
         }
         else
         {
            var_57.goToRoom(_roomId);
         }
      }
   }
}
