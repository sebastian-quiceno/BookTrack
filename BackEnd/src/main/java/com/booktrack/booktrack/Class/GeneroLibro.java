package com.booktrack.booktrack.Class;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "generos_libros")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GeneroLibro {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_genero")
    private long id;

    @Column(nullable = false, length = 100)
    private String titulo;

}
