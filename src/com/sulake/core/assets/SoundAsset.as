package com.sulake.core.assets
{
   import flash.media.Sound;
   import flash.utils.ByteArray;
   
   public class SoundAsset implements IAsset
   {
       
      
      private var var_35:Sound = null;
      
      private var _disposed:Boolean = false;
      
      private var var_1063:AssetTypeDeclaration;
      
      private var var_873:String;
      
      public function SoundAsset(param1:AssetTypeDeclaration, param2:String = null)
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
         if(param1 is Sound)
         {
            if(var_35)
            {
               var_35.close();
            }
            var_35 = param1 as Sound;
            return;
         }
         if(param1 is ByteArray)
         {
         }
         if(param1 is Class)
         {
            if(var_35)
            {
               var_35.close();
            }
            var_35 = new param1() as Sound;
            return;
         }
         if(param1 is SoundAsset)
         {
            if(var_35)
            {
               var_35.close();
            }
            var_35 = SoundAsset(param1).var_35;
            return;
         }
      }
      
      public function get content() : Object
      {
         return var_35 as Object;
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is SoundAsset)
         {
            var_35 = SoundAsset(param1).var_35;
         }
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
