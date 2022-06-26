package project.service;

import project.dao.UserMapper;
import project.pojo.User;

import java.util.List;

/**
 * @author BXO
 * @version 1.0
 * @description: TODO
 * @date 2022/5/31 17:34
 */
public class UserServiceImpl implements UserService {
    private UserMapper userMapper;

    public UserServiceImpl(){}
    public UserServiceImpl(UserMapper userMapper) {
        this.userMapper = userMapper;
    }


    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public List<User> queryAllUser() {
        return userMapper.queryAllUser();
    }

    @Override
    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public int login(User user) {
        return userMapper.login(user);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    //实现通过用户查询用户账户的方法
    public List<User> findU_id(int u_id) {
        return userMapper.findU_id(u_id);
    }
    //通过账户查询用户信息的查询
    public User findU_account(String u_account){
        return userMapper.findU_account(u_account);
    }

    @Override
    public List<User> findU_Allaccount(String u_account) { return userMapper.findU_Allaccount(u_account); }

    public List<User> findU_idcard(String u_idcard) { return userMapper.findU_idcard(u_idcard);}

    public List<User> findU_sex(String u_sex) {
        return userMapper.findU_sex(u_sex);
    }

    public List<User> findU_type(int u_type) {
        return userMapper.findU_type(u_type);
    }

    //
    public void DeAllU() { userMapper.DeAllU(); }

    //
    public List<User> findAllU() { return userMapper.findAllU(); }

    //实现通过用户id删除用户账户的方法
    public void DeU_id(int u_id) {
        userMapper.DeU_id(u_id);
    }

    //
    public void Updatetuser(User user){
        System.out.println(user);
        userMapper.Updatetuser(user); }

    @Override
    public void Updatetpower(int u_type, int u_id) { userMapper.Updatetpower(u_type,u_id); }
}
