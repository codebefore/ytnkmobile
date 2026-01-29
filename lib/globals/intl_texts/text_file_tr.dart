// ignore_for_file: non_constant_identifier_names, overridden_fields

import 'package:ytnkio/globals/intl_texts/text_file.dart';

class TextFileTR extends TextFile {
  @override
  var MONTHS = [
    "Ocak",
    "Şubat",
    "Mart",
    "Nisan",
    "Mayıs",
    "Haziran",
    "Temmuz",
    "Ağustos",
    "Eylül",
    "Ekim",
    "Kasım",
    "Aralık"
  ];

  @override
  var YEARSBEFORE = [
    "2000",
    "2001",
    "2002",
    "2003",
    "2004",
    "2005",
    "2006",
    "2007",
    "2008",
    "2009",
    "2010",
    "2011",
    "2012",
    "2013",
    "2014",
    "2015",
    "2016",
    "2017",
    "2018",
    "2019",
    "2020",
    "2021",
    "2022",
    "2023",
    "2024",
    "2025"
  ];

  @override
  var YEARSBEFOREAFTER = [
    "2000",
    "2001",
    "2002",
    "2003",
    "2004",
    "2005",
    "2006",
    "2007",
    "2008",
    "2009",
    "2010",
    "2011",
    "2012",
    "2013",
    "2014",
    "2015",
    "2016",
    "2017",
    "2018",
    "2019",
    "2020",
    "2021",
    "2022",
    "2023",
    "2024",
    "2025",
    "2026",
    "2027",
    "2028",
    "2029",
    "2030"
  ];

  @override
  var WORKTYPES = ["Tam zamanlı", "Yarı zamanlı", "Hibrit", "Uzaktan"];

  @override
  String EXCEPTION_emailAlreadyInUse = "Eposta zaten kullanımda.";
  @override
  String EXCEPTION_invalidEmail = "Geçersiz eposta.";
  @override
  String EXCEPTION_unknownException = "Bilinmeyen hata: ";

  @override
  String SERVICEDOWN_PAGE_title = "Servis erişilemez durumda";
  @override
  String SERVICEDOWN_PAGE_pleaseTryAgainLater =
      "Servis erişilemez durumda.\nLütfen tekrar deneyin.";
  @override
  String SERVICEDOWN_PAGE_solutionButton = "Yeniden dene";

  @override
  String DRAWER_preferences = "Tercihler";
  @override
  String DRAWER_logout = "Çıkış";
  @override
  String DRAWER_dashboard = "Kokpit";
  @override
  String DRAWER_settings = "Ayarlar";
  @override
  String DRAWER_uncompleteLanding = "Başlangıcı Yeniden Göster";

  @override
  String PHONE_FORM_FIELD_searchText = "Ülke seçin";
  @override
  String PHONE_FORM_FIELD_invalidNumberMessage = "Geçersiz telefon numarası";

  @override
  String CONTACTINFO_ITEM_couldNotLaunch = "Sayfa açılamıyor ";

  @override
  String LANDING_PAGE_title = "ytnk.io";
  @override
  String LANDING_PAGE_skip = "Geç";
  @override
  String LANDING_PAGE_next = "Sonraki";
  @override
  String LANDING_PAGE_complete = "Tamamla";
  @override
  String LANDING_PAGE_landing1Title = "Profilini Oluştur";
  @override
  String LANDING_PAGE_landing1Description =
      "Sizi daha iyi tanıyabilmemiz için profilinizi oluşturun";
  @override
  String LANDING_PAGE_landing2Title = "İş Ortamı Anketini Doldur";
  @override
  String LANDING_PAGE_landing2Description =
      "Kendiniz için en uygun iş ortamını keşfetmek için anketi doldurun";
  @override
  String LANDING_PAGE_landing3Title = "Teknik Değerlendirmelere Katıl";
  @override
  String LANDING_PAGE_landing3Description =
      "Teknik değerlendirmelere katılarak yetkinliklerinizi keşfetmemize imkan verin";
  @override
  String LANDING_PAGE_landing4Title = "Eşleşmelerini Yönet";
  @override
  String LANDING_PAGE_landing4Description =
      "Size gelen davetiyeleri değerlendirerek eşleşmelerinizi yönetin";

