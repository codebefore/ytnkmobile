// ignore_for_file: non_constant_identifier_names

import 'package:ytnkio/globals/intl_texts/text_file.dart';

class TextFileES extends TextFile {
  @override
  var MONTHS = [
    "Enero",
    "Febrero",
    "Marzo",
    "Abril",
    "Mayo",
    "Junio",
    "Julio",
    "Agosto",
    "Septiembre",
    "Octubre",
    "Noviembre",
    "Diciembre"
  ];

  @override
  var YEARSBEFORE = [
    "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009",
    "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019",
    "2020", "2021", "2022", "2023", "2024", "2025"
  ];

  @override
  var YEARSBEFOREAFTER = [
    "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009",
    "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019",
    "2020", "2021", "2022", "2023", "2024", "2025", "2026", "2027", "2028", "2029", "2030"
  ];

  @override
  var WORKTYPES = ["Tiempo completo", "Medio tiempo", "Híbrido", "Remoto"];

  @override
  String EXCEPTION_emailAlreadyInUse = "La dirección de correo ya está en uso.";
  @override
  String EXCEPTION_invalidEmail = "Correo electrónico inválido.";
  @override
  String EXCEPTION_unknownException = "Excepción desconocida: ";

  @override
  String SERVICEDOWN_PAGE_title = "Servicio No Disponible";
  @override
  String SERVICEDOWN_PAGE_pleaseTryAgainLater =
      "Conexión de servicio no disponible.\nPor favor, inténtalo más tarde.";
  @override
  String SERVICEDOWN_PAGE_solutionButton = "Intentar de nuevo";

  @override
  String DRAWER_preferences = "Preferencias";
  @override
  String DRAWER_logout = "Cerrar sesión";
  @override
  String DRAWER_dashboard = "Panel";
  @override
  String DRAWER_settings = "Configuración";
  @override
  String DRAWER_uncompleteLanding = "Inicio incompleto";

  @override
  String PHONE_FORM_FIELD_searchText = "Seleccionar país";
  @override
  String PHONE_FORM_FIELD_invalidNumberMessage = "Número de teléfono inválido";

  @override
  String CONTACTINFO_ITEM_couldNotLaunch = "No se pudo abrir ";

  @override
  String LANDING_PAGE_title = "ytnk.io";
  @override
  String LANDING_PAGE_skip = "Saltar";
  @override
  String LANDING_PAGE_next = "Siguiente";
  @override
  String LANDING_PAGE_complete = "Completar";
  @override
  String LANDING_PAGE_landing1Title = "Crea tu perfil";
  @override
  String LANDING_PAGE_landing1Description =
      "Crea tu perfil para que te conozcamos mejor";
  @override
  String LANDING_PAGE_landing2Title = "Completa la encuesta de ambiente laboral";
  @override
  String LANDING_PAGE_landing2Description =
      "Completa la encuesta para descubrir el mejor ambiente laboral para ti";
  @override
  String LANDING_PAGE_landing3Title = "Únete a evaluaciones técnicas";
  @override
  String LANDING_PAGE_landing3Description =
      "Únete a evaluaciones técnicas para que descubramos tus habilidades";
  @override
  String LANDING_PAGE_landing4Title = "Gestiona tus coincidencias";
  @override
  String LANDING_PAGE_landing4Description =
      "Gestiona tus coincidencias evaluando las invitaciones que te enviamos";

  @override
  String LOGIN_PAGE_title = "Bienvenido";
  @override
  String LOGIN_PAGE_email = "Correo electrónico";
  @override
  String LOGIN_PAGE_emailExample = "jimmymc9ill@proton.me";
  @override
  String LOGIN_PAGE_emailHint = "Ej: test@testmail.com";
  @override
  String LOGIN_PAGE_passwordExample = "123456";
  @override
  String LOGIN_PAGE_password = "Contraseña";
  @override
  String LOGIN_PAGE_login = "Iniciar sesión";
  @override
  String LOGIN_PAGE_retreivingProfileInfo = "Recuperando información del perfil...";
  @override
  String LOGIN_PAGE_forgotPassword = "¿Olvidaste tu contraseña?";
  @override
  String LOGIN_PAGE_or = " o ";
  @override
  String LOGIN_PAGE_loginWithGoogle = "Iniciar sesión con Google";
  @override
  String LOGIN_PAGE_dontHaveAnAccount = "¿No tienes una cuenta?";
  @override
  String LOGIN_PAGE_createAccount = "Crear cuenta";
  @override
  String LOGIN_PAGE_unsuccessfulLoginAttempt = "Intento de inicio de sesión fallido";
  @override
  String LOGIN_PAGE_noProfile = "Sin perfil";
  @override
  String LOGIN_PAGE_returnToLoginPage = "Volver a la página de inicio de sesión";
  @override
  String LOGIN_PAGE_loginSuccessful = "Inicio de sesión exitoso";

