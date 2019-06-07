package pers.huangyuhui.ssm.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.huangyuhui.ssm.crud.bean.Friend;
import pers.huangyuhui.ssm.crud.service.FriendService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @project: ssm_crud_alumni
 * @description: 控制器
 * @author: HuangYuhui
 * @date: 6/5/2019-8:50 AM
 * @version: 1.0
 */
@Controller
@RequestMapping("/friend")
public class FriendController {

    @Autowired //注入业务对象
    private FriendService friendService;

    //存储预返回给页面的对象数据
    private Map<String, Object> result = new HashMap<>();

    /**
     * @description: 分页查询: 获取所有学生信息,分页后返回给页面
     * @param: page 当前页数
     * @param: rows 每页行数
     * @date: 2019-06-06 10:10 AM
     * @return: java.util.List<pers.huangyuhui.ssm.crud.bean.Friend>
     */
    @RequestMapping("/getFriendList")
    @ResponseBody //将Map转化为JSON数据
    public Map<String, Object> getFriendlist(Integer page, Integer rows) {

        //设置每页的记录数
        PageHelper.startPage(page, rows);
        //获取所有好友信息
        List<Friend> list = friendService.selectAll();
        //封装查询结果
        PageInfo<Friend> pageInfo = new PageInfo<>(list);
        //获取总记录数
        long total = pageInfo.getTotal();
        //获取当前页数据列表
        List<Friend> friendList = pageInfo.getList();
        //存储对象数据
        result.put("total", total);
        result.put("rows", friendList);

        return result;
    }


    /**
     * @description: 添加好友信息
     * @param: friend 学生信息
     * @date: 2019-06-06 5:21 PM
     * @return: java.util.Map<java.lang.String, java.lang.Object>
     */
    @RequestMapping("/submitForm")
    @ResponseBody
    public Map<String, Object> submitForm(Friend friend) {
        try {
            friendService.save(friend);
            result.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success", false);
            result.put("msg", "(ಥ_ಥ)服务器端发生异常 !");
        }
        return result;
    }


    /**
     * @description: 表单回显功能:通过id查询好友信息
     * @param: id 好友ID
     * @date: 2019-06-06 9:19 PM
     * @return: pers.huangyuhui.ssm.crud.bean.Friend
     */
    @RequestMapping("/editFriend")
    @ResponseBody
    public Friend editFriend(Integer id) {
        return friendService.selectById(id);
    }


    /**
     * @description: 根据id删除指定好友信息
     * @param: ids 拼装后的id
     * @date: 2019-06-06 10:32 PM
     * @return: void
     */
    @RequestMapping("deleteFriend")
    @ResponseBody
    public Map<String, Object> deleteFriend(Integer[] id) {
        try {
            friendService.deleteByIds(id);
            result.put("success", true);
        } catch (Exception e) {
            result.put("success", false);
            result.put("msg", "(ಥ_ಥ)服务器端发生异常 !");
            e.printStackTrace();
        }
        return result;
    }
}
