package kr.co.itcen.mysite.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.itcen.mysite.service.GuestbookService;
import kr.co.itcen.mysite.vo.GuestbookVo;

@Controller
@RequestMapping("/guestbook")
public class GuestbookController {
	private GuestbookService guestbookService;

	@RequestMapping(value = "/delete", method =RequestMethod.GET)
	public String delete() {
		return "/guestbook/delete";
	}
	//@RequestMapping(value = "/delete", method =RequestMethod.POST)
	//public String delete(@ModelAttribute GuestbookVo vo, HttpSession session,Model model) {
//		GuestbookVo guestbookVo = guestbookService.delete(vo);
//		if(guestbookVo == null) {
//			model.addAttribute("result","delete fail");
//			return "guestbook/list";
//		}
//		session.setAttribute("authUser", guestbookVo);
//		return "redirect:/";
//	}
	@RequestMapping(value = "/list", method =RequestMethod.GET)
	public String list() {
		return "/guestbook/list";
	}
}