  @override
  String LOGIN_PAGE_title = "Hoşgeldiniz";
  @override
  String LOGIN_PAGE_email = "Eposta";
  @override
  String LOGIN_PAGE_emailExample = "jimmymc9ill@proton.me";
  @override
  String LOGIN_PAGE_emailHint = "Ör: test@testmail.com";
  @override
  String LOGIN_PAGE_passwordExample = "123456";
  @override
  String LOGIN_PAGE_password = "Parola";
  @override
  String LOGIN_PAGE_login = "Giriş";
  @override
  String LOGIN_PAGE_retreivingProfileInfo =
      "Profil bilgileriniz getiriliyor...";
  @override
  String LOGIN_PAGE_forgotPassword = "Şifrenizi mi unuttunuz?";
  @override
  String LOGIN_PAGE_or = " or ";
  @override
  String LOGIN_PAGE_loginWithGoogle = "Google ile bağlan";
  @override
  String LOGIN_PAGE_dontHaveAnAccount = "Hesabınız yok mu?";
  @override
  String LOGIN_PAGE_createAccount = "Hesap Oluştur";
  @override
  String LOGIN_PAGE_unsuccessfulLoginAttempt = "Başarısız giriş denemesi";
  @override
  String LOGIN_PAGE_noProfile = "Profil bulunamadı.";
  @override
  String LOGIN_PAGE_returnToLoginPage = "Giriş sayfasına dön";
  @override
  String LOGIN_PAGE_loginSuccessful = "Giriş başarılı";

  @override
  String SIGNUP_OPTIONS_PAGE_title = "Kayıt Seçenekleri";
  @override
  String SIGNUP_OPTIONS_PAGE_signupWithEmail = "Epostayla Kayıt Ol";
  @override
  String SIGNUP_OPTIONS_PAGE_signupWithGoogle = "Google ile Kayıt Ol";
  @override
  String SIGNUP_OPTIONS_PAGE_or = "ya da";
  @override
  String SIGNUP_OPTIONS_PAGE_login = "Giriş";

  @override
  String SIGNUP_PAGE_title = "Hesap Oluştur";
  @override
  String SIGNUP_PAGE_createAccount = "Hesabımı Oluştur";

  @override
  String SIGNUP_PAGE_email = "Eposta";
  @override
  String SIGNUP_PAGE_emailHint = "Ör: test@testmail.com";
  @override
  String SIGNUP_PAGE_password = "Parola";
  @override
  String SIGNUP_PAGE_passwordHint = "En az 6 karakter";
  @override
  String SIGNUP_PAGE_passwordAgain = "Parola (tekrar)";
  @override
  String SIGNUP_PAGE_referenceCode = "Referans Kodu";
  @override
  String SIGNUP_PAGE_fullName = "Tam Ad";
  @override
  String SIGNUP_PAGE_location = "Konum";
  @override
  String SIGNUP_PAGE_phone = "Telefon";
  @override
  String SIGNUP_PAGE_aggreeAndJoin = "Kabul Et & Katıl";
  @override
  String SIGNUP_PAGE_alreadyHaveAnAccount = "Zaten hesabınız var mı?";
  @override
  String SIGNUP_PAGE_invalidReferenceCode = "Geçersiz referans kodu";
  @override
  String SIGNUP_PAGE_fullNameMustBeFilled = "Tam Ad alanı boş bırakılamaz";
  @override
  String SIGNUP_PAGE_fullNameMustContainFirstAndLast =
      "Tam ad hem ilk adı hem de soyadı içermelidir";
  @override
  String SIGNUP_PAGE_emailMustBeFilled = "Eposta alanı boş bırakılamaz";
  @override
  String SIGNUP_PAGE_emailIsNotValid = "Geçersiz eposta";
  @override
  String SIGNUP_PAGE_phoneMustBeFilled = "Telefon alanı boş bırakılamaz";
  @override
  String SIGNUP_PAGE_locationMustBeFilled = "Konum alanı boş bırakılamaz.";
  @override
  String SIGNUP_PAGE_locationIsNotValid = "Geçersiz konum";
  @override
  String SIGNUP_PAGE_passwordMustBeFilled = "Parola alanı boş bırakılamaz";
  @override
  String SIGNUP_PAGE_passwordIsNotValid = "Parola en az 6 karakter içermelidir";
  @override
  String SIGNUP_PAGE_passwordNotMatching = "Parolalar eşleşmiyor";
  @override
  String SIGNUP_PAGE_signupFailed =
      "Kayıt başarısız. Lütfen girişlerinizi kontrol edin.";
  @override
  String SIGNUP_PAGE_signupSuccess = "Kayıt başarılı";

