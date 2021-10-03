package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_605:IAssetLoader;
      
      private var var_1210:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         var_1210 = param1;
         var_605 = param2;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return var_605;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_605 != null)
            {
               if(true)
               {
                  var_605.dispose();
                  var_605 = null;
               }
            }
            super.dispose();
         }
      }
      
      public function get assetName() : String
      {
         return var_1210;
      }
   }
}
