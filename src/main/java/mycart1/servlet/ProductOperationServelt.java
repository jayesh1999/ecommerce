package mycart1.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Path;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import mycart1.dao.CategoryDao;
import mycart1.dao.ProductDto;
import mycart1.entity.Category;
import mycart1.entity.Product;
import mycart1.helper.FactoryProvider;

/**
 * Servlet implementation class ProductOperationServelt
 */
@MultipartConfig
public class ProductOperationServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductOperationServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out  = response.getWriter();
		
	
		//servelt 2:
		//add category
		String op  = request.getParameter("operation");
		
		if(op.trim().equals("addCategory")) {
			String title = request.getParameter("catTitle");
			String description  = request.getParameter("catDesc");
			
		Category category = new Category();
		category.setCategoryTitle(title);
		category.setCategoryDescription(description);
		
		//category database server
		
		CategoryDao categoryDao =  new CategoryDao(FactoryProvider.getFactory());
		int catId = categoryDao.saveCategory(category);
			
		HttpSession httpSession  = request.getSession();
		httpSession.setAttribute("message", "Category added successfully !!");
		response.sendRedirect("admin.jsp");
		return;
		}
		
		//add product
		else if(op.trim().equals("addProduct")) {
			
		String pName = 	request.getParameter("pName");
		String Pdesc  = request.getParameter("pDesc");
		int pPrice  = Integer.parseInt(request.getParameter("pPrice"));
		int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
		int pQuantity  =Integer.parseInt(request.getParameter("pQuantity"));
		int catId  =Integer.parseInt(request.getParameter("catId"));
		
		
		Part part  = request.getPart("pPic");
		
		Product p  = new Product();
		p.setpName(pName);
		p.setpPrice(pPrice);
		p.setpDesc(Pdesc);
		p.setpDiscount(pDiscount);
		p.setPQuantity(pQuantity);
		p.setpPhoto(part.getSubmittedFileName());
		
		//get category by id
		CategoryDao categoryDao =  new CategoryDao(FactoryProvider.getFactory());
		Category category = categoryDao.getCategoryById(catId);
		
		p.setCategory(category);
		
		//out.print(p);
		
		//product save
		ProductDto productDto = new ProductDto(FactoryProvider.getFactory());
		productDto.saveProduct(p);
		
		//upload file code
		
		//get the path of image location
		String path =  request.getRealPath("images") + File.separator + "products" + File.separator  + part.getSubmittedFileName();
		System.out.println(path);
		
		try {
			FileOutputStream fos = new FileOutputStream(path);
			
			InputStream is = part.getInputStream();
			
			byte [] data = new byte[is.available()];
			
			//reading data
			is.read(data);
			
			//write data
			
			fos.write(data);
			
			fos.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		out.print("<h1>Product save successfully </h1>");
		
		HttpSession  httpSession = request.getSession();
		httpSession.setAttribute("message", "Product is added successfully");
		response.sendRedirect("admin.jsp");
		return;
		
		}
		
		
		
		
			
		
	}

}
