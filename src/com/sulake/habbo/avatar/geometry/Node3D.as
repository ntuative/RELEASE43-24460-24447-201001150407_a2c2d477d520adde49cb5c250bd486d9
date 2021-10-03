package com.sulake.habbo.avatar.geometry
{
   public class Node3D
   {
       
      
      private var var_1071:Vector3D;
      
      private var var_511:Vector3D;
      
      public function Node3D(param1:Number, param2:Number, param3:Number)
      {
         var_1071 = new Vector3D();
         super();
         var_511 = new Vector3D(param1,param2,param3);
      }
      
      public function get transformedLocation() : Vector3D
      {
         return var_1071;
      }
      
      public function get location() : Vector3D
      {
         return var_511;
      }
      
      public function applyTransform(param1:Matrix4x4) : void
      {
         var_1071 = param1.vectorMultiplication(var_511);
      }
   }
}
