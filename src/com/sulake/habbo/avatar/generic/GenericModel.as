package com.sulake.habbo.avatar.generic
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.common.AvatarEditorGridItem;
   import com.sulake.habbo.avatar.common.CategoryData;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import flash.utils.Dictionary;
   
   public class GenericModel implements IAvatarEditorCategoryModel
   {
       
      
      private var var_344:Dictionary;
      
      private var _view:GenericView;
      
      private var _controller:HabboAvatarEditor;
      
      private var var_868:Boolean = false;
      
      private var _gender:String;
      
      public function GenericModel(param1:HabboAvatarEditor, param2:String = "")
      {
         super();
         _controller = param1;
         _gender = param2;
      }
      
      public function get gender() : String
      {
         return _gender;
      }
      
      public function toggleItemSelection(param1:String, param2:int) : void
      {
         var _loc3_:CategoryData = var_344[param1];
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:AvatarEditorGridItem = _loc3_.select(param2);
         _controller.figureData.savePartData(FigureData.const_55,_loc4_.id,_loc3_.currentColourId,true);
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         if(!var_868)
         {
            init();
         }
         return _view.getWindowContainer();
      }
      
      public function closingEditorView() : void
      {
         reset();
      }
      
      public function reset() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_344)
         {
            _loc1_.dispose();
         }
         var_344 = null;
         if(_view != null)
         {
            _view.dispose();
            _view = null;
         }
         var_868 = false;
      }
      
      private function init() : void
      {
         var_344 = new Dictionary();
         var_344["null"] = _controller.generateDataContent(this,FigureData.const_55);
         updateCategoryData(FigureData.const_55);
         _view = new GenericView(this,controller.windowManager,controller.assets);
         updateView();
         var_868 = true;
      }
      
      public function categorySwitch(param1:String) : void
      {
         if(_gender == param1)
         {
            return;
         }
         switch(param1)
         {
            case FigureData.const_84:
               _controller.gender = FigureData.const_84;
               break;
            case FigureData.const_82:
               _controller.gender = FigureData.const_82;
         }
      }
      
      public function get controller() : HabboAvatarEditor
      {
         return _controller;
      }
      
      public function updateView() : void
      {
         updateCategoryData(FigureData.const_55);
      }
      
      public function getCategoryContent(param1:String) : CategoryData
      {
         return var_344[param1];
      }
      
      public function dispose() : void
      {
         reset();
      }
      
      private function updateCategoryData(param1:String) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc2_:int = _controller.figureData.getPartSetId(FigureData.const_55);
         var _loc3_:int = _controller.figureData.getColourId(FigureData.const_55);
         var _loc4_:CategoryData = var_344[param1];
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.selectItemWithId(_loc2_);
         _loc4_.selectColourWithId(_loc3_);
         for each(_loc5_ in _loc4_.data)
         {
            _loc6_ = _controller.figureData.getFigureStringWithFace(_loc5_.id);
            Logger.log("face: " + _loc6_);
            _loc7_ = _controller.avatarRenderManager.createAvatarImage(_loc6_,AvatarScaleType.const_50);
            _loc5_.iconImage = _loc7_.getCroppedImage(AvatarSetType.const_45).clone();
            _loc7_.dispose();
         }
      }
      
      public function toggleColourSelection(param1:String, param2:int) : void
      {
         var _loc3_:CategoryData = var_344[param1];
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.selectColour(param2);
         _controller.figureData.savePartSetColourId(FigureData.const_55,_loc3_.currentColourId,true);
         updateView();
      }
   }
}
