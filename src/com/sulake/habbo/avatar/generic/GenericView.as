package com.sulake.habbo.avatar.generic
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.utils.PropertyStruct;
   import com.sulake.habbo.avatar.AvatarEditorView;
   import com.sulake.habbo.avatar.common.AvatarEditorGridItem;
   import com.sulake.habbo.avatar.common.AvatarEditorGridView;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryView;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class GenericView implements IAvatarEditorCategoryView
   {
       
      
      private var _window:IWindowContainer;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_1429:String;
      
      private var var_456:IWindowContainer;
      
      private var var_299:String = "";
      
      private var var_93:GenericModel;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_677:Dictionary;
      
      private var var_945:Dictionary;
      
      public function GenericView(param1:GenericModel, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         super();
         var_93 = param1;
         _assetLibrary = param3;
         _windowManager = param2;
         var _loc4_:XmlAsset = _assetLibrary.getAssetByName("avatareditor_generic_base") as XmlAsset;
         _window = IWindowContainer(_windowManager.buildFromXML(_loc4_.content as XML));
         var_677 = new Dictionary();
         var_677["null"] = new AvatarEditorGridView(param1,FigureData.const_55,param2,param3);
         attachImages();
         switchCategory(FigureData.const_55);
         _window.procedure = method_6;
         _window.visible = false;
      }
      
      private function method_6(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "tab_boy":
                  var_93.categorySwitch(FigureData.const_84);
                  param1.stopPropagation();
                  break;
               case "tab_girl":
                  var_93.categorySwitch(FigureData.const_82);
                  param1.stopPropagation();
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            switch(param2.name)
            {
               case "tab_boy":
               case "tab_girl":
                  activateTab(param2.name);
            }
         }
         else if(param1.type == WindowMouseEvent.const_28)
         {
            switch(param2.name)
            {
               case "tab_boy":
               case "tab_girl":
                  if(var_299 != param2.name)
                  {
                     inactivateTab(param2.name);
                  }
            }
         }
      }
      
      public function dispose() : void
      {
      }
      
      public function updateItem(param1:String, param2:AvatarEditorGridItem, param3:int) : void
      {
         var _loc4_:AvatarEditorGridView = var_677[param1];
         if(_loc4_ != null)
         {
            _loc4_.updateItem(param3,param2.view);
         }
      }
      
      private function setElementImage(param1:IBitmapWrapperWindow, param2:Boolean) : void
      {
         var asset:IAsset = null;
         var assetName:String = null;
         var src:BitmapData = null;
         var dx:int = 0;
         var dy:int = 0;
         var bmp:IBitmapWrapperWindow = param1;
         var active:Boolean = param2;
         if(bmp == null)
         {
            return;
         }
         Logger.log("setElementImage: " + bmp.name);
         var result:Array = bmp.properties.filter(function(param1:*, param2:int, param3:Array):Boolean
         {
            return PropertyStruct(param1).key == "bitmap_asset_name";
         });
         if(result.length)
         {
            assetName = PropertyStruct(result[0]).value as String;
            if(active)
            {
               assetName = assetName.replace("_on","");
            }
            asset = _assetLibrary.getAssetByName(assetName);
            if(asset && asset is BitmapDataAsset)
            {
               bmp.bitmap = new BitmapData(bmp.width,bmp.height,false,AvatarEditorView.var_1041);
               src = BitmapDataAsset(asset).content as BitmapData;
               dx = (bmp.width - src.width) / 2;
               dy = (bmp.height - src.height) / 2;
               bmp.bitmap.copyPixels(src,src.rect,new Point(dx,dy));
            }
         }
      }
      
      public function switchCategory(param1:String) : void
      {
         if(_window == null)
         {
            return;
         }
         if(false)
         {
            return;
         }
         if(var_1429 == param1)
         {
            return;
         }
         var _loc2_:ISelectorWindow = _window.findChildByName("category_selector") as ISelectorWindow;
         inactivateTab(var_299);
         switch(var_93.controller.gender)
         {
            case FigureData.const_84:
               var_299 = "tab_boy";
               break;
            case FigureData.const_82:
               var_299 = "tab_girl";
         }
         activateTab(var_299);
         var_1429 = param1;
         var _loc3_:IWindowContainer = _window.findChildByName("grid_container") as IWindowContainer;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.removeChildAt(0);
         var _loc4_:AvatarEditorGridView = var_677[var_1429];
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:IWindowContainer = _loc4_.window;
         if(_loc5_ == null)
         {
            return;
         }
         _loc3_.visible = true;
         _loc3_.addChild(_loc5_);
         _loc3_.invalidate();
         if(_loc4_.firstView)
         {
            _loc4_.initFromList();
         }
      }
      
      private function attachImages() : void
      {
         var _loc2_:* = null;
         var _loc1_:Array = new Array();
         _window.groupChildrenWithTag("bitmap",_loc1_,true);
         for each(_loc2_ in _loc1_)
         {
            setElementImage(_loc2_,false);
         }
      }
      
      private function activateTab(param1:String) : void
      {
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName(param1) as IBitmapWrapperWindow;
         setElementImage(_loc2_,true);
      }
      
      private function inactivateTab(param1:String) : void
      {
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName(param1) as IBitmapWrapperWindow;
         setElementImage(_loc2_,false);
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         return _window;
      }
   }
}
