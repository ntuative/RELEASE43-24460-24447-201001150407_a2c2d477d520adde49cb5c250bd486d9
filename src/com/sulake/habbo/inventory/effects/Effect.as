package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_2009:Date;
      
      private var var_1229:Boolean = false;
      
      private var _type:int;
      
      private var var_359:BitmapData;
      
      private var var_250:Boolean = false;
      
      private var var_1080:int;
      
      private var var_556:int = 1;
      
      private var var_987:int;
      
      public function Effect()
      {
         super();
      }
      
      public function get icon() : BitmapData
      {
         return var_359;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --var_556;
         if(var_556 < 0)
         {
            var_556 = 0;
         }
         var_987 = var_1080;
         var_250 = false;
         var_1229 = false;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         var_987 = param1;
      }
      
      public function get isActive() : Boolean
      {
         return var_250;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_359 = param1;
      }
      
      public function get duration() : int
      {
         return var_1080;
      }
      
      public function get isInUse() : Boolean
      {
         return var_1229;
      }
      
      public function get effectsInInventory() : int
      {
         return var_556;
      }
      
      public function get iconImage() : BitmapData
      {
         return var_359;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         if(param1 && !var_250)
         {
            var_2009 = new Date();
         }
         var_250 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         var_556 = param1;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(var_250)
         {
            _loc1_ = var_987 - (new Date().valueOf() - var_2009.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return var_987;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         var_1229 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1080 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
