package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.graphics.WindowRedrawFlag;
   import com.sulake.core.window.utils.IBitmapDataContainer;
   import com.sulake.core.window.utils.PropertyStruct;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   
   public class BitmapWrapperController extends WindowController implements IBitmapWrapperWindow, IBitmapDataContainer
   {
      
      protected static const const_1381:String = null;
      
      protected static const const_1012:String = "handle_bitmap_disposing";
      
      protected static const const_1380:Boolean = true;
      
      protected static const const_1013:String = "bitmap_asset_name";
       
      
      protected var var_423:Boolean = true;
      
      protected var _bitmapData:BitmapData;
      
      protected var var_1050:String;
      
      public function BitmapWrapperController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function = null, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public function get disposesBitmap() : Boolean
      {
         return var_423;
      }
      
      public function set disposesBitmap(param1:Boolean) : void
      {
         var_423 = param1;
      }
      
      override public function clone() : IWindow
      {
         var _loc1_:BitmapWrapperController = super.clone() as BitmapWrapperController;
         _loc1_._bitmapData = _bitmapData;
         _loc1_.var_423 = var_423;
         _loc1_.var_1050 = var_1050;
         return _loc1_;
      }
      
      public function set bitmap(param1:BitmapData) : void
      {
         if(var_423 && _bitmapData && param1 != _bitmapData)
         {
            _bitmapData.dispose();
         }
         _bitmapData = param1;
         var_29.invalidate(this,var_22,WindowRedrawFlag.const_72);
      }
      
      override public function set properties(param1:Array) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1)
         {
            switch(_loc2_.key)
            {
               case const_1012:
                  var_423 = _loc2_.value as Boolean;
                  break;
               case const_1013:
                  var_1050 = _loc2_.value as String;
                  break;
            }
         }
         super.properties = param1;
      }
      
      override public function dispose() : void
      {
         if(_bitmapData)
         {
            if(var_423)
            {
               _bitmapData.dispose();
            }
            _bitmapData = null;
         }
         super.dispose();
      }
      
      public function get bitmap() : BitmapData
      {
         return _bitmapData;
      }
      
      public function set bitmapData(param1:BitmapData) : void
      {
         bitmap = param1;
      }
      
      override public function get properties() : Array
      {
         var _loc1_:Array = super.properties;
         _loc1_.push(new PropertyStruct(const_1012,var_423,PropertyStruct.const_54,var_423 != const_1380));
         _loc1_.push(new PropertyStruct(const_1013,var_1050,PropertyStruct.const_172,var_1050 != const_1381));
         return _loc1_;
      }
      
      public function get bitmapData() : BitmapData
      {
         return _bitmapData;
      }
   }
}
