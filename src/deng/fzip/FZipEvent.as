package deng.fzip
{
   import flash.events.Event;
   
   public class FZipEvent extends Event
   {
      
      public static const const_1370:String = "fileLoaded";
       
      
      public var var_2254:FZipFile;
      
      public function FZipEvent(param1:String, param2:FZipFile = null, param3:Boolean = false, param4:Boolean = false)
      {
         this.var_2254 = param2;
         super(param1,param3,param4);
      }
      
      override public function clone() : Event
      {
         return new FZipEvent(type,var_2254,bubbles,cancelable);
      }
   }
}
