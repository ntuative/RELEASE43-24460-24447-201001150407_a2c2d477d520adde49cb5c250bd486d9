package com.sulake.core.window.components
{
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.core.window.utils.IMargins;
   import com.sulake.core.window.utils.Iterator;
   import com.sulake.core.window.utils.PropertyStruct;
   import com.sulake.core.window.utils.TextMargins;
   import flash.geom.Rectangle;
   
   public class FrameController extends ContainerController implements IFrameWindow
   {
      
      private static const const_762:String = "margin_top";
      
      private static const const_1083:String = "_HEADER";
      
      private static const const_759:String = "margin_right";
      
      private static const const_1082:String = "_SCALER";
      
      private static const const_1035:String = "_TITLE";
      
      private static const const_1081:String = "_CONTENT";
      
      private static const const_760:String = "margin_left";
      
      private static const const_761:String = "margin_bottom";
       
      
      private var _title:ITextWindow;
      
      private var var_72:IMargins;
      
      private var var_1313:Boolean = false;
      
      private var var_1223:IHeaderWindow;
      
      private var var_35:IWindowContainer;
      
      public function FrameController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function = null, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         var_1313 = true;
         activate();
         setupScaling();
      }
      
      override public function get properties() : Array
      {
         var _loc1_:Array = super.properties;
         var _loc2_:* = var_72 != null;
         var _loc3_:Rectangle = content.rectangle;
         _loc1_.push(new PropertyStruct(const_760,_loc3_.left,PropertyStruct.const_58,_loc2_));
         _loc1_.push(new PropertyStruct(const_762,_loc3_.top,PropertyStruct.const_58,_loc2_));
         _loc1_.push(new PropertyStruct(const_759,0 - _loc3_.right,PropertyStruct.const_58,_loc2_));
         _loc1_.push(new PropertyStruct(const_761,0 - _loc3_.bottom,PropertyStruct.const_58,_loc2_));
         return _loc1_;
      }
      
      public function resizeToFitContent() : void
      {
         var _loc1_:WindowController = WindowController(content);
         var _loc2_:int = _loc1_.width;
         var _loc3_:int = _loc1_.height;
         var _loc4_:uint = _loc1_.numChildren;
         resizeToAccommodateChildren(_loc1_);
      }
      
      public function get margins() : IMargins
      {
         var _loc1_:* = null;
         if(!var_72)
         {
            _loc1_ = content.rectangle;
            var_72 = new TextMargins(_loc1_.left,_loc1_.top,_loc1_.right,_loc1_.bottom,marginsCallback);
         }
         return var_72;
      }
      
      override public function set color(param1:uint) : void
      {
         var _loc3_:* = null;
         super.color = param1;
         var _loc2_:Array = new Array();
         groupChildrenWithTag("_COLORIZE",_loc2_,false);
         for each(_loc3_ in _loc2_)
         {
            _loc3_.color = param1;
         }
      }
      
      private function setupScaling() : void
      {
         var _loc1_:IWindow = scaler;
         var _loc2_:Boolean = testParamFlag(WindowParam.const_223);
         var _loc3_:Boolean = testParamFlag(WindowParam.const_219);
         var _loc4_:Boolean = testParamFlag(WindowParam.const_191);
         if(_loc1_)
         {
            if(_loc3_ || _loc2_)
            {
               _loc1_.setParamFlag(WindowParam.const_219,true);
            }
            else
            {
               _loc1_.setParamFlag(WindowParam.const_219,false);
            }
            if(_loc4_ || _loc2_)
            {
               _loc1_.setParamFlag(WindowParam.const_191,true);
            }
            else
            {
               _loc1_.setParamFlag(WindowParam.const_191,false);
            }
            _loc1_.visible = _loc3_ || _loc4_ || _loc2_;
         }
      }
      
      public function get header() : IHeaderWindow
      {
         if(var_1223 == null)
         {
            var_1223 = findChildByTag(const_1083) as IHeaderWindow;
            if(!var_1223)
            {
               throw new Error("Frame window\'s header element not available!");
            }
         }
         return var_1223;
      }
      
      override public function set caption(param1:String) : void
      {
         var value:String = param1;
         super.caption = value;
         try
         {
            title.text = value;
         }
         catch(e:Error)
         {
         }
      }
      
      override public function setParamFlag(param1:uint, param2:Boolean = true) : void
      {
         super.setParamFlag(param1,param2);
         setupScaling();
      }
      
      public function get title() : ITextWindow
      {
         if(_title == null)
         {
            _title = findChildByTag(const_1035) as ITextWindow;
            if(!_title)
            {
               throw new Error("Frame window\'s title element not available!");
            }
         }
         return _title;
      }
      
      public function get scaler() : IScalerWindow
      {
         return findChildByTag(const_1082) as IScalerWindow;
      }
      
      private function marginsCallback(param1:IMargins) : void
      {
         var _loc2_:IWindow = content;
         var _loc3_:uint = _loc2_.param;
         var _loc4_:uint = _loc2_.param & (0 | 0);
         if(_loc4_)
         {
            _loc2_.setParamFlag(0 | 0,false);
         }
         var _loc5_:uint = _loc2_.param & 0;
         if(_loc5_)
         {
            _loc2_.setParamFlag(WindowParam.const_266,false);
         }
         _loc2_.rectangle = new Rectangle(param1.left,param1.top,param1.right - param1.left,param1.bottom - param1.top);
         if(_loc4_ || _loc5_)
         {
            _loc2_.setParamFlag(4294967295,false);
            _loc2_.setParamFlag(_loc3_,true);
         }
      }
      
      override public function set properties(param1:Array) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1)
         {
            switch(_loc2_.key)
            {
               case const_760:
                  margins.left = _loc2_.value as int;
                  break;
               case const_762:
                  margins.top = _loc2_.value as int;
                  break;
               case const_759:
                  margins.right = 0 - (_loc2_.value as int);
                  break;
               case const_761:
                  margins.bottom = 0 - (_loc2_.value as int);
                  break;
            }
         }
         super.properties = param1;
      }
      
      override public function get iterator() : IIterator
      {
         return content != null && var_1313 ? content.iterator : new Iterator(this);
      }
      
      public function get content() : IWindowContainer
      {
         if(var_35 == null)
         {
            var_35 = findChildByTag(const_1081) as IWindowContainer;
            if(!var_35)
            {
               throw new Error("Frame window\'s content element not available!");
            }
         }
         return var_35;
      }
      
      override public function buildFromXML(param1:XML, param2:Map = null) : Boolean
      {
         return context.getWindowParser().parseAndConstruct(param1,content,param2) != null;
      }
   }
}
