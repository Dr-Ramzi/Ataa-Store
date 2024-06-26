part of "./data.dart";

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this section }}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// This section is only temporary to display fictitious data during the project
/// development process.
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/// TODO: Delete >>> this file after connect on database

class TestDataX {
  static List<String> countries = ["Saudi Arabia", "The UAE", "Oman"];
  static List<String> cities = ["Riyadh", "Jeddah", "Sharqia"];
  static ContactUsX contactUs = ContactUsX(
      phone: "+966 0500 000 000", email: "info@ataa.com", web: "www.atta.com");
  static List<AdsX> ads = [
    AdsX(
        id: '1',
        goToLink: "/donations",
        imageURL:
            "https://github.com/SakerDakak/Images/blob/main/home-1.png?raw=true"),
    AdsX(
        id: '2',
        goToLink: "/donations",
        imageURL:
            "https://github.com/SakerDakak/Images/blob/main/home-2.png?raw=true"),
    AdsX(
        id: '3',
        goToLink: "/donations",
        imageURL:
            "https://github.com/SakerDakak/Images/blob/main/home-3.png?raw=true"),
  ];
  static List<BankAccountX> banks = [
    BankAccountX(
        id: '1',
        name: "Al Rajhi Bank",
        iban: "SA6280000355608010003110",
        imageURL:
            "https://github.com/SakerDakak/Images/blob/main/bank-1.png?raw=true"),
    BankAccountX(
        id: '2',
        name: "Alinma Bank",
        iban: "SA5005000068202960918000",
        imageURL:
            "https://github.com/SakerDakak/Images/blob/main/bank-2.png?raw=true")
  ];
  static List<OrganizationX> organizations = [
    OrganizationX(
        id: '1',
        name: "Introduction to Islam",
        description:
            "Preaching Islam through electronic dialogue with non-Muslims, introducing them to it, and answering their questions",
        imageURL:
            "https://github.com/SakerDakak/Images/blob/main/org-1.png?raw=true"),
    OrganizationX(
        id: '2',
        name: "New Muslim Academy",
        description:
            "Teaching the new Muslim the basics of religion and the pillars and rituals that are obligatory for every Muslim",
        imageURL:
            "https://github.com/SakerDakak/Images/blob/main/org-2.png?raw=true"),
    OrganizationX(
        id: '3',
        name: "Messengers of Peace Academy",
        description:
            "Qualifying Muslims and training them on modern means of advocacy, how to constructive dialogue with others, and scientific methods of persuasion",
        imageURL:
            "https://github.com/SakerDakak/Images/blob/main/org-3.png?raw=true"),
  ];
  static List<BankCardX> bankCards = [
    BankCardX(
      id: "1",
      name: "Saker",
      cardNum: "3489708765678764",
      expiryDate: "12/26",
      cvv: 343,
      isDefault: true,
    ),
    BankCardX(
      id: "2",
      name: "Saker",
      cardNum: "4589708765670976",
      expiryDate: "09/25",
      cvv: 343,
      isDefault: false,
    ),
    BankCardX(
      id: "3",
      name: "Saker",
      cardNum: "536970876567786",
      expiryDate: "15/27",
      cvv: 343,
      isDefault: false,
    ),
    BankCardX(
      id: "4",
      name: "Saker",
      cardNum: "658970876565625",
      expiryDate: "02/28",
      cvv: 343,
      isDefault: false,
    ),
  ];
  static List<DonationX> donations = [
    DonationX(
        id: "1",
        name: "Teach 30 Muslims the Pillars of Islam",
        totalNumberDonations: 324,
        currentDonations: 5420,
        totalDonations: 36953,
        currentTargets: 33453,
        totalTargets: 5606,
        stockValue: 10,
        description:
        "Do you want an easy job with an extended reward and an uninterrupted reward?!Contribute to the conversion of 1,000 people to Islam so that you will be rewarded for their prayers, fasting, and good deeds, God willing.",
        idea:
        "Supporting the electronic dialogue program to introduce Islam via the Internet, which includes a contribution to the association’s endowment, so that you will receive two wages, the wage of converting 1,000 people to Islam, and the wage and your contribution to the endowment.",
        plan:
        "The first stage: 1,000 Muslims, We attract them > we dialogue with them > we give you good news of their Islam. Thanks to God, more than 148,000 new Muslims from 186 countries around the world have converted to Islam with us.",
        isZakat: false,
        packages: ["Silver", "Golden", "Diamond"],
        shareURL: "https://www.ataa.com/231",
        imageURL: [
          "https://github.com/SakerDakak/Images/blob/main/donate-1.png?raw=true",
          "https://github.com/SakerDakak/Images/blob/main/donate-2.jpeg?raw=true",
          "https://github.com/SakerDakak/Images/blob/main/donate-3.jpeg?raw=true"
        ]),
    DonationX(
        id: "2",
        name: "Prayer science for 120 new Muslims",
        totalNumberDonations: 324,
        currentDonations: 5420,
        totalDonations: 36953,
        currentTargets: 33453,
        totalTargets: 5606,
        description:
        "Do you want an easy job with an extended reward and an uninterrupted reward?!Contribute to the conversion of 1,000 people to Islam so that you will be rewarded for their prayers, fasting, and good deeds, God willing.",
        idea:
        "Supporting the electronic dialogue program to introduce Islam via the Internet, which includes a contribution to the association’s endowment, so that you will receive two wages, the wage of converting 1,000 people to Islam, and the wage and your contribution to the endowment.",
        plan:
        "The first stage: 1,000 Muslims, We attract them > we dialogue with them > we give you good news of their Islam. Thanks to God, more than 148,000 new Muslims from 186 countries around the world have converted to Islam with us.",
        isZakat: false,
        shareURL: "https://www.ataa.com/231",
        imageURL: [
          "https://github.com/SakerDakak/Images/blob/main/donate-2.jpeg?raw=true"
        ]),
    DonationX(
        id: "3",
        name: "Charity on Friday",
        totalNumberDonations: 324,
        currentDonations: 5420,
        totalDonations: 36953,
        currentTargets: 33453,
        totalTargets: 5606,
        stockValue: 10,
        description:
        "Do you want an easy job with an extended reward and an uninterrupted reward?!Contribute to the conversion of 1,000 people to Islam so that you will be rewarded for their prayers, fasting, and good deeds, God willing.",
        idea:
        "Supporting the electronic dialogue program to introduce Islam via the Internet, which includes a contribution to the association’s endowment, so that you will receive two wages, the wage of converting 1,000 people to Islam, and the wage and your contribution to the endowment.",
        plan:
        "The first stage: 1,000 Muslims, We attract them > we dialogue with them > we give you good news of their Islam. Thanks to God, more than 148,000 new Muslims from 186 countries around the world have converted to Islam with us.",
        isZakat: false,
        shareURL: "https://www.ataa.com/231",
        imageURL: [
          "https://github.com/SakerDakak/Images/blob/main/donate-3.jpeg?raw=true"
        ]),
    DonationX(
        id: "4",
        name: "Teach 30 Muslims the Pillars of Islam",
        totalNumberDonations: 324,
        currentDonations: 5420,
        totalDonations: 36953,
        currentTargets: 33453,
        totalTargets: 5606,
        stockValue: 10,
        description:
        "Do you want an easy job with an extended reward and an uninterrupted reward?!Contribute to the conversion of 1,000 people to Islam so that you will be rewarded for their prayers, fasting, and good deeds, God willing.",
        idea:
        "Supporting the electronic dialogue program to introduce Islam via the Internet, which includes a contribution to the association’s endowment, so that you will receive two wages, the wage of converting 1,000 people to Islam, and the wage and your contribution to the endowment.",
        plan:
        "The first stage: 1,000 Muslims, We attract them > we dialogue with them > we give you good news of their Islam. Thanks to God, more than 148,000 new Muslims from 186 countries around the world have converted to Islam with us.",
        isZakat: true,
        shareURL: "https://www.ataa.com/231",
        imageURL: [
          "https://github.com/SakerDakak/Images/blob/main/donate-1.png?raw=true",
          "https://github.com/SakerDakak/Images/blob/main/donate-2.jpeg?raw=true",
          "https://github.com/SakerDakak/Images/blob/main/donate-3.jpeg?raw=true"
        ]),
    DonationX(
        id: "5",
        name: "Prayer science for 120 new Muslims",
        totalNumberDonations: 324,
        currentDonations: 5420,
        totalDonations: 36953,
        currentTargets: 33453,
        totalTargets: 5606,
        stockValue: 10,
        description:
        "Do you want an easy job with an extended reward and an uninterrupted reward?!Contribute to the conversion of 1,000 people to Islam so that you will be rewarded for their prayers, fasting, and good deeds, God willing.",
        idea:
        "Supporting the electronic dialogue program to introduce Islam via the Internet, which includes a contribution to the association’s endowment, so that you will receive two wages, the wage of converting 1,000 people to Islam, and the wage and your contribution to the endowment.",
        plan:
        "The first stage: 1,000 Muslims, We attract them > we dialogue with them > we give you good news of their Islam. Thanks to God, more than 148,000 new Muslims from 186 countries around the world have converted to Islam with us.",
        isZakat: true,
        shareURL: "https://www.ataa.com/231",
        imageURL: [
          "https://github.com/SakerDakak/Images/blob/main/donate-2.jpeg?raw=true"
        ]),
    DonationX(
        id: "6",
        name: "Charity on Friday",
        totalNumberDonations: 324,
        currentDonations: 5420,
        totalDonations: 36953,
        currentTargets: 33453,
        totalTargets: 5606,
        stockValue: 10,
        description:
        "Do you want an easy job with an extended reward and an uninterrupted reward?!Contribute to the conversion of 1,000 people to Islam so that you will be rewarded for their prayers, fasting, and good deeds, God willing.",
        idea:
        "Supporting the electronic dialogue program to introduce Islam via the Internet, which includes a contribution to the association’s endowment, so that you will receive two wages, the wage of converting 1,000 people to Islam, and the wage and your contribution to the endowment.",
        plan:
        "The first stage: 1,000 Muslims, We attract them > we dialogue with them > we give you good news of their Islam. Thanks to God, more than 148,000 new Muslims from 186 countries around the world have converted to Islam with us.",
        isZakat: true,
        shareURL: "https://www.ataa.com/231",
        imageURL: [
          "https://github.com/SakerDakak/Images/blob/main/donate-3.jpeg?raw=true"
        ]),
  ];
  static List<ShareLinkX> shareLinks = [
    ShareLinkX(
      id: "1",
      donationID: "1",
      donationName: "Teach 30 Muslims the Pillars of Islam",
      link: "https://ataa-store-frontend-staging.edialoguecenter.com/",
      numVisits: 302,
      numRegistered: 42,
      numDonors: 17,
      totalDonations: 3205,
    ),
    ShareLinkX(
      id: "2",
      donationID: "2",
      donationName: "Prayer science for 120 new Muslims",
      link: "https://ataa-store-frontend-staging.edialoguecenter.com/",
      numVisits: 98,
      numRegistered: 2,
      numDonors: 1,
      totalDonations: 100,
    ),
    ShareLinkX(
      id: "3",
      donationID: "3",
      donationName: "Charity on Friday",
      link: "https://ataa-store-frontend-staging.edialoguecenter.com/",
      numVisits: 109,
      numRegistered: 24,
      numDonors: 5,
      totalDonations: 410,
    ),
  ];
  static List<DeductionX> deductions = [
    DeductionX(
        id: "1",
        name: "Zakat on the first ten days of Dhul-Hijjah",
        currentDonations: 324,
        deduction: "Daily",
        totalNumberSubscriptions: 273,
        fixedDeductionAmount: 50,
        description:
            "Donate daily automatically by participating in the charity of the blessed ten days of Dhul-Hijjah.",
        shareURL: "https://www.ataa.com/231",
        imageURL: [
          "https://github.com/SakerDakak/Images/blob/main/deduction-1.jpeg?raw=true",
          "https://github.com/SakerDakak/Images/blob/main/deduction-2.jpeg?raw=true",
          "https://github.com/SakerDakak/Images/blob/main/deduction-3.jpeg?raw=true"
        ]),
    DeductionX(
        id: "2",
        name: "Monthly sponsorship for preacher Youssef",
        currentDonations: 324,
        deduction: "Monthly",
        totalNumberSubscriptions: 273,
        description:
            "Contribute to sponsoring a preacher on a monthly basis and receive his reward, God willing.",
        shareURL: "https://www.ataa.com/231",
        imageURL: [
          "https://github.com/SakerDakak/Images/blob/main/deduction-2.jpeg?raw=true"
        ]),
    DeductionX(
        id: "3",
        name: "Weekly Friday charity",
        currentDonations: 324,
        deduction: "Weekly",
        totalNumberSubscriptions: 273,
        description:
            "Donate weekly automatically by subscribing to the weekly Friday charity.",
        shareURL: "https://www.ataa.com/231",
        imageURL: [
          "https://github.com/SakerDakak/Images/blob/main/deduction-3.jpeg?raw=true"
        ]),
  ];
  static List<DeductionRecordX> deductionRecords = [
    DeductionRecordX(
      id: "1",
      deductionID: "1",
      name: "Zakat on the first ten days of Dhul-Hijjah",
      deduction: "Daily",
      deductionAmount: 35,
      bankCardNumber: "32378978",
    ),
    DeductionRecordX(
      id: "2",
      deductionID: "2",
      name: "Monthly sponsorship for preacher Youssef",
      deduction: "Monthly",
      deductionAmount: 1200,
      bankCardNumber: "78083907",
    ),
    DeductionRecordX(
      id: "3",
      deductionID: "3",
      name: "Weekly Friday charity",
      deduction: "Weekly",
      deductionAmount: 10,
      bankCardNumber: "32378978",
    ),
  ];
  static List<DonationRecordX> donationsRecords = [
    DonationRecordX(
      id: '1',
      donationID: "1",
      numStock: 2,
      package: "Silver",
      state: 'Active',
      paymentMethod: 'Mada',
      donationDate: '2024/05/22',
      donationReceiptUrl:
          'https://imgv2-1-f.scribdassets.com/img/document/513990043/original/ab5f03dc75/1710453753?v=1',
      projectReportUrl: 'https://www.ataa.com/231',
    ),
    DonationRecordX(
      id: '2',
      donationID: "2",
      donationAmount: 100,
      state: 'Complete',
      paymentMethod: 'Apple Pay',
      donationDate: '2024/04/13',
      donationReceiptUrl:
          'https://imgv2-1-f.scribdassets.com/img/document/513990043/original/ab5f03dc75/1710453753?v=1',
      projectReportUrl: 'https://www.ataa.com/231',
    ),
    DonationRecordX(
      id: '3',
      donationID: "3",
      numStock: 3,
      state: 'Complete',
      paymentMethod: 'Google Pay',
      donationDate: '2024/03/21',
      donationReceiptUrl:
          'https://imgv2-1-f.scribdassets.com/img/document/513990043/original/ab5f03dc75/1710453753?v=1',
      projectReportUrl: 'https://www.ataa.com/231',
    ),
  ];
  static List<OrderX> orders = [
    OrderX(
      id: "1",
      numOrder: 57812,
      state: "Under shipment",
      paymentMethod: "Mada",
      orderInvoiceUrl: "https://www.ataa.com/231",
      aramexInvoiceUrl: "https://www.ataa.com/231",
      totalPrice: 302,
      orderDate: "2024/05/22",
      orderProductsIDs: ["1", "2"],
    ),
    OrderX(
      id: "2",
      numOrder: 57812,
      state: "Complete",
      paymentMethod: "Apple Pay",
      orderInvoiceUrl: "https://www.ataa.com/231",
      aramexInvoiceUrl: "https://www.ataa.com/231",
      totalPrice: 302,
      orderDate: "2024/04/13",
      orderProductsIDs: ["3"],
    ),
  ];
  static List<ProductX> products = [
    ProductX(
      id: '1',
      name: "Quran speaker with lighting",
      description:
      "Mini Portable Hand Counter Digital Bead Counter Lcd Electronic Rosary Beads Digital Tali Toy Meditation Muslim Prayer New",
      price: 50,
      numOfStore: 30,
      rating: 4.6,
      reviews: 100,
      numSales: 14,
      colors: ["0F9591", "F05252", "C76028","C27803", "6875F5", "9061F9"],
      sizes: ["Lg", "Md", "Sm"],
      imageURL: [
        "https://github.com/SakerDakak/Images/blob/main/product-1.png?raw=true",
      ],
    ),
    ProductX(
      id: '2',
      name: "Talking educational prayer rug",
      description:
      "Mini Portable Hand Counter Digital Bead Counter Lcd Electronic Rosary Beads Digital Tali Toy Meditation Muslim Prayer New",
      price: 23,
      numOfStore: 30,
      rating: 5,
      reviews: 100,
      numSales: 20,
      colors: [],
      sizes: ["Lg", "Md", "Sm"],
      imageURL: [
        "https://github.com/SakerDakak/Images/blob/main/product-2.png?raw=true"
      ],
    ),
    ProductX(
      id: '3',
      name: "Modern electronic rosary",
      description:
      "Mini Portable Hand Counter Digital Bead Counter Lcd Electronic Rosary Beads Digital Tali Toy Meditation Muslim Prayer New",
      price: 17,
      numOfStore: 30,
      rating: 4.6,
      reviews: 100,
      numSales: 13,
      colors: ["0F9591", "F05252", "C76028","C27803", "6875F5", "9061F9"],
      sizes: [],
      imageURL: [
        "https://github.com/SakerDakak/Images/blob/main/product-3.png?raw=true",
        "https://github.com/SakerDakak/Images/blob/main/product-3-2.png?raw=true",
        "https://github.com/SakerDakak/Images/blob/main/product-3-3.jpeg?raw=true",
      ],
    ),
    ProductX(
      id: '4',
      name: "Smart tasbeeh ring",
      description:
      "Mini Portable Hand Counter Digital Bead Counter Lcd Electronic Rosary Beads Digital Tali Toy Meditation Muslim Prayer New",
      price: 100,
      numOfStore: 30,
      rating: 4.6,
      reviews: 100,
      numSales: 1,
      colors: ["C27803", "6875F5", "9061F9"],
      sizes: ["Lg"],
      imageURL: [
        "https://github.com/SakerDakak/Images/blob/main/product-4.png?raw=true"
      ],
    ),
    ProductX(
      id: '5',
      name: "The Holy Quran Reader with multi-color pen design M9- 16",
      description:
      "Mini Portable Hand Counter Digital Bead Counter Lcd Electronic Rosary Beads Digital Tali Toy Meditation Muslim Prayer New",
      price: 50,
      numOfStore: 30,
      rating: 4.6,
      reviews: 100,
      numSales: 10,
      colors: ["0F9591", "F05252", "C76028","C27803", "6875F5", "9061F9"],
      sizes: ["Lg", "Md", "Sm"],
      imageURL: [
        "https://github.com/SakerDakak/Images/blob/main/product-5.png?raw=true"
      ],
    ),
    ProductX(
      id: '6',
      name: "Prayer rug with back support",
      description:
      "Mini Portable Hand Counter Digital Bead Counter Lcd Electronic Rosary Beads Digital Tali Toy Meditation Muslim Prayer New",
      price: 50,
      numOfStore: 30,
      rating: 4.6,
      reviews: 100,
      numSales: 14,
      colors: [],
      sizes: ["Lg", "Md", "Sm"],
      imageURL: [
        "https://github.com/SakerDakak/Images/blob/main/product-6.png?raw=true"
      ],
    ),
  ];
  static List<OrderProductX> orderProducts = [
    OrderProductX(
      id: '1',
      productID: "1",
      numProduct: 3,
      imageURL:
          "https://github.com/SakerDakak/Images/blob/main/product-1.png?raw=true",
      name: "Quran speaker with lighting",
      price: 50,
    ),
    OrderProductX(
      id: '2',
      productID: "2",
      numProduct: 2,
      imageURL:
      "https://github.com/SakerDakak/Images/blob/main/product-2.png?raw=true",
      name: "Talking educational prayer rug",
      price: 23,
    ),
    OrderProductX(
      id: '3',
      productID: "3",
      numProduct: 7,
      imageURL:
      "https://github.com/SakerDakak/Images/blob/main/product-3.png?raw=true",
      name: "Modern electronic rosary",
      price: 23,
    ),
  ];
  static List<String> religions = [
    "Christianity",
    "Judaism",
    "Buddhism",
    "Hinduism",
  ];
  static List<String> countriesGuarantees = [
    "Britain",
    "America",
    "France",
    "India",
    "Pakistan",
  ];
  static List<String> language = [
    "English",
    "French",
    "Indian",
    "Urdu",
  ];
  static List<GuaranteeX> guarantees = [
    GuaranteeX(
      id: "1",
      muslimNum: 124934,
      previousReligion: "Christianity",
      country: "India",
      countryFlagCode: "in",
      gender: "male",
      language: "Indian",
      donationAmount: 2000,
    ),
    GuaranteeX(
      id: "2",
      muslimNum: 320840,
      previousReligion: "Hinduism",
      country: "Britain",
      countryFlagCode: "gb",
      gender: "female",
      language: "English",
      donationAmount: 1200,
    ),
    GuaranteeX(
      id: "3",
      muslimNum: 73874,
      previousReligion: "Judaism",
      country: "America",
      countryFlagCode: "us",
      gender: "male",
      language: "English",
      donationAmount: 1800,
    ),
    GuaranteeX(
      id: "4",
      muslimNum: 38298,
      courseName: "What a Muslim cannot afford to be ignorant of",
      country: "Britain",
      countryFlagCode: "gb",
      gender: "female",
      language: "English",
      donationAmount: 3200,
    ),
    GuaranteeX(
      id: "5",
      muslimNum: 972836,
      courseName: "Memorizing the Qur’an",
      country: "America",
      countryFlagCode: "us",
      gender: "male",
      language: "English",
      donationAmount: 2200,
    ),
    GuaranteeX(
      id: "6",
      muslimNum: 427689,
      courseName: "Memorizing prophetic hadiths",
      country: "India",
      countryFlagCode: "in",
      gender: "male",
      language: "Indian",
      donationAmount: 1800,
    ),
    GuaranteeX(
      id: "7",
      muslimNum: 632833,
      country: "Pakistan",
      countryFlagCode: "pk",
      gender: "male",
      language: "Urdu",
      donationAmount: 2000,
    ),
    GuaranteeX(
      id: "8",
      muslimNum: 43269,
      country: "America",
      countryFlagCode: "us",
      gender: "female",
      language: "English",
      donationAmount: 3100,
    ),
    GuaranteeX(
      id: "9",
      muslimNum: 867261,
      country: "India",
      countryFlagCode: "in",
      gender: "male",
      language: "Indian",
      donationAmount: 2300,
    ),
    GuaranteeX(
      id: "10",
      country: "India",
      countryFlagCode: "in",
      gender: "male",
      language: "Indian",
      donationAmount: 3400,
    ),
    GuaranteeX(
      id: "11",
      country: "Britain",
      countryFlagCode: "gb",
      gender: "male",
      language: "English",
      donationAmount: 2300,
    ),
    GuaranteeX(
      id: "12",
      country: "Pakistan",
      countryFlagCode: "pk",
      gender: "female",
      language: "Urdu",
      donationAmount: 2500,
    ),
  ];
  static List<DedicationCardX> dedicationCards = [
    DedicationCardX(
        id: "1",
        imageURL:
        "https://github.com/SakerDakak/Images/blob/main/dedications-card-1.png?raw=true"),
    DedicationCardX(
        id: "1",
        imageURL:
        "https://github.com/SakerDakak/Images/blob/main/dedications-card-2.png?raw=true"),
  ];
  static List<String> dedicationColors = [
    "0F9591",
    "F05252",
    "C76028",
    "C27803",
    "6875F5",
    "9061F9",
    "E74694"
  ];
  static List<DedicationTypeX> dedicationTypes = [
    DedicationTypeX(
      id: "1",
      name: "Ramadan",
      imageURL:
      "https://github.com/SakerDakak/Images/blob/main/dedication-type-1.jpeg?raw=true",
    ),
    DedicationTypeX(
      id: "2",
      name: "The arrival of a generator",
      imageURL:
      "https://github.com/SakerDakak/Images/blob/main/dedication-type-2.png?raw=true",
    ),
    DedicationTypeX(
      id: "3",
      name: "Charity",
      imageURL:
      "https://github.com/SakerDakak/Images/blob/main/dedication-type-3.png?raw=true",
    ),
    DedicationTypeX(
      id: "4",
      name: "Memorizing the Qur’an",
      imageURL:
      "https://github.com/SakerDakak/Images/blob/main/dedication-type-4.jpeg?raw=true",
    ),
  ];
  static List<DedicationX> dedications = [
    DedicationX(
      id: "1",
      typeID: "1",
      cardID: "1",
      orgID: "1",
      donationAmount: 100,
      isShowAmount: true,
      isSendToMe: true,
      isSendLater: true,
      mahdiName: "Saker",
      name: "Mouhamad",
      gender: "male",
      phone: "994343927",
      countryCode: 963,
      dedicationData: "2024/05/22",
      dedicationURL:
          "https://ataa-store-frontend-staging.edialoguecenter.com/Store",
      paymentMethod: "Mada",
      typeName: "Ramadan",
    ),
    DedicationX(
      id: "2",
      typeID: "2",
      cardID: "2",
      orgID: "2",
      donationAmount: 50,
      isShowAmount: true,
      isSendToMe: true,
      isSendLater: true,
      mahdiName: "Saker",
      name: "Sara",
      gender: "female",
      phone: "578987678",
      countryCode: 966,
      dedicationData: "2024/05/13",
      dedicationURL:
          "https://ataa-store-frontend-staging.edialoguecenter.com/Store",
      paymentMethod: "Apple Pay",
      typeName: "The arrival of a generator",
    ),
  ];
  static List<CampaignX> campaigns = [
    CampaignX(
      id: '1',
      title: "Teach 30 Muslims the Pillars of Islam",
      totalNumberDonations: 20,
      currentDonations: 30295,
      totalDonations: 40000,
      isZakat: true,
      shareURL: "https://www.ataa.com/231",
      imageURL: [
        "https://github.com/SakerDakak/Images/blob/main/donate-1.png?raw=true",
        "https://github.com/SakerDakak/Images/blob/main/donate-2.jpeg?raw=true",
        "https://github.com/SakerDakak/Images/blob/main/donate-3.jpeg?raw=true"
      ],
      stockValue: 50,
      maxNumStock: 100,
      orgID: '1',
      donationID: "1",
      endDate: DateTime.now(),
    ),
    CampaignX(
      id: '2',
      title: "Prayer science for 120 new Muslims",
      totalNumberDonations: 14,
      currentDonations: 25690,
      totalDonations: 50000,
      isZakat: false,
      shareURL: "https://www.ataa.com/231",
      imageURL: [
        "https://github.com/SakerDakak/Images/blob/main/donate-2.jpeg?raw=true"
      ],
      targetAmount: 50000,
      orgID: '2',
      donationID: "2",
      endDate: DateTime.now(),
    ),
    CampaignX(
      id: '3',
      title: "Charity on Friday",
      totalNumberDonations: 43,
      currentDonations: 120200,
      totalDonations: 2000000,
      isZakat: true,
      shareURL: "https://www.ataa.com/231",
      imageURL: [
        "https://github.com/SakerDakak/Images/blob/main/donate-3.jpeg?raw=true"
      ],
      stockValue: 20,
      maxNumStock: 100,
      orgID: '3',
      donationID: "3",
      endDate: DateTime.now(),
    ),
  ];
  static StatisticsX statistics = StatisticsX(
    id: '1',
    allDonations: 6,
    completedDonations: 5,
    totalDonationAmount: 3250,
    totalParticipation: 2487,
    totalCampaigns: 8,
    totalCampaignAmount: 20653,
    numCampaignDonations: 7,
    numCampaignVisits: 3520,
    numRequests: 8,
    completedOrders: 6,
    totalAmountOrders: 2487,
    totalDeductions: 3,
    totalAmountDeductions: 3575,
    numGuarantees: 12,
    totalAmountGuarantees: 1349,
    numLinks: 9,
    newRegistrationsViaLinks: 22,
    numDonationsViaLinks: 5,
    numLinkVisits: 2908,
    totalAmountDonationsViaLinks: 4309,
  );
  static List<NotificationX> notifications = [
    NotificationX(
      id: 1,
      body: "Congratulations on the success of your “Sponsor 100 Muslims”",
      dateTime: "Two days ago",
    )
  ];
  static String privacyPolicy = """
Privacy Policy for Ataa Application

At Ataa, we value your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our application ("App"). By using the App, you agree to the collection and use of information in accordance with this policy.

1. Information We Collect

We may collect and store the following information:

Personal Information: When you create an account, we may collect information such as your name, email address, phone number, and payment information.
Usage Data: We collect information on how the App is accessed and used. This may include information such as your device’s IP address, browser type, and usage patterns.
Location Data: With your permission, we may collect and process information about your device's location.
2. Use of Information

We use the collected information for various purposes, including:

To provide and maintain the App.
To process your donations and Zakat payments.
To notify you about changes to our App or any services we offer.
To provide customer support.
To gather analysis or valuable information so that we can improve our App.
To monitor the usage of the App.
To detect, prevent, and address technical issues.
3. Sharing of Information

We do not sell or trade your personal information. We may share your information in the following situations:

With Service Providers: We may share your information with third-party service providers to perform services on our behalf, such as payment processing and data analysis.
For Legal Reasons: We may disclose your information if required by law or in response to valid requests by public authorities.
4. Security of Information

We implement appropriate technical and organizational measures to protect your personal information from unauthorized access, use, or disclosure. However, no method of transmission over the internet or electronic storage is 100% secure.

5. Your Data Protection Rights

Depending on your location, you may have the following rights regarding your personal information:

The right to access – You have the right to request copies of your personal data.
The right to rectification – You have the right to request that we correct any information you believe is inaccurate or complete information you believe is incomplete.
The right to erasure – You have the right to request that we erase your personal data, under certain conditions.
The right to restrict processing – You have the right to request that we restrict the processing of your personal data, under certain conditions.
The right to object to processing – You have the right to object to our processing of your personal data, under certain conditions.
The right to data portability – You have the right to request that we transfer the data that we have collected to another organization, or directly to you, under certain conditions.

6. Changes to This Privacy Policy

We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.

7. Contact Us

If you have any questions about this Privacy Policy, please contact us at [Your Contact Information].

By using the Ataa application, you acknowledge that you have read, understood, and agree to be bound by this Privacy Policy.
  """;
  static String termsConditions = """
Terms and Conditions for Ataa Application

Welcome to Ataa! These Terms and Conditions ("Terms") govern your use of the Ataa application ("App"), a service provided by [Your Company Name] ("Company", "we", "us", or "our"). By accessing or using the App, you agree to comply with and be bound by these Terms. If you do not agree to these Terms, please do not use the App.

1. Acceptance of Terms

By using the App, you affirm that you are at least 18 years old or have the consent of a parent or guardian to use the App. You also affirm that you are legally permitted to use the App in your jurisdiction.

2. Services Provided

The App allows users to donate and pay Zakat through a secure and user-friendly platform. The App provides features such as donation tracking, payment history, and various donation options.

3. User Accounts

To use certain features of the App, you may be required to create an account. You agree to provide accurate and complete information during the registration process and to keep your account information up-to-date. You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.

4. Donations and Payments

All donations and Zakat payments made through the App are final and non-refundable. The Company is not responsible for any issues arising from donations, including but not limited to tax implications. Users are encouraged to consult with a tax professional regarding their donations.

5. Use of the App

You agree to use the App in compliance with all applicable laws and regulations. You agree not to:

- Use the App for any unlawful purpose.
- Impersonate any person or entity or falsely state or otherwise misrepresent your affiliation with a person or entity.
- Interfere with or disrupt the operation of the App or the servers or networks connected to the App.
- Engage in any activity that could harm or impair the functioning of the App.

6. Privacy

Your use of the App is subject to our Privacy Policy, which is incorporated into these Terms by reference. Please review the Privacy Policy to understand how we collect, use, and disclose information about you.

7. Intellectual Property

All content and materials available on the App, including but not limited to text, graphics, logos, and software, are the property of the Company or its licensors and are protected by applicable intellectual property laws. You are granted a limited, non-exclusive, non-transferable license to access and use the App for personal, non-commercial purposes.

8. Disclaimer of Warranties

The App is provided on an "as is" and "as available" basis. The Company makes no representations or warranties of any kind, express or implied, as to the operation of the App or the information, content, or materials included therein. You expressly agree that your use of the App is at your sole risk.

9. Limitation of Liability

To the fullest extent permitted by law, the Company shall not be liable for any damages of any kind arising from your use of the App, including but not limited to direct, indirect, incidental, punitive, and consequential damages.

10. Indemnification

You agree to indemnify, defend, and hold harmless the Company and its affiliates, officers, directors, employees, and agents from and against any claims, liabilities, damages, losses, and expenses, including reasonable attorneys' fees, arising out of or in any way connected with your access to or use of the App.

11. Changes to Terms

The Company reserves the right to modify these Terms at any time. Any changes will be effective immediately upon posting the revised Terms on the App. Your continued use of the App after the posting of changes constitutes your acceptance of such changes.

12. Termination

The Company reserves the right to terminate or suspend your access to the App at any time, without notice, for conduct that it believes violates these Terms or is harmful to other users of the App, the Company, or third parties, or for any other reason in its sole discretion.

13. Governing Law

These Terms shall be governed by and construed in accordance with the laws of [Your Jurisdiction], without regard to its conflict of law principles.

14. Contact Us

If you have any questions about these Terms, please contact us at [Your Contact Information].

By using the Ataa application, you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions.
  """;
}
