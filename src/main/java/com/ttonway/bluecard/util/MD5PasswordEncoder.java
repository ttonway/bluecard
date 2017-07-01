package com.ttonway.bluecard.util;

import org.apache.log4j.Logger;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.math.BigInteger;
import java.security.MessageDigest;

/**
 * Created by ttonway on 2017/6/8.
 */
public class MD5PasswordEncoder implements PasswordEncoder {
    private static Logger logger = Logger.getLogger(MD5PasswordEncoder.class);

    @Override
    public String encode(CharSequence rawPassword) {
        String md5 = "";
        try {
            // ����һ��MD5���ܼ���ժҪ
            MessageDigest md = MessageDigest.getInstance("MD5");
            // ����md5����
            md.update(rawPassword.toString().getBytes());
            // digest()���ȷ������md5 hashֵ������ֵΪ8Ϊ�ַ�������Ϊmd5 hashֵ��16λ��hexֵ��ʵ���Ͼ���8λ���ַ�
            // BigInteger������8λ���ַ���ת����16λhexֵ�����ַ�������ʾ���õ��ַ�����ʽ��hashֵ
            md5 = new BigInteger(1, md.digest()).toString(16);
        } catch (Exception e) {
            logger.error("encode fail.", e);
        }
        return md5;
    }

    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        return encode(rawPassword).equals(encodedPassword);
    }
}
