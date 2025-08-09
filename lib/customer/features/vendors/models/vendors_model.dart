import 'package:book_app/app/assets_path.dart';

class StaffModel {
  final String staffName;
  final String staffEmail;
  final String? staffImage;
  final String? staffRating;
  final String? staffPhone;

  StaffModel({
    required this.staffName,
    required this.staffEmail,
    this.staffImage,
    this.staffRating,
    this.staffPhone,
  });
}

class ServiceCardModel {
  final String images;
  final String title;
  final String category;
  final String address;
  final String price;
  final String? qty;
  final String discountedPrice;
  final String description;
  final String rating;
  final String reviews;
  final List<String>? sliderImages;
  final List<StaffModel>? staffs;

  ServiceCardModel({
    this.qty,
    required this.description,
    required this.staffs,
    required this.rating,
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

class VendorModel {
  final String vendorName;
  final String vendorImage;
  final String vendorAddress;
  final List<ServiceCardModel> services;

  VendorModel({
    required this.vendorName,
    required this.vendorImage,
    required this.vendorAddress,
    required this.services,
  });
}

List<VendorModel> dummyVendors = [
  VendorModel(
    vendorName: 'USA Plumbing Experts',
    vendorImage: AssetsPath.staffPng1,
    vendorAddress: 'City Tower, Road 1285, USA',
    services: [
      ServiceCardModel(
        staffs: [
          StaffModel(
            staffName: 'James Moore',
            staffEmail: 'james@example.com',
            staffImage: AssetsPath.staffPng3,
            staffRating: '4.5',
          ),
          StaffModel(
            staffName: 'Sophia Wilson',
            staffEmail: 'sophia@example.com',
            staffImage: AssetsPath.staffPng1,
            staffRating: '4.2',
          ),
        ],
        sliderImages: [
          'assets/images/plumber.png',
          'assets/images/cleanings.png',
        ],
        images: AssetsPath.servicePng3,
        title: 'Emergency Plumbing',
        category: 'Plumbing',
        address: 'NYC, USA',
        price: '\$300',
        discountedPrice: '\$220',
        rating: '4.6',
        qty: '12',
        reviews: '85',
        description:
            'Certified plumbers for urgent leaks and blockages. Available 24/7.',
      ),
    ],
  ),
  VendorModel(
    vendorName: 'Digital Doctor Group',
    vendorImage: AssetsPath.staffPng2,
    vendorAddress: 'New Jersey, USA',
    services: [
      ServiceCardModel(
        staffs: [
          StaffModel(
            staffName: 'William Brown',
            staffEmail: 'william@example.com',
            staffImage: AssetsPath.staffPng2,
          ),
        ],
        sliderImages: [
          'assets/images/doctors.png',
          'assets/images/computers.png',
        ],
        images: AssetsPath.servicePng4,
        title: 'Online Doctor Consultation',
        category: 'Doctor',
        address: 'Online / USA',
        price: '\$120',
        discountedPrice: '\$99',
        rating: '4.9',
        qty: '120',
        reviews: '243',
        description:
            'Virtual health services by licensed practitioners. 24/7 support.',
      ),
    ],
  ),
  VendorModel(
    vendorName: 'Elite Cleaners',
    vendorImage: AssetsPath.staffPng3,
    vendorAddress: 'Houston, USA',
    services: [
      ServiceCardModel(
        staffs: [
          StaffModel(
            staffName: 'Emma Lee',
            staffEmail: 'emma@example.com',
            staffImage: AssetsPath.staffPng5,
          ),
        ],
        sliderImages: ['assets/images/cleanings.png'],
        images: AssetsPath.servicePng3,
        title: 'Home Deep Cleaning',
        category: 'Cleaning',
        address: 'Houston',
        price: '\$199',
        discountedPrice: '\$149',
        rating: '4.8',
        qty: '34',
        reviews: '120',
        description:
            'Eco-friendly deep cleaning. Includes kitchen, bathroom, and floor cleaning.',
      ),
    ],
  ),
  VendorModel(
    vendorName: 'Auto Shine Car Wash',
    vendorImage: AssetsPath.staffPng4,
    vendorAddress: 'San Diego, USA',
    services: [
      ServiceCardModel(
        staffs: [
          StaffModel(
            staffName: 'Noah Davis',
            staffEmail: 'noah@example.com',
            staffImage: AssetsPath.staffPng6,
          ),
        ],
        sliderImages: ['assets/images/plumber.png'],
        images: AssetsPath.servicePng4,
        title: 'Car Wash Premium',
        category: 'Car Wash',
        address: 'San Diego',
        price: '\$50',
        discountedPrice: '\$40',
        rating: '4.2',
        qty: '58',
        reviews: '98',
        description: 'Interior & exterior wash with polish and tire cleaning.',
      ),
    ],
  ),
  VendorModel(
    vendorName: 'TechFix IT Services',
    vendorImage: AssetsPath.staffPng5,
    vendorAddress: 'Austin, Texas',
    services: [
      ServiceCardModel(
        staffs: [
          StaffModel(
            staffName: 'Liam Johnson',
            staffEmail: 'liam@example.com',
            staffImage: AssetsPath.staffPng3,
          ),
        ],
        sliderImages: ['assets/images/computers.png'],
        images: AssetsPath.servicePng3,
        title: 'Computer Repair',
        category: 'IT Support',
        address: 'Austin Downtown',
        price: '\$100',
        discountedPrice: '\$75',
        rating: '4.7',
        qty: '43',
        reviews: '76',
        description: 'Troubleshooting, virus removal, and hardware repair.',
      ),
    ],
  ),
  VendorModel(
    vendorName: 'Beauty Lounge',
    vendorImage: AssetsPath.staffPng6,
    vendorAddress: 'Miami, USA',
    services: [
      ServiceCardModel(
        staffs: [
          StaffModel(
            staffName: 'Olivia Martin',
            staffEmail: 'olivia@example.com',
            staffImage: AssetsPath.staffPng4,
          ),
        ],
        sliderImages: ['assets/images/cleanings.png'],
        images: AssetsPath.servicePng4,
        title: 'Facial & Skincare',
        category: 'Beauty',
        address: 'Miami Main Street',
        price: '\$180',
        discountedPrice: '\$120',
        rating: '4.9',
        qty: '50',
        reviews: '160',
        description: 'Professional facial services with organic products.',
      ),
    ],
  ),
  VendorModel(
    vendorName: 'ApplianceFix Co.',
    vendorImage: AssetsPath.staffPng1,
    vendorAddress: 'Boston, USA',
    services: [
      ServiceCardModel(
        staffs: [
          StaffModel(
            staffName: 'Mason Reed',
            staffEmail: 'mason@example.com',
            staffImage: AssetsPath.staffPng2,
          ),
        ],
        sliderImages: ['assets/images/computers.png'],
        images: AssetsPath.servicePng3,
        title: 'AC Repair & Maintenance',
        category: 'Appliance Repair',
        address: 'Boston Heights',
        price: '\$250',
        discountedPrice: '\$199',
        rating: '4.5',
        qty: '39',
        reviews: '92',
        description:
            'Complete AC servicing and gas refill. On-demand home visits.',
      ),
    ],
  ),
  VendorModel(
    vendorName: 'Smart Tutors',
    vendorImage: AssetsPath.staffPng2,
    vendorAddress: 'Los Angeles, USA',
    services: [
      ServiceCardModel(
        staffs: [
          StaffModel(
            staffName: 'Ava James',
            staffEmail: 'ava@example.com',
            staffImage: AssetsPath.staffPng4,
          ),
        ],
        sliderImages: ['assets/images/doctors.png'],
        images: AssetsPath.servicePng4,
        title: 'Math Tutoring (Grade 6-12)',
        category: 'Education',
        address: 'Remote/Online',
        price: '\$90',
        discountedPrice: '\$60',
        rating: '4.8',
        qty: '75',
        reviews: '132',
        description:
            'One-on-one virtual sessions for middle & high school students.',
      ),
    ],
  ),
  VendorModel(
    vendorName: 'GreenGardens',
    vendorImage: AssetsPath.staffPng3,
    vendorAddress: 'Seattle, USA',
    services: [
      ServiceCardModel(
        staffs: [
          StaffModel(
            staffName: 'Chloe Morgan',
            staffEmail: 'chloe@example.com',
            staffImage: AssetsPath.staffPng6,
          ),
        ],
        sliderImages: ['assets/images/cleanings.png'],
        images: AssetsPath.servicePng3,
        title: 'Lawn Mowing & Trimming',
        category: 'Gardening',
        address: 'Seattle Suburbs',
        price: '\$75',
        discountedPrice: '\$55',
        rating: '4.3',
        qty: '31',
        reviews: '65',
        description: 'Seasonal and weekly lawn care with edge trimming.',
      ),
    ],
  ),
  VendorModel(
    vendorName: 'MoveIt Movers',
    vendorImage: AssetsPath.staffPng5,
    vendorAddress: 'Chicago, USA',
    services: [
      ServiceCardModel(
        staffs: [
          StaffModel(
            staffName: 'Nathan Perez',
            staffEmail: 'nathan@example.com',
            staffImage: AssetsPath.staffPng1,
          ),
        ],
        sliderImages: ['assets/images/plumber.png'],
        images: AssetsPath.servicePng4,
        title: 'Furniture Moving',
        category: 'Logistics',
        address: 'Chicago City Center',
        price: '\$350',
        discountedPrice: '\$299',
        rating: '4.6',
        qty: '21',
        reviews: '48',
        description: 'Safe and professional house shifting and item transport.',
      ),
    ],
  ),
];
