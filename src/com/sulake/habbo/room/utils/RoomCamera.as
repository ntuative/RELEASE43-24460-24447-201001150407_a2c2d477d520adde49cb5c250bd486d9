package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_332:Number = 0.5;
      
      private static const const_746:int = 3;
      
      private static const const_1048:Number = 1;
       
      
      private var var_1777:Boolean = false;
      
      private var var_1780:Boolean = false;
      
      private var var_925:int = 0;
      
      private var var_257:Vector3d = null;
      
      private var var_1776:int = 0;
      
      private var var_1781:int = 0;
      
      private var var_1774:Boolean = false;
      
      private var var_1775:int = -2;
      
      private var var_1782:Boolean = false;
      
      private var var_1778:int = 0;
      
      private var var_1783:int = -1;
      
      private var var_376:Vector3d = null;
      
      private var var_1779:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get roomWd() : int
      {
         return var_1776;
      }
      
      public function get targetId() : int
      {
         return var_1783;
      }
      
      public function set roomHt(param1:int) : void
      {
         var_1778 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         var_1776 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_1777 = param1;
      }
      
      public function set targetId(param1:int) : void
      {
         var_1783 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_1780 = param1;
      }
      
      public function dispose() : void
      {
         var_376 = null;
         var_257 = null;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_376 == null)
         {
            var_376 = new Vector3d();
         }
         var_376.assign(param1);
         var_925 = 0;
      }
      
      public function get targetCategory() : int
      {
         return var_1775;
      }
      
      public function get screenHt() : int
      {
         return var_1779;
      }
      
      public function set screenWd(param1:int) : void
      {
         var_1781 = param1;
      }
      
      public function get location() : IVector3d
      {
         return var_257;
      }
      
      public function set screenHt(param1:int) : void
      {
         var_1779 = param1;
      }
      
      public function get roomHt() : int
      {
         return var_1778;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_1777;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_1780;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_376 != null && var_257 != null)
         {
            ++var_925;
            _loc2_ = Vector3d.dif(var_376,var_257);
            if(_loc2_.length <= const_332)
            {
               var_257 = var_376;
               var_376 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_332 * (const_746 + 1))
               {
                  _loc2_.mul(const_332);
               }
               else if(var_925 <= const_746)
               {
                  _loc2_.mul(const_332);
               }
               else
               {
                  _loc2_.mul(const_1048);
               }
               var_257 = Vector3d.sum(var_257,_loc2_);
            }
         }
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_1774 = param1;
      }
      
      public function get screenWd() : int
      {
         return var_1781;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_1782 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         var_1775 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_257 != null)
         {
            return;
         }
         var_257 = new Vector3d();
         var_257.assign(param1);
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_1774;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_1782;
      }
   }
}
