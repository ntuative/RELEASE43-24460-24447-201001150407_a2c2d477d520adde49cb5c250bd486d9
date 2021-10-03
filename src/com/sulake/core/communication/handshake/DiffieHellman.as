package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1342:BigInteger;
      
      private var var_960:BigInteger;
      
      private var var_1685:BigInteger;
      
      private var var_1343:BigInteger;
      
      private var var_1686:BigInteger;
      
      private var var_1657:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1342 = param1;
         var_1685 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_1686.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1343 = new BigInteger();
         var_1343.fromRadix(param1,param2);
         var_1686 = var_1343.modPow(var_960,var_1342);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_1657.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         var_960 = new BigInteger();
         var_960.fromRadix(param1,param2);
         var_1657 = var_1685.modPow(var_960,var_1342);
         return true;
      }
   }
}
