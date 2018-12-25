package com.glkj.webchat.dao;

import java.util.List;

import com.glkj.webchat.pojo.YuCe;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.glkj.webchat.pojo.LottType;

@Repository(value = "lottDao")
public interface ILottDao {

	/**
	 * 查新所有已激活的彩种
	 * @param state
	 * @return
	 */
	List<LottType> selectActivation(Integer state);

	List<YuCe> findYuCeByIds(@Param("lott")String lott, @Param("gid")String gid, @Param("play")String play);

	YuCe findYuCe(@Param("roomName")String roomName, @Param("nextOpenIssue")String nextOpenIssue);

	LottType findLottType(String lottCode);
}
