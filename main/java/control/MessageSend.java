package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import model.MessageModel;

/**
 * Servlet implementation class MessageSend
 */
@WebServlet("/MessageSend")
public class MessageSend extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageSend() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String content = request.getParameter("message-input");
		String sender = (String) request.getSession().getAttribute("senderName");
		String receiver = (String) request.getSession().getAttribute("receiver");
		
		DAO dao = new DAO();
		dao.sendMessage(sender, receiver, content);
		
		List<MessageModel> list = dao.getMessage(sender, receiver);
		request.setAttribute("messageList", list);
		request.setAttribute("senderName", sender);
		request.getRequestDispatcher("MessageBox.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
