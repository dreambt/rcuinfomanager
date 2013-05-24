package com.rcuinfomanager.session;

import com.rcuinfomanager.CommonConst;
import com.rcuinfomanager.exception.SystemException;
import com.rcuinfomanager.util.CookieUtil;
import com.rcuinfomanager.util.LocalStringUtils;
import com.rcuinfomanager.util.RequestUtils;
import org.apache.commons.lang.StringUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashSet;
import java.util.Set;

/**
 * @author 王文庭(xorbytes@qq.com)
 *         功能说明:
 */
public class SessionFilter implements Filter {

    private static final String FILTER_APPLIED = "__session_context_filter_applied";

    private static final String[] INHERENT_ESCAPE_URIS = {"/login","/login.html","/api"};

    private static final Set STATIC_RESOURCE_URIS = new HashSet();

    static {
        STATIC_RESOURCE_URIS.add(".JPG");
        STATIC_RESOURCE_URIS.add(".JPEG");
        STATIC_RESOURCE_URIS.add(".BMP");
        STATIC_RESOURCE_URIS.add(".GIF");
        STATIC_RESOURCE_URIS.add(".PNG");
        STATIC_RESOURCE_URIS.add(".BMP");

        STATIC_RESOURCE_URIS.add(".ZIP");
        STATIC_RESOURCE_URIS.add(".RAR");

        STATIC_RESOURCE_URIS.add(".JS");
        STATIC_RESOURCE_URIS.add(".CSS");

        STATIC_RESOURCE_URIS.add(".HTM");
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    /**
     * 进行登录检测，如果用户已经登录将UserContext绑定到Session中。
     *
     * @param request
     * @param response
     * @param chain
     * @throws IOException
     * @throws ServletException
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String uri = httpRequest.getRequestURI();
        // 保证该过滤器在一次请求中只被调用一次
        if (request.getAttribute(FILTER_APPLIED) != null || isEscapeFilter(uri)) {
            chain.doFilter(request, response);
        } else {
            try {
                //设置过滤标识，防止一次请求多次过滤
                request.setAttribute(FILTER_APPLIED, Boolean.TRUE);
                boolean needLogon = !isURIEscape(uri);

                String sessionId = null;
                //对服务总线登录的用户会话，根据请求参数获取用户上下文信息，同时要将用户信息写到Cookie中,以便下次
                //可以按正常的方式获取用户上下文（Cookie）
                sessionId = (String) request.getParameter(UserSessionCookieName.SESSION_ID);
                if (StringUtils.isEmpty(sessionId)) {
                    sessionId = request.getParameter(UserSessionCookieName.SESSION_ID);
                }
                if (request.getParameter(UserSessionCookieName.FORCE_NOT_USE_COOKIE) == null && StringUtils.isEmpty(sessionId)) {
                    sessionId = CookieUtil.getCookieValue(httpRequest, UserSessionCookieName.SESSION_ID);
                }
                UserSessionContext userSessionContext = null;
                if (LocalStringUtils.isNotEmpty(sessionId)) {
                    userSessionContext = UserSessionContextManager.getInstance().getUserSessionContext(sessionId);
                }

                if (isUserLogoned(sessionId, userSessionContext)) {//用户已经登录
                    UserSessionContextManager.getInstance().accessIt(sessionId);
                    UserSessionContextHolder.mountUserSessionContext(userSessionContext);
                    CookieUtil.setUserInfoCookies((HttpServletResponse) response);
                } else {//用户没有登录
                    writeNotLogonCookie(response);
                    if (needLogon) {
                        if (RequestUtils.isAjax(httpRequest)) {
                            ((HttpServletResponse) response).setStatus(HttpServletResponse.SC_NOT_ACCEPTABLE);
                            response.getWriter().print("NOLOGON");
                        } else {
                            forwardToLogonPage(request, response);
                        }
                        return;
                    }
                }
                chain.doFilter(request, response);
            } finally {
                UserSessionContextHolder.unmountUserSessionContext();
            }
        }

    }

    @Override
    public void destroy() {

    }

    /**
     * 转向到登录的页面
     *
     * @param request
     * @param response
     */
    private void forwardToLogonPage(ServletRequest request, ServletResponse response) throws
            IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        String logonPageUrl = httpRequest.getSession().getServletContext().getContextPath() + "/login.html";
        String uri = httpRequest.getRequestURI();
        String toUrl = request.getParameter(CommonConst.TO_URL);
        if (LocalStringUtils.isEmpty(toUrl)) {
            logonPageUrl = logonPageUrl + "?" + CommonConst.TO_URL + "=" + URLEncoder.encode(uri, "UTF-8");
        }
        if (httpRequest.getHeader("X-Requested-With") == null) {
            String requestUrl = httpRequest.getRequestURI();
            if (LocalStringUtils.isNotEmpty(httpRequest.getQueryString())) {
                requestUrl += "?" + httpRequest.getQueryString();
            }
            //将用户的请求链接保存在session中，以备登录成功后跳转
            httpRequest.getSession().setAttribute(CommonConst.LOGIN_RRETURN_URL_KEY, requestUrl);
            request.setAttribute("requestUrl", requestUrl);
            //转发到登录页面
            request.getRequestDispatcher("/login.html").forward(request, response);
            return;
        } else {
            try {
                httpResponse.setCharacterEncoding("UTF-8");
                /*针对ajax中页面编码为GBK的情况，一定要加上以下两句*/
                httpResponse.setHeader("Cache-Control", "no-cache");
                httpResponse.setContentType("text/html;charset=UTF-8");
                PrintWriter writer = response.getWriter();
                writer.write("need_to_login_page," + logonPageUrl);
                writer.flush();
                writer.close();
            } catch (IOException e) {
                throw new SystemException(e);
            }
        }
    }

    /**
     * 判断用户是否已经登录
     *
     * @param sessionId          会话ID
     * @param userSessionContext
     * @return
     */
    private boolean isUserLogoned(String sessionId, UserSessionContext userSessionContext) {
        return LocalStringUtils.isNotEmpty(sessionId) && userSessionContext != null;
    }

    private void writeNotLogonCookie(ServletResponse response) {
        CookieUtil.setCookie((HttpServletResponse) response, UserSessionCookieName.LOGON_STATUS, "0");
    }

    private boolean isEscapeFilter(String uri) {
        int index = uri.lastIndexOf(".");
        if (index < 0 || (index > 0 && index == uri.length() - 1)) {
            return false;
        } else {
            String subfix = uri.substring(index);
            return STATIC_RESOURCE_URIS.contains(subfix.toUpperCase());
        }
    }

    /**
     * 访问的URI是否要不需要登录就可访问
     *
     * @param requestURI
     * @return
     */
    private boolean isURIEscape(String requestURI) {
        for (String uri : INHERENT_ESCAPE_URIS) {
            if (requestURI != null && requestURI.indexOf(uri) >= 0) {
                return true;
            }
        }
        return false;
    }
}
