package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_923:SoundChannel = null;
      
      private var var_749:Boolean;
      
      private var var_922:Sound = null;
      
      private var var_608:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         var_922 = param1;
         var_922.addEventListener(Event.COMPLETE,onComplete);
         var_608 = 1;
         var_749 = false;
      }
      
      public function get finished() : Boolean
      {
         return !var_749;
      }
      
      public function stop() : Boolean
      {
         var_923.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         var_749 = false;
         var_923 = var_922.play(0);
         this.volume = var_608;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return var_608;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get position() : Number
      {
         return var_923.position;
      }
      
      public function get length() : Number
      {
         return var_922.length;
      }
      
      public function set volume(param1:Number) : void
      {
         var_608 = param1;
         if(var_923 != null)
         {
            var_923.soundTransform = new SoundTransform(var_608);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var_749 = true;
      }
   }
}
