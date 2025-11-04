package com.booktrack.booktrack.Class;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Accion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idAccion;

    @Column(length = 20, nullable = false, unique = true)
    private String nombreAccion; // Ej: "PRESTAR", "VISUALIZAR", "CONSULTAR"
}
