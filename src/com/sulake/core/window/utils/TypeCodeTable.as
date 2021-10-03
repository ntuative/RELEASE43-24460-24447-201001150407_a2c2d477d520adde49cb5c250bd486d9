package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_727;
         param1["bitmap"] = const_664;
         param1["border"] = const_589;
         param1["border_notify"] = const_1134;
         param1["button"] = const_457;
         param1["button_thick"] = const_519;
         param1["button_icon"] = const_1180;
         param1["button_group_left"] = const_699;
         param1["button_group_center"] = const_516;
         param1["button_group_right"] = const_528;
         param1["canvas"] = const_558;
         param1["checkbox"] = const_596;
         param1["closebutton"] = const_959;
         param1["container"] = const_312;
         param1["container_button"] = const_577;
         param1["display_object_wrapper"] = const_686;
         param1["dropmenu"] = const_379;
         param1["dropmenu_item"] = const_412;
         param1["frame"] = const_317;
         param1["frame_notify"] = const_1340;
         param1["header"] = const_568;
         param1["icon"] = const_928;
         param1["itemgrid"] = const_822;
         param1["itemgrid_horizontal"] = const_354;
         param1["itemgrid_vertical"] = const_679;
         param1["itemlist"] = const_858;
         param1["itemlist_horizontal"] = const_313;
         param1["itemlist_vertical"] = const_299;
         param1["maximizebox"] = const_1321;
         param1["menu"] = const_1200;
         param1["menu_item"] = WINDOW_TYPE_MENU_ITEM;
         param1["submenu"] = const_1001;
         param1["minimizebox"] = const_1360;
         param1["notify"] = const_1338;
         param1["null"] = const_414;
         param1["password"] = const_521;
         param1["radiobutton"] = const_498;
         param1["region"] = const_421;
         param1["restorebox"] = const_1369;
         param1["scaler"] = const_821;
         param1["scaler_horizontal"] = const_1282;
         param1["scaler_vertical"] = const_1343;
         param1["scrollbar_horizontal"] = const_368;
         param1["scrollbar_vertical"] = const_540;
         param1["scrollbar_slider_button_up"] = const_803;
         param1["scrollbar_slider_button_down"] = const_835;
         param1["scrollbar_slider_button_left"] = const_882;
         param1["scrollbar_slider_button_right"] = const_931;
         param1["scrollbar_slider_bar_horizontal"] = const_837;
         param1["scrollbar_slider_bar_vertical"] = const_839;
         param1["scrollbar_slider_track_horizontal"] = const_932;
         param1["scrollbar_slider_track_vertical"] = const_1005;
         param1["scrollable_itemlist"] = const_1249;
         param1["scrollable_itemlist_vertical"] = const_466;
         param1["scrollable_itemlist_horizontal"] = const_960;
         param1["selector"] = const_646;
         param1["selector_list"] = const_612;
         param1["submenu"] = const_1001;
         param1["tab_button"] = const_533;
         param1["tab_container_button"] = const_944;
         param1["tab_context"] = const_448;
         param1["tab_content"] = const_913;
         param1["tab_selector"] = WINDOW_TYPE_TAB_SELECTOR;
         param1["text"] = const_559;
         param1["input"] = const_600;
         param1["toolbar"] = const_1349;
         param1["tooltip"] = WINDOW_TYPE_TOOLTIP;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
