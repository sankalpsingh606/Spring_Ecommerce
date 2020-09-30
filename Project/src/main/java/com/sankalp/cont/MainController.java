package com.sankalp.cont;

import java.io.File;
import java.io.FileOutputStream;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sankalp.entity.Category;
import com.sankalp.entity.Order;
import com.sankalp.entity.Payment;
import com.sankalp.entity.Product;
import com.sankalp.entity.User;
import com.sankalp.entity.item;
import com.sankalp.service.Serv;

@Controller
public class MainController {

	@Autowired
	Serv serv;

	@RequestMapping("/order")
	public String order(HttpSession session, Order order) {
		session.setAttribute("order", order);
		return "order";

	}
	@RequestMapping("/orderCancel")
	public String orderCancel(HttpSession session) {
		session.removeAttribute("order");
		session.removeAttribute("cart");
		return "hello";

	}

	@RequestMapping("/payment")
	public String payment(HttpSession session,ModelAndView mv,Payment p) {
		session.removeAttribute("order");
		session.removeAttribute("cart");
		session.setAttribute("payment", p);
		mv.addObject("message", "Payment Success");
		return "hello";

	}

	/*
	 * @RequestMapping("/payment") public String payment(HttpSession session) {
	 * return "hello";
	 * 
	 * }
	 */
	@RequestMapping("/categoryWisePorduct")
	public ModelAndView categoryWisePorduct(@RequestParam("category") String cat, ModelAndView mv) {
		// TODO Auto-generated method stub
		try {

			if (cat.trim().equals("all")) {
				List<Product> plist = serv.getAllProducts();
				mv.addObject("productList", plist);
				mv.setViewName("hello");
			} else {
				int cid = Integer.parseInt(cat.trim());
				System.out.println(cid);
				List<Product> catByPro = serv.getProductCategoryList(cid);
				mv.addObject("productList", catByPro);
				mv.setViewName("hello");
			}

		} catch (Exception e) {
			System.out.println(MainController.class.getCanonicalName() + "->" + e.toString());
		}
		return mv;

	}

	@ModelAttribute
	public void commonDataModel(Model m) {

		m.addAttribute("categoryList", serv.getAllCategories());
		m.addAttribute("productList", serv.getAllProducts());
		m.addAttribute("userList", serv.getAllUser());
		// m.addAttribute("mes", attributeValue)

	}

	@RequestMapping("/hello")
	public String hello(Model m) {
		User user = (User) m.getAttribute("current_user");
		System.out.println("current_user" + user);
		return "hello";
	}

	@RequestMapping("/loginPage")
	public String loginPage() {
		return "login";
	}

	@RequestMapping("/loggedInUser")
	public String loggedInUser(HttpSession session, Model m) {
		User user = (User) session.getAttribute("current_user");
		if (user != null) {

			if (user.getUserType().equals("admin")) {
				return "admin";
			}
			return "normal";
		} else {
			m.addAttribute("message", "You are not logged in !! Login first");
			return "login";
		}

	}

	@RequestMapping("/checkout")
	public String checkout() {
		return "checkout";
	}

	@RequestMapping("/registerPage")
	public String registerPage() {
		return "register";
	}

	@RequestMapping("/login")
	public ModelAndView login(HttpSession session, User u, ModelAndView mv) {
		try {
			User user = new User();
			user = serv.logins(u);
			if (user != null) {
				session.setAttribute("current_user", user);
				if (user.getUserType().equals("admin")) {
					mv.setViewName("admin");
				} else if (user.getUserType().equals("normal")) {
					mv.setViewName("normal");
				}
			} else {
				mv.addObject("message", "Your email and password not matched!!! Register frist");
				mv.setViewName("login");
			}

		} catch (Exception e) {
			System.out.println(MainController.class.getCanonicalName() + "->" + e.toString());
		}
		return mv;

	}

	@RequestMapping("/register")
	public ModelAndView register(ModelAndView mv, User u) {
		try {
			User user2 = new User();
			user2 = serv.emailCheck(u);
			if (user2 != null) {
				mv.addObject("message", "This Email Id Already Used!.");
				mv.setViewName("register");
				return mv;
			} else {
				User user = new User(u.getUserName(), u.getUserEmail(), u.getUserPassword(), u.getUserPhone(),
						"default.jsp", u.getUserAddress(), "normal");
				u = serv.insert(user);
				if (u != null) {
					mv.addObject("message", "Successfully Register!.");
					mv.setViewName("register");
					return mv;
				} else {
					mv.addObject("message", "Registeration Failed");
					mv.setViewName("register");
				}
			}

		} catch (Exception e) {
			System.out.println(MainController.class.getCanonicalName() + "->" + e.toString());
		}
		return mv;

	}

