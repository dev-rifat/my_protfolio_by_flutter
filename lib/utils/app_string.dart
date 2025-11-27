// ------------------------------------------------------
// TEXT HANDLER (Easy to Modify, Supports Localization)
// ------------------------------------------------------
import '../web/widgets/project_serction.dart';
import 'images.dart';

class AboutMeStrings {
  static const sectionTitle = "About Me";
  static const title = "Who I Am";

  static const description =
      "I’m a dedicated Flutter developer specializing in fast, beautiful, and scalable cross-platform mobile apps. "
      "Focused on clean architecture, performance optimization, and pixel-perfect UI to deliver modern user experiences.";

  // Features
  static const feature1Title = "Reliable & Secure";
  static const feature1Desc =
      "I build applications with reliability and security at their core, ensuring your data stays protected.";

  static const feature2Title = "Innovative Solutions";
  static const feature2Desc =
      "I use modern technologies and industry best practices to solve problems creatively and efficiently.";

  static const feature3Title = "User-Focused Design";
  static const feature3Desc =
      "I prioritize user experience to create intuitive, smooth, and visually appealing interfaces.";

  // Journey
  static const journeyTitle = "My Journey";
  static const journeyDesc =
      "Flutter developer with 2.5+ years of experience building scalable, high-performance mobile apps. "
      "Skilled in GetX, BLoC, REST / GraphQL, Firebase, CI/CD, and push notifications. "
      "Experienced in full development lifecycle — UI/UX, architecture, and publishing to Play Store & App Store.";
}

class ContactString{
  // -----------------------------
  // TEXT CONSTANTS (ALL TEXT HERE)
  // -----------------------------
  static const String titleBadge = "Get Touch";
  static const String titleMain = "Let's Work Together";
  static const String contactHeader = "Contact Information";
  static const String sendMessageHeader = "Send a Message";

  static const String emailText = "lutfurrh850@gmail.com";
  static const String linkedinText = "linkedin.com/in/lutfar-rahman-rifat-1a769323a";
  static const String githubText = "github.com/dev-rifat";

  static const String linkedinUrl = "https://www.linkedin.com/in/lutfar-rahman-rifat-1a769323a";
  static const String githubUrl = "https://github.com/dev-rifat";

  static const snackCopiedText = "Copied!";
  static const messagePlaceholder = "Your message...";

// -----------------------------
}

class HeroStrings {
  // Intro Text
  static const hi = "Hi,";
  static const name = "I'm Rifat";
  static const title = "Apps Developer";

  // Description
  static const description =
      "I develop modern, scalable Flutter applications for mobile and web, "
      "following clean architecture principles, with robust state management "
      "and seamless user experiences";

  // Buttons
  static const viewWork = "View My Work";
  static const resume = "My resume";

  // Resume URL
  static const resumeUrl =
      "https://drive.google.com/file/d/17c5KrbqtvnFzaWQ9QTpxq8X0nGL54kib/view?usp=sharing";
}


// SAMPLE DATA
 final projects = [
  Project(
    title: "PayRun",
    viewDetails: "https://payrun.app/",
    appstoreUrl: "https://apps.apple.com/us/app/payrun/id6483939439",
    playStoreUrl:
    "https://play.google.com/store/apps/details?id=com.gainhq.payrun&hl=en",
    description:
    "Complete HR & payroll management app with employee tracking, payroll automation and admin interface.",
    imageUrl: AppImages.payrun,
    tags: [
      "Flutter",
      "Graphql",
      "aws",
      "graphql subscription",
      "Firebase",
      "Pushy",
      "Apns Server",
      "Hive",
      "Local notification",
      "Websocket",
    ],
  ),
  Project(
    title: "EasyDesk",
    viewDetails: "https://easydesk.app/",
    appstoreUrl:
    "https://apps.apple.com/us/app/easydesk-support/id6738735433",
    playStoreUrl:
    "https://play.google.com/store/apps/details?id=com.gainhq.easydesk&hl=en",
    description:
    "EasyDesk is more than just a helpdesk software. It is a complete online customer...",
    imageUrl: AppImages.easyDesk,
    tags: [
      "Flutter",
      "Graphql",
      "aws",
      "graphql subscription",
      "Pushy",
      "Apns Server",
      "Local notification",
    ],
  ),
  Project(
    title: "LMS Mobile",
    viewDetails:           "https://play.google.com/store/apps/details?id=com.data_app_lms.lms_mobile_android_ios&hl=en",

    playStoreUrl:
    "https://play.google.com/store/apps/details?id=com.data_app_lms.lms_mobile_android_ios&hl=en",

    description:
    "Full-featured LMS for students with offline access, quizzes & video learning...",
    imageUrl: AppImages.rise,
    tags: ["Flutter", "REST API", "GetX", "SQLite"],
  ),

  Project(
    title: "Mango Cart",
    viewDetails:
    "https://play.google.com/store/apps/details?id=com.rifatalhasan.mango_app_user&hl=en", playStoreUrl:
  "https://play.google.com/store/apps/details?id=com.rifatalhasan.mango_app_user&hl=en",

    description:
    "Mango lets you order fresh mangoes and premium beef from trusted local suppliers—fast, easy, and delivered to your door...",
    imageUrl: AppImages.mangoCart,
    tags: ["Flutter", "REST API", "GetX", "SQLite", "WebSocket"],
  ),
  Project(
    title: "Mango Cart Distributor",
    viewDetails:
    "https://play.google.com/store/apps/details?id=com.rifatalhasan.mango_app_admin&hl=en",playStoreUrl:
  "https://play.google.com/store/apps/details?id=com.rifatalhasan.mango_app_admin&hl=en",

    description:
    "Seasonal mangoes and premium beef, delivered fast from trusted local suppliers...",
    imageUrl: AppImages.mangoCart,
    tags: ["Flutter", "REST API", "GetX", "SQLite", "WebSocket"],
  ),
];

class SkillsStrings {
  static const title = "Technical Skills";

  static const subtitle =
      "Here are the technologies and tools I work with to build high-performance mobile applications.";

  // Skill Groups
  static const categoryMobile = "Mobile Development";
  static const mobileSkills = [
    "Flutter & Dart",
    "Responsive UI Development",
    "Pixel-perfect UI",
    "Clean Architecture",
    "Reusable Components",
    "App Store Publishing",
    "Play Store Publishing",
  ];

  static const categoryState = "State Management";
  static const stateSkills = [
    "GetX",
    "BLoC Pattern",
    "MVC Architecture",
    "MVVM Architecture",
    "Clean Architecture",
    "Dependency Injection",
  ];

  static const categoryApi = "APIs & Backend";
  static const apiSkills = [
    "REST APIs",
    "GraphQL & Subscriptions",
    "WebSocket",
    "Real-time Data Handling",
    "Firebase Auth",
    "Firestore",
    "Live chat",
  ];

  static const categoryFeatures = "Features & Modules";
  static const featureSkills = [
    "Chat Modules",
    "Payment Gateway Integration",
    "Push Notification Systems",
    "Offline Storage (Hive)",
    "HRM Solutions",
    "E-commerce Features",
    "LMS Development",
  ];

  static const categoryPush = "Push Notification";
  static const pushSkills = [
    "Firebase Cloud Messaging (FCM)",
    "Pushy",
    "Apple Push Notification (APNs)",
    "Notification Systems",
  ];

  static const categoryTools = "Tools & DevOps";
  static const toolSkills = [
    "Git & GitHub",
    "GitLab",
    "GitHub Actions CI/CD",
    "Firebase App Distribution",
    "Jira",
    "Zen Hub",
    "Trello",
    "Slack",
    "MS Teams",
  ];
}
