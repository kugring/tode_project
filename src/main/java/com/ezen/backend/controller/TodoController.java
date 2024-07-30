package com.a.ezn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.a.ezn.repo.TodoTitleRepository;
import com.a.ezn.repo.UserRepository;

/*
 * 	BoardController 클래스가 com.a.ean 패키지 아래에 존재하고
 * @Controller(@Componant) 어노테이션이 달려있기 때문에
 * 컴포넌트 스캔시 BoardController 클래스의 생성자를 스프링에서 호출하고 IOC컨테이너에 넣는다.
 * 
 * 컨트롤러 네이터베이스 접근과, 실제화면에 대한 접근을 처리해주는 코드만을 작성해야한다.
 * 데이터베이스에 대한 접근은(CRUD) DAO(Repository)클래스를  이용해서만 접근해야만 한다.
 * */
@Controller
//특정 url 경로로 요청이 왔을떄 특정 클래스 안에서 메서드를 찾게된다.
//~~/board/board.do =>  BoardController안에 board.do 를 찾는다.
@RequestMapping("/Todo")
public class TodoController {


	/**
	 * @Autowired 어노테이션이 달린 필드나, setter메서드나, 생성자는
	 * 해당하는 클래스를 IOC컨테이너에서 찾아 주입 (대입)한다.
	 * IOC 컨테이너에 등록된 생성자의 타입을 이용해서 찾는다.
	 * 
	 * 이 단계를 의존성 주입(DI, Dependency Injection)이라고 한다.
	 * BoardController 클래스는 BoardRepository 클래스에 의존하고 있는것.
	 * 
	 */
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	TodoTitleRepository todoTitleRepository;
	
	@Autowired
	ServletContext servletContext;
	
	
	/*
	 * 메서드에 @RequestMapping 어노테이션이 달려있다면 value 속성에 넣은 url로 요청이 올 때,
	 * method 속성에 맞는 http 요청이 올 때 해당 메서드를 실행한다.
	 * ex) get요청으로 //board/board.do 요청이 온다면 아래의 board 메서드가 실행된다.
	 * */
	@RequestMapping(value="/TodoTitle.do",method=RequestMethod.GET)
	public String TodoTitle(Model model,HttpServletRequest request,
			//model 객체는 서블릿에서 request.setAttribute를 이용해
			//특정 jsp로 포워딩 시 데이터를 넘겨주는것과 동일한 역할을 수행한다.
			//스프링이 board 메서드를 실행할 때 메서드의 파라미터로 넣어준다.
			
			
			//request.getParameter()외 동일한 역할을 수행한다.
			//url 파라미터에서 name 속성의 값을 떠내오는 것
			//name 속성의 값은 url로 요청이 오면 BoardController
			
			/*, @RequestParam(name="title", required=false) String title, @RequestParam(name="body", defaultValue="기본 본문") String body*/
//			BucketListVO vo,
//			@RequestParam(name="searchType", required=false) String searchType,
//			@RequestParam(name="keyword", required=false) String keyword,
//			 @RequestParam(name="page", required=false, defaultValue = "1") int page
			TodoTitleVO tvo) {
		
		
/*		BoardVO vo = new BoardVO();
		vo.setBody(body);
		vo.setTitle(title);*/
//		
//		Pageable pageable = PageRequest.of(page - 1 , 10); 
		
//		Page<BucketListVO> data = repository.getAllData(pageable,searchType,keyword);
//		data.getContent();
//		data.getTotalPages();
		
		
		//특정 jsp 페이지로 포워딩될때 데이터를 넣어준다.
		//데이터는 키-밸류 형식으로 넣어 주어야한다.
		//아래는 "vo"라는 키에 게시글 데이터를 넣어준것
//		model.addAttribute("vo" , data.getContent());
//		model.addAttribute("currentPage" , page);
//		model.addAttribute("totalPage" , data.getTotalPages());
//		model.addAttribute("pageSize", 10);
		
		//RequestMapping 어노테이션이 달린 메서드가 문자열로 데이터를 반환한다면
		//뷰 리졸버가 이를 가로채, 특정 jsp로 포워딩 시킨다.
		// -> WEB-INF/view/board.jsp로 포워딩 된다.
		return "TodoTitle";
	} 
	



