class AppStrings {
  static AppStrings? _singleton;
  factory AppStrings() => _singleton ??= AppStrings._();

  AppStrings._();

  // Tema de la app
  static String deepPurple = "deepPurple";
  static String red = "red";
  static String green = "green";
  static String indigo = "indigo";

  // Pagina de inicio.
  static String welcome = "Bienvenido";
  static String registerButton = "Registrar";

  // Pagina de usuarios.
  static String guieText =
      "Selecciona para añadir el usuario a la papelera, puedes deshacer las selecciones presionando la X, o eliminar presionando la papelera.";
  static String viewAddress = "Ver direcciones";
  static String noUser = "No hay usuarios registrados";

  // Pagina detalles de usuario.
  static String detailsPageTitle = "Detalles";
  static String userName = "Nombre:";
  static String userLastName = "Apellido";
  static String userBirthDate = "Fecha de nacimiento:";
  static String addressTitle = "Direcciones:";
  static String noAddress = "El usuario no tiene direcciones registradas.";
  static String addressCardAddress = "Dirección:";
  static String addressCardCity = "Ciudad:";
  static String addressCardCountry = "País:";

  // Dialogo para agregar una nueva dirección.
  static String dialogTitle = "Agregar dirección";
  static String addAddressButton = "Agregar";
  static String cancel = "Cancelar";

  // Pagina de registro.
  static String titleRegisterPage = "Registrar Usuario";
  static String contextFieldUserName = "Nombre del usuario";
  static String contextFieldUserLastName = "Apellido del usuario";
  static String birthDate = "Fecha de cumpleaños";
  static String year = "Año";
  static String month = "Mes";
  static String day = "Día";
  static String addAddressTextButton = "Agregar Dirección";
  static String finalTextPage =
      "Debes completar todos los campos para poder registrar un usuario.";
  static String completeButton = "Completar";
  static String streetFocus = "streetFocus";
  static String numStreetFocus = "numStreetFocus";
  static String cityFocus = "cityFocus";
  static String countryFocus = "countryFocus";

  //General Strings
  static String users = "Usuarios";
  static String name = "Nombre";
  static String lastName = "Apellido";
  static String address = "Dirección";
  static String street = "Carrera o Calle";
  static String numStreet = "Número #";
  static String city = "Ciudad";
  static String country = "País";

  // Dialogo al dar error cuando se cargan los usuarios.
  static String loadUserDialogTitle = "Error al cargar.";
  static String loadUserDialogContent =
      "Se produjo un problema al caragar los usuarios, por favor intenta mas tarde.";

  // Dialogo al eliminar un usuario.
  static String deleteUserDialogTitle = "Usuarios eliminados.";
  static String deleteUserDialogContent =
      "Se eliminaron satisfactoriamente los usuarios seleccionados.";

  // Dialogo al dar error eliminar un usuario.
  static String erroDeleteUserDialogTitle = "Problema al eliminar.";
  static String erroDeleteUserDialogContent =
      "No fue posible eliminar el usuario, por favor intenta mas tarde.";

  // Dialogo cuando se agrega una nueva dirección.
  static String addNewAddressDialogTitle = "Dirección agregada.";
  static String addNewAddressDialogContent =
      "Se agrego satisfactoriamente la nueva dirección.";

  // Dialogo al dar erro cuando se agrega una nueva dirección.
  static String errorAddNewAddressDialogTitle = "Problema al agregar.";
  static String errorAddNewAddressDialogContent =
      "No se puedo agregar la nueva dirección, por favor verifica los datos.";

  // Dialogo para cuando falta un campo en la dirección nueva a agregar.
  static String missingFieldDialogTitle = "Campo faltante.";
  static String missingFieldDialogcontent =
      "Por favor asegurate de llenar todos los campos.";

  // Dialogo de que se elimino una dirección.
  static String deleteAddressDialogTitle = "Direcciones Eliminadas.";
  static String deleteAddressDialogContent =
      "Se han eliminado las direcciones seleccionadas.";

  // Dialogo al dar error cuando se elimina una dirección.
  static String errorDeleteAddressDialogTitle = "Problema al eliminar.";
  static String errorDeleteAddressDialogContent =
      "Se produjo un problema al eliminar la(s) direccion(es) por favor intente mas tarde";

  // Dialogo de que se registro un usuario.
  static String registerUserDialogTitle = "Usuario Registrado.";
  static String registerUserDialogContent =
      "Se pudo registrar satisfactoriamente el usuario.";

  // Dialog al dar erro registrar un usuario.
  static String erroRegisterUserDialogTitle = "Hubo un problema.";
  static String erroRegisterUserDialogContent =
      "No se pudo registrar el usuario por favor intenta mas tarde.";
}
