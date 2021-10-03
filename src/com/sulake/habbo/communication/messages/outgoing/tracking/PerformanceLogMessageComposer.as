package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_1016:int = 0;
      
      private var var_1227:int = 0;
      
      private var var_1994:String = "";
      
      private var var_1017:int = 0;
      
      private var var_1996:String = "";
      
      private var var_1997:int = 0;
      
      private var var_1493:String = "";
      
      private var var_1995:int = 0;
      
      private var var_1993:int = 0;
      
      private var var_1992:String = "";
      
      private var var_1991:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_1995 = param1;
         var_1992 = param2;
         var_1493 = param3;
         var_1994 = param4;
         var_1996 = param5;
         if(param6)
         {
            var_1227 = 1;
         }
         else
         {
            var_1227 = 0;
         }
         var_1997 = param7;
         var_1993 = param8;
         var_1017 = param9;
         var_1991 = param10;
         var_1016 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1995,var_1992,var_1493,var_1994,var_1996,var_1227,var_1997,var_1993,var_1017,var_1991,var_1016];
      }
      
      public function dispose() : void
      {
      }
   }
}