    @RequestMapping(value="TodoTitle.do", method=RequestMethod.POST)
    public Map<String, String> TodoTitleOk(Model model, HttpServletRequest request, 
            @RequestParam(name="todo-title-id", required=false, defaultValue="0") int todo_title_id,
            @RequestParam(name="color-id", required=false, defaultValue="0") int color_id,
            @RequestParam(name="email", required=false) String email,
            @RequestParam(name="todo-title", required=false) String todo_title,
            @RequestParam(name="title-todo-open", required=false, defaultValue="0") int title_todo_open) {

        // 요청된 파라미터로 TodoTitleVO 객체 생성
        TodoTitleVO tvo = new TodoTitleVO();
        tvo.setTodo_title_id(todo_title_id);
        tvo.setColor_id(color_id);
        tvo.setEmail(email);  // email 설정 추가
        tvo.setTodo_title(todo_title);
        tvo.setTitle_todo_open(title_todo_open);

        // 모든 데이터를 가져와서 첫 번째 항목을 사용
        List<TodoTitleVO> allData = todoTitleRepository.getAllData();
        TodoTitleVO savedTodoTitle = allData.isEmpty() ? new TodoTitleVO() : allData.get(0);

        // 결과를 Map에 담아 반환
        Map<String, String> result = new HashMap<>();
        result.put("todoTitleId", String.valueOf(savedTodoTitle.getTodo_title_id()));
        result.put("colorId", String.valueOf(savedTodoTitle.getColor_id()));
        result.put("email", savedTodoTitle.getEmail());
        result.put("todoTitle", savedTodoTitle.getTodo_title());
        result.put("titleTodoOpen", String.valueOf(savedTodoTitle.getTitle_todo_open()));

        return result;
    }
}
	

	
	
//	@RequestMapping(value="/post.do", method=RequestMethod.GET)
//	public String view(@RequestParam(name="sno", defaultValue="0") int sno, Model model) {
//		
////		BucketListVO vo = repository.selectOne(sno);
//		model.addAttribute("vo", vo);
//		
//		
//		return "view";
//	}
//		
	
	@RequestMapping(value="write.do", method=RequestMethod.GET)
	public String write(HttpSession session) {
		
		return "write";
	}
	
	
	
//	@RequestMapping(value="write.do", method=RequestMethod.POST)
//	public String writeOk(
//			//url로 요청온 파라미터가 특정 클래스 내에 존재하는 필드와 동일하다면 
//			//클래스 타입으로 url 파라미터를 받을 수 있다.
//			//ex) ?sno=2&title=제목&body=본문 ...과 같이 요청이 온다면
//			//vo클래스에 해당 값을 setter 메서드를 이용해 호출하고 담아준다.
//			BucketListVO vo,
//			//여러개의 첨부파일을 갖기 위해서는 MultipartFile 설정을 한 후
//			//컨트롤러 메서드의 파라미터로 첨부파일을 받을 수 있다.
//			@RequestParam("file") MultipartFile[] files) {
//		
//
//		
//		repository.insertOne(vo);
//		int result = vo.getEmail();
//		
//		String uploadDir = servletContext.getRealPath("/upload/");
//		File dir = new File(uploadDir);
//		
//		if(!dir.exists()) {
//			dir.mkdirs();
//		}
//		
//		List<TodoTitleVO> fileList = new ArrayList<TodoTitleVO>();
//		
//		for(MultipartFile file : files) {
//			if(!file.isEmpty()) {
//				String originFileName = file.getOriginalFilename();
//				
//				String uniqueFileName = UUID.randomUUID().toString() + "." + getFileExtention(originFileName);
//				
//				String filePath = uploadDir + uniqueFileName;
//				
//				try {
//					file.transferTo(new File(filePath));
//					TodoTitleVO fileVo = new TodoTitleVO();
//					fileVo.setEmail(email);
//					fileVo.setFileName(originFileName);
//					fileVo.setFilePath(filePath);
//					fileVo.setFileSize(file.getSize() + "");
//					fileVo.setFileType(file.getContentType());
//					fileList.add(fileVo);
//					
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//				
//			}
//			
//			
//		}
//		
//		
//		if(result >= 1) {
//			if(fileList.size() != 0) {
//				fileRepository.insert(fileList);
//			}
//			return "redirect:/board/post.do?sno=" + vo.getSno();
//		}else {
//			return "redirect:/board/board.do";
//		}
//			
//		
//	}
//	
//	
//	@RequestMapping(value="/modify.do", method=RequestMethod.GET)
//	public String modifyBoard(@RequestParam(name="sno", required=false, defaultValue="0") int sno, Model model) {
//		
//		BucketListVO vo = repository.selectOne(sno);
//		model.addAttribute("vo", vo);
//		
//		return "modify";
//	}
//	
//	
//	@RequestMapping(value="/modify.do", method=RequestMethod.POST)
//	public String modifyBoardOk(BucketListVO vo) {
//		
//		int result = repository.update(vo);
//		
//		if(result > 0) {
//			return "redirect:/board/post.do?sno=" + vo.getSno();
//		}else {
//			return "redirect:board/board.do";
//		}
//		
///*		System.out.println(vo.getSno());
//		System.out.println(vo.getTitle());
//		System.out.println(vo.getWriter());
//		System.out.println(vo.getBody());*/
//	}
//	
//
//	@RequestMapping(value="delete.do", method=RequestMethod.POST)
//	public String deleteBoard(@RequestParam(name="sno") int sno) {
//		
//		int result = repository.delete(sno);
//		
//		if(result > 0) {
//			return "redirect:/board/board.do";
//		}else {
//			return "redirect:/board/post.do?sno=" + sno;
//		}
//	}
//
//	public String getFileExtention(String fileName) {
//		int index = fileName.lastIndexOf(".");
//		if(index == -1) {
//			return "";
//		}
//		
//		return fileName.substring(index + 1);
//	}
//	
	
}
