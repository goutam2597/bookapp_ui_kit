import 'package:book_app/customer/features/home/data/models/staff_model.dart';
import 'dart:math';

class ServiceCardModel {
  final String images;
  final String title;
  final String category;
  final String address;
  final String price;
  final String? qty;
  final String discountedPrice;
  final String description;
  final String? features;
  final String rating;
  final String reviewsCount;
  final String reviews;
  final List<String>? sliderImages;
  final List<StaffModel>? staffs;

  ServiceCardModel({
    this.qty,
    required this.description,
    this.features,
    required this.staffs,
    required this.rating,
    required this.reviewsCount,
    required this.reviews,
    this.sliderImages,
    required this.images,
    required this.title,
    required this.category,
    required this.address,
    required this.price,
    required this.discountedPrice,
  });
}

// List of staff images to be randomly assigned
List<String> _staffImages = [
  'https://masud.kreativdev.com/bookapp/assets/img/admins/66d2fa86e75bb.png',
  'https://masud.kreativdev.com/bookapp/assets/admin/img/vendor-photo/6880c409001e0.jpg',
  'https://masud.kreativdev.com/bookapp/assets/admin/img/vendor-photo/66d2ff3cd7c9f.png',
  'https://masud.kreativdev.com/bookapp/assets/admin/img/vendor-photo/66d2fe989e77c.png',
  'https://masud.kreativdev.com/bookapp/assets/admin/img/vendor-photo/66d2fed129705.png',
  'https://masud.kreativdev.com/bookapp/assets/admin/img/vendor-photo/66d2fdfed8692.png',
  'https://masud.kreativdev.com/bookapp/assets/admin/img/vendor-photo/66d2fdb2348ef.png',
  'https://masud.kreativdev.com/bookapp/assets/admin/img/vendor-photo/66d2fe6e0ec84.png',
  'https://masud.kreativdev.com/bookapp/assets/admin/img/vendor-photo/66d2f90f36c9d.png',
];

// Function to get a random staff image
String _getRandomStaffImage() {
  final _random = Random();
  return _staffImages[_random.nextInt(_staffImages.length)];
}

List<ServiceCardModel> dummyServiceCardList = [
  ServiceCardModel(
    reviews:
        'Elara V.: Dr. Anderson was incredibly helpful and attentive. The consultation was thorough and I felt very well taken care of. \nJason K.: Dr. Chu provided clear and concise advice for my recurring issue. The virtual format was so convenient. \nMaria P.: Very professional and put my mind at ease immediately. The prescription was sent to my pharmacy right away. \nSam W.: I was worried about my child, but Dr. Paul was amazing with her. Great service and peace of mind.',
    title: '24/7 Online Doctor Consultation',
    category: 'Doctor',
    address: 'Block 20, Healthway Plaza, Chicago, IL 60616',
    images:
        'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c6d08a6e037.jpg',
    price: '\$999',
    discountedPrice: '\$349',
    rating: '4.8',
    qty: '310',
    reviewsCount: '492',
    description:
        'Instant video consultations with certified doctors from various specialties. Available round-the-clock for general, pediatric, and chronic care. Get prescriptions, referrals, and expert advice online. Safe, private, and efficient healthcare at your fingertips. Start your journey to better health today.',
    sliderImages: [
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c6d086e7419.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c6d08c29470.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c6d088d13ef.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c6d08a6e037.jpg',
    ],
    staffs: [
      StaffModel(
        staffName: 'Dr. Lisa Anderson',
        staffEmail: 'lisa@telehealth.com',
        staffPhone: '+981524521155',
        staffRating: '4.6',
        staffImage: _getRandomStaffImage(),
      ),
      StaffModel(
        staffName: 'Dr. Peter Chu',
        staffEmail: 'chu@telemed.org',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffImage: _getRandomStaffImage(),
      ),
      StaffModel(
        staffName: 'Dr. Irene Paul',
        staffEmail: 'irene@healthnow.com',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffImage: _getRandomStaffImage(),
      ),
    ],
    features:
        '✅ Instant Video Consultations \n✅ 24/7 Availability \n✅ Prescriptions and Referrals \n✅ Certified Medical Doctors \n✅ Secure and Private Platform \n✅ General, Pediatric, and Chronic Care',
  ),
  ServiceCardModel(
    title: 'Emergency Electrical Repair',
    category: 'Electrical',
    address: '188 Bolt Lane, Austin, TX 78701',
    images:
        'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c713c653bbe.jpg',
    price: '\$499',
    discountedPrice: '\$199',
    rating: '4.5',
    qty: '150',
    reviewsCount: '205',
    description:
        'Fast response electricians for residential and commercial issues. We fix circuits, fuses, power surges, and emergency breakdowns. Safety guaranteed with certified experts and proper tools. Available 24/7 for urgent repairs. Keep your power running smoothly with reliable service.',
    sliderImages: [
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c713bd83d9e.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c713bee8506.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c713c352045.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c713c653bbe.jpg',
    ],
    staffs: [
      StaffModel(
        staffName: 'Ricky Baldwin',
        staffEmail: 'ricky@voltfix.com',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffImage: _getRandomStaffImage(),
      ),
      StaffModel(
        staffName: 'Elaine Marsh',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffEmail: 'elaine@quickpower.net',
        staffImage: _getRandomStaffImage(),
      ),
    ],
    reviews:
        'David P.: Ricky came out in the middle of the night and fixed our power surge issue. Super fast and professional! \nEmily J.: Elaine was knowledgeable and quickly diagnosed the problem with our circuit breaker. Highly recommend this service. \nMichael B.: Great service! The team was on time and got the job done efficiently. No more flickering lights. \nSophia R.: They were able to come out on short notice and prevent a major electrical issue. A trustworthy and reliable team.',
    features:
        '✅ 24/7 Emergency Response \n✅ Fuse and Breaker Repair \n✅ Wiring and Outlet Inspection \n✅ Surge Protection Installation \n✅ Electrical Safety Check',
  ),
  ServiceCardModel(
    title: 'Men’s Haircut & Beard Grooming',
    category: 'Barber Shop',
    address: 'Ground Floor, BarberBlock, Brooklyn, NY 11201',
    images:
        'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c58b3396456.jpg',
    price: '\$80',
    discountedPrice: '\$49',
    rating: '4.9',
    qty: '213',
    reviewsCount: '442',
    description:
        'Enjoy premium grooming from professional barbers. Get trendy cuts, beard styling, hot towel shaves, and scalp massages. We use quality products and sanitized tools. Perfect for everyday styling or special occasions. Home service available for ultimate convenience.',
    sliderImages: [
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c58b3396456.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c58b356870c.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c58b3768667.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c58b39bf192.jpg',
    ],
    staffs: [
      StaffModel(
        staffName: 'Jonah Riley',
        staffEmail: 'jonah@barbershop.com',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffImage: _getRandomStaffImage(),
      ),
      StaffModel(
        staffName: 'Luis Martin',
        staffEmail: 'luis@sharpstyle.net',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffImage: _getRandomStaffImage(),
      ),
      StaffModel(
        staffName: 'Tyson Greene',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffEmail: 'tyson@cutandstyle.com',
        staffImage: _getRandomStaffImage(),
      ),
    ],
    reviews:
        'Alex S.: Jonah gave me the best haircut I\'ve had in years. He really took the time to listen to what I wanted. \nBen M.: The hot towel shave was an incredible experience. Luis is a master of his craft. \nChris D.: Fast, friendly, and a fantastic fade. I\'ll definitely be a regular here from now on. \nDaniel P.: Great value for the price and the atmosphere is really cool. My beard has never looked better.',
    features:
        '✅ Classic and Modern Haircuts \n✅ Professional Beard Trimming \n✅ Hot Towel Shave Service \n✅ Scalp Massage and Treatment \n✅ Premium Grooming Products',
  ),
  ServiceCardModel(
    title: 'Deep Sofa Cleaning',
    category: 'Cleaning',
    address: '88 Camden Street, San Diego, CA 92103',
    images:
        'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c71746534ef.jpg',
    price: '\$300',
    discountedPrice: '\$129',
    rating: '4.7',
    qty: '329',
    reviewsCount: '489',
    description:
        'Revive your sofa with deep cleaning and stain removal service. We use eco-friendly solutions to clean fabric, leather, and suede. Remove odors, allergens, and pet stains. Quick-drying methods included. Your furniture will look and feel brand new again.',
    sliderImages: [
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c71746534ef.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c717484eba2.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c7174a490bc.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c7174c1cb42.jpg',
    ],
    staffs: [
      StaffModel(
        staffName: 'Daphne Roy',
        staffEmail: 'daphne@cleantech.com',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffImage: _getRandomStaffImage(),
      ),
      StaffModel(
        staffName: 'Shawn Carter',
        staffEmail: 'shawn@freshify.net',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffImage: _getRandomStaffImage(),
      ),
    ],
    reviews:
        'Sarah W.: My old sofa looks brand new! Daphne was amazing and worked tirelessly to remove some stubborn stains. The eco-friendly solution smells great too. \nMark R.: Shawn was very professional and efficient. He managed to get rid of the pet odors completely. I\'m so impressed with the results. \nLinda C.: The team arrived on time and did an incredible job. My sofa is a high-traffic area, and it looks spotless now. \nTom B.: Quick, reliable service. My couch feels and smells so much fresher. Worth every penny!',
    features:
        '✅ Professional Steam Cleaning \n✅ Eco-Friendly Cleaning Solutions \n✅ Stain and Odor Removal \n✅ Quick-Drying Technology \n✅ Leather and Fabric-Specific Care',
  ),
  ServiceCardModel(
    title: 'Drainage and Pipe Repair',
    category: 'Plumber',
    address: '21 Pipeway Ave, Denver, CO 80014',
    images:
        'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c5835f8968f.jpg',
    price: '\$650',
    discountedPrice: '\$230',
    rating: '4.6',
    qty: '270',
    reviewsCount: '388',
    description:
        'Eliminate leaks and drainage problems with expert plumbing. We fix kitchen, bathroom, and outdoor lines. Available for emergency or scheduled service. Transparent pricing and long-lasting results. Certified technicians ready to assist you.',
    sliderImages: [
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c5835f8968f.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c58358a05c3.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c5835aee10a.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c5835d21272.jpg',
    ],
    staffs: [
      StaffModel(
        staffName: 'Mike Thomas',
        staffEmail: 'mike@proplumb.com',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffImage: _getRandomStaffImage(),
      ),
      StaffModel(
        staffName: 'Ashley Weber',
        staffEmail: 'ashley@fixitplumb.com',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffImage: _getRandomStaffImage(),
      ),
    ],
    reviews:
        'John D.: Mike fixed a persistent leak under my sink quickly and without any mess. Very professional. \nLaura H.: Ashley was fantastic. She arrived on time, quickly diagnosed the drainage issue, and fixed it without any fuss. Very professional and tidy work. \nSteven G.: I had a blocked drain that other plumbers couldn\'t solve, but they had it cleared in no time. Great service. \nMaria P.: The team was prompt and the pricing was very transparent. No hidden fees, just great work.',
    features:
        '✅ Drain and Pipe Unclogging \n✅ Leak Detection and Repair \n✅ Water Heater Maintenance \n✅ Garbage Disposal Services \n✅ Fixture Installation',
  ),
  ServiceCardModel(
    title: 'Home Tutor for School Students',
    category: 'Education',
    address: 'Residential Zone 9, Durham, NC 27707',
    images:
        'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c6d516c7b72.jpg',
    price: '\$100',
    discountedPrice: '\$40',
    rating: '4.8',
    qty: '156',
    reviewsCount: '199',
    description:
        'Experienced tutors for math, science, and English. Flexible sessions for primary and secondary students. Personalized attention with progress tracking. Online and home visits available. Make learning fun and effective for your child.',
    sliderImages: [
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c6d518d4542.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c6d516c7b72.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c6d51f97a6c.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c6d5239a66c.jpg',
    ],
    staffs: [
      StaffModel(
        staffName: 'Emma Larson',
        staffEmail: 'emma@hometutor.com',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffImage: _getRandomStaffImage(),
      ),
      StaffModel(
        staffName: 'Robert Hill',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffEmail: 'robert@eduguide.net',
        staffImage: _getRandomStaffImage(),
      ),
    ],
    reviews:
        'Susan L.: Emma helped my son with his algebra and his grades have improved dramatically. She is patient and makes complex topics easy to understand. \nDavid M.: Robert is a great tutor for science subjects. My daughter is now excited about her biology class. \nGrace W.: The online sessions are very interactive and engaging. My child is getting the personalized attention they need. \nTom B.: Excellent service. The tutor was able to identify my child’s weak points and create a solid study plan.',
    features:
        '✅ Personalized Learning Plans \n✅ Certified and Experienced Tutors \n✅ Online and In-person Sessions \n✅ Progress Tracking and Reports \n✅ Flexible Scheduling',
  ),
  ServiceCardModel(
    title: 'Computer Assembly & Setup',
    category: 'Computer',
    address: '604 Tech Hub, Silicon Street, San Jose, CA',
    images:
        'https://t3.ftcdn.net/jpg/01/78/10/58/360_F_178105808_YIWQ7QDcQUgmJjbO0azDPWMY5zrQZM2x.jpg',
    price: '\$300',
    discountedPrice: '\$120',
    rating: '4.4',
    qty: '198',
    reviewsCount: '332',
    description:
        'Assemble desktops, install OS, and configure networks at home or office. Ideal for gamers, professionals, and IT teams. Quick setup with driver updates and performance tuning. On-site and remote options available. Get your system running smoothly in no time.',
    sliderImages: [
      'https://t3.ftcdn.net/jpg/02/17/86/24/360_F_217862401_PbwxeyarUw8ktkmgPJnXTyitsGUvKEta.jpg',
      'https://t4.ftcdn.net/jpg/04/10/31/07/360_F_410310701_irVZAyvCWWYCiYDdvrF0wLEhjOCsXCb5.jpg',
      'https://t3.ftcdn.net/jpg/01/78/10/58/360_F_178105808_YIWQ7QDcQUgmJjbO0azDPWMY5zrQZM2x.jpg',
      'https://t4.ftcdn.net/jpg/00/62/71/69/360_F_62716906_nhEW88kBkZeQ9fgi6VGx52PSCiqrGXwt.jpg',
    ],
    staffs: [
      StaffModel(
        staffName: 'Arjun Seth',
        staffEmail: 'arjun@techfitters.com',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffImage: _getRandomStaffImage(),
      ),
      StaffModel(
        staffName: 'Chloe Lim',
        staffEmail: 'chloe@computerguru.com',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffImage: _getRandomStaffImage(),
      ),
    ],
    reviews:
        'Mike D.: Arjun built my custom gaming PC and it is a beast! He was very knowledgeable and the setup was perfect. Highly recommend his services. \nSarah L.: Chloe helped me set up my new office computers. She was very patient and made sure everything was working perfectly before she left. \nJason K.: Great and fast service! My new desktop was up and running in a few hours. The team is very professional. \nLaura M.: They did an excellent job with the OS installation and data transfer. All my files were safely moved without any hassle.',
    features:
        '✅ Desktop and Laptop Assembly \n✅ Operating System Installation \n✅ Data Transfer and Backup \n✅ Driver and Software Updates \n✅ Network and Peripheral Configuration',
  ),
  ServiceCardModel(
    title: 'Virtual Doctor for Kids',
    category: 'Doctor',
    address: '4th Floor, Mediplus Tower, Orlando, FL 32801',
    images:
        'https://www.muhealth.org/sites/default/files/2022-05/Child%20with%20doctor-1040x615.jpg',
    price: '\$750',
    discountedPrice: '\$300',
    rating: '4.9',
    qty: '215',
    reviewsCount: '391',
    description:
        'Consult licensed pediatricians online for all your child’s health needs. From fevers to allergies and regular checkups. Get instant care, prescriptions, and advice without visiting a clinic. Easy scheduling and affordable pricing. Your child’s health made simple and accessible.',
    sliderImages: [
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c58f4187538.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c58f466d78d.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c6c87034453.jpg',
      'https://www.muhealth.org/sites/default/files/2022-05/Child%20with%20doctor-1040x615.jpg',
    ],
    staffs: [
      StaffModel(
        staffName: 'Dr. Sonia Malik',
        staffEmail: 'sonia@kiddoc.org',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffImage: _getRandomStaffImage(),
      ),
      StaffModel(
        staffName: 'Dr. Jeff Conrad',
        staffEmail: 'jeff@smartpeds.com',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffImage: _getRandomStaffImage(),
      ),
    ],
    reviews:
        'Emily S.: Dr. Sonia was fantastic with my son. She was very patient and made him feel comfortable during the video call. Her diagnosis was spot on. A great service for busy parents! \nMark R.: Dr. Conrad was very reassuring and gave me excellent advice for my daughter\'s fever. The care was just as good as an in-person visit. \nJessica C.: So convenient and easy to use. The doctors are wonderful and genuinely care about the kids\' health. \nBryan D.: We use this service for all our children\'s minor health concerns. It saves so much time and the quality of care is top-notch.',
    features:
        '✅ Licensed Pediatricians \n✅ 24/7 Virtual Consultations \n✅ Prescription Refills \n✅ Allergy and Fever Management \n✅ Child Wellness Checks',
  ),
  ServiceCardModel(
    title: 'Home Electrical Inspection',
    category: 'Electrical',
    address: '772 Fuse Ave, Fresno, CA 93722',
    images:
        'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c6fc8a56a66.jpg',
    price: '\$450',
    discountedPrice: '\$180',
    rating: '4.3',
    qty: '186',
    reviewsCount: '247',
    description:
        'Get your home inspected by licensed electricians. We evaluate safety, wiring, breakers, and energy efficiency. Ideal before renovations or buying new property. Receive a full report with recommendations. Keep your electrical systems safe and compliant.',
    sliderImages: [
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c6fc8a56a66.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c6fc8a5e0a9.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c6fc8f22bcf.jpg',
    ],
    staffs: [
      StaffModel(
        staffName: 'Brad Lewis',
        staffEmail: 'brad@fusecheck.com',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffImage: _getRandomStaffImage(),
      ),
      StaffModel(
        staffName: 'Rachel Greene',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffEmail: 'rachel@homesafe.io',
        staffImage: _getRandomStaffImage(),
      ),
    ],
    reviews:
        'Tom B.: Rachel did a full inspection of my new home. She was very thorough and explained everything clearly. Her report gave me peace of mind about my home’s electrical system. \nSara K.: Brad was very knowledgeable and professional. He found a potential issue that could have been a serious problem. \nDan L.: The inspection was quick and the report was easy to understand. They provided great recommendations. \nAnna M.: Excellent service for a home purchase. They checked everything from wiring to the breaker box.',
    features:
        '✅ Full Home Electrical Audit \n✅ Fuse and Breaker Panel Check \n✅ Energy Efficiency Assessment \n✅ Wiring and Grounding Inspection \n✅ Safety and Code Compliance Report',
  ),
  ServiceCardModel(
    title: 'Home Barber Service – Men & Kids',
    category: 'Barber Shop',
    address: 'Suite 205, RazorSharp, Los Angeles, CA 90012',
    images:
        'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c6e52fe553d.jpg',
    price: '\$90',
    discountedPrice: '\$55',
    rating: '4.6',
    qty: '322',
    reviewsCount: '521',
    description:
        'Haircut and grooming in the comfort of your home. Great for busy dads and school-going kids. Our barbers follow hygiene protocols and bring all tools. Choose your preferred style and relax. No queues, just great service at your doorstep.',
    sliderImages: [
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c6e52fe553d.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c6e5320e91a.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c6e534438ab.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c6e53b8f5e8.jpg',
    ],
    staffs: [
      StaffModel(
        staffName: 'Chris Stone',
        staffEmail: 'chris@homebarber.com',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffImage: _getRandomStaffImage(),
      ),
      StaffModel(
        staffName: 'Adam Scott',
        staffEmail: 'adam@cutmate.net',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffImage: _getRandomStaffImage(),
      ),
    ],
    reviews:
        'Chris S.: Adam came to my house and gave my son the best haircut he\'s ever had. It was so convenient and Adam was great with kids. Will definitely book again! \nBen T.: My son gets nervous at barbershops, but Chris made him feel so comfortable. He got a great haircut right at home. \nMark J.: This is perfect for my busy schedule. No more waiting in lines, just a professional cut at my doorstep. \nAlex R.: Adam is a fantastic barber. The haircut was perfect, and the whole process was quick and easy.',
    features:
        '✅ On-Demand Home Service \n✅ Men\'s and Kids\' Haircuts \n✅ Beard and Mustache Styling \n✅ Sanitized Tools and Equipment \n✅ Custom Styles and Consultation',
  ),
  ServiceCardModel(
    title: 'Post-Renovation Cleaning',
    category: 'Cleaning',
    address: '9 Clean Street, New Orleans, LA 70130',
    images:
        'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c714c98122d.jpg',
    price: '\$600',
    discountedPrice: '\$260',
    rating: '4.7',
    qty: '143',
    reviewsCount: '301',
    description:
        'Renovation done? Let us clear the mess! We clean dust, debris, paint marks, and polish all surfaces. Safe for new floors and walls. Quick turnaround with professional-grade machines. Your property will look ready for living in no time.',
    sliderImages: [
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c714c98122d.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c714cb4d9a0.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c714d97c2be.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c714d2c9cb1.jpg',
    ],
    staffs: [
      StaffModel(
        staffName: 'Bethany Rose',
        staffEmail: 'beth@shinebright.com',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffImage: _getRandomStaffImage(),
      ),
      StaffModel(
        staffName: 'Mark Dawson',
        staffEmail: 'mark@neatify.org',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffImage: _getRandomStaffImage(),
      ),
    ],
    reviews:
        'James K.: The team was incredibly efficient and thorough. They cleared all the dust and debris left from our kitchen remodel. The house is spotless and ready for us to move in. \nBethany R.: Bethany and her team did an amazing job after our bathroom renovation. They were meticulous and left no stone unturned. \nSarah T.: The cleaning service was a lifesaver. It saved us so much time and effort. The results are outstanding. \nDavid P.: Mark and his crew were prompt and professional. They had all the right equipment to handle the post-construction mess.',
    features:
        '✅ Deep Dust and Debris Removal \n✅ Paint and Caulk Stain Cleaning \n✅ Floor and Carpet Polishing \n✅ Window and Surface Wiping \n✅ Eco-Friendly Cleaning Supplies',
  ),
  ServiceCardModel(
    title: 'Toilet & Bathroom Repair',
    category: 'Plumber',
    address: '102 Aqua Lane, Tampa, FL 33610',
    images:
        'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c5835aee10a.jpg',
    price: '\$320',
    discountedPrice: '\$135',
    rating: '4.5',
    qty: '189',
    reviewsCount: '299',
    description:
        'Get leaks, flush tanks, and blocked drains fixed fast. Clean and trained plumbers with years of experience. Service available within 2 hours of booking. Budget-friendly rates and guaranteed satisfaction. Keep your bathroom fully functional.',
    sliderImages: [
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c5835aee10a.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c5835d21272.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c5835f8968f.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c58358a05c3.jpg',
    ],
    staffs: [
      StaffModel(
        staffName: 'Raymond Cruz',
        staffEmail: 'ray@plumbitfast.com',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffImage: _getRandomStaffImage(),
      ),
      StaffModel(
        staffName: 'Jessica Ford',
        staffEmail: 'jess@waterfixpro.com',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffImage: _getRandomStaffImage(),
      ),
    ],
    reviews:
        'Michael L.: Jessica fixed our running toilet quickly and charged a fair price. She was very professional and left the bathroom clean. \nRaymond C.: Raymond was at my door in less than an hour for an emergency leak. He was polite and got the job done perfectly. \nLaura W.: I had a blocked drain that was a nightmare. They came and cleared it in minutes. So happy with the service. \nDaniel P.: The pricing was upfront and the quality of work was excellent. I won\'t use any other plumber now.',
    features:
        '✅ Leak and Drip Repair \n✅ Clogged Drain Solutions \n✅ Toilet Flusher and Tank Repair \n✅ Faucet and Showerhead Installation \n✅ Emergency Plumbing Service',
  ),
  ServiceCardModel(
    title: 'Exam Prep – 1-on-1 Tutoring',
    category: 'Education',
    address: 'Unit 6, EduWing Complex, Seattle, WA 98101',
    images:
        'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c71d0c0fedd.jpg',
    price: '\$120',
    discountedPrice: '\$60',
    rating: '4.9',
    qty: '280',
    reviewsCount: '445',
    description:
        'Ace your finals with help from expert tutors. We specialize in board exams, SAT, ACT, GRE, and college prep. Tailored lessons, mock tests, and revision strategies. Online and home classes available. Study smart with guided support.',
    sliderImages: [
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c71d0c0fedd.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c71d0a37eae.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c71d086df05.jpg',
      'https://masud.kreativdev.com/bookapp/assets/img/services/service-gallery/66c71d0757d5d.jpg',
    ],
    staffs: [
      StaffModel(
        staffName: 'Nancy Hall',
        staffEmail: 'nancy@examboost.org',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffImage: _getRandomStaffImage(),
      ),
      StaffModel(
        staffName: 'Mohammed Zain',
        staffEmail: 'zain@scholartutor.net',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffImage: _getRandomStaffImage(),
      ),
    ],
    reviews:
        'Sarah D.: Nancy helped me prepare for my SATs and my score went up significantly. The one-on-one sessions were perfect and tailored to my needs. Couldn\'t have done it without her! \nBen P.: Mohammed is an incredible tutor. My daughter\'s grades in history have improved so much. \nGrace L.: The online classes are engaging and the mock exams were a huge help. I felt much more confident for my finals. \nMichael K.: The tutor was able to quickly identify my weak spots and provide targeted lessons. Great value and results.',
    features:
        '✅ Specialized Subject Tutors \n✅ Test-Taking Strategies \n✅ Mock Exams and Practice Tests \n✅ College Application Guidance \n✅ Flexible Study Plans',
  ),
  ServiceCardModel(
    title: 'Laptop Repair & OS Installation',
    category: 'Computer',
    address: '1111 Logic Street, Atlanta, GA 30303',
    images:
        'https://www.shutterstock.com/image-photo/portrait-attractive-technician-feeling-happy-600nw-2004651494.jpg',
    price: '\$250',
    discountedPrice: '\$89',
    rating: '4.6',
    qty: '174',
    reviewsCount: '278',
    description:
        'Facing system crashes or slow performance? We install Windows/Linux, drivers, and recover data. Also repair keyboards, screens, and batteries. Same-day pickup and delivery available. Your device, restored and optimized.',
    sliderImages: [
      'https://www.shutterstock.com/image-photo/portrait-attractive-technician-feeling-happy-600nw-2004651494.jpg',
      'https://st2.depositphotos.com/1384136/8718/i/450/depositphotos_87180288-stock-photo-man-fixing-the-laptop.jpg',
      'https://www.shutterstock.com/image-photo/technical-support-fixing-gadgets-problems-600nw-2248700195.jpg',
      'https://t3.ftcdn.net/jpg/04/10/31/06/360_F_410310617_gscwufTAwR0jc3Wlbg9WyDzeJMhJxOkT.jpg',
    ],
    staffs: [
      StaffModel(
        staffName: 'Kevin Liu',
        staffEmail: 'kevin@geekrepairs.com',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffImage: _getRandomStaffImage(),
      ),
      StaffModel(
        staffName: 'Shreya Menon',
        staffEmail: 'shreya@techmedic.co',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffImage: _getRandomStaffImage(),
      ),
    ],
    reviews:
        'Michael K.: My laptop was running super slow and Shreya got it running like new again. She was quick, efficient, and explained the issue perfectly. Great value for the money! \nJason P.: Kevin fixed my cracked laptop screen in no time. The pickup and delivery service was a game-changer. \nSarah T.: They recovered all my data after a system crash. I was so worried, but they were able to save everything. Highly recommend! \nDaniel B.: The OS installation was seamless and my computer is now faster than ever. Very professional and reliable service.',
    features:
        '✅ Operating System Reinstallation \n✅ Data Recovery and Backup \n✅ Hardware Diagnostics and Repair \n✅ Keyboard and Screen Replacement \n✅ Pickup and Delivery Service',
  ),
  ServiceCardModel(
    title: 'Network Setup & Wi-Fi Solutions',
    category: 'Computer',
    address: 'Suite 3B, ConnectHub, Miami, FL 33101',
    images:
        'https://www.sejutronics.com/wp-content/uploads/2019/12/Wireless-1200-x-600.jpg',
    price: '\$180',
    discountedPrice: '\$70',
    rating: '4.4',
    qty: '205',
    reviewsCount: '341',
    description:
        'Struggling with Wi-Fi dead zones or poor connectivity? We install routers, mesh systems, and boosters. Configure secure wireless networks for homes and offices. Speed tests and parental control setups included. Stay connected, seamlessly.',
    sliderImages: [
      'https://images.squarespace-cdn.com/content/v1/639867138c214b73db1334bd/cbeafa1e-0d7e-404b-af45-cd68c4df9a82/Wi-Fi+Solutions.jpg',
      'https://www.sejutronics.com/wp-content/uploads/2019/12/Wireless-1200-x-600.jpg',
      'https://vaysinfotech.com/wp-content/uploads/2020/10/enterprise.jpg',
      'https://flylighttechnologies.com/wp-content/uploads/2025/05/2148779239-1024x683.jpg',
    ],
    staffs: [
      StaffModel(
        staffName: 'Rajiv Menon',
        staffEmail: 'rajiv@networkplus.org',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffImage: _getRandomStaffImage(),
      ),
      StaffModel(
        staffName: 'Angela Kim',
        staffEmail: 'angela@speedyconnect.com',
        staffRating: '4.6',
        staffPhone: '+981524521155',
        staffImage: _getRandomStaffImage(),
      ),
    ],
    reviews:
        'Lisa T.: The team solved my Wi-Fi dead zones with a new mesh system. My whole house now has fast and stable internet. \nRajiv M.: Rajiv was great. He helped me set up a secure network and explained all the features. Very patient and knowledgeable. \nAngela K.: Angela configured my parental controls and showed me how to manage them. I feel much safer with my kids online. \nBen R.: I had issues with slow internet speeds and they did a thorough check and fixed the problem. My connection is so much better now.',
    features:
        '✅ Router and Mesh System Installation \n✅ Wi-Fi Signal Boosters \n✅ Secure Network Configuration \n✅ Speed Test and Optimization \n✅ Parental Control Setup \n✅ Troubleshooting and Support',
  ),
];
