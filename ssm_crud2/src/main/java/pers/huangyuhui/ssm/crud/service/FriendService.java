package pers.huangyuhui.ssm.crud.service;

import pers.huangyuhui.ssm.crud.bean.Friend;

import java.util.List;

/**
 * @project: ssm_crud2
 * @description: Service层: 操控好友信息
 * @author: HuangYuhui
 * @date: 6/4/2019-11:04 PM
 * @version: 1.0
 */
public interface FriendService {

    // TODO: 6/5/2019 查询所有好友信息
    List<Friend> selectAll();

    // TODO: 6/6/2019 保存(添加/更新)好友信息
    void save(Friend friend);

    // TODO: 6/6/2019 通过id查询好友信息
    Friend selectById(Integer id);

    // TODO: 6/6/2019 根据id删除指定好友
    void deleteByIds(Integer[] id);
}
