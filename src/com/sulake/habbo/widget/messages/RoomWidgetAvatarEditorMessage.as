package com.sulake.habbo.widget.messages
{
   import com.sulake.core.window.IWindowContainer;
   
   public class RoomWidgetAvatarEditorMessage extends RoomWidgetMessage
   {
      
      public static const const_631:String = "RWAEM_AVATAR_EDITOR_VIEW_DISPOSED";
      
      public static const const_669:String = "RWCM_OPEN_AVATAR_EDITOR";
      
      public static const const_1243:String = "RWCM_GET_WARDROBE";
       
      
      private var var_29:IWindowContainer;
      
      public function RoomWidgetAvatarEditorMessage(param1:String, param2:IWindowContainer = null)
      {
         super(param1);
         var_29 = param2;
      }
      
      public function get context() : IWindowContainer
      {
         return var_29;
      }
   }
}
