package com.booktrack.booktrack.Class;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "libros")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Libro {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_libro")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_genero", nullable = false)
    private GeneroLibro genero;

    @Column(nullable = false, length = 100)
    private String titulo;

    @Column(length = 100)
    private String autor;

    @Column(name = "fecha", nullable = false)
    private LocalDate fecha;

    @Column(name = "cantidad_total")
    private Integer cantidadTotal;

    @Column(name = "cantidad_disponible")
    private Integer cantidadDisponible;

    //URL de la portada
    @Column(length = 500)
    private String portada;

    


}
