package com.bd.spring_board.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;

@Getter
@Setter
@ToString
public class UserSecurityDto implements UserDetails {

    private String id;
    private String password;
    private String authorities;
    private boolean enabled;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() { // 유저가 가진 권한 목록
        ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
        auth.add(new SimpleGrantedAuthority(authorities));
        return auth;
    }

    @Override
    public String getPassword() { return password; } // 유저 비밀번호

    @Override
    public String getUsername() { return id; } // 유저 아이디

    @Override
    public boolean isAccountNonExpired() { return true; } // 아이디 만료 여부

    @Override
    public boolean isAccountNonLocked() { return true; } // 유저 아이디 Lock 여부

    @Override
    public boolean isCredentialsNonExpired() { return true; } // 비밀번호 만료 여부

    @Override
    public boolean isEnabled() { return enabled; } // 활성화 여부

}
