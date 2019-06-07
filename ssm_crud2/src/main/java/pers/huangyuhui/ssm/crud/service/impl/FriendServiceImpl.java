package pers.huangyuhui.ssm.crud.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pers.huangyuhui.ssm.crud.bean.Friend;
import pers.huangyuhui.ssm.crud.dao.FriendMapper;
import pers.huangyuhui.ssm.crud.service.FriendService;

import java.util.List;

/**
 * @project: ssm_crud_alumni
 * @description: Service层的实现类
 * @author: HuangYuhui
 * @date: 6/4/2019-11:05 PM
 * @version: 1.0
 */
@Service("studentService") //标注为Service层
@Transactional //添加Sping事务管理
public class FriendServiceImpl implements FriendService {

    // TODO: 6/5/2019 注入Mapper接口对象
    @Autowired
    private FriendMapper friendMapper;

    // TODO: 6/5/2019 查询所有好友信息
    @Override
    public List<Friend> selectAll() {
        return friendMapper.selectAll();
    }

    // TODO: 6/6/2019 保存(添加/更新)好友信息
    @Override
    public void save(Friend friend) {
        //判断是添加还是修改操作
        if (friend.getId() != null) {
            friendMapper.updateById(friend);//更新操作
        } else {
            friendMapper.insert(friend);//添加操作
        }
    }

    // TODO: 6/6/2019 根据id查询指定好友信息
    @Override
    public Friend selectById(Integer id) {
        return friendMapper.selectById(id);
    }

    // TODO: 6/6/2019 根据id删除指定好友信息
    @Override
    public void deleteByIds(Integer[] id) {
        friendMapper.deleteByIds(id);
    }
}