import 'package:get/get.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'get_started': 'Get started',
      'login_here': 'Login here',
      'welcome_back': "Welcome back you've \n been missed!",
      'email': 'Email',
      'email_required': 'Email is required',
      'email_invalid': 'Enter a valid email',
      'password': 'Password',
      'password_required': 'Password is required',
      'password_length': 'Password must be at least 6 characters',
      'forgot_password': 'Forgot your Password?',
      'sign_in': 'Sign In',
      'create_account': 'Create new account',
      'or_continue_with': 'Or continue with',
      'google_login': 'Login with Google',
      'facebook_login': 'Login with Facebook',
      'enter_email_address': 'Enter Email Address',
      'back_to_sign_in': 'Back to sign in',
      'send': 'Send',
      'or': 'Or',
      'have_account': 'Do you have an account?',
      'sign_up': 'Sign up',
      'create_account_subtitle':
          'Create an account so you can explore \n all the  existing jobs',

      'confirm_password': 'Confirm Password',
      'confirm_password_required': 'Confirm your password',
      'passwords_not_match': 'Passwords do not match',
      'already_have_account': 'Already have an account',
      'home': 'Home',
      'jobs': 'Jobs',
      'book': 'Book',
      'menu': 'Menu',
      // Section titles
      'featured_activities': 'Featured Activities',
      'top_listings': 'Top Listings',
      'view_all': 'View All',

      // Listing card tags
      'paid': 'Paid',
      'free': 'Free',

      // Listing card buttons
      'view_details': 'View Details',
      'book_now': 'Book Now',

      // Grid titles (could be keys or just literals)
      'football': 'Football',
      'gym': 'Gym',
      'swimming': 'Swimming',
      'tennis': 'Tennis',
      'reward': 'Reward',
      'car_services': 'Car Services',
      'faqs': 'FAQs',
      'notifications': 'Notifications',
      'admin': 'Admin',
      'logout': 'Logout',
      'edit_name': 'Edit Name',
      'gold_member_points': 'Gold Member - 1200 Points',
      'location': 'Location',
      'enter_your_location': 'Enter your location',

      'book_a_session': 'Book a Session',
      'personal_information': 'Personal Information',
      'first_name': 'First Name',
      'last_name': 'Last Name',
      'email_address': 'Email Address',
      'booking_details': 'Booking Details',
      'select_academy': 'Select Academy',
      'category': 'Category',
      'date': 'Date',
      'number_of_participants': 'Number of Participants',
      'age_group': 'Age Group',
      'select_an_age_group': 'Select an age group',
      'special_request': 'Special Request',
      'additional_request': 'Additional Request',
      'select_an_academy': 'Select an academy',
      'select_a_category': 'Select a category',
      'agree_terms': 'I agree to the terms and conditions\n',
      'booking_agreement': 'By booking a session, you agree to our\n',
      'terms_of_service': 'Terms of Service',
      'and': ' and ',
      'privacy_policy': 'Privacy Policy',
      'cancel': 'Cancel',
      'submit_booking': 'Submit Booking',
      'academy_overview': 'Academy Overview',
      'downtown': 'Downtown',
      'reviews_count': '(2 reviews)',
      'description': 'Description',
      'age_groups': 'Age Groups',
      'children_6_12': 'Children (6-12 years)',
      'teenagers_13_18': 'Teenagers (13-18 years)',
      'facilities': 'Facilities',
      'opening_hours': 'Opening Hours',
      'opening_hours_detail':
          'Mon-Fri: 7:00 AM - 9:00PM, Sat-Sun: 8:00AM - 7:00PM',
      'reviews': 'Reviews',
      // Facilities
      'olympic_pool': 'Olympic-sized pool',
      'changing_rooms': 'Changing rooms',
      'shower_facilities': 'Shower facilities',
      'spectator_area': 'Spectator area',

      // Contact labels (optional)
      'phone': 'Phone',
      'website': 'Website',
      'date_month_year': 'Date/Month/year',
      'time': 'Time',
      'number_of_person': 'Number of person',
      'contact_information': 'Contact Information',
      'home_title': "Find the Perfect Sports Academy or Nursery",
      'home_sub_title':
          "Discover top-rated sports academies and nurseries in your area. Book sessions easily and track your progress.",
      'home_bottom_title': "Ready to get started?",
      'home_bottom_sub_title':
          "Join thousands of parents who have found the perfect academy for their children.",

      'academies_1_title': "Elite Swimming Academy",
      'academies_2_title': "Power Gym Center",
      'academies_3_title': "Ace Tennis Club",
      'academies_4_title': "Hoops Basketball Center",
      'academies_5_title': "Ace Tennis Club",
      'academies_6_title': "Bright Beginnings Nursery",

      'academies_1_details':
          "Elite Swimming Academy offers professional swimming lessons for children and teenagers. Our Olympic-sized pool and certified instructors ensure top-quality training.",
      'academies_2_details':
          "Power Gym Center is equipped with modern machines and certified personal trainers.",
      'academies_3_details':
          "Join Ace Tennis Club to enjoy premium coaching and facilities for all skill levels.",
      'academies_4_details':
          "Hoops Basketball Center offers training programs for all age groups. Our facility includes multiple courts and specialized training equipment.",
      'academies_5_details':
          "Ace Tennis Club provides world-class tennis coaching for all ages and skill levels. Our facilities include indoor and outdoor courts.",
      'academies_6_details':
          "Bright Beginnings Nursery focuses on early childhood development in a fun and engaging environment. We offer a balanced mix of play and structured activities.",
      'apply_filters': 'Apply Filters',
      'all_location': 'All Location',
      'rating': 'Rating',
      'price': 'Price',
      'reset': 'Reset',
      'how_it_works': 'How It Works',

      'points_earn_history': 'Points Earn History',
      'booking': 'Booking',
      'earned_points_on': 'Earned 10 points on April',
      'available_rewards': 'Available Rewards',
      'off_next_booking': '10% Off Next Booking',
      'get_discount_text': 'Get 10% off your next booking at any academy.',
      'redeem': 'Redeem',
      'gold_member': 'Gold Member',
      'points': 'Points',

      'earn_points_info':
          'Earn 10 points for every booking you make through our platform.',
      'faq_q1': 'How can I book a session?',
      'faq_a1':
          'Visit the booking page, fill out the form, and click "Submit Booking".',

      'faq_q2': 'Can I cancel or reschedule a session?',
      'faq_a2':
          'Yes, you can cancel or reschedule up to 24 hours before the session.',

      'faq_q3': 'What payment methods do you accept?',
      'faq_a3':
          'We accept credit cards, debit cards, and secure online transfers.',

      'faq_q4': 'Is there a refund policy?',
      'faq_a4':
          'Refunds are offered for cancellations made at least 24 hours in advance.',

      'faq_q5': 'How do I contact support?',
      'faq_a5':
          'You can reach support via our Contact page or by emailing support@example.com.',

      'faq_q6': 'Are there any discounts for group bookings?',
      'faq_a6':
          'Yes, we offer discounts for bookings with 3 or more participants.',

      'faq_q7': 'Can I attend sessions without registering?',
      'faq_a7':
          'Registration is required for all sessions to ensure space availability.',

      'faq_q8': 'Do you provide equipment?',
      'faq_a8':
          'Basic equipment is provided for most sessions, but check details when booking.',

      'faq_q9': 'Are sessions suitable for beginners?',
      'faq_a9':
          'Yes, we offer beginner-friendly sessions across all categories.',

      'faq_q10': 'What happens if a session is canceled by the academy?',
      'faq_a10':
          'You will be notified immediately and offered a reschedule or full refund.',
    },
    'ar_AE': {
      'get_started': 'ابدء',
      'login_here': 'تسجيل الدخول',
      'welcome_back': 'مرحباً بك مرة أخرى\nلقد افتقدناك!',
      'email': 'البريد الإلكتروني',
      'email_required': 'البريد الإلكتروني مطلوب',
      'email_invalid': 'أدخل بريدًا إلكترونيًا صالحًا',
      'password': 'كلمة المرور',
      'password_required': 'كلمة المرور مطلوبة',
      'password_length': 'يجب أن تكون كلمة المرور 6 أحرف على الأقل',
      'forgot_password': 'هل نسيت كلمة المرور؟',
      'sign_in': 'تسجيل الدخول',
      'create_account': 'إنشاء حساب جديد',
      'or_continue_with': 'أو تابع باستخدام',
      'google_login': 'تسجيل الدخول عبر جوجل',
      'facebook_login': 'تسجيل الدخول عبر فيسبوك',
      'enter_email_address': 'أدخل البريد الإلكتروني',
      'back_to_sign_in': 'العودة لتسجيل الدخول',
      'send': 'إرسال',
      'or': 'أو',
      'have_account': 'هل لديك حساب؟',
      'sign_up': 'إنشاء حساب',
      'create_account_subtitle':
          'أنشئ حسابًا لتتمكن من استكشاف \n جميع الوظائف المتاحة',
      'confirm_password': 'تأكيد كلمة المرور',
      'confirm_password_required': 'يرجى تأكيد كلمة المرور',
      'passwords_not_match': 'كلمات المرور غير متطابقة',
      'already_have_account': 'هل لديك حساب بالفعل',
      'home': 'الرئيسية',
      'jobs': 'وظائف',
      'book': 'الحجز',
      'menu': 'القائمة',
      'featured_activities': 'الأنشطة المميزة',
      'top_listings': 'أفضل القوائم',
      'view_all': 'عرض الكل',

      'paid': 'مدفوع',
      'free': 'مجاني',

      'view_details': 'عرض التفاصيل',
      'book_now': 'احجز الآن',

      'football': 'كرة القدم',
      'gym': 'صالة الألعاب الرياضية',
      'swimming': 'السباحة',
      'tennis': 'التنس',
      'reward': 'المكافأة',
      'car_services': 'خدمات السيارات',
      'faqs': 'الأسئلة الشائعة',
      'notifications': 'الإشعارات',
      'admin': 'المسؤول',
      'logout': 'تسجيل الخروج',
      'edit_name': 'تعديل الاسم',
      'gold_member_points': 'عضو ذهبي - 1200 نقطة',
      'location': 'الموقع',
      'enter_your_location': 'أدخل موقعك',

      'book_a_session': 'حجز جلسة',
      'personal_information': 'المعلومات الشخصية',
      'first_name': 'الاسم الأول',
      'last_name': 'اسم العائلة',
      'email_address': 'البريد الإلكتروني',
      'booking_details': 'تفاصيل الحجز',
      'select_academy': 'اختر الأكاديمية',
      'category': 'الفئة',
      'date': 'التاريخ',
      'number_of_participants': 'عدد المشاركين',
      'age_group': 'الفئة العمرية',
      'select_an_age_group': 'اختر فئة عمرية',
      'special_request': 'طلب خاص',
      'additional_request': 'طلب إضافي',
      'select_an_academy': 'اختر أكاديمية',
      'select_a_category': 'اختر فئة',
      'agree_terms': 'أوافق على الشروط والأحكام\n',
      'booking_agreement': 'بحجز جلسة، فإنك توافق على\n',
      'terms_of_service': 'شروط الخدمة',
      'and': ' و ',
      'privacy_policy': 'سياسة الخصوصية',
      'cancel': 'إلغاء',
      'submit_booking': 'إرسال الحجز',
      'academy_overview': 'نظرة عامة على الأكاديمية',

      'downtown': 'وسط المدينة',
      'reviews_count': '(2 مراجعات)',
      'description': 'الوصف',
      'age_groups': 'الفئات العمرية',
      'children_6_12': 'الأطفال (6-12 سنة)',
      'teenagers_13_18': 'المراهقون (13-18 سنة)',
      'facilities': 'المرافق',
      'opening_hours': 'ساعات العمل',
      'opening_hours_detail':
          'من الاثنين إلى الجمعة: 7:00 صباحًا - 9:00 مساءً، السبت - الأحد: 8:00 صباحًا - 7:00 مساءً',
      'reviews': 'التقييمات',
      'olympic_pool': 'مسبح أولمبي',
      'changing_rooms': 'غرف تغيير الملابس',
      'shower_facilities': 'مرافق الاستحمام',
      'spectator_area': 'منطقة المشاهدين',

      'phone': 'هاتف',
      'website': 'الموقع الإلكتروني',
      'date_month_year': 'اليوم/الشهر/السنة',
      'time': 'الوقت',
      'number_of_person': 'عدد الأشخاص',
      'contact_information': 'معلومات الاتصال',
      'home_title': "اعثر على أكاديمية رياضية أو حضانة مثالية",
      'home_sub_title':
          "اكتشف أفضل الأكاديميات الرياضية والحضانات في منطقتك. قم بحجز الجلسات بسهولة وتتبع تقدمك.",
      'home_bottom_title': "هل أنت مستعد للبدء؟",
      'home_bottom_sub_title':
          "انضم إلى آلاف الآباء الذين وجدوا الأكاديمية المثالية لأطفالهم.",

      'academies_1_title': "أكاديمية السباحة النخبة",
      'academies_2_title': "مركز القوة للياقة البدنية",
      'academies_3_title': "نادي إيس للتنس",
      'academies_4_title': "مركز هووبس لكرة السلة",
      'academies_5_title': "نادي إيس للتنس",
      'academies_6_title': "روضة البدايات المشرقة",

      'academies_1_details':
          "تقدم أكاديمية السباحة النخبة دروس سباحة محترفة للأطفال والمراهقين. مسبحنا الأولمبي والمدربون المعتمدون يضمنون تدريبًا عالي الجودة.",
      'academies_2_details':
          "مركز القوة مجهز بأجهزة حديثة ومدربين شخصيين معتمدين.",
      'academies_3_details':
          "انضم إلى نادي إيس للتنس للاستمتاع بالتدريب الممتاز والمرافق لجميع المستويات.",
      'academies_4_details':
          "يقدم مركز هووبس برامج تدريب لجميع الفئات العمرية. يشمل منشآتنا العديد من الملاعب والمعدات المتخصصة.",
      'academies_5_details':
          "يوفر نادي إيس للتنس تدريب تنس عالمي المستوى لجميع الأعمار والمستويات. تشمل مرافقنا ملاعب داخلية وخارجية.",
      'academies_6_details':
          "تركز روضة البدايات المشرقة على تنمية الطفولة المبكرة في بيئة ممتعة وجذابة. نقدم مزيجًا متوازنًا من اللعب والأنشطة المنظمة.",
      'apply_filters': 'تطبيق الفلاتر',

      'all_location': 'كل المواقع',

      'rating': 'التقييم',
      'price': 'السعر',
      'reset': 'إعادة تعيين',
      'how_it_works': 'كيف يعمل',

      'points_earn_history': 'تاريخ كسب النقاط',
      'booking': 'حجز',
      'earned_points_on': 'تم الحصول على 10 نقاط في أبريل',
      'available_rewards': 'المكافآت المتاحة',
      'off_next_booking': 'خصم 10% على الحجز التالي',
      'get_discount_text': 'احصل على خصم 10٪ على الحجز التالي في أي أكاديمية.',
      'redeem': 'استرداد',
      'gold_member': 'عضو ذهبي',
      'points': 'نقاط',

      'earn_points_info': 'اكسب 10 نقاط عن كل حجز تقوم به عبر منصتنا.',
      'faq_q1': 'كيف يمكنني حجز جلسة؟',
      'faq_a1': 'قم بزيارة صفحة الحجز، املأ النموذج، وانقر على "إرسال الحجز".',

      'faq_q2': 'هل يمكنني إلغاء أو إعادة جدولة جلسة؟',
      'faq_a2':
          'نعم، يمكنك الإلغاء أو إعادة الجدولة قبل 24 ساعة على الأقل من الجلسة.',

      'faq_q3': 'ما هي طرق الدفع المقبولة؟',
      'faq_a3':
          'نقبل بطاقات الائتمان، وبطاقات الخصم، والتحويلات الآمنة عبر الإنترنت.',

      'faq_q4': 'هل هناك سياسة استرداد؟',
      'faq_a4': 'يتم تقديم استرداد للطلبات الملغاة قبل 24 ساعة على الأقل.',

      'faq_q5': 'كيف أتواصل مع الدعم؟',
      'faq_a5':
          'يمكنك التواصل مع الدعم عبر صفحة الاتصال أو البريد الإلكتروني support@example.com.',

      'faq_q6': 'هل هناك خصومات للحجوزات الجماعية؟',
      'faq_a6': 'نعم، نقدم خصومات للحجوزات التي تشمل 3 مشاركين أو أكثر.',

      'faq_q7': 'هل يمكنني حضور الجلسات بدون تسجيل؟',
      'faq_a7': 'التسجيل مطلوب لجميع الجلسات لضمان توفر الأماكن.',

      'faq_q8': 'هل توفرون المعدات؟',
      'faq_a8':
          'نوفر المعدات الأساسية لمعظم الجلسات، لكن يرجى التحقق عند الحجز.',

      'faq_q9': 'هل الجلسات مناسبة للمبتدئين؟',
      'faq_a9': 'نعم، نقدم جلسات مناسبة للمبتدئين في جميع الفئات.',

      'faq_q10': 'ماذا يحدث إذا ألغت الأكاديمية الجلسة؟',
      'faq_a10': 'ستتم إعلامك فوراً وعرض إعادة جدولة أو استرداد كامل.',
    },
  };
}
