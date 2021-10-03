package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitMessageParser implements IMessageParser
   {
       
      
      private var _roomMessageTemplates:Array;
      
      private var var_1949:Boolean;
      
      private var var_1444:Array;
      
      private var var_1950:Boolean;
      
      private var var_1952:Boolean;
      
      private var var_1953:Boolean;
      
      private var var_153:Array;
      
      private var var_1954:Boolean;
      
      private var var_1947:Boolean;
      
      private var var_1445:Array;
      
      private var var_1948:Boolean;
      
      private var var_1951:Boolean;
      
      public function ModeratorInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get banPermission() : Boolean
      {
         return var_1951;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return var_1949;
      }
      
      public function get alertPermission() : Boolean
      {
         return var_1950;
      }
      
      public function get cfhPermission() : Boolean
      {
         return var_1954;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return _roomMessageTemplates;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return var_1947;
      }
      
      public function get messageTemplates() : Array
      {
         return var_1444;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         var_153 = [];
         var_1444 = [];
         _roomMessageTemplates = [];
         var_1445 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(!_loc2_.parse(param1))
            {
               return false;
            }
            var_153.push(_loc2_.issueData);
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1444.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1445.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         var_1954 = param1.readBoolean();
         var_1953 = param1.readBoolean();
         var_1950 = param1.readBoolean();
         var_1952 = param1.readBoolean();
         var_1951 = param1.readBoolean();
         var_1947 = param1.readBoolean();
         var_1949 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _roomMessageTemplates.push(param1.readString());
            _loc4_++;
         }
         var_1948 = param1.readBoolean();
         return true;
      }
      
      public function get kickPermission() : Boolean
      {
         return var_1952;
      }
      
      public function get offenceCategories() : Array
      {
         return var_1445;
      }
      
      public function get issues() : Array
      {
         return var_153;
      }
      
      public function get bobbaFilterPermission() : Boolean
      {
         return var_1948;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return var_1953;
      }
   }
}
