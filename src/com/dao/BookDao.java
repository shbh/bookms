package com.dao;

import java.util.List;

import com.model.Book;

public interface BookDao {
	// 添加图书
	public void add(Book book);

	// 删除图书
	public void delete(Book book);

	// 修改图书信息
	public void modify(Book book);

	// 加载图书信息
	public Book load(int id);

	// 加载图书信息列表
	public List<Book> list(int pageNow, int pageSize);

	// 按图书编号查找图书
	public Book findBook(String bookNumber);
	
	// 按图书名进行模糊查询
	public List<Book> findBookByName(String bookName, int pageNow, int pageSize);

	// 获取学生总数
	public long getAllBookCount();

	public int searchCount(String bookname);
}
