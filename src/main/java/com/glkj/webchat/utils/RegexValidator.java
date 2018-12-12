package com.glkj.webchat.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexValidator {
    /**
     * @param str 待验证的字符串
     * @return 如果是符合邮箱格式的字符串, 返回true,否则为false
     */
    public static boolean isEmail(String str) {
        String regex = "[a-zA-Z_]{1,}[0-9]{0,}@(([a-zA-z0-9]-*){1,}\\.){1,3}[a-zA-z\\-]{1,}";
        return matche(regex, str);
    }

    /**
     * @param str 待验证的字符串
     * @return 如果是符合网址格式的字符串, 返回true,否则为false
     */
    public static boolean isURL(String str) {
        String regex = ".*([A-Za-z0-9:/]+)\\.([A-Za-z0-9-~]+)\\.([A-Za-z0-9_?/=&]+).*";
        return matche(regex, str);
    }

    public static boolean isURI(String str) {
        String regex = ".*([A-Za-z0-9-]+)\\.([cC][oO][mM]|[nN][eE][tT]|[oO][rR][gG]|[cC][nN]|[cC][oO][mM].[cC][nN]|[nN][eE][tT].[cC][nN]|[oO][rR][gG].[cC][nN]|[gG][oO][vV].[cC][nN]|[cC][cC]|[tT][vV]|[tT][oO][pP]|[vV][iI][pP]|[gG][oO][vV]|[eE][dD][uU]|[iI][nN][tT]).*";
        return matche(regex, str);
    }

    /**
     * @param regex 正则表达式字符串
     * @param str   要匹配的字符串
     * @return 如果str 符合 regex的正则表达式格式,返回true, 否则返回 false;
     */
    private static boolean matche(String regex, String str) {
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(str);
        return matcher.matches();
    }

}