  @override
  String SIGNUP_PAGE_userAgreementBeginning =
      "'Epostayla Kayıt Ol' veya 'Google ile Kayıt Ol' butonlarına tıklayarak aşağıdakileri kabul etmiş olursunuz:\n\n";
  @override
  String SIGNUP_PAGE_privacyPolicy = "1. Gizlilik Politikası:";
  @override
  String SIGNUP_PAGE_privacyPolicyText =
      " Kişisel bilgilerinizin toplanması, kullanılması ve açıklanmasına ilişkin uygulamalarımızı kabul etmiş olursunuz. \n\n";
  @override
  String SIGNUP_PAGE_termsOfService = "2. Hizmet Şartları:";
  @override
  String SIGNUP_PAGE_termsOfServiceText =
      " Hizmet Şartları ve Kullanım Koşullarımızı kabul etmiş olursunuz. \n\n";
  @override
  String SIGNUP_PAGE_gdprCompliance = "3. GDPR Uyumluluğu:";
  @override
  String SIGNUP_PAGE_gdprComplianceText =
      " Avrupa Genel Veri Koruma Yönetmeliği (GDPR) kapsamında kişisel verilerinizin işlenmesini kabul etmiş olursunuz. \n\n";
  @override
  String SIGNUP_PAGE_cookies = "4. Çerezler:";
  @override
  String SIGNUP_PAGE_cookiesText =
      " Çerezlerin kullanılmasını kabul etmiş olursunuz. \n\n";
  @override
  String SIGNUP_PAGE_userAgreementEnding =
      "Kaydolmakla, bu şartları ve koşulları okuduğunuzu, anladığınızı ve kabul ettiğinizi onaylıyorsunuz. Bu şartların herhangi bir kısmına katılmıyorsanız, lütfen kayıt sürecine devam etmeyin.";

  @override
  String FORGOT_PASSWORD_PAGE_title = "Parolamı Unuttum";
  @override
  String FORGOT_PASSWORD_PAGE_email = "Eposta";
  @override
  String FORGOT_PASSWORD_PAGE_emailHint =
      "Eposta adresinizi girin. \n\nParola sıfırlama bağlantısı almak için eposta adresinizi girin.";
  @override
  String FORGOT_PASSWORD_PAGE_resetPassword =
      "Parola sıfırlama bağlantısı gönder";
  @override
  String FORGOT_PASSWORD_PAGE_emailIsNotValid = "Eposta geçerli değil";
  @override
  String FORGOT_PASSWORD_PAGE_resetLinkGenerated =
      "Sıfırlama bağlantısı oluşturuldu. \r\n\r\n Epostanızı kontrol ediniz.";

  @override
  String EMAIL_VERIFICATION_PAGE_title = "Eposta Doğrulama";
  @override
  String EMAIL_VERIFICATION_PAGE_emailVerificationSuccess =
      "Eposta doğrulama başarılı";
  @override
  String EMAIL_VERIFICATION_PAGE_verificationCodeLabel = "Doğrulama Kodu";
  @override
  String EMAIL_VERIFICATION_PAGE_verificationCodeHelper =
      "Eposta adresinize gönderilen doğrulama kodunu girin";
  @override
  String EMAIL_VERIFICATION_PAGE_verifyEmail = "Epostayı Doğrula";
  @override
  String EMAIL_VERIFICATION_PAGE_verificationSentTo =
      "Doğrulama kodu eposta adresinize gönderildi";
  @override
  String EMAIL_VERIFICATION_PAGE_verificationCodeEmpty =
      "Doğrulama kodu boş olamaz";
  @override
  String EMAIL_VERIFICATION_PAGE_emailSentSuccessfully =
      "Eposta başarıyla gönderildi";

  @override
  String NAVIGATION_BAR_profile = "Profil";
  @override
  String NAVIGATION_BAR_dashboard = "Kokpit";
  @override
  String NAVIGATION_BAR_matches = "Eşleşmeler";

  @override
  String VIEWPROFILE_PAGE_title = "Profilini Görüntüle";
  @override
  String VIEWPROFILE_PAGE_summary = "Özet";
  @override
  String VIEWPROFILE_PAGE_workExperiences = "İş Deneyimleri";
  @override
  String VIEWPROFILE_PAGE_educations = "Eğitimler";
  @override
  String VIEWPROFILE_PAGE_certificates = "Sertifikalar";
  @override
  String VIEWPROFILE_PAGE_skills = "Yetkinlikler";
  @override
  String VIEWPROFILE_PAGE_profileDirty =
      "Profilinizde değişiklikler var. Lütfen kaydedin.";
  @override
  String VIEWPROFILE_PAGE_preferencesDirty =
      "Tercihlerinizde değişiklikler var. Lütfen kaydedin.";

  @override
  String VIEWPROFILE_PAGE_fillManually = "ya da elle doldur";
  @override
  String VIEWPROFILE_PAGE_importFromLinkedin = "Linkedin'den içe aktar";
  @override
  String VIEWPROFILE_PAGE_emptyHeadline = "Başlık ekleyin";
  @override
  String VIEWPROFILE_PAGE_emptySummary =
      "Kendiniz hakkında kısa bir özet ekleyin";
  @override
  String VIEWPROFILE_PAGE_emptyWorkExperiences =
      "Profilinizi zenginleştirmek için iş deneyimlerinizi ekleyin";
  @override
  String VIEWPROFILE_PAGE_saveProfileText = "Profilinizi kaydedin";

