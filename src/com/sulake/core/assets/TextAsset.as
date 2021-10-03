package com.sulake.core.assets
{
   import flash.utils.ByteArray;
   
   public class TextAsset implements IAsset
   {
       
      
      private var var_35:String = "";
      
      private var _disposed:Boolean = false;
      
      private var var_1063:AssetTypeDeclaration;
      
      private var var_873:String;
      
      public function TextAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         var_1063 = param1;
         var_873 = param2;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return var_1063;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
      
      public function get url() : String
      {
         return var_873;
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         var _loc2_:* = null;
         if(param1 is String)
         {
            var_35 = param1 as String;
            return;
         }
         if(param1 is Class)
         {
            _loc2_ = new param1() as ByteArray;
            var_35 = _loc2_.readUTFBytes(_loc2_.length);
            return;
         }
         if(param1 is ByteArray)
         {
            _loc2_ = param1 as ByteArray;
            var_35 = _loc2_.readUTFBytes(_loc2_.length);
            return;
         }
         if(param1 is TextAsset)
         {
            var_35 = TextAsset(param1).var_35;
            return;
         }
         var_35 = param1.toString();
      }
      
      public function get content() : Object
      {
         return var_35;
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is TextAsset)
         {
            var_35 = TextAsset(param1).var_35;
            return;
         }
         throw Error("Provided asset is not of type TextAsset!");
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _disposed = true;
            var_35 = null;
            var_1063 = null;
            var_873 = null;
         }
      }
   }
}
