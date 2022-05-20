package com.stusystem.dao;

import java.util.List;

import com.stusystem.entity.ScoreBean;
import com.stusystem.entity.StudentBean;
import com.stusystem.entity.SubjectBean;


public interface ScoreDao {
	//多表查询查询出一个申请人的成绩和其他信息保存到一个score对象中  
	public List<ScoreBean> getscorelist(StudentBean studentbean)throws Exception;
	//添加一个申请人的成绩 
	public void scoreadd(ScoreBean score)throws Exception;
	//查询一个申请人的未选选科研信息list
	public List<SubjectBean> getSubject(ScoreBean score) throws Exception;
	//已选科研信息的分页处理
	public int getsbjpage(ScoreBean score)throws Exception;
	//添加一个申请人的选课信息
	public void setsubject(ScoreBean score)throws Exception;
	//查询一个申请人已选科研信息的list
	public List<SubjectBean> yxsubjectlist(ScoreBean score) throws Exception;
	//删除一条已选科研
	public void delyxkc(ScoreBean score) throws Exception;
	//查询一个申请人的已选科研成绩和科研信息的list
	public List<ScoreBean> getscoreonelist(ScoreBean score)throws Exception;
}
