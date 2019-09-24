package kr.co.itcen.mysite.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.mysite.repository.GuestbookDao;
import kr.co.itcen.mysite.vo.GuestbookVo;
import kr.co.itcen.mysite.vo.UserVo;

@Service
public class GuestbookService {
	@Autowired
	private GuestbookDao guestbookDao;

	public void delete(GuestbookVo vo) {
		guestbookDao.delete(vo);
	}

}