  @override
  String VIEWPROFILE_PAGE_addWorkExperience = "İş deneyimi ekle";
  @override
  String VIEWPROFILE_PAGE_addEducation = "Eğitim ekle";
  @override
  String VIEWPROFILE_PAGE_addSkill = "Yetkinlik ekle";
  @override
  String VIEWPROFILE_PAGE_addCertificate = "Sertifika ekle";

  @override
  String VIEWPROFILE_PAGE_personalInfo = "Kişisel Bilgiler";
  @override
  String VIEWPROFILE_PAGE_emptyPersonalInfo = "Kişisel bilgilerinizi ekleyin";

  @override
  String VIEWPROFILE_PAGE_profileSavedSuccessfully =
      "Profil başarıyla kaydedildi";
  @override
  String VIEWPROFILE_PAGE_profileFetchedSuccessfullyFromResume =
      "Profil başarıyla özgeçmişten alındı";
  @override
  String VIEWPROFILE_PAGE_avatarSavedSuccessfully =
      "Avatar başarıyla kaydedildi";

  @override
  String PROFILE_FLOATINGBUTTON_WORKEXPERIENCE = "İş Deneyimi";
  @override
  String PROFILE_FLOATINGBUTTON_EDUCATION = "Eğitim";
  @override
  String PROFILE_FLOATINGBUTTON_CERTIFICATE = "Sertifika";
  @override
  String PROFILE_FLOATINGBUTTON_SKILL = "Yetkinlik";
  @override
  String PROFILE_FLOATINGBUTTON_ADD = "Ekle...";
  @override
  String PROFILE_FLOATINGBUTTON_CANCEL = "Vazgeç";

  @override
  String PREFERENCES_PAGE_title = "Tercihler";

  @override
  String PARSEPDF_PAGE_title = "PDF Seçim";
  @override
  String PARSEPDF_PAGE_selectPdf = "PDF seç";
  @override
  String PARSEPDF_PAGE_fillProfileFromPdf = "Profilinizi PDF'den Doldurun";
  @override
  String PARSEPDF_PAGE_noPdfSelected = "PDF seçilmedi";

  @override
  String EDITAVATAR_PAGE_title = "Avatarı Düzenle";
  @override
  String EDITAVATAR_PAGE_noImageSelected = "Resim seçilmedi";
  @override
  String EDITAVATAR_PAGE_selectImage = "Galeriden resim seçin";
  @override
  String EDITAVATAR_PAGE_uploadImage = "Resmi yükleyin";
  @override
  String EDITAVATAR_PAGE_fileSizeLimitNotification =
      "Resim boyutu 4MB dan küçük olmalıdır. Dosya boyutu (KB): ";
  @override
  String EDITAVATAR_PAGE_saveSuccess = "Başarıyla kaydedildi";

  @override
  String EDITHEADLINE_PAGE_title = "Başlık Düzenle";
  @override
  String EDITHEADLINE_PAGE_headline = "Başlık";
  @override
  String EDITHEADLINE_PAGE_headlineHint =
      "Ör: 10 yıllık IT sektöründe deneyimli Proje Yöneticisi ...";
  @override
  String EDITHEADLINE_PAGE_save = "Başlığı Kaydet";

  @override
  String EDITSUMMARY_PAGE_title = "Özet Düzenle";
  @override
  String EDITSUMMARY_PAGE_summary = "Özet";
  @override
  String EDITSUMMARY_PAGE_summaryHint =
      "Ör: 10 yıllık IT sektöründe deneyimli Proje Yöneticisi ...";
  @override
  String EDITSUMMARY_PAGE_save = "Özeti Kaydet";

