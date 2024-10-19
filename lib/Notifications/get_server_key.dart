import 'package:googleapis_auth/auth_io.dart';

class GetServerKey {
  Future<String> getServerKeyToken() async {
    final scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];

    final client = await clientViaServiceAccount(
      ServiceAccountCredentials.fromJson({
        "type": "service_account",
        "project_id": "farm-lancer",
        "private_key_id": "7f72bec75e95a64bf642b1b60b78c1849777ec65",
        "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDpoDLlJzpspSYL\npCdDo/qBGHZMpJF8JAjypnBrUx85CJ/wDXXqfqWpAEw3tXog+55cafsp9K4Hd402\nW2ylR/NdWl4LnYv6MgEDRj3GMHsZV5DxSJ/8WxtofUh8fo+aGpeGxAr9FS8xctJF\nootSIERjAkE3KzCeRmtM6cuI2FX/9t/0ELDNhzDoUKCOzTqiELeTI6VbDA5o7SpT\nLoD9XMbUpUH5p6Qhn8izqjefhBAzuUU+gzYOwTTgXpckJW+DLLdhL5duVohmnfCk\n4nvhoETRFZ3DwJoEy/em4N/4TWgBckLVHVlPPxJq+rU4Grb14flox+RKmkJwLS0i\n1QCB0vlVAgMBAAECggEAEipQYsR41LtHmMaf/fCpWPHVuvJd1Iz5vCJIYfPx3M2o\nn/Hv/fZwe5JIGtnLv/ZIky9zZcj+Yhq/2l7j9PsB93uADf+nQ2IxdXd39KnO3ILU\nRIqM1AKigC6jnPh7QnR4XTRvlUuZIotmwZ7Ynd9f6eHiP7+mNVxM2gtgtch6cV8y\n8tFCyWopiu6CgDZLIIO+x/Zc8cKWlowawdtWA+IDoe/YlAquIDKunKR3lbZvQlfv\n2PyJQb0DWLfaye70mBTWzVDqbTnLn8OzCI4PIMO6dZPgh/4rS9p+U0Oz36HGi07v\ntvfwddDLT1jfff2a7tXlM81E9b96FQG9OyfuyAH0EQKBgQD6BzliwCs0uErg55bl\nXMP0dGFI3Hr/OrA0528RJlC4v5RicFn7lv9DEJGcMsCsgVzxKDw50P46sCOxmRkI\n1rYaEpT6lQWFYhVoihnN5LZVQIm71fouBo34ntDkzIMS/4wfQS3Lvvh/PKaiu2Wd\nkzINifT1K5Qumug8GzQ1WiG3JQKBgQDvNK7u99KGD5daqexAtTlOJKrhN4QXzVts\n3RE+RPDs/ZF02WHYeYFr9jX469Oa61u6g3M+yvEaoWfyej5/3bzQt8DrY4j1k3gZ\n+GQxzwDojbqPiFWpK1QnnF0KCYh8g+2l/OAFPh+1plAC0dsYbxePcqNSCfCFeN2X\nEkuhf4v6cQKBgA/YD1njpZlEqHISGuzT8RL3oQaV+jFcTbg8hjxG+kyKz2NhjUI1\nMl3UmfWU/cKwu+wISbC8PrAHY2uosP5vZMDINqqecOgf7A1g2vvCJ4/FdDTz/VOX\nVL3RiplFIHU+vmlonvdPVb3yYPjk+S6AGmbjPCOhLFW7uUW9z5Ql7wcFAoGBALiG\nr5vw2RpJ1Lw/8NxJ8Jbzek6agO/Lnwdv0elzTVfEk/zL5MsVkF00ZZZMdcRAY1aS\nKMj7zNp6QLGw053X89wepFfxRKoMxM1j7AbwZQcArjYjOdFyd0zHNo6TpBJJw34U\ngMwKjHOYhIhoUteae1ZRXOPgfwa3oljz6BwBRH5BAoGABkmvwENVDZ8njHoJVryd\nclMOuCcGTjgbcvW4d3YfIg9jxAf0QJ7BcgDK/YTc7+QooDQpAEpqrgYJLENh8wGU\n0XxLaa636b/4l3IIQ6CqTxCDeJfmqKKXS/aVGiHdCgwjd9seZXMh2deSwKIXgWvZ\nVFYRbg5IazJiXTMTrtcVs7w=\n-----END PRIVATE KEY-----\n",
        "client_email": "firebase-adminsdk-kqpho@farm-lancer.iam.gserviceaccount.com",
        "client_id": "110535767137150776137",
        "auth_uri": "https://accounts.google.com/o/oauth2/auth",
        "token_uri": "https://oauth2.googleapis.com/token",
        "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
        "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-kqpho%40farm-lancer.iam.gserviceaccount.com",
        "universe_domain": "googleapis.com"
      }),
      scopes,
    );
    final accessServerKey = client.credentials.accessToken.data;
    return accessServerKey;
  }
}