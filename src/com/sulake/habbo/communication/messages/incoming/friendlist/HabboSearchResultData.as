package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2245:Boolean;
      
      private var var_2247:int;
      
      private var var_2246:Boolean;
      
      private var var_1512:String;
      
      private var var_1154:String;
      
      private var var_2127:int;
      
      private var var_2135:String;
      
      private var var_2248:String;
      
      private var var_2134:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2127 = param1.readInteger();
         this.var_1512 = param1.readString();
         this.var_2135 = param1.readString();
         this.var_2245 = param1.readBoolean();
         this.var_2246 = param1.readBoolean();
         param1.readString();
         this.var_2247 = param1.readInteger();
         this.var_2134 = param1.readString();
         this.var_2248 = param1.readString();
         this.var_1154 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1154;
      }
      
      public function get avatarName() : String
      {
         return this.var_1512;
      }
      
      public function get avatarId() : int
      {
         return this.var_2127;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2245;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2248;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2134;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2246;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2135;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2247;
      }
   }
}