  @override
  String EDITPERSONALINFO_PAGE_title = "Kişisel Bilgileri Düzenle";
  @override
  String EDITPERSONALINFO_PAGE_firstName = "Ad";
  @override
  String EDITPERSONALINFO_PAGE_firstNameHint = "Ör: John";
  @override
  String EDITPERSONALINFO_PAGE_lastName = "Soyad";
  @override
  String EDITPERSONALINFO_PAGE_lastNameHint = "Ör: Doe";
  @override
  String EDITPERSONALINFO_PAGE_country = "Ülke";
  @override
  String EDITPERSONALINFO_PAGE_countryHint = "Ör: Türkiye";
  @override
  String EDITPERSONALINFO_PAGE_city = "Şehir";
  @override
  String EDITPERSONALINFO_PAGE_cityHint = "Ör: İstanbul";
  @override
  String EDITPERSONALINFO_PAGE_address = "Adres";
  @override
  String EDITPERSONALINFO_PAGE_addressHint = "Ör: Cadde, Sokak, No";
  @override
  String EDITPERSONALINFO_PAGE_save = "Kişisel Bilgileri Kaydet";
  @override
  String EDITPERSONALINFO_PAGE_phone = "Telefon";
  @override
  String EDITPERSONALINFO_PAGE_phoneHint = "Ör: 1234567890";
  @override
  String EDITPERSONALINFO_PAGE_linkedin = "Linkedin Hesabı";
  @override
  String EDITPERSONALINFO_PAGE_x = "X Hesabı";
  @override
  String EDITPERSONALINFO_PAGE_facebook = "Facebook Hesabı";
  @override
  String EDITPERSONALINFO_PAGE_instagram = "Instagram Hesabı";
  @override
  String EDITPERSONALINFO_PAGE_linkedinHint = "Ör: linkedin.com";
  @override
  String EDITPERSONALINFO_PAGE_xHint = "Ör: x.com";
  @override
  String EDITPERSONALINFO_PAGE_facebookHint = "Ör: facebook.com";
  @override
  String EDITPERSONALINFO_PAGE_instagramHint = "Ör: instagram.com";
  @override
  String EDITPERSONALINFO_PAGE_githubHint = "Ör: github.com";
  @override
  String EDITPERSONALINFO_PAGE_github = "Github Hesabı";
  @override
  String EDITPERSONALINFO_PAGE_websiteHint = "Ör: website.com";
  @override
  String EDITPERSONALINFO_PAGE_website = "Website";

  @override
  String EDITWORKEXPERIENCE_PAGE_save = "İş Deneyimini Kaydet";
  @override
  String EDITWORKEXPERIENCE_PAGE_saveSuccess =
      "İş deneyimi başarıyla düzenlendi";
  @override
  String EDITWORKEXPERIENCE_PAGE_saveError =
      "İş deneyimi düzenlenirken hata oluştu";
  @override
  String EDITWORKEXPERIENCE_PAGE_title = "İş Deneyimi Düzenle";
  @override
  String EDITWORKEXPERIENCE_PAGE_organisation = "Organizasyon";
  @override
  String EDITWORKEXPERIENCE_PAGE_titleLabel = "Ünvan";
  @override
  String EDITWORKEXPERIENCE_PAGE_workType = "Çalışma Türü";
  @override
  String EDITWORKEXPERIENCE_PAGE_description = "Açıklama";
  @override
  String EDITWORKEXPERIENCE_PAGE_location = "Konum";
  @override
  String EDITWORKEXPERIENCE_PAGE_startedOn = "Başlangıç Tarihi";
  @override
  String EDITWORKEXPERIENCE_PAGE_endedOn = "Bitiş Tarihi";
  @override
  String EDITWORKEXPERIENCE_PAGE_isCurrent = "Şu anki işiniz mi?";
  @override
  String EDITWORKEXPERIENCE_PAGE_deleteSuccess =
      "İş deneyimi başarıyla silindi";
  @override
  String EDITWORKEXPERIENCE_PAGE_deleteError =
      "İş deneyimi silinirken hata oluştu";
  @override
  String EDITWORKEXPERIENCE_PAGE_deleteConfirmationTitle = "İş Deneyimini Sil";
  @override
  String EDITWORKEXPERIENCE_PAGE_deleteConfirmation =
      "İş deneyimi kaydını silmek istediğinizden emin misiniz?";
  @override
  String EDITWORKEXPERIENCE_PAGE_delete = "Sil";
  @override
  String EDITWORKEXPERIENCE_PAGE_deleteCancel = "İptal";

  @override
  String EDITEDUCATION_PAGE_title = "Eğitimi Düzenle";
  @override
  String EDITEDUCATION_PAGE_save = "Eğitimi Kaydet";
  @override
  String EDITEDUCATION_PAGE_saveSuccess = "Eğitim başarıyla düzenlendi";
  @override
  String EDITEDUCATION_PAGE_saveError = "Eğitim düzenlenirken hata oluştu";
  @override
  String EDITEDUCATION_PAGE_deleteSuccess = "Eğitim başarıyla silindi";
  @override
  String EDITEDUCATION_PAGE_deleteError = "Eğitim silinirken hata oluştu";
  @override
  String EDITEDUCATION_PAGE_deleteConfirmationTitle = "Eğitimi Sil";
  @override
  String EDITEDUCATION_PAGE_deleteConfirmation =
      "Bu eğitim kaydını silmek istediğinizden emin misiniz?";
  @override
  String EDITEDUCATION_PAGE_delete = "Sil";
  @override
  String EDITEDUCATION_PAGE_deleteCancel = "İptal";

