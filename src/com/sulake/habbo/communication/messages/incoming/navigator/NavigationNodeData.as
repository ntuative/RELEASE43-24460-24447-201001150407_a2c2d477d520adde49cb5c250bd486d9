package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class NavigationNodeData
   {
       
      
      private var var_1172:int;
      
      private var var_1448:String;
      
      public function NavigationNodeData(param1:int, param2:String)
      {
         super();
         var_1172 = param1;
         var_1448 = param2;
         Logger.log("READ NODE: " + var_1172 + ", " + var_1448);
      }
      
      public function get nodeName() : String
      {
         return var_1448;
      }
      
      public function get nodeId() : int
      {
         return var_1172;
      }
   }
}
