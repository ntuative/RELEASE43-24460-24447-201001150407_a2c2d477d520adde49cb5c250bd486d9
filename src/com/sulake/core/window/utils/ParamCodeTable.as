package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_101;
         param1["bound_to_parent_rect"] = const_83;
         param1["child_window"] = const_981;
         param1["embedded_controller"] = const_308;
         param1["resize_to_accommodate_children"] = const_63;
         param1["input_event_processor"] = const_48;
         param1["internal_event_handling"] = const_576;
         param1["mouse_dragging_target"] = const_203;
         param1["mouse_dragging_trigger"] = const_288;
         param1["mouse_scaling_target"] = const_223;
         param1["mouse_scaling_trigger"] = const_345;
         param1["horizontal_mouse_scaling_trigger"] = const_191;
         param1["vertical_mouse_scaling_trigger"] = const_219;
         param1["observe_parent_input_events"] = const_938;
         param1["optimize_region_to_layout_size"] = const_350;
         param1["parent_window"] = const_917;
         param1["relative_horizontal_scale_center"] = const_154;
         param1["relative_horizontal_scale_fixed"] = const_117;
         param1["relative_horizontal_scale_move"] = const_295;
         param1["relative_horizontal_scale_strech"] = const_255;
         param1["relative_scale_center"] = const_1006;
         param1["relative_scale_fixed"] = const_492;
         param1["relative_scale_move"] = const_793;
         param1["relative_scale_strech"] = const_819;
         param1["relative_vertical_scale_center"] = const_159;
         param1["relative_vertical_scale_fixed"] = const_124;
         param1["relative_vertical_scale_move"] = const_306;
         param1["relative_vertical_scale_strech"] = const_245;
         param1["on_resize_align_left"] = const_505;
         param1["on_resize_align_right"] = const_442;
         param1["on_resize_align_center"] = const_402;
         param1["on_resize_align_top"] = const_644;
         param1["on_resize_align_bottom"] = const_342;
         param1["on_resize_align_middle"] = const_425;
         param1["on_accommodate_align_left"] = const_922;
         param1["on_accommodate_align_right"] = const_353;
         param1["on_accommodate_align_center"] = const_688;
         param1["on_accommodate_align_top"] = const_857;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_718;
         param1["route_input_events_to_parent"] = const_398;
         param1["use_parent_graphic_context"] = const_30;
         param1["draggable_with_mouse"] = const_862;
         param1["scalable_with_mouse"] = const_906;
         param1["reflect_horizontal_resize_to_parent"] = const_476;
         param1["reflect_vertical_resize_to_parent"] = WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT;
         param1["reflect_resize_to_parent"] = const_266;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
