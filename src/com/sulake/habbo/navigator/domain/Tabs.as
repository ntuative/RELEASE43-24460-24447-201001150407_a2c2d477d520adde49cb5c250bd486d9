package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_655:int = 6;
      
      public static const const_209:int = 5;
      
      public static const const_635:int = 2;
      
      public static const const_280:int = 9;
      
      public static const const_300:int = 4;
      
      public static const const_265:int = 2;
      
      public static const const_698:int = 4;
      
      public static const const_218:int = 8;
      
      public static const const_613:int = 7;
      
      public static const const_222:int = 3;
      
      public static const const_297:int = 1;
      
      public static const const_197:int = 5;
      
      public static const const_406:int = 12;
      
      public static const const_284:int = 1;
      
      public static const const_625:int = 11;
      
      public static const const_713:int = 3;
      
      public static const const_1497:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_390:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_390 = new Array();
         var_390.push(new Tab(_navigator,const_297,const_406,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_417));
         var_390.push(new Tab(_navigator,const_265,const_284,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_417));
         var_390.push(new Tab(_navigator,const_300,const_625,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_877));
         var_390.push(new Tab(_navigator,const_222,const_209,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_417));
         var_390.push(new Tab(_navigator,const_197,const_218,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_627));
         setSelectedTab(const_297);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_390)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_390)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_390)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_300;
      }
      
      public function get tabs() : Array
      {
         return var_390;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
