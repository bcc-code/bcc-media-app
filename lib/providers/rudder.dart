import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:brunstadtv_app/env/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rudder_sdk_flutter/RudderController.dart';
import 'package:rudder_sdk_flutter_platform_interface/platform.dart';

initializeRudderStack() {
  if (Env.rudderstackWriteKey == '') {
    return null;
  }
  final RudderController controller = RudderController.instance;
  RudderLogger.init(RudderLogger.VERBOSE);
  RudderConfigBuilder builder = RudderConfigBuilder();
  builder.withDataPlaneUrl('https://rs.bcc.media/');
  builder.withMobileConfig(MobileConfig(recordScreenViews: true));
  controller.initialize(Env.rudderstackWriteKey, config: builder.build());
}

String getAgeGroup(int? age) {
  if (age == null) {
    return 'UNKNOWN';
  }
  if (age >= 65) {
    return '65+';
  } else if (age >= 51) {
    return '51 - 65';
  } else if (age >= 37) {
    return '37 - 50';
  } else if (age >= 26) {
    return '26 - 36';
  } else if (age >= 19) {
    return '19 - 26';
  } else if (age >= 13) {
    return '13 - 18';
  } else if (age >= 10) {
    return '10 - 12';
  } else {
    return '< 10';
  }
}

void identify(UserProfile profile, String anonymousId) {
  final traits = RudderTraits();

  final birthDateTime = profile.birthdate == null ? null : DateTime.tryParse(profile.birthdate!);
  final ageDuration = birthDateTime == null ? null : DateTime.now().difference(birthDateTime);
  int? age;
  if (ageDuration != null) {
    age = (ageDuration.inDays / 365.25).floor();
    traits.put('ageGroup', getAgeGroup(age));
  }
  traits.put('country', profile.customClaims?['https://login.bcc.no/claims/CountryIso2Code']);
  traits.put('churchId', profile.customClaims?['https://login.bcc.no/claims/churchId']?.toString());
  if (profile.gender != null) {
    traits.putGender(profile.gender!);
  }

  RudderController.instance.identify(anonymousId, traits: traits);
}
