package com.booktrack.booktrack.Controllers;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.booktrack.booktrack.Class.Usuario;
import com.booktrack.booktrack.Repositories.UsuarioRepository;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class TestController {

    private final UsuarioRepository usuarioRepository;

    @GetMapping("/usuarios")
    public List<Usuario> getUsers() {
        return usuarioRepository.findAll();
    }
}
