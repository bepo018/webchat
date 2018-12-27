package com.glkj.webchat.dao;

import com.glkj.webchat.pojo.LiveInfo;
import com.glkj.webchat.pojo.LivePc;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository(value = "iLiveDao")
public interface ILiveDao {

    void insert(LiveInfo live);

    List<LiveInfo> selectAll(Integer page);

    List<LivePc> selectLive();
}
