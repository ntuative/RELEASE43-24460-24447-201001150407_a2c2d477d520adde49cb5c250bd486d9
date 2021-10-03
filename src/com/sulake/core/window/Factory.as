package com.sulake.core.window
{
   import com.sulake.core.window.components.ActivatorController;
   import com.sulake.core.window.components.BackgroundController;
   import com.sulake.core.window.components.BitmapWrapperController;
   import com.sulake.core.window.components.BorderController;
   import com.sulake.core.window.components.ButtonController;
   import com.sulake.core.window.components.CanvasController;
   import com.sulake.core.window.components.CheckBoxController;
   import com.sulake.core.window.components.ContainerButtonController;
   import com.sulake.core.window.components.ContainerController;
   import com.sulake.core.window.components.DisplayObjectWrapperController;
   import com.sulake.core.window.components.DropMenuController;
   import com.sulake.core.window.components.DropMenuItemController;
   import com.sulake.core.window.components.FrameController;
   import com.sulake.core.window.components.HeaderController;
   import com.sulake.core.window.components.IconController;
   import com.sulake.core.window.components.InteractiveController;
   import com.sulake.core.window.components.ItemGridController;
   import com.sulake.core.window.components.ItemListController;
   import com.sulake.core.window.components.PasswordFieldController;
   import com.sulake.core.window.components.RadioButtonController;
   import com.sulake.core.window.components.RegionController;
   import com.sulake.core.window.components.ScalerController;
   import com.sulake.core.window.components.ScrollableItemListWindow;
   import com.sulake.core.window.components.ScrollbarController;
   import com.sulake.core.window.components.ScrollbarLiftController;
   import com.sulake.core.window.components.SelectableButtonController;
   import com.sulake.core.window.components.SelectorController;
   import com.sulake.core.window.components.TabButtonController;
   import com.sulake.core.window.components.TabContainerButtonController;
   import com.sulake.core.window.components.TabContextController;
   import com.sulake.core.window.components.TabSelectorController;
   import com.sulake.core.window.components.TextController;
   import com.sulake.core.window.components.TextFieldController;
   import com.sulake.core.window.components.ToolTipController;
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class Factory
   {
       
      
      protected var var_27:Dictionary;
      
      public function Factory()
      {
         super();
         var_27 = new Dictionary();
         var_27["null"] = WindowController;
         var_27["null"] = ActivatorController;
         var_27["null"] = BackgroundController;
         var_27["null"] = BorderController;
         var_27["null"] = ButtonController;
         var_27["null"] = ButtonController;
         var_27["null"] = SelectableButtonController;
         var_27["null"] = SelectableButtonController;
         var_27["null"] = SelectableButtonController;
         var_27["null"] = BitmapWrapperController;
         var_27["null"] = CanvasController;
         var_27["null"] = CheckBoxController;
         var_27["null"] = ContainerController;
         var_27["null"] = ContainerButtonController;
         var_27["null"] = InteractiveController;
         var_27["null"] = DisplayObjectWrapperController;
         var_27["null"] = ScrollbarLiftController;
         var_27["null"] = DropMenuController;
         var_27["null"] = DropMenuItemController;
         var_27["null"] = FrameController;
         var_27["null"] = HeaderController;
         var_27["null"] = IconController;
         var_27["null"] = ItemListController;
         var_27["null"] = ItemListController;
         var_27["null"] = ItemListController;
         var_27["null"] = ItemGridController;
         var_27["null"] = ItemGridController;
         var_27["null"] = ItemGridController;
         var_27["null"] = PasswordFieldController;
         var_27["null"] = RadioButtonController;
         var_27["null"] = RegionController;
         var_27["null"] = ScalerController;
         var_27["null"] = ScrollbarController;
         var_27["null"] = ScrollbarController;
         var_27["null"] = ButtonController;
         var_27["null"] = ButtonController;
         var_27["null"] = ButtonController;
         var_27["null"] = ButtonController;
         var_27["null"] = ScrollbarLiftController;
         var_27["null"] = ScrollbarLiftController;
         var_27["null"] = WindowController;
         var_27["null"] = WindowController;
         var_27["null"] = ScrollableItemListWindow;
         var_27["null"] = SelectorController;
         var_27["null"] = TabSelectorController;
         var_27["null"] = TabButtonController;
         var_27["null"] = TabContainerButtonController;
         var_27["null"] = ContainerController;
         var_27["null"] = TabContextController;
         var_27["null"] = TabSelectorController;
         var_27["null"] = TextController;
         var_27["null"] = TextFieldController;
         var_27["null"] = ToolTipController;
      }
      
      public function getWindowClassByType(param1:uint) : Class
      {
         return var_27[param1];
      }
   }
}
