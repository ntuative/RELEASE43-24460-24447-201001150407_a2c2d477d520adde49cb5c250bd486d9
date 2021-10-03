package com.sulake.core.utils.profiler
{
   import com.sulake.core.runtime.ICoreUpdateReceiver;
   import com.sulake.core.runtime.IDisposable;
   import flash.utils.getQualifiedClassName;
   
   public class ProfilerAgent extends ProfilerAgentTask implements IDisposable
   {
       
      
      protected var var_874:ICoreUpdateReceiver;
      
      public function ProfilerAgent(param1:ICoreUpdateReceiver)
      {
         var_874 = param1;
         var _loc2_:String = getQualifiedClassName(var_874);
         super(_loc2_.slice(_loc2_.lastIndexOf(":") + 1,_loc2_.length));
      }
      
      override public function dispose() : void
      {
         var_874 = null;
         super.dispose();
      }
      
      public function get receiver() : ICoreUpdateReceiver
      {
         return var_874;
      }
      
      public function update(param1:int) : void
      {
         super.start();
         var_874.update(param1);
         super.stop();
      }
   }
}