  @override
  String EDITCERTIFICATE_PAGE_title = "Sertifikayı Düzenle";
  @override
  String EDITCERTIFICATE_PAGE_name = "Ad";
  @override
  String EDITCERTIFICATE_PAGE_nameHelper = "Ör: PMP, AWS, CCNA";
  @override
  String EDITCERTIFICATE_PAGE_issuer = "Veren Kurum";
  @override
  String EDITCERTIFICATE_PAGE_issuerHelper = "Ör: Cisco, PMI, AWS";
  @override
  String EDITCERTIFICATE_PAGE_certificateId = "Sertifika No";
  @override
  String EDITCERTIFICATE_PAGE_certificateIdHelper = "Ör: 1234567890";
  @override
  String EDITCERTIFICATE_PAGE_certificateUrl = "Sertifika URL";
  @override
  String EDITCERTIFICATE_PAGE_certificateUrlHelper =
      "Ör: https://www.cisco.com";
  @override
  String EDITCERTIFICATE_PAGE_descriptionHelper = "Ör: Bu sertifika ...";
  @override
  String EDITCERTIFICATE_PAGE_description = "Açıklama";
  @override
  String EDITCERTIFICATE_PAGE_save = "Sertifikayı Kaydet";
  @override
  String EDITCERTIFICATE_PAGE_saveSuccess = "Sertifika başarıyla düzenlendi";
  @override
  String EDITCERTIFICATE_PAGE_saveError = "Sertifika düzenlenirken hata oluştu";
  @override
  String EDITCERTIFICATE_PAGE_deleteSuccess = "Sertifika başarıyla silindi";
  @override
  String EDITCERTIFICATE_PAGE_deleteError = "Sertifika silinirken hata oluştu";
  @override
  String EDITCERTIFICATE_PAGE_deleteConfirmationTitle = "Sertifikayı Sil";
  @override
  String EDITCERTIFICATE_PAGE_deleteConfirmation =
      "Bu sertifikayı silmek istediğinizden emin misiniz?";
  @override
  String EDITCERTIFICATE_PAGE_delete = "Sil";
  @override
  String EDITCERTIFICATE_PAGE_deleteCancel = "İptal";

  @override
  String EDITSKILL_PAGE_title = "Yetkinliği Düzenle";
  @override
  String EDITSKILL_PAGE_selectYourProficiencyLevel =
      "Yetkinlik seviyenizi seçin";
  @override
  String EDITSKILL_PAGE_save = "Yetkinliği Kaydet";
  @override
  String EDITSKILL_PAGE_level1Title = "Başlangıç";
  @override
  String EDITSKILL_PAGE_level2Title = "Orta";
  @override
  String EDITSKILL_PAGE_level3Title = "Yetkin";
  @override
  String EDITSKILL_PAGE_level4Title = "İleri";
  @override
  String EDITSKILL_PAGE_level5Title = "Uzman";
  @override
  String EDITSKILL_PAGE_level1Description =
      "Temel bilgileriniz var ama uygulamada yardıma ihtiyacınız var. Pratik yaparak ve gerçek dünya uygulamalarıyla becerilerinizi pekiştirebilirsiniz.";
  @override
  String EDITSKILL_PAGE_level2Description =
      "En iyi uygulamaları anlıyor, sorunları gideriyor ve verimli çalışıyorsunuz. Uzmanlığınızı geliştirmeye devam ederken, teknik projelere etkili bir şekilde katkıda bulunabilirsiniz.";
  @override
  String EDITSKILL_PAGE_level3Description =
      "İleri düzeyde bilgi ve becerilere sahipsiniz. İş akışlarını optimize edebilir, diğerlerine mentorluk yapabilir ve yenilikçi çözümler sunabilirsiniz. Uzmanlığınız, yeni durumlara uyum sağlamanıza ve teknik tartışmalarda liderlik rolleri üstlenmenize olanak tanır.";
  @override
  String EDITSKILL_PAGE_level4Description =
      "Karmaşık sorunları çözebilir, yenilikçi çözümler sunabilir ve yeni metodolojilere katkıda bulunabilirsiniz. Diğerleri, mentorluk, rehberlik ve uzmanlık için size bakar.";
  @override
  String EDITSKILL_PAGE_level5Description =
      "Uzmanlık seviyesinde bilgi ve becerilere sahipsiniz. Karmaşık sorunları çözebilir, yenilikçi çözümler sunabilir ve yeni metodolojilere katkıda bulunabilirsiniz. Diğerleri, mentorluk, rehberlik ve uzman";
  @override
  String EDITSKILL_PAGE_deleteConfirmationTitle = "Yetkinliği Sil";
  @override
  String EDITSKILL_PAGE_deleteConfirmation =
      "Bu yetkinliği silmek istediğinizden emin misiniz?";
  @override
  String EDITSKILL_PAGE_delete = "Sil";
  @override
  String EDITSKILL_PAGE_deleteCancel = "İptal";
  @override
  String EDITSKILL_PAGE_deleteSuccess = "Yetkinlik başarıyla silindi";
  @override
  String EDITSKILL_PAGE_saveSuccess = "Yetkinlik başarıyla kaydedildi";

