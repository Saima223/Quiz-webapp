package testing.filter;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = {"/quiz.jsp", "/quizResult.jsp", "/submitQuiz", "/quizQuestion"})  // Add other protected pages here
public class AuthenticationFilter implements Filter {
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        HttpSession session = httpRequest.getSession(false);
        
        // Debug logs
        System.out.println("AuthenticationFilter - Checking session");
        
        if (session == null || session.getAttribute("user") == null) {
            System.out.println("AuthenticationFilter - No valid session found, redirecting to login");
            httpResponse.sendRedirect("login.jsp");
        } else {
            System.out.println("AuthenticationFilter - Valid session found, proceeding");
            chain.doFilter(request, response);
        }
    }
    
    @Override
    public void destroy() {
    }
}