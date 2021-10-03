package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1883:String;
      
      private var _gender:String;
      
      private var var_1884:int;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         var_1884 = param1.readInteger();
         var_1883 = param1.readString();
         _gender = param1.readString();
      }
      
      public function get gender() : String
      {
         return _gender;
      }
      
      public function get figureString() : String
      {
         return var_1883;
      }
      
      public function get slotId() : int
      {
         return var_1884;
      }
   }
}
