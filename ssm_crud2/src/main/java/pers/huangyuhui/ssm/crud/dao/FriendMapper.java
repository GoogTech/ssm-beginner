package pers.huangyuhui.ssm.crud.dao;

import pers.huangyuhui.ssm.crud.bean.Friend;

import java.util.List;

/**
 * @project: ssm_crud_alumni
 * @description: DAO层: 操纵好友信息
 * @author: HuangYuhui
 * @date: 6/4/2019-6:30 PM
 * @version: 1.0
 */
public interface FriendMapper {

    // TODO: 6/5/2019 查询所有好友信息
    List<Friend> selectAll();

    // TODO: 6/6/2019 添加好友信息
    void insert(Friend friend);

    // TODO: 6/6/2019 查找指定好友信息
    Friend selectById(Integer id);

    // TODO: 6/6/2019 修改好友信息
    void updateById(Friend friend);

    // TODO: 6/6/2019 根据id删除指定好友
    void deleteByIds(Integer[] id);
}