  @override
  String SIGNUP_OPTIONS_PAGE_title = "Opciones de registro";
  @override
  String SIGNUP_OPTIONS_PAGE_signupWithEmail = "Registrarse con correo";
  @override
  String SIGNUP_OPTIONS_PAGE_signupWithGoogle = "Registrarse con Google";
  @override
  String SIGNUP_OPTIONS_PAGE_or = "o";
  @override
  String SIGNUP_OPTIONS_PAGE_login = "Iniciar sesión";

  @override
  String SIGNUP_PAGE_title = "Crear cuenta";
  @override
  String SIGNUP_PAGE_createAccount = "Crear mi cuenta";

  @override
  String SIGNUP_PAGE_email = "Correo electrónico";
  @override
  String SIGNUP_PAGE_emailHint = "Ej: test@testmail.com";
  @override
  String SIGNUP_PAGE_password = "Contraseña";
  @override
  String SIGNUP_PAGE_passwordHint = "Mínimo 6 caracteres";
  @override
  String SIGNUP_PAGE_passwordAgain = "Contraseña (de nuevo)";
  @override
  String SIGNUP_PAGE_referenceCode = "Código de referencia";
  @override
  String SIGNUP_PAGE_fullName = "Nombre completo";
  @override
  String SIGNUP_PAGE_location = "Ubicación";
  @override
  String SIGNUP_PAGE_phone = "Teléfono";
  @override
  String SIGNUP_PAGE_aggreeAndJoin = "Aceptar y unirse";
  @override
  String SIGNUP_PAGE_alreadyHaveAnAccount = "¿Ya tienes una cuenta?";
  @override
  String SIGNUP_PAGE_invalidReferenceCode = "Código de referencia inválido";
  @override
  String SIGNUP_PAGE_fullNameMustBeFilled = "El campo nombre completo es obligatorio";
  @override
  String SIGNUP_PAGE_fullNameMustContainFirstAndLast =
      "El nombre completo debe contener nombre y apellido";
  @override
  String SIGNUP_PAGE_emailMustBeFilled = "El campo correo electrónico es obligatorio";
  @override
  String SIGNUP_PAGE_emailIsNotValid = "El correo electrónico no es válido";
  @override
  String SIGNUP_PAGE_phoneMustBeFilled = "El campo teléfono es obligatorio";
  @override
  String SIGNUP_PAGE_locationMustBeFilled =
      "Registro fallido. Por favor, revisa tu información e inténtalo de nuevo.";
  @override
  String SIGNUP_PAGE_locationIsNotValid = "La ubicación no es válida";
  @override
  String SIGNUP_PAGE_passwordMustBeFilled = "El campo contraseña es obligatorio";
  @override
  String SIGNUP_PAGE_passwordIsNotValid =
      "La contraseña debe tener al menos 6 caracteres";
  @override
  String SIGNUP_PAGE_passwordNotMatching = "Las contraseñas no coinciden";
  @override
  String SIGNUP_PAGE_signupFailed =
      "Registro fallido. Por favor, revisa tu información e inténtalo de nuevo.";
  @override
  String SIGNUP_PAGE_signupSuccess = "Registro exitoso.";

  @override
  String SIGNUP_PAGE_userAgreementBeginning =
      "Al hacer clic en 'Registrarse con correo' o 'Registrarse con Google' aceptas lo siguiente:\n\n";
  @override
  String SIGNUP_PAGE_privacyPolicy = "1. Política de privacidad:";
  @override
  String SIGNUP_PAGE_privacyPolicyText =
      " Consientes la recopilación, uso y divulgación de tu información personal según nuestra Política de Privacidad. \n\n";
  @override
  String SIGNUP_PAGE_termsOfService = "2. Términos de servicio:";
  @override
  String SIGNUP_PAGE_termsOfServiceText =
      " Aceptas nuestros Términos de Servicio, que rigen el uso de nuestra plataforma.\n\n";
  @override
  String SIGNUP_PAGE_gdprCompliance = "3. Cumplimiento GDPR:";
  @override
  String SIGNUP_PAGE_gdprComplianceText =
      " Si te encuentras en el Espacio Económico Europeo (EEE), reconoces y consientes el procesamiento de tus datos personales conforme al Reglamento General de Protección de Datos (GDPR).\n\n";
  @override
  String SIGNUP_PAGE_cookies = "4. Cookies:";
  @override
  String SIGNUP_PAGE_cookiesText =
      " Reconoces y aceptas nuestro uso de cookies y tecnologías similares como se describe en nuestra Política de Cookies.\n\n";
  @override
  String SIGNUP_PAGE_userAgreementEnding =
      "Al registrarte, confirmas que has leído, entendido y aceptado estos términos y condiciones. Si no estás de acuerdo con alguna parte, por favor no continúes con el registro.";

  @override
  String FORGOT_PASSWORD_PAGE_title = "Olvidé mi contraseña";
  @override
  String FORGOT_PASSWORD_PAGE_email = "Correo electrónico";
  @override
  String FORGOT_PASSWORD_PAGE_emailHint =
      "Se enviará un correo con un enlace para restablecer la contraseña.";
  @override
  String FORGOT_PASSWORD_PAGE_resetPassword = "Enviar enlace de restablecimiento";
  @override
  String FORGOT_PASSWORD_PAGE_emailIsNotValid = "Tu correo no es válido";
  @override
  String FORGOT_PASSWORD_PAGE_resetLinkGenerated =
      "Enlace de restablecimiento generado. \r\n\r\n Por favor, revisa tu correo.";

  @override
  String EMAIL_VERIFICATION_PAGE_title = "Verificación de correo";
  @override
  String EMAIL_VERIFICATION_PAGE_emailVerificationSuccess =
      "Verificación de correo exitosa";
  @override
  String EMAIL_VERIFICATION_PAGE_verificationCodeLabel = "Código de verificación";
  @override
  String EMAIL_VERIFICATION_PAGE_verificationCodeHelper =
      "Introduce el código enviado a tu correo";
  @override
  String EMAIL_VERIFICATION_PAGE_verifyEmail = "Verificar correo";
  @override
  String EMAIL_VERIFICATION_PAGE_verificationSentTo =
      "Correo de verificación enviado a ";
  @override
  String EMAIL_VERIFICATION_PAGE_verificationCodeEmpty =
      "El código de verificación está vacío";
  @override
  String EMAIL_VERIFICATION_PAGE_emailSentSuccessfully =
      "Correo de verificación enviado";

  @override
  String NAVIGATION_BAR_profile = "Perfil";
  @override
  String NAVIGATION_BAR_dashboard = "Panel";
  @override
  String NAVIGATION_BAR_matches = "Coincidencias";

  @override
  String VIEWPROFILE_PAGE_title = "Ver perfil";
  @override
  String VIEWPROFILE_PAGE_summary = "Resumen";
  @override
  String VIEWPROFILE_PAGE_workExperiences = "Experiencia laboral";
  @override
  String VIEWPROFILE_PAGE_educations = "Educación";
  @override
  String VIEWPROFILE_PAGE_certificates = "Certificados";
  @override
  String VIEWPROFILE_PAGE_skills = "Habilidades";
  @override
  String VIEWPROFILE_PAGE_profileDirty =
      "Hay cambios no guardados en tu perfil. Por favor, pulsa guardar perfil para no perder información.";
  @override
  String VIEWPROFILE_PAGE_preferencesDirty =
      "Hay cambios no guardados en tus preferencias. Por favor, pulsa guardar preferencias para no perder información.";

  @override
  String VIEWPROFILE_PAGE_fillManually = "o completar manualmente";
  @override
  String VIEWPROFILE_PAGE_importFromLinkedin = "Importar desde Linkedin CV PDF";
  @override
  String VIEWPROFILE_PAGE_emptyHeadline = "Escribe tu titular aquí";
  @override
  String VIEWPROFILE_PAGE_emptySummary = "Haz un breve resumen sobre ti";
  @override
  String VIEWPROFILE_PAGE_emptyWorkExperiences =
      "Agrega tu experiencia laboral para enriquecer tu perfil";
  @override
  String VIEWPROFILE_PAGE_saveProfileText = "Guardar perfil";

  @override
  String VIEWPROFILE_PAGE_addWorkExperience = "Agregar experiencia laboral";
  @override
  String VIEWPROFILE_PAGE_addEducation = "Agregar educación";
  @override
  String VIEWPROFILE_PAGE_addSkill = "Agregar habilidad";
  @override
  String VIEWPROFILE_PAGE_addCertificate = "Agregar certificado";

  @override
  String VIEWPROFILE_PAGE_personalInfo = "Información personal";
  @override
  String VIEWPROFILE_PAGE_emptyPersonalInfo =
      "Agrega tu información personal para enriquecer tu perfil";

  @override
  String VIEWPROFILE_PAGE_profileSavedSuccessfully = "Perfil guardado exitosamente";
  @override
  String VIEWPROFILE_PAGE_profileFetchedSuccessfullyFromResume =
      "Perfil obtenido exitosamente desde el currículum";
  @override
  String VIEWPROFILE_PAGE_avatarSavedSuccessfully = "Avatar guardado exitosamente";

  @override
  String PROFILE_FLOATINGBUTTON_WORKEXPERIENCE = "Experiencia laboral";
  @override
  String PROFILE_FLOATINGBUTTON_EDUCATION = "Educación";
  @override
  String PROFILE_FLOATINGBUTTON_CERTIFICATE = "Certificado";
  @override
  String PROFILE_FLOATINGBUTTON_SKILL = "Habilidad";
  @override
  String PROFILE_FLOATINGBUTTON_ADD = "Agregar...";
  @override
  String PROFILE_FLOATINGBUTTON_CANCEL = "Cancelar";

  @override
  String PREFERENCES_PAGE_title = "Preferencias";

  @override
  String PARSEPDF_PAGE_title = "Completar perfil desde PDF";
  @override
  String PARSEPDF_PAGE_selectPdf = "Seleccionar currículum PDF";
  @override
  String PARSEPDF_PAGE_fillProfileFromPdf = "Completar perfil desde currículum";
  @override
  String PARSEPDF_PAGE_noPdfSelected = "Ningún PDF seleccionado";

  @override
  String EDITAVATAR_PAGE_title = "Editar avatar";
  @override
  String EDITAVATAR_PAGE_noImageSelected = "Ninguna imagen seleccionada";
  @override
  String EDITAVATAR_PAGE_selectImage = "Elegir imagen de la galería";
  @override
  String EDITAVATAR_PAGE_uploadImage = "Subir imagen";
  @override
  String EDITAVATAR_PAGE_fileSizeLimitNotification =
      "El tamaño de la imagen debe ser menor a 4MB. Tamaño del archivo en KB: ";
  @override
  String EDITAVATAR_PAGE_saveSuccess = "Guardado exitosamente";

  @override
  String EDITHEADLINE_PAGE_title = "Editar titular";
  @override
  String EDITHEADLINE_PAGE_headline = "Titular";
  @override
  String EDITHEADLINE_PAGE_headlineHint =
      "Ej: Gerente de proyectos con 10 años de experiencia en TI ...";
  @override
  String EDITHEADLINE_PAGE_save = "Guardar titular";

  @override
  String EDITSUMMARY_PAGE_title = "Editar resumen";
  @override
  String EDITSUMMARY_PAGE_summary = "Resumen";
  @override
  String EDITSUMMARY_PAGE_summaryHint =
      "Ej: Gerente de proyectos con 10 años de experiencia en TI ...";
  @override
  String EDITSUMMARY_PAGE_save = "Guardar resumen";

  @override
  String EDITPERSONALINFO_PAGE_title = "Editar información personal";
  @override
  String EDITPERSONALINFO_PAGE_firstName = "Nombre";
  @override
  String EDITPERSONALINFO_PAGE_firstNameHint = "Ej: Juan";
  @override
  String EDITPERSONALINFO_PAGE_lastName = "Apellido";
  @override
  String EDITPERSONALINFO_PAGE_lastNameHint = "Ej: Pérez";
  @override
  String EDITPERSONALINFO_PAGE_save = "Guardar información personal";
  @override
  String EDITPERSONALINFO_PAGE_country = "País";
  @override
  String EDITPERSONALINFO_PAGE_countryHint = "Ej: España";
  @override
  String EDITPERSONALINFO_PAGE_city = "Ciudad";
  @override
  String EDITPERSONALINFO_PAGE_cityHint = "Ej: Madrid";
  @override
  String EDITPERSONALINFO_PAGE_address = "Dirección";
  @override
  String EDITPERSONALINFO_PAGE_addressHint = "Ej: Calle Mayor 123, Piso 4B";
  @override
  String EDITPERSONALINFO_PAGE_phone = "Teléfono";
  @override
  String EDITPERSONALINFO_PAGE_phoneHint = "Ej: 123456789";
  @override
  String EDITPERSONALINFO_PAGE_linkedin = "Cuenta de Linkedin";
  @override
  String EDITPERSONALINFO_PAGE_x = "Cuenta X";
  @override
  String EDITPERSONALINFO_PAGE_facebook = "Cuenta de Facebook";
  @override
  String EDITPERSONALINFO_PAGE_instagram = "Cuenta de Instagram";
  @override
  String EDITPERSONALINFO_PAGE_linkedinHint = "Ej: linkedin.com";
  @override
  String EDITPERSONALINFO_PAGE_xHint = "Ej: x.com";
  @override
  String EDITPERSONALINFO_PAGE_facebookHint = "Ej: facebook.com";
  @override
  String EDITPERSONALINFO_PAGE_instagramHint = "Ej: instagram.com";
  @override
  String EDITPERSONALINFO_PAGE_githubHint = "Ej: github.com";
  @override
  String EDITPERSONALINFO_PAGE_github = "Cuenta de Github";
  @override
  String EDITPERSONALINFO_PAGE_websiteHint = "Ej: website.com";
  @override
  String EDITPERSONALINFO_PAGE_website = "Sitio web";

  @override
  String EDITWORKEXPERIENCE_PAGE_save = "Guardar experiencia laboral";
  @override
  String EDITWORKEXPERIENCE_PAGE_saveSuccess =
      "Experiencia laboral guardada exitosamente";
  @override
  String EDITWORKEXPERIENCE_PAGE_saveError = "Error al guardar experiencia laboral";
  @override
  String EDITWORKEXPERIENCE_PAGE_title = "Editar experiencia laboral";
  @override
  String EDITWORKEXPERIENCE_PAGE_organisation = "Organización";
  @override
  String EDITWORKEXPERIENCE_PAGE_titleLabel = "Título";
  @override
  String EDITWORKEXPERIENCE_PAGE_workType = "Tipo de trabajo";
  @override
  String EDITWORKEXPERIENCE_PAGE_description = "Descripción";
  @override
  String EDITWORKEXPERIENCE_PAGE_location = "Ubicación";
  @override
  String EDITWORKEXPERIENCE_PAGE_startedOn = "Comenzó en";
  @override
  String EDITWORKEXPERIENCE_PAGE_endedOn = "Terminó en";
  @override
  String EDITWORKEXPERIENCE_PAGE_isCurrent = "Actual";
  @override
  String EDITWORKEXPERIENCE_PAGE_deleteSuccess =
      "Experiencia laboral eliminada exitosamente";
  @override
  String EDITWORKEXPERIENCE_PAGE_deleteError =
      "Error al eliminar experiencia laboral";
  @override
  String EDITWORKEXPERIENCE_PAGE_deleteConfirmationTitle =
      "Eliminar experiencia laboral";
  @override
  String EDITWORKEXPERIENCE_PAGE_deleteConfirmation =
      "¿Estás seguro de que deseas eliminar esta experiencia laboral?";
  @override
  String EDITWORKEXPERIENCE_PAGE_delete = "Eliminar";
  @override
  String EDITWORKEXPERIENCE_PAGE_deleteCancel = "Cancelar";

  @override
  String EDITEDUCATION_PAGE_title = "Editar educación";
  @override
  String EDITEDUCATION_PAGE_save = "Guardar educación";
  @override
  String EDITEDUCATION_PAGE_saveSuccess = "Educación editada exitosamente";
  @override
  String EDITEDUCATION_PAGE_saveError = "Error al editar educación";
  @override
  String EDITEDUCATION_PAGE_deleteSuccess = "Educación eliminada exitosamente";
  @override
  String EDITEDUCATION_PAGE_deleteError = "Error al eliminar educación";
  @override
  String EDITEDUCATION_PAGE_deleteConfirmationTitle = "Eliminar educación";
  @override
  String EDITEDUCATION_PAGE_deleteConfirmation =
      "¿Estás seguro de que deseas eliminar esta educación?";
  @override
  String EDITEDUCATION_PAGE_delete = "Eliminar";
  @override
  String EDITEDUCATION_PAGE_deleteCancel = "Cancelar";

  @override
  String EDITCERTIFICATE_PAGE_title = "Editar certificado";
  @override
  String EDITCERTIFICATE_PAGE_name = "Nombre";
  @override
  String EDITCERTIFICATE_PAGE_nameHelper = "Ej: PMP, AWS, CCNA";
  @override
  String EDITCERTIFICATE_PAGE_issuer = "Emisor";
  @override
  String EDITCERTIFICATE_PAGE_issuerHelper = "Ej: Cisco, PMI, AWS";
  @override
  String EDITCERTIFICATE_PAGE_certificateId = "ID del certificado";
  @override
  String EDITCERTIFICATE_PAGE_certificateIdHelper = "Ej: 1234567890";
  @override
  String EDITCERTIFICATE_PAGE_certificateUrl = "URL del certificado";
  @override
  String EDITCERTIFICATE_PAGE_certificateUrlHelper =
      "Ej: https://www.cisco.com";
  @override
  String EDITCERTIFICATE_PAGE_descriptionHelper =
      "Ej: Este certificado trata sobre ...";
  @override
  String EDITCERTIFICATE_PAGE_description = "Descripción";
  @override
  String EDITCERTIFICATE_PAGE_save = "Guardar certificado";
  @override
  String EDITCERTIFICATE_PAGE_saveSuccess = "Certificado editado exitosamente";
  @override
  String EDITCERTIFICATE_PAGE_saveError = "Error al editar certificado";
  @override
  String EDITCERTIFICATE_PAGE_deleteSuccess = "Certificado eliminado exitosamente";
  @override
  String EDITCERTIFICATE_PAGE_deleteError = "Error al eliminar certificado";
  @override
  String EDITCERTIFICATE_PAGE_deleteConfirmationTitle = "Eliminar certificado";
  @override
  String EDITCERTIFICATE_PAGE_deleteConfirmation =
      "¿Estás seguro de que deseas eliminar este certificado?";
  @override
  String EDITCERTIFICATE_PAGE_delete = "Eliminar";
  @override
  String EDITCERTIFICATE_PAGE_deleteCancel = "Cancelar";

  @override
  String EDITSKILL_PAGE_title = "Editar habilidades";
  @override
  String EDITSKILL_PAGE_selectYourProficiencyLevel =
      "Selecciona tu nivel de competencia";
  @override
  String EDITSKILL_PAGE_save = "Guardar";
  @override
  String EDITSKILL_PAGE_level1Title = "Principiante";
  @override
  String EDITSKILL_PAGE_level2Title = "Intermedio";
  @override
  String EDITSKILL_PAGE_level3Title = "Competente";
  @override
  String EDITSKILL_PAGE_level4Title = "Avanzado";
  @override
  String EDITSKILL_PAGE_level5Title = "Experto";
  @override
  String EDITSKILL_PAGE_level1Description =
      "Requieres orientación y apoyo para completar tareas y aún estás construyendo tu comprensión fundamental. Espera participar en aprendizaje estructurado, seguir tutoriales y practicar conceptos básicos.";
  @override
  String EDITSKILL_PAGE_level2Description =
      "Te sientes cómodo usando herramientas y métodos comunes pero aún puedes necesitar orientación para problemas complejos. La práctica continua y aplicaciones reales ayudarán a solidificar tu competencia.";
  @override
  String EDITSKILL_PAGE_level3Description =
      "Entiendes las mejores prácticas, puedes resolver problemas y trabajar eficientemente. Mientras continúas aprendiendo y perfeccionando tu experiencia, puedes contribuir efectivamente a proyectos técnicos.";
  @override
  String EDITSKILL_PAGE_level4Description =
      "Puedes optimizar flujos de trabajo, guiar a otros y aportar soluciones innovadoras. Tu experiencia te permite adaptarte a nuevas situaciones y asumir roles de liderazgo en discusiones técnicas.";
  @override
  String EDITSKILL_PAGE_level5Description =
      "Impulsas la innovación, resuelves problemas altamente complejos y contribuyes al desarrollo de nuevas metodologías. Otros acuden a ti por mentoría, orientación y experiencia.";
  @override
  String EDITSKILL_PAGE_deleteConfirmationTitle = "Eliminar habilidad";
  @override
  String EDITSKILL_PAGE_deleteConfirmation =
      "¿Estás seguro de que deseas eliminar esta habilidad?";
  @override
  String EDITSKILL_PAGE_delete = "Eliminar";
  @override
  String EDITSKILL_PAGE_deleteCancel = "Cancelar";
  @override
  String EDITSKILL_PAGE_deleteSuccess = "Habilidad eliminada exitosamente";
  @override
  String EDITSKILL_PAGE_saveSuccess = "Habilidad editada exitosamente";

  @override
  String MATCHINGS_PAGE_title = "Tus coincidencias";
  @override
  String MATCHINGS_PAGE_matchingSummaryA = "   Tienes ";
  @override
  String MATCHINGS_PAGE_matchingSummaryB = " coincidencias.";
  @override
  String MATCHINGS_PAGE_matchingSummaryHint =
      "    Puedes ver los detalles de tus coincidencias tocando sobre ellas.";
  @override
  String MATCHINGS_PAGE_filterBy = "Filtrar por";

  @override
  String MATCH_PAGE_title = "Coincidencia";
  @override
  String MATCH_PAGE_accept = "Aceptar";
  @override
  String MATCH_PAGE_reject = "Rechazar y referir";
  @override
  String MATCH_PAGE_feature_1_title = "Tipo de Trabajo";
  @override
  String MATCH_PAGE_feature_2_title = "Salario Esperado";
  @override
  String MATCH_PAGE_feature_3_title = "Alcance";
  @override
  String MATCH_PAGE_feature_4_title = "Tipo de Posición";
  @override
  String MATCH_PAGE_radar_title = "Radar de Coincidencias";
  @override
  String MATCH_PAGE_skillCloud_title = "Nube de Habilidades";
  @override
  String MATCH_PAGE_accordion_title_1 = "Responsabilidades";
  @override
  String MATCH_PAGE_accordion_title_2 = "Requisitos";
  @override
  String MATCH_PAGE_accordion_title_3 = "Acerca de nosotros";

  @override
  String SETTINGS_PAGE_title = "Configuración";
  @override
  String SETTINGS_PAGE_language = "Idioma";
  @override
  String SETTINGS_PAGE_changingLanguage = "Cambiando idioma...";
  @override
  String SETTINGS_PAGE_languageChanged = "Idioma cambiado exitosamente";
  @override
  String SETTINGS_PAGE_languageChangeFailed =
      "Error al cambiar el idioma. Por favor, inténtalo de nuevo.";

  @override
  String PREFERENCES_PAGE_companySizeQuestion =
      "¿Te gustaría trabajar en empresas de estos tamaños?";

  @override
  Map<String, String> PREFERENCES_PAGE_companySizeOptions = {
    "": "",
    "seed": "Semilla (1-10 emp.)",
    "small": "Pequeña (11-50 emp.)",
    "medium": "Mediana (51-250 emp.)",
    "large": "Grande (251-500 emp.)",
    "verylarge": "Muy grande (501-1000 emp.)",
    "massive": "Enorme (1000+ emp.)"
  };

  @override
  String PREFERENCES_PAGE_companyTypeQuestion =
      "¿En qué tipo de empresa te gustaría trabajar?";

  @override
  Map<String, String> PREFERENCES_PAGE_companyTypeOptions = {
    "": "",
    "startup": "Startup",
    "corporate": "Corporativo",
    "nonprofit": "Sin fines de lucro",
  };

  @override
  String PREFERENCES_PAGE_sectorsQuestion =
      "¿Te gustaría trabajar en estos sectores?";

  @override
  String PREFERENCES_PAGE_typesOfPositionsQuestion =
      "¿Qué tipo de trabajo te interesa?";

  @override
  Map<String, String> PREFERENCES_PAGE_typesOfPositionsOptions = {
    "": "",
    "fulltime": "Tiempo completo",
    "parttime": "Medio tiempo",
    "contractor": "Contratista",
    "temporary": "Temporal",
    "freelancer": "Freelancer",
    "volunteer": "Voluntario",
    "internship": "Pasantía"
  };

  @override
  String PREFERENCES_PAGE_howUrgentYourHiringQuestion =
      "¿En qué etapa estás en tu búsqueda de empleo?";

  @override
  Map<String, String> PREFERENCES_PAGE_howUrgentIsYourHiringOptions = {
    "": "",
    "veryurgent": "Buscando activamente",
    "norush": "Abierto a nuevas oportunidades",
    "always": "No buscando",
  };

  @override
  String PREFERENCES_PAGE_seniorityLevelQuestion =
      "¿Cuál es tu nivel de antigüedad en tu último puesto?";

  @override
  Map<String, String> PREFERENCES_PAGE_seniorityLevelOptions = {
    "": "",
    "internship": "Pasantía",
    "juniorlevel": "Nivel junior",
    "midlevel": "Nivel medio",
    "seniorlevel": "Nivel senior",
    "principallevel": "Nivel principal",
    "techleader": "Líder técnico",
    "teamleader": "Líder de equipo",
    "manager": "Gerente",
    "director": "Director",
    "head": "Jefe",
    "clevel": "Nivel C",
    "cofounder": "Cofundador",
  };

  @override
  String PREFERENCES_PAGE_salaryExpectationQuestion =
      "¿Cuál es tu salario actual y tu expectativa salarial? (bruto mensual)";

  @override
  String PREFERENCES_PAGE_currentSalaryHint = "Salario actual";

  @override
  String PREFERENCES_PAGE_salaryExpectationHint = "Expectativa salarial";

  @override
  String PREFERENCES_PAGE_legalCountryQuestion =
      "Selecciona los países donde tienes derecho legal a trabajar";

  @override
  String PREFERENCES_PAGE_wantedCountryQuestion =
      "Selecciona los países donde te gustaría trabajar.";

  @override
  String PREFERENCES_PAGE_workingMethodQuestion =
      "¿Qué métodos de trabajo prefieres?";

  @override
  Map<String, String> PREFERENCES_PAGE_workingMethodOptions = {
    "": "",
    "onsite": "Presencial",
    "remote": "Remoto",
    "hybrid": "Híbrido",
  };

    @override
  String TAKE_SURVE_PAGE_title = "Encuesta de ambiente laboral";

  @override
  String TAKE_SURVE_PAGE_question = "Pregunta ";

  @override
  String TAKE_SURVE_PAGE_previous = "Anterior";

  @override
  String TAKE_SURVE_PAGE_next = "Siguiente";

  @override
  String TAKE_SURVEY_PAGE_remainingPoints = "Puntos restantes: ";

  @override
  String DASHBOARD_PAGE_title = "Panel";
  @override
  String DASHBOARD_PAGE_loadingRssFeed = "Cargando feed RSS...";
  @override
  String DASHBOARD_PAGE_updateProfile = "Actualizar perfil";
  @override
  String DASHBOARD_PAGE_lastUpdatedOn = "Última actualización el ";
  @override
  String DASHBOARD_PAGE_fillSurvey = "Completar encuesta";
  @override
  String DASHBOARD_PAGE_fillSurveyHeader = "Expectativa organizacional";
  @override
  String DASHBOARD_PAGE_fillSurveyDescription =
      "Ayúdanos a entender tus expectativas de tu ambiente laboral ideal.";
  @override
  String DASHBOARD_PAGE_showTests = "Mostrar pruebas";
  @override
  String DASHBOARD_PAGE_showTestsHeader = "Evaluaciones técnicas";
  @override
  String DASHBOARD_PAGE_showTestsDescription =
      "Completa la encuesta para ayudarnos a calificar tus habilidades.";

  @override
  String PROGRESSVIEWER_activityLevel = "Nivel de actividad";

  @override
  String PROGRESSVIEWER_profileScore = "Puntaje de perfil";

  @override
  var PROGRESSVIEWER_levelNames = ["Ninguno", "Bajo", "Medio", "Alto", "Perfecto"];

  @override
  String BOTTOM_NAVIGATION_BAR_profile = "Perfil";
  @override
  String BOTTOM_NAVIGATION_BAR_dashboard = "Panel";
  @override
  String BOTTOM_NAVIGATION_BAR_matchings = "Coincidencias";

  @override
  String START_SURVEY_PAGE_title = "Comenzar encuesta";
  @override
  String START_SURVEY_PAGE_startSurvey = "Comenzar encuesta";
  @override
  String START_SURVEY_PAGE_description =
      "Completa la encuesta para ayudarnos a entender tus expectativas de tu ambiente laboral ideal.";

  @override
  String COMPLETE_SURVEY_PAGE_title = "Completar encuesta";
  @override
  String COMPLETE_SURVEY_PAGE_completeSurvey =
      "Completar encuesta";
  @override
  String COMPLETE_SURVEY_PAGE_description  = 
      "Completa la encuesta para ayudarnos a entender tus expectativas de tu ambiente laboral ideal.";
}