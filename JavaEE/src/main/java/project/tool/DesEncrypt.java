package project.tool;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

/**
 * @author BXO
 * @version 1.0
 * @description: TODO
 * @date 2022/6/15 22:11
 */
public class DesEncrypt {
   private String originKey = "3916bxo0";
    /**
     * 加密
     * @param clearText
     * @return
     * @throws NoSuchPaddingException
     * @throws NoSuchAlgorithmException
     * @throws InvalidKeyException
     * @throws BadPaddingException
     * @throws IllegalBlockSizeException
     */
    public String desRncript(String clearText) throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, BadPaddingException, IllegalBlockSizeException {
       //获取加密工具类
        Cipher des = Cipher.getInstance("DES");
        //初始化
        SecretKeySpec key = new SecretKeySpec(originKey.getBytes(), "DES");
        des.init(Cipher.ENCRYPT_MODE,key);
        //可能会造成字节丢失
        byte[] doFinal = des.doFinal(clearText.getBytes());
        String encode = Base64.encode(doFinal);
        return encode;
    }

    /**
     * 解密
     * @param cipherText
     * @return
     * @throws NoSuchPaddingException
     * @throws NoSuchAlgorithmException
     * @throws InvalidKeyException
     * @throws BadPaddingException
     * @throws IllegalBlockSizeException
     */
    public String desDecript(String cipherText) throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, BadPaddingException, IllegalBlockSizeException {
        //获取加密工具类
        Cipher des = Cipher.getInstance("DES");
        //初始化
        SecretKeySpec key = new SecretKeySpec(originKey.getBytes(), "DES");
        des.init(Cipher.DECRYPT_MODE,key);
        byte[] decode = Base64.decode(cipherText);
        //可能会造成字节丢失
        byte[] doFinal = des.doFinal(decode);

        return new String(doFinal);

    }

}
