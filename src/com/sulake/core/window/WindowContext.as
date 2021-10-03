package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.ICoreUpdateReceiver;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.IScrollableWindow;
   import com.sulake.core.window.components.IScrollbarWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.enum.WindowStyle;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.utils.IInternalWindowServices;
   import com.sulake.core.window.utils.IMouseCursor;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.InternalWindowServices;
   import com.sulake.core.window.utils.KeyboardEventQueue;
   import com.sulake.core.window.utils.MouseCursorControl;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, ICoreUpdateReceiver
   {
      
      public static var var_869:MouseEventQueue;
      
      public static var var_1529:IMouseCursor;
      
      public static const const_1549:int = 2;
      
      private static var var_887:Factory;
      
      private static var var_137:IWindowRenderer;
      
      public static var var_1300:KeyboardEventQueue;
      
      public static const const_1534:int = 1;
      
      public static const ERROR_DURING_EVENT_HANDLING:int = 5;
      
      public static const const_1533:int = 0;
      
      public static const const_1594:int = 3;
      
      public static const const_1366:int = 4;
       
      
      protected var var_2185:IWindowFactory;
      
      private var _disposed:Boolean = false;
      
      private var var_598:WindowController;
      
      private var var_613:Date;
      
      protected var var_2184:IWindowParser;
      
      protected var var_872:Error;
      
      protected var var_2186:IInternalWindowServices;
      
      protected var var_102:WindowController;
      
      protected var var_1303:int = -1;
      
      protected var var_95:IDesktopWindow;
      
      private var var_1326:Boolean = false;
      
      protected var var_2269:Boolean = true;
      
      private var var_186:Boolean = false;
      
      protected var var_1045:SubstituteParentController;
      
      private var var_2203:Point;
      
      protected var var_310:DisplayObjectContainer;
      
      private var var_340:IWindowContextStateListener;
      
      private var _name:String;
      
      protected var _localization:ICoreLocalizationManager;
      
      private var var_507:Point;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         var_507 = new Point();
         var_2203 = new Point();
         super();
         _name = param1;
         var_137 = param2;
         _localization = param4;
         var_310 = param5;
         var_2186 = new InternalWindowServices(this,param5);
         var_2185 = param3;
         var_2184 = new WindowParser(this);
         var_613 = new Date();
         if(var_887 == null)
         {
            var_887 = new Factory();
         }
         if(var_869 == null)
         {
            var_869 = new MouseEventQueue(param5);
         }
         if(var_1300 == null)
         {
            var_1300 = new KeyboardEventQueue(param5);
         }
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         var_95 = new DesktopController("_CONTEXT_DESKTOP_" + _name,WindowType.const_414,WindowStyle.const_226,WindowParam.const_101,this,param6,null,null);
         var_310.addChild(var_95.getDisplayObject());
         var_310.doubleClickEnabled = true;
         var_310.addEventListener(Event.RESIZE,stageResizedHandler);
         var_102 = WindowController(var_95);
         var_1045 = new SubstituteParentController("_CONTEXT_SUBSTITUTE_PARENT",0,0,0,this,new Rectangle(0,0,0,0),null,null,null,null,0);
         var_340 = param7;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == var_95)
         {
            var_95 = null;
         }
         if(param1.state != WindowState.const_381)
         {
            param1.destroy();
         }
         var_137.removeRenderable(param1 as WindowController);
         return true;
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:Class = var_887.getWindowClassByType(param3);
         if(_loc12_ == null)
         {
            handleError(WindowContext.const_1366,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = var_1045;
            }
         }
         var _loc13_:IWindow = new _loc12_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : var_95,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc13_.caption = param2;
         }
         return _loc13_;
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return var_95;
      }
      
      public function render(param1:uint) : void
      {
         var_1326 = true;
         var_137.update(param1);
         var_1326 = false;
      }
      
      public function dispose() : void
      {
         _disposed = true;
         var_310.removeEventListener(Event.RESIZE,stageResizedHandler);
         var_310.removeChild(IGraphicContextHost(var_95).getGraphicContext(true) as DisplayObject);
         var_95.destroy();
         var_95 = null;
         var_1045.destroy();
         var_1045 = null;
         var_887 = null;
         var_137 = null;
         var_102 = null;
         var_613 = null;
         var_340 = null;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(var_95 != null && true)
         {
            if(var_310 is Stage)
            {
               var_95.width = Stage(var_310).stageWidth;
               var_95.height = Stage(var_310).stageHeight;
            }
            else
            {
               var_95.width = var_310.width;
               var_95.height = var_310.height;
            }
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         _localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : Boolean
      {
         var_137.addToRenderQueue(WindowController(param1),param2,param3);
         return true;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return var_2184;
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         _localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return var_2185;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var_186 = true;
         if(var_872)
         {
            throw var_872;
         }
         var _loc6_:Point = new Point();
         var _loc7_:MouseEventQueue = WindowContext.var_869;
         _loc7_.begin();
         var_507.x = -1;
         var_507.y = -1;
         while(true)
         {
            _loc2_ = _loc7_.next() as MouseEvent;
            if(_loc2_ == null)
            {
               break;
            }
            if(_loc2_.stageX != var_507.x || _loc2_.stageY != var_507.y)
            {
               var_507.x = _loc2_.stageX;
               var_507.y = _loc2_.stageY;
               _loc5_ = new Array();
               var_95.groupChildrenUnderPoint(var_507,_loc5_);
            }
            _loc3_ = _loc5_ != null ? int(_loc5_.length) : 0;
            if(_loc3_ == 1)
            {
               if(_loc2_.type == MouseEvent.MOUSE_MOVE)
               {
                  if(var_102 != var_95 && true)
                  {
                     var_102.getGlobalPosition(_loc6_);
                     var_102.update(var_102,new MouseEvent(MouseEvent.MOUSE_OUT,false,false,_loc2_.stageX - _loc6_.x,_loc2_.stageY - _loc6_.y,null,_loc2_.altKey,_loc2_.ctrlKey,_loc2_.shiftKey,_loc2_.buttonDown,_loc2_.delta));
                     var_102 = WindowController(var_95);
                  }
               }
            }
            while(--_loc3_ > -1)
            {
               _loc4_ = passMouseEvent(WindowController(_loc5_[_loc3_]),_loc2_);
               if(_loc4_ != null && _loc4_.visible)
               {
                  if(_loc2_.type == MouseEvent.MOUSE_MOVE)
                  {
                     if(_loc4_ != var_102)
                     {
                        if(true)
                        {
                           var_102.getGlobalPosition(_loc6_);
                           var_102.update(var_102,new MouseEvent(MouseEvent.MOUSE_OUT,false,false,_loc2_.stageX - _loc6_.x,_loc2_.stageY - _loc6_.y,null,_loc2_.altKey,_loc2_.ctrlKey,_loc2_.shiftKey,_loc2_.buttonDown,_loc2_.delta));
                        }
                        if(!_loc4_.disposed)
                        {
                           _loc4_.getGlobalPosition(_loc6_);
                           _loc4_.update(_loc4_,new MouseEvent(MouseEvent.MOUSE_OVER,false,false,_loc2_.stageX - _loc6_.x,_loc2_.stageY - _loc6_.y,null,_loc2_.altKey,_loc2_.ctrlKey,_loc2_.shiftKey,_loc2_.buttonDown,_loc2_.delta));
                        }
                        if(!_loc4_.disposed)
                        {
                           var_102 = _loc4_;
                        }
                     }
                  }
                  else if(_loc2_.type == MouseEvent.MOUSE_UP || _loc2_.type == MouseEvent.CLICK)
                  {
                     if(var_102 && true)
                     {
                        if(var_340 != null)
                        {
                           var_340.mouseEventReceived(_loc2_.type,var_102);
                        }
                     }
                  }
                  if(_loc2_.altKey)
                  {
                     if(var_102)
                     {
                        Logger.log("HOVER: undefined");
                     }
                  }
                  if(_loc4_ != var_95)
                  {
                     _loc2_.stopPropagation();
                     _loc7_.remove();
                  }
                  break;
               }
            }
         }
         _loc7_.end();
         var_186 = false;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         var_872 = param2;
         var_1303 = param1;
         if(var_2269)
         {
            throw param2;
         }
      }
      
      public function getLastError() : Error
      {
         return var_872;
      }
      
      public function getMouseCursor() : IMouseCursor
      {
         if(var_1529 == null)
         {
            var_1529 = new MouseCursorControl(var_310 as Stage);
         }
         return var_1529;
      }
      
      public function flushError() : void
      {
         var_872 = null;
         var_1303 = -1;
      }
      
      public function getLastErrorCode() : int
      {
         return var_1303;
      }
      
      private function passMouseEvent(param1:WindowController, param2:MouseEvent) : WindowController
      {
         if(param1.disposed)
         {
            return null;
         }
         if(!param1.testParamFlag(WindowParam.const_48))
         {
            return null;
         }
         if(param1.testStateFlag(WindowState.const_68))
         {
            return null;
         }
         var _loc3_:Point = new Point(param2.stageX,param2.stageY);
         param1.convertPointFromGlobalToLocalSpace(_loc3_);
         var _loc4_:BitmapData = var_137.getDrawBufferForRenderable(param1);
         if(!param1.validateLocalPointIntersection(_loc3_,_loc4_))
         {
            return null;
         }
         if(param1.testParamFlag(WindowParam.const_398))
         {
            if(param1.parent != null)
            {
               return passMouseEvent(WindowController(param1.parent),param2);
            }
         }
         var _loc5_:Boolean = true;
         switch(param2.type)
         {
            case MouseEvent.MOUSE_DOWN:
               var_598 = param1;
               break;
            case MouseEvent.CLICK:
               if(var_598 != param1)
               {
                  _loc5_ = false;
               }
               else
               {
                  var_598 = null;
               }
               break;
            case MouseEvent.DOUBLE_CLICK:
               if(var_598 != param1)
               {
                  _loc5_ = false;
               }
               else
               {
                  var_598 = null;
               }
               break;
            case MouseEvent.MOUSE_WHEEL:
               if(!(param1 is IScrollableWindow) && !(param1 is IScrollbarWindow))
               {
                  return null;
               }
               break;
         }
         if(_loc5_)
         {
            if(!param1.update(param1,param2))
            {
               if(param1.parent)
               {
                  return passMouseEvent(WindowController(param1.parent),param2);
               }
            }
         }
         return param1;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return var_95.findChildByName(param1);
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return var_2186;
      }
   }
}