  @override
  String MATCHINGS_PAGE_title = "Eşleşmeler";
  @override
  String MATCHINGS_PAGE_matchingSummaryA = "   Toplam ";
  @override
  String MATCHINGS_PAGE_matchingSummaryB = " eşleşmeniz var.";
  @override
  String MATCHINGS_PAGE_matchingSummaryHint =
      "    Eşleşmelerin üzerine tıklayarak ayrıntılarını görebilirsiniz.";
  @override
  String MATCHINGS_PAGE_filterBy = "Filtrele";

  @override
  String MATCH_PAGE_title = "Eşleşme";
  @override
  String MATCH_PAGE_accept = "Kabul Et";
  @override
  String MATCH_PAGE_reject = "Reddet & Öner";
  @override
  String MATCH_PAGE_feature_1_title = "Çalışma Türü";
  @override
  String MATCH_PAGE_feature_2_title = "Beklenen Maaş";
  @override
  String MATCH_PAGE_feature_3_title = "Kapsam";
  @override
  String MATCH_PAGE_feature_4_title = "Pozisyon Türü";
  @override
  String MATCH_PAGE_radar_title = "Eşleşme Radarı";
  @override
  String MATCH_PAGE_skillCloud_title = "Sahip olunması gereken yetkinler";
  @override
  String MATCH_PAGE_accordion_title_1 = "Sorumluluklar";
  @override
  String MATCH_PAGE_accordion_title_2 = "Gereklilikler";
  @override
  String MATCH_PAGE_accordion_title_3 = "Hakkımızda";

  @override
  String SETTINGS_PAGE_title = "Ayarlar";
  @override
  String SETTINGS_PAGE_language = "Dil";
  @override
  String SETTINGS_PAGE_changingLanguage = "Dil değiştiriliyor...";
  @override
  String SETTINGS_PAGE_languageChanged = "Dil seçimi değiştirildi.";
  @override
  String SETTINGS_PAGE_languageChangeFailed =
      "Dil seçimi değiştirilemedi. Lütfen tekrar deneyin.";

  @override
  String PREFERENCES_PAGE_companySizeQuestion =
      "Hangi şirket büyüklüğünde çalışmak istersiniz?";

  @override
  Map<String, String> PREFERENCES_PAGE_companySizeOptions = {
    "": "",
    "seed": "Tohum (1-10 çal.)",
    "small": "Küçük (11-50 çal.)",
    "medium": "Orta (51-250 çal.)",
    "large": "Büyük (251-500 çal.)",
    "verylarge": "Çok Büyük (501-1000 çal.)",
    "massive": "Devasa (1000+ çal.)"
  };

  @override
  String PREFERENCES_PAGE_companyTypeQuestion =
      "Ne tür bir şirketle çalışmak istersiniz";

  @override
  Map<String, String> PREFERENCES_PAGE_companyTypeOptions = {
    "": "",
    "startup": "Startup",
    "corporate": "Kurumsal",
    "nonprofit": "Kar Amacı Gütmeyen",
  };

  @override
  String PREFERENCES_PAGE_sectorsQuestion =
      "Hangi sektörlerde çalışmak istersiniz?";

  @override
  String PREFERENCES_PAGE_typesOfPositionsQuestion =
      "Hangi pozisyon türlerinde çalışmak istersiniz?";

  @override
  Map<String, String> PREFERENCES_PAGE_typesOfPositionsOptions = {
    "": "",
    "fulltime": "Tam zamanlı",
    "parttime": "Yarı zamanlı",
    "contractor": "Sözleşmeli",
    "temporary": "Geçici",
    "freelancer": "Serbest çalışan",
    "volunteer": "Gönüllü",
    "internship": "Stajyer",
  };

  @override
  String PREFERENCES_PAGE_howUrgentYourHiringQuestion =
      "İşe alım süreciniz ne kadar acil?";

  @override
  Map<String, String> PREFERENCES_PAGE_howUrgentIsYourHiringOptions = {
    "": "",
    "veryurgent": "İş arıyorum",
    "norush": "Yeni fırsatlara açığım",
    "always": "İş aramıyorum",
  };

