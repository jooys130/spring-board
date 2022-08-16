package com.bd.spring_board.config;

import com.bd.spring_board.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
@AllArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private UserService userService;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    public void configure(HttpSecurity http) throws Exception { //HTTP 관련 보안 설정 **가장 중요

        http
                .authorizeRequests()
                // 해당 권한 가진 유저만 접근 가능
                .antMatchers("/post/*", "/edit/*", "/update", "/create", "/delete/*").hasAnyAuthority("ADMIN", "USER")
                .antMatchers("/").permitAll() // 나머지 모두 접근 가능

                .and()
                    .csrf().ignoringAntMatchers("/boardList", "/joinPage", "/loginPage", "/create", "/update") // CSRF 토큰 없이 실행하겠다.

                .and() // 로그인 설정
                    .formLogin()
                    .loginPage("/loginPage")
                    .defaultSuccessUrl("/boardList") // 로그인 성공하면 해당 URL로 이동
                    .usernameParameter("id")
                    .passwordParameter("password")

                .and() // 로그아웃 설정
                    .logout()
                    .logoutRequestMatcher(new AntPathRequestMatcher("/logoutPage")) // /logout 을 받으면 로그아웃
                    .logoutSuccessUrl("/boardList")
                    .invalidateHttpSession(true)
                    .deleteCookies("JSESSIONID") // JSESSIONID를 를 지움

                .and()// 403 예외처리
                .exceptionHandling().accessDeniedPage("/accessDenied"); // 권한이 없는 URL에 접속하려고 하면 해당 /accessDenied 로 리다이렉션
    }

    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService).passwordEncoder(new BCryptPasswordEncoder());
    }
}

