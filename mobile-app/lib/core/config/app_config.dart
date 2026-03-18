import '../values/flavor/flavor.dart';

class AppConfig {
  AppFlavor _flavor;
  String _appName;
  String _appIcon;
  String _apiBaseUrl;
  String _storageUrl;
  String _connectionCheckerUrl;
  String _storageKey;
  String _initializationVector;
  String _secretKey;
  String _staticKey;
  String _defaultOrganizationCodeAdmin;
  String _defaultSurveyCodeAdmin;
  String _organizationCode;
  String _surveyCode;
  String _version;
  String _storageVersion;
  String _newRelicAndroidToken;
  String _newRelicIOSToken;
  bool _enableNewRelicLogging;
  String _firebaseApiKey;
  String _firebaseAppId;
  String _firebaseMessagingSenderId;
  String _firebaseProjectId;
  String _playStoreLink;    
  String _appStoreLink;

  static AppConfig? _instance;

  AppFlavor get flavor => _flavor;
  String get appName => _appName;
  String get appIcon => _appIcon;
  String get apiBaseUrl => _apiBaseUrl;
  String get storageUrl => _storageUrl;
  String get connectionCheckerUrl => _connectionCheckerUrl;
  String get storageKey => _storageKey;
  String get initializationVector => _initializationVector;
  String get secretKey => _secretKey;
  String get staticKey => _staticKey;
  String get defaultOrganizationCodeAdmin => _defaultOrganizationCodeAdmin;
  String get defaultSurveyCodeAdmin => _defaultSurveyCodeAdmin;
  String get organizationCode => _organizationCode;
  String get surveyCode => _surveyCode;
  String get version => _version;
  String get storageVersion => _storageVersion;
  String get newRelicAndroidToken => _newRelicAndroidToken;
  String get newRelicIOSToken => _newRelicIOSToken;
  bool get enableNewRelicLogging => _enableNewRelicLogging;
  String get firebaseApiKey => _firebaseApiKey;
  String get firebaseAppId => _firebaseAppId;
  String get firebaseMessagingSenderId => _firebaseMessagingSenderId;
  String get firebaseProjectId => _firebaseProjectId;
  String get playStoreLink => _playStoreLink;    
  String get appStoreLink => _appStoreLink;     

  AppConfig({
    AppFlavor flavor = AppFlavor.dev,
    String appName = '',
    String appIcon = '',
    String apiBaseUrl = '',
    String storageUrl = '',
    String connectionCheckerUrl = '',
    String storageKey = '',
    String initializationVector = '',
    String secretKey = '',
    String staticKey = '',
    String defaultOrganizationCodeAdmin = '',
    String defaultSurveyCodeAdmin = '',
    String organizationCode = '',
    String surveyCode = '',
    String version = '',
    String storageVersion = '',
    String newRelicAndroidToken = '',
    String newRelicIOSToken = '',
    bool enableNewRelicLogging = false,
    String firebaseApiKey = '',
    String firebaseAppId = '',
    String firebaseMessagingSenderId = '',
    String firebaseProjectId = '',
    String playStoreLink = '',   
    String appStoreLink = '',   
  }) : 
    _flavor = flavor,
    _appName = appName,
    _appIcon = appIcon,
    _apiBaseUrl = apiBaseUrl,
    _storageUrl = storageUrl,
    _connectionCheckerUrl = connectionCheckerUrl,
    _storageKey = storageKey,
    _initializationVector = initializationVector,
    _secretKey = secretKey,
    _staticKey = staticKey,
    _defaultOrganizationCodeAdmin = defaultOrganizationCodeAdmin,
    _defaultSurveyCodeAdmin = defaultSurveyCodeAdmin,
    _organizationCode = organizationCode,
    _surveyCode = surveyCode,
    _version = version,
    _storageVersion = storageVersion,
    _newRelicAndroidToken = newRelicAndroidToken,
    _newRelicIOSToken = newRelicIOSToken,
    _enableNewRelicLogging = enableNewRelicLogging,
    _firebaseApiKey = firebaseApiKey,
    _firebaseAppId = firebaseAppId,
    _firebaseMessagingSenderId = firebaseMessagingSenderId,
    _firebaseProjectId = firebaseProjectId,
    _playStoreLink = playStoreLink,  
    _appStoreLink = appStoreLink {    
    _instance = this;
  }

  static AppConfig get instance => _instance ?? AppConfig();

  void update({
    AppFlavor? flavor,
    String? appName,
    String? appIcon,
    String? apiBaseUrl,
    String? storageUrl,
    String? connectionCheckerUrl,
    String? storageKey,
    String? initializationVector,
    String? secretKey,
    String? staticKey,
    String? defaultOrganizationCodeAdmin,
    String? defaultSurveyCodeAdmin,
    String? organizationCode,
    String? surveyCode,
    String? version,
    String? storageVersion,
    String? newRelicAndroidToken,
    String? newRelicIOSToken,
    bool? enableNewRelicLogging,
    String? firebaseApiKey,
    String? firebaseAppId,
    String? firebaseMessagingSenderId,
    String? firebaseProjectId,
    String? playStoreLink,    
    String? appStoreLink,    
  }) {
    _flavor = flavor ?? _flavor;
    _appName = appName ?? _appName;
    _appIcon = appIcon ?? _appIcon;
    _apiBaseUrl = apiBaseUrl ?? _apiBaseUrl;
    _storageUrl = storageUrl ?? _storageUrl;
    _connectionCheckerUrl = connectionCheckerUrl ?? _connectionCheckerUrl;
    _storageKey = storageKey ?? _storageKey;
    _initializationVector = initializationVector ?? _initializationVector;
    _secretKey = secretKey ?? _secretKey;
    _staticKey = staticKey ?? _staticKey;
    _defaultOrganizationCodeAdmin = defaultOrganizationCodeAdmin ?? _defaultOrganizationCodeAdmin;
    _defaultSurveyCodeAdmin = defaultSurveyCodeAdmin ?? _defaultSurveyCodeAdmin;
    _organizationCode = organizationCode ?? _organizationCode;
    _surveyCode = surveyCode ?? _surveyCode;
    _version = version ?? _version;
    _storageVersion = storageVersion ?? _storageVersion;
    _newRelicAndroidToken = newRelicAndroidToken ?? _newRelicAndroidToken;
    _newRelicIOSToken = newRelicIOSToken ?? _newRelicIOSToken;
    _enableNewRelicLogging = enableNewRelicLogging ?? _enableNewRelicLogging;
    _firebaseApiKey = firebaseApiKey ?? _firebaseApiKey;
    _firebaseAppId = firebaseAppId ?? _firebaseAppId;
    _firebaseMessagingSenderId = firebaseMessagingSenderId ?? _firebaseMessagingSenderId;
    _firebaseProjectId = firebaseProjectId ?? _firebaseProjectId;
    _playStoreLink = playStoreLink ?? _playStoreLink;     
    _appStoreLink = appStoreLink ?? _appStoreLink;         
  }
}