package com.cc.util;

import com.cc.dao.UserDao;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

/**
 * Created with IntelliJ IDEA.
 * Author: CC
 * E-mail: 203717588@qq.com
 * Date: 2022/11/23
 * Time: 8:54
 * Description:
 */
public class MybatisUtil {

    private static InputStream inputStream;
    private static SqlSession sqlSession;

    // 初始化
    public static Object init(String res, Class<?> cla) throws IOException {
        inputStream = Resources.getResourceAsStream(res);
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(inputStream);
        sqlSession = factory.openSession(true);
        return sqlSession.getMapper(cla);
    }

    // 销毁(释放资源)
    public static void destroy() throws IOException {
        sqlSession.close();
        inputStream.close();
    }

}
