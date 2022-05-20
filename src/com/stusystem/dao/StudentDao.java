package com.stusystem.dao;

import java.util.List;

import com.stusystem.entity.StudentBean;

public interface StudentDao {
	//返回申请人信息的list
	public List<StudentBean> getStudent(StudentBean studentbean)throws Exception;
	//分页处理
	public int getstupage(StudentBean studentbean)throws Exception;
	//返回一条申请人信息
	public StudentBean getStudentone(StudentBean studentbean)throws Exception;
	//删除一条申请人信息
	public void studentdel(StudentBean studentbean)throws Exception;
	//添加一条申请人信息
	public void studentadd(StudentBean studentbean)throws Exception;
	//修改一条申请人信息
	public void studentxiugai(StudentBean studentbean)throws Exception;
}
