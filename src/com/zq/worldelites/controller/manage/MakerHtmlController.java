package com.zq.worldelites.controller.manage;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gambler.makerhtml.MakerHTML;

@Controller
public class MakerHtmlController {

	@ResponseBody
	@RequestMapping("maker_html")
	public void makerHTML(HttpServletRequest request){
		String path = request.getSession().getServletContext().getRealPath("/");
		MakerHTML makerHTML = new MakerHTML("index.html", path + "/index.htm");
		makerHTML.makerHTML();
	}
}
