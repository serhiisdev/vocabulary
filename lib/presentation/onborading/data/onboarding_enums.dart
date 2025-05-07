import 'package:flutter/widgets.dart';

abstract class Localized {
  String title(BuildContext context);
}

enum OnboardingHowDidYouHearAboutUs implements Localized {
  socialMedia(),
  searchEngine(),
  other();

  @override
  String title(BuildContext context) {
    return switch (this) {
      OnboardingHowDidYouHearAboutUs.socialMedia => 'Social Media',
      OnboardingHowDidYouHearAboutUs.searchEngine => 'Web Search',
      OnboardingHowDidYouHearAboutUs.other => 'Other',
    };
  }
  const OnboardingHowDidYouHearAboutUs();
}

enum OnboardingHowOldAreYou implements Localized {
  under18(),
  above18();

  @override
  String title(BuildContext context) {
    return switch (this) {
      OnboardingHowOldAreYou.under18 => 'Under 18',
      OnboardingHowOldAreYou.above18 => '18 and above',
    };
  }
  const OnboardingHowOldAreYou();
}

enum OnboardingGender implements Localized {
  male(),
  female(),
  other();

  @override
  String title(BuildContext context) {
    return switch (this) {
      OnboardingGender.male => 'Male',
      OnboardingGender.female => 'Female',
      OnboardingGender.other => 'Other',
    };
  }
  const OnboardingGender();
}

enum OnboardingNumOfWords implements Localized {
  ten(),
  thirty(),
  fifty();

  @override
  String title(BuildContext context) {
    return switch (this) {
      OnboardingNumOfWords.ten => '10 words',
      OnboardingNumOfWords.thirty => '30 words',
      OnboardingNumOfWords.fifty => '50 words',
    };
  }
  const OnboardingNumOfWords();
}

enum OnboardingVocabularyLevel implements Localized {
  beginner(),
  intermediate(),
  advanced();

  @override
  String title(BuildContext context) {
    return switch (this) {
      OnboardingVocabularyLevel.beginner => 'Beginner',
      OnboardingVocabularyLevel.intermediate => 'Intermediate',
      OnboardingVocabularyLevel.advanced => 'Advanced',
    };
  }
  const OnboardingVocabularyLevel();
}


enum OnboardingSpecificGoal implements Localized {
  enchanceMyLexicon(),
  getReadyForATest(),
  other();

  @override
  String title(BuildContext context) {
    return switch (this) {
      OnboardingSpecificGoal.enchanceMyLexicon => 'Enchance my lexicon',
      OnboardingSpecificGoal.getReadyForATest => 'Get ready for a test',
      OnboardingSpecificGoal.other => 'Other',
    };
  }
  const OnboardingSpecificGoal();
}

enum OnboardingTopics implements Localized {
  society(),
  business(),
  other();

  @override
  String title(BuildContext context) {
    return switch (this) {
      OnboardingTopics.society => 'Society',
      OnboardingTopics.business => 'Business',
      OnboardingTopics.other => 'Other',
    };
  }
  const OnboardingTopics();
}

enum OnboardingGoalDays implements Localized {
  three(),
  seven(),
  twentyOne();

  @override
  String title(BuildContext context) {
    return switch (this) {
      OnboardingGoalDays.three => '3 days',
      OnboardingGoalDays.seven => '7 days',
      OnboardingGoalDays.twentyOne => '21 days',
    };
  }
  const OnboardingGoalDays();
}
