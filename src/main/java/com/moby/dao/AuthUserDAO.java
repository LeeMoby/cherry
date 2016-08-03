package com.moby.dao;

import com.moby.entiry.AuthUser;

/**
 * Created by Moby on 16/8/3.
 */
public interface AuthUserDAO {

    /**
     * 根据ID获取用户信息
     * @param id
     * @return
     */
    AuthUser getAuthUserById(int id);

    /**
     * 保存用户登录记录
     * @param authUser
     * @return
     */
    int saveAuthUserLoginRecord(AuthUser authUser);

}
