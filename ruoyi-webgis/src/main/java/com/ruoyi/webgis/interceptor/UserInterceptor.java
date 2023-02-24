//package com.ruoyi.webgis.interceptor;
//
//
//import com.ruoyi.webgis.enums.BizCodeEnum;
//import com.ruoyi.webgis.exception.BizException;
//import com.ruoyi.webgis.model.dto.LoginUserInfoDto;
//import com.ruoyi.webgis.utils.CommonUtil;
//import com.ruoyi.webgis.utils.JWTUtil;
//import com.ruoyi.webgis.utils.JsonData;
//import io.jsonwebtoken.Claims;
//import org.apache.commons.lang3.StringUtils;
//import org.springframework.http.HttpMethod;
//import org.springframework.web.servlet.HandlerInterceptor;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//
//public class UserInterceptor implements HandlerInterceptor {
//
//    public static ThreadLocal<LoginUserInfoDto> threadLocal =  new ThreadLocal<>();
//
//    @Override
//    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//        //获取请求用户token信息
//        String token = request.getHeader("token");
////        if (HttpMethod.OPTIONS.toString().equals(request.getMethod())) {
////            System.out.println("OPTIONS请求，放行");
////            return true;
////        }
//        //String token ="z$k&jxrecruitment_registration_09021108eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJyZWNydWl0bWVudF9yZWdpc3RyYXRpb24iLCJuYW1lIjoiNTAyODEzIiwiaWQiOjYsImVtYWlsIjoiMTc4NzkzMDcwQHFxLmNvbSIsImlkTnVtIjoiMzYwNzEyMTM0OTgwMTI0NTQwIiwidXNlclJvbGUiOiJOIiwiaWF0IjoxNjMxMjAwMTIxLCJleHAiOjE2MzMwMTQ1MjF9.xUVFpbOz5gpcxV4CS9gZTQcmfbZtQdBCiNLqHowwzok";
//        if (token==null || StringUtils.isEmpty(token)) {
//            token = request.getParameter("token");
//            if (StringUtils.isEmpty(token)) {
//                //未登录
//                CommonUtil.sendJsonMessage(response, JsonData.buildResult(BizCodeEnum.ACCOUNT_UNLOGIN));
//                return false;
//            }
//        }
//        //解析token
//        Claims claims = JWTUtil.checkJWT(token);
//        if (claims==null){
//            throw new BizException(BizCodeEnum.ACCOUNT_UNLOGIN);
////            CommonUtil.sendJsonMessage(response, JsonData.buildResult(BizCodeEnum.ACCOUNT_UNLOGIN));
////            return false;
//        }
//        LoginUserInfoDto loginUser = new LoginUserInfoDto();
//        loginUser.setUserId(Long.parseLong(claims.get("id").toString()));
//        loginUser.setName((String) claims.get("name"));
//        loginUser.setAccount((String) claims.get("account"));
//        loginUser.setUserRole((String) claims.get("userRole"));
//        threadLocal.set(loginUser);
//        return true;
//}
//}
//
//
//
