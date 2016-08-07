package com.moby.service;

import com.moby.entiry.AuthUser;

/**
 * Created by Moby on 16/8/7.
 */
public interface AuditDeviceService {
    int saveAuditDevice(String type, String content, AuthUser authUser);
}
