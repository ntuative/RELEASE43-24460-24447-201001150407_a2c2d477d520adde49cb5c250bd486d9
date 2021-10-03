package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import flash.utils.getTimer;
   
   public class IssueInfoMessageParser implements IMessageParser
   {
       
      
      private var var_63:IssueMessageData;
      
      public function IssueInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_63 = new IssueMessageData();
         var_63.issueId = param1.readInteger();
         var_63.state = param1.readInteger();
         var_63.categoryId = param1.readInteger();
         var_63.reportedCategoryId = param1.readInteger();
         var_63.timeStamp = getTimer() - param1.readInteger();
         var_63.priority = param1.readInteger();
         var_63.reporterUserId = param1.readInteger();
         var_63.reporterUserName = param1.readString();
         var_63.reportedUserId = param1.readInteger();
         var_63.reportedUserName = param1.readString();
         var_63.pickerUserId = param1.readInteger();
         var_63.pickerUserName = param1.readString();
         var_63.message = param1.readString();
         var_63.chatRecordId = param1.readInteger();
         var_63.roomName = param1.readString();
         var_63.roomType = param1.readInteger();
         if(false)
         {
            var_63.roomResources = param1.readString();
            var_63.unitPort = param1.readInteger();
            var_63.worldId = param1.readInteger();
         }
         if(false)
         {
            var_63.flatType = param1.readString();
            var_63.flatId = param1.readInteger();
            var_63.flatOwnerName = param1.readString();
         }
         return true;
      }
      
      public function get issueData() : IssueMessageData
      {
         return var_63;
      }
      
      public function flush() : Boolean
      {
         var_63 = null;
         return true;
      }
   }
}