	@RequestMapping("/addCategory")
	public ModelAndView addCategory(ModelAndView mv, Category c) {
		try {

			c = serv.addCategory(c);
			if (c != null) {
				mv.addObject("message", "Add Category Successfully!." + c.getCategoryId());
				mv.setViewName("admin");
				return mv;
			} else {
				mv.addObject("message", "Add Category Failed");
				mv.setViewName("admin");
			}

		} catch (Exception e) {
			System.out.println(MainController.class.getCanonicalName() + "->" + e.toString());
		}
		return mv;

	}

	@RequestMapping("/logout")
	public String logout(HttpSession session, Model m) {
		session.removeAttribute("current_user");
		m.addAttribute("message", "User Successfully Logout.");
		return "login";

	}

	@RequestMapping("/addProduct")
	private ModelAndView addProduct(@RequestParam("pPhoto") CommonsMultipartFile file, HttpServletRequest request,
			ModelAndView mv) {
		// TODO Auto-generated method stub
		try {
			String pTitle = request.getParameter("pTitle");
			String pDesc = request.getParameter("pDesc");
			int pPrice = Integer.parseInt(request.getParameter("pPrice"));
			int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
			int pQuanity = Integer.parseInt(request.getParameter("pQuanity"));
			int catId = Integer.parseInt(request.getParameter("catId"));

			Product p = new Product();
			p.setpTitle(pTitle);
			p.setpDesc(pDesc);
			p.setpPrice(pPrice);
			p.setpDiscount(pDiscount);
			p.setpQuanity(pQuanity);
			p.setpPhoto(file.getOriginalFilename());

			Category c1 = serv.categorybyId(catId);
			p.setCategory(c1);
			Product p1 = serv.addProduct(p);
			String path = request.getRealPath("WEB-INF") + File.separator + "static" + File.separator + "image"
					+ File.separator + "product" + File.separator + file.getOriginalFilename();
			System.out.println(path);

			FileOutputStream fos = new FileOutputStream(path);
			byte[] data = file.getBytes();
			fos.write(data);
			fos.close();

			if (p1 != null) {
				mv.addObject("message", "Add Product Successfully!.");
				mv.setViewName("admin");
				return mv;
			} else {
				mv.addObject("message", "Add Product Failed");
				mv.setViewName("admin");
				return mv;
			}

		} catch (Exception e) {
			System.out.println(MainController.class.getCanonicalName() + "->" + e.toString());
		}
		return mv;

	}

	@RequestMapping("/cart")
	public String addToCart(HttpServletRequest request, Model m) {

		String action = request.getParameter("action");
		Integer id = Integer.parseInt(request.getParameter("id"));
		Product product = new Product();
		product = serv.productByid(id);
		HttpSession session = request.getSession();
		if (action.equals("ordernow")) {
			if (session.getAttribute("cart") == null) {
				List<item> cart = new ArrayList<item>();
				cart.add(new item(product, 1));
				session.setAttribute("cart", cart);
			}

			else {
				List<item> cart = (List<item>) session.getAttribute("cart");
				int index = isExisting(id, cart);
				if (index == -1) {
					cart.add(new item(product, 1));
				} else {
					System.out.println("Product Quantity :-" + product.getpQuanity());
					int quantity = cart.get(index).getQuantity() + 1;
					// cart.get(index).setQuantity(quantity);

					if (product.getpQuanity() != quantity) {
						cart.get(index).setQuantity(quantity);
					} else {
						m.addAttribute("message", "Product not available in Stoke!.");
					}

				}
				session.setAttribute("cart", cart);
			}

//			else {
//				List<item> cart = (List<item>) session.getAttribute("cart");
//				cart.add(new item(product, 1));
//				session.setAttribute("cart", cart);
//			}
		}
		System.out.println(id + "," + action);
		return "hello";

	}

	@SuppressWarnings("unused")
	private int isExisting(int id, List<item> cart) {
		for (int i = 0; i < cart.size(); i++)
			if (cart.get(i).getP().getpId() == id)
				return i;
		return -1;

	}

	@RequestMapping("/deleteToCart")
	public String deleteToCart(HttpServletRequest request) {
		Integer id = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		List<item> cart = (List<item>) session.getAttribute("cart");
		int index = isExisting(id, cart);
		cart.remove(index);
		session.setAttribute("cart", cart);
		return "redirect:hello";
	}
}
