package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_124:DisplayObject;
      
      private var var_2217:uint;
      
      private var var_743:IWindowToolTipAgentService;
      
      private var var_745:IWindowMouseScalingService;
      
      private var var_400:IWindowContext;
      
      private var var_742:IWindowFocusManagerService;
      
      private var var_746:IWindowMouseListenerService;
      
      private var var_744:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2217 = 0;
         var_124 = param2;
         var_400 = param1;
         var_744 = new WindowMouseDragger(param2);
         var_745 = new WindowMouseScaler(param2);
         var_746 = new WindowMouseListener(param2);
         var_742 = new FocusManager(param2);
         var_743 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_745;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_742;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_743;
      }
      
      public function dispose() : void
      {
         if(var_744 != null)
         {
            var_744.dispose();
            var_744 = null;
         }
         if(var_745 != null)
         {
            var_745.dispose();
            var_745 = null;
         }
         if(var_746 != null)
         {
            var_746.dispose();
            var_746 = null;
         }
         if(var_742 != null)
         {
            var_742.dispose();
            var_742 = null;
         }
         if(var_743 != null)
         {
            var_743.dispose();
            var_743 = null;
         }
         var_400 = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_746;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_744;
      }
   }
}
