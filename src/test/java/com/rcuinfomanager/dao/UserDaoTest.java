/**
 * 版权声明：中图一购网络科技有限公司 版权所有 违者必究 2012 
 * 日    期：12-10-30
 */
package com.rcuinfomanager.dao;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author 王文庭(xorbytes@qq.com)
 *         功能说明:
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/applicationContext.xml"})
public class UserDaoTest {
  /*  @Autowired
    @Qualifier("dataSource")
    private BasicDataSource dataSource;

    @Autowired
  //  private UserDao userDao;

    @Before
    public void connectionTest() throws Exception {
        dataSource.getConnection();
    }

    @Test
    public void testUser() {
        int id = 3;
        //添加
        User u = new User();
        u.setUserName("zhangsan");
        u.setPassword("123456");
       // u.setUserType("2");
     //   u.setRemark("张三客户端");
        u.setDisplayUserName("张三");
        u.setCreateTime(DateUtils.getCurrTimeStrOfStoreFormat());
        u.setUpdateTime(DateUtils.getCurrTimeStrOfStoreFormat());
        //userDao.saveUser(u);

        //查询
      //  User user = userDao.getUserById(id);
        Assert.assertNotNull(user);
        Assert.assertTrue(user.getUserName().equals("zhangsan"));

        //修改
      //  user.setPassword("654321");
      //  userDao.updateUser(user);

        //修改后的结果
       // User updateResult = userDao.getUserById(id);
        Assert.assertNotNull(updateResult);
        Assert.assertTrue(updateResult.getPassword().equals("654321"));

        //删除
        userDao.deleteUser(id);
        User deleteResult = userDao.getUserById(id);
        Assert.assertNull(deleteResult);
    }*/
}
