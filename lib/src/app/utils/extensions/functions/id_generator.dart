/// Función para generar un id unico para los usuarios.
///
/// @author: Camilo Gómez.
String idGenerator() {
  return DateTime.now().millisecondsSinceEpoch.toString();
}