  @override
  String PREFERENCES_PAGE_seniorityLevelQuestion =
      "Hangi kıdem seviyesinde çalışmak istersiniz?";

  @override
  Map<String, String> PREFERENCES_PAGE_seniorityLevelOptions = {
    "": "",
    "internship": "Stajyer",
    "juniorlevel": "Çaylak",
    "midlevel": "Orta Seviye",
    "seniorlevel": "Kıdemli",
    "principallevel": "Baş Uzman",
    "techleader": "Teknoloji Lideri",
    "teamleader": "Takım Lideri",
    "manager": "Yönetici",
    "director": "Direktör",
    "head": "Başkan",
    "clevel": "Üst Düzey",
    "cofounder": "Kurucu Ortak",
  };

  @override
  String PREFERENCES_PAGE_salaryExpectationQuestion = "Maaş beklentiniz nedir?";

  @override
  String PREFERENCES_PAGE_currentSalaryHint = "Mevcut Maaş";

  @override
  String PREFERENCES_PAGE_salaryExpectationHint = "Beklenen Maaş";

  @override
  String PREFERENCES_PAGE_legalCountryQuestion =
      "Hangi ülkelerde yasal olarak çalışabilirsiniz?";

  @override
  String PREFERENCES_PAGE_wantedCountryQuestion =
      "Hangi ülkelerde çalışmak istersiniz?";

  @override
  String PREFERENCES_PAGE_workingMethodQuestion =
      "Hangi çalışma yöntemlerinde çalışmak istersiniz?";

  @override
  Map<String, String> PREFERENCES_PAGE_workingMethodOptions = {
    "": "",
    "onsite": "Yerinde",
    "remote": "Uzaktan",
    "hybrid": "Hibrid",
  };

  @override
  String TAKE_SURVE_PAGE_title = "Beklenti Anketi";

  @override
  String TAKE_SURVE_PAGE_question = "Soru ";

  @override
  String TAKE_SURVE_PAGE_previous = "Önceki";

  @override
  String TAKE_SURVE_PAGE_next = "Sonraki";

  @override
  String TAKE_SURVEY_PAGE_remainingPoints = "Kalan Puanlar: ";

  @override
  String DASHBOARD_PAGE_title = "Kokpit";
  @override
  String DASHBOARD_PAGE_loadingRssFeed = "RSS yükleniyor...";
  @override
  String DASHBOARD_PAGE_updateProfile = "Profilinizi güncelleyin";
  @override
  String DASHBOARD_PAGE_lastUpdatedOn = "Son güncelleme : ";
  @override
  String DASHBOARD_PAGE_fillSurvey = "Anketi doldur";
  @override
  String DASHBOARD_PAGE_fillSurveyHeader = "Organizasyonel Beklenti";
  @override
  String DASHBOARD_PAGE_fillSurveyDescription =
      "En uygun iş ortamını keşfetmek için organizasyonel beklenti anketini doldurun";
  @override
  String DASHBOARD_PAGE_showTests = "Testleri Göster";
  @override
  String DASHBOARD_PAGE_showTestsHeader = "Teknik Değerlendirmeler";
  @override
  String DASHBOARD_PAGE_showTestsDescription =
      "Teknik değerlendirmelere katılarak yetkinliklerinizi keşfetmemize imkan verin";

  @override
  String PROGRESSVIEWER_activityLevel = "Aktivite Seviyesi";

  @override
  String PROGRESSVIEWER_profileScore = "Profil Skoru";

  @override
  var PROGRESSVIEWER_levelNames = [
    "Hiçbiri",
    "Düşük",
    "Orta",
    "Yüksek",
    "Müthiş"
  ];

  @override
  String BOTTOM_NAVIGATION_BAR_profile = "Profil";
  @override
  String BOTTOM_NAVIGATION_BAR_dashboard = "Kokpit";
  @override
  String BOTTOM_NAVIGATION_BAR_matchings = "Eşleşmeler";

  @override
  String START_SURVEY_PAGE_title = "Anketi Başlat";
  @override
  String START_SURVEY_PAGE_startSurvey = "Hadi Başlayalım!";
  @override
  String START_SURVEY_PAGE_description =
      "Anketi tamamlayarak kendiniz için en uygun iş ortamını keşfedin";

  @override
  String COMPLETE_SURVEY_PAGE_title = "Anket Tamamlandı";
  @override
  String COMPLETE_SURVEY_PAGE_completeSurvey =
      "Anketi Tamamla";
  @override
  String COMPLETE_SURVEY_PAGE_description = "Anketi tamamladığınız için teşekkür ederiz! \n\nSonuçlarınız, iş ortamı tercihlerinizi ve beklentilerinizi anlamamıza yardımcı olacak.";
}
