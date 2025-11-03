
-- =========================
-- TRIGGER: Reducir cantidad disponible al prestar
-- =========================

CREATE OR REPLACE FUNCTION disminuir_disponibilidad()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE libros
    SET cantidad_disponible = cantidad_disponible - 1
    WHERE id_libro = NEW.id_libro;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_disminuir_disponibilidad
AFTER INSERT ON prestamos
FOR EACH ROW
WHEN (NEW.devuelto = FALSE)
EXECUTE FUNCTION disminuir_disponibilidad();


-- =========================
-- TRIGGER: Aumentar cantidad disponible al devolver
-- =========================

CREATE OR REPLACE FUNCTION aumentar_disponibilidad()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE libros
    SET cantidad_disponible = cantidad_disponible + 1
     WHERE id_libro = NEW.id_libro;

     RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_aumentar_disponibilidad
AFTER UPDATE ON prestamos
FOR EACH ROW
WHEN (NEW.devuelto = TRUE AND OLD.devuelto = FALSE)
EXECUTE FUNCTION aumentar_disponibilidad();


-- =========================
-- TRIGGER: Registrar en historial automáticamente
-- =========================

CREATE OR REPLACE FUNCTION registrar_historial()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO historial_actividad(id_usuario, id_libro, accion)
    VALUES(NEW.id_usuario, NEW.id_libro, TG_ARGV[0]);

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Registrar cuando se presta
CREATE TRIGGER trg_historial_prestamo
AFTER INSERT ON prestamos
FOR EACH ROW
EXECUTE FUNCTION registrar_historial('PRESTAR');

-- Registrar cuando se califica
CREATE TRIGGER trg_historial_calificacion
AFTER INSERT ON calificaciones
FOR EACH ROW
EXECUTE FUNCTION registrar_historial('CALIFICAR');

-- Registrar cuando se visualiza
CREATE TRIGGER trg_historial_visualizacion
AFTER INSERT ON visualizaciones 
FOR EACH ROW 
EXECUTE FUNCTION registrar_historial('VISUALIZAR')