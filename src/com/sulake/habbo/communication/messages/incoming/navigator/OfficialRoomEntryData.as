package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1203:int = 4;
      
      public static const const_500:int = 3;
      
      public static const const_602:int = 2;
      
      public static const const_800:int = 1;
       
      
      private var var_1967:String;
      
      private var _disposed:Boolean;
      
      private var var_1900:int;
      
      private var var_1969:Boolean;
      
      private var var_733:String;
      
      private var var_815:PublicRoomData;
      
      private var var_1970:int;
      
      private var _index:int;
      
      private var var_1966:String;
      
      private var _type:int;
      
      private var var_1638:String;
      
      private var var_814:GuestRoomData;
      
      private var var_1968:String;
      
      private var _open:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         _index = param1.readInteger();
         var_1967 = param1.readString();
         var_1968 = param1.readString();
         var_1969 = param1.readInteger() == 1;
         var_1966 = param1.readString();
         var_733 = param1.readString();
         var_1970 = param1.readInteger();
         var_1900 = param1.readInteger();
         _type = param1.readInteger();
         if(_type == const_800)
         {
            var_1638 = param1.readString();
         }
         else if(_type == const_500)
         {
            var_815 = new PublicRoomData(param1);
         }
         else if(_type == const_602)
         {
            var_814 = new GuestRoomData(param1);
         }
      }
      
      public function get folderId() : int
      {
         return var_1970;
      }
      
      public function get popupCaption() : String
      {
         return var_1967;
      }
      
      public function get userCount() : int
      {
         return var_1900;
      }
      
      public function get open() : Boolean
      {
         return _open;
      }
      
      public function get showDetails() : Boolean
      {
         return var_1969;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_800)
         {
            return 0;
         }
         if(this.type == const_602)
         {
            return this.var_814.maxUserCount;
         }
         if(this.type == const_500)
         {
            return this.var_815.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_1968;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_814 != null)
         {
            this.var_814.dispose();
            this.var_814 = null;
         }
         if(this.var_815 != null)
         {
            this.var_815.dispose();
            this.var_815 = null;
         }
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_814;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get picText() : String
      {
         return var_1966;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_815;
      }
      
      public function get picRef() : String
      {
         return var_733;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tag() : String
      {
         return var_1638;
      }
      
      public function toggleOpen() : void
      {
         _open = !_open;
      }
   }
}
