package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.events.WindowEvent;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class WindowMouseOperator implements IDisposable
   {
       
      
      protected var var_504:Point;
      
      protected var var_124:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      protected var var_1056:uint;
      
      protected var _window:WindowController;
      
      protected var _offset:Point;
      
      protected var _mouse:Point;
      
      protected var _working:Boolean;
      
      public function WindowMouseOperator(param1:DisplayObject)
      {
         super();
         var_124 = param1;
         var_504 = new Point();
         _mouse = new Point();
         _offset = new Point();
         _working = false;
         var_1056 = 0;
      }
      
      protected function handler(param1:Event) : void
      {
         var _loc2_:* = null;
         if(_working)
         {
            if(param1.type == Event.ENTER_FRAME)
            {
               if(false)
               {
                  end(_window);
               }
               else if(false)
               {
                  operate(var_124.mouseX,var_124.mouseY);
                  _mouse.x = var_124.mouseX;
                  _mouse.y = var_124.mouseY;
               }
            }
            _loc2_ = param1 as MouseEvent;
            if(_loc2_ != null)
            {
               switch(_loc2_.type)
               {
                  case MouseEvent.MOUSE_UP:
                     end(_window);
               }
            }
         }
      }
      
      public function operate(param1:int, param2:int) : void
      {
         _mouse.x = param1;
         _mouse.y = param2;
         getMousePositionRelativeTo(_window,_mouse,var_504);
         _window.offset(0 - 0,0 - 0);
      }
      
      public function end(param1:IWindow) : IWindow
      {
         var _loc2_:IWindow = _window;
         if(_working)
         {
            if(_window == param1)
            {
               var_124.removeEventListener(MouseEvent.MOUSE_DOWN,handler,false);
               var_124.removeEventListener(MouseEvent.MOUSE_UP,handler,false);
               var_124.removeEventListener(Event.ENTER_FRAME,handler);
               if(true)
               {
                  _window.removeEventListener(WindowEvent.const_367,clientWindowDestroyed);
               }
               _window = null;
               _working = false;
            }
         }
         return _loc2_;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function begin(param1:IWindow, param2:uint = 0) : IWindow
      {
         var_1056 = param2;
         var _loc3_:IWindow = _window;
         if(_window != null)
         {
            end(_window);
         }
         if(param1 && !param1.disposed)
         {
            var_124.addEventListener(MouseEvent.MOUSE_DOWN,handler,false);
            var_124.addEventListener(MouseEvent.MOUSE_UP,handler,false);
            var_124.addEventListener(Event.ENTER_FRAME,handler);
            _mouse.x = var_124.mouseX;
            _mouse.y = var_124.mouseY;
            _window = WindowController(param1);
            getMousePositionRelativeTo(param1,_mouse,_offset);
            _window.addEventListener(WindowEvent.const_367,clientWindowDestroyed);
            _working = true;
         }
         return _loc3_;
      }
      
      public function dispose() : void
      {
         end(_window);
         _offset = null;
         _mouse = null;
         var_504 = null;
         var_124 = null;
      }
      
      private function clientWindowDestroyed(param1:WindowEvent) : void
      {
         end(_window);
      }
      
      protected function getMousePositionRelativeTo(param1:IWindow, param2:Point, param3:Point) : void
      {
         param1.getGlobalPosition(param3);
         param3.x = param2.x - param3.x;
         param3.y = param2.y - param3.y;
      }
   }
}
