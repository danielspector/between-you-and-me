# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
CATEGORIES = <<-CAT
    Active Life
    Amateur Sports Teams
    Amusement Parks
    Aquariums
    Archery
    Badminton
    Basketball Courts
    Beaches
    Bike Rentals
    Boating
    Bowling
    Challenge Courses
    Climbing
    Cycling Classes
    Day Camps
    Disc Golf
    Diving
    Free Diving
    Scuba Diving
    Fishing
    Fitness & Instruction
    Barre Classes
    Boot Camps
    Boxing
    Dance Studios
    Gyms 
    Martial Arts
    Meditation Centers
    Pilates
    Swimming Lessons/Schools
    Tai Chi
    Trainers
    Yoga
    Go Karts
    Golf
    Gun/Rifle Ranges
    Gymnastics
    Hang Gliding
    Hiking
    Horse Racing
    Horseback Riding
    Hot Air Balloons
    Kiteboarding
    Lakes
    Laser Tag
    Leisure Centers
    Mini Golf
    Mountain Biking
    Paddleboarding
    Paintball
    Parks
    Dog Parks
    Skate Parks
    Playgrounds
    Rafting/Kayaking
    Recreation Centers
    Rock Climbing
    Skating Rinks
    Skydiving
    Sledding
    Soccer
    Sports Clubs
    Squash
    Summer Camps
    Surfing
    Swimming Pools
    Tennis
    Trampoline Parks
    Tubing
    Zoos
    Arts & Entertainment
    Arcades
    Art Galleries
    Botanical Gardens
    Cabaret
    Casinos
    Cinema
    Cultural Center
    Festivals
    Jazz & Blues
    Museums
    Music Venues
    Opera & Ballet
    Performing Arts
    Professional Sports Teams
    Psychics & Astrologers
    Race Tracks
    Social Clubs
    Stadiums & Arenas
    Ticket Sales
    Wineries
    Automotive
    Aircraft Dealers
    Auto Customization
    Auto Detailing
    Auto Glass Services
    Auto Loan Providers
    Auto Parts & Supplies
    Auto Repair
    Boat Dealers
    Body Shops
    Car Dealers
    Car Stereo Installation
    Car Wash
    Gas & Service Stations
    Motorcycle Dealers
    Motorcycle Repair
    Oil Change Stations
    Parking
    RV Dealers
    Registration Services
    Smog Check Stations
    Tires
    Towing
    Truck Rental
    Wheel & Rim Repair
    Windshield Installation & Repair
    Beauty & Spas
    Barbers
    Cosmetics & Beauty Supply
    Day Spas
    Eyelash Service
    Hair Extensions
    Hair Removal
    Laser Hair Removal
    Hair Salons
    Blow Dry/Out Services
    Hair Extensions
    Hair Stylists
    Men's Hair Salons
    Makeup Artists
    Massage
    Medical Spas
    Nail Salons
    Permanent Makeup
    Piercing
    Rolfing
    Skin Care
    Tanning
    Spray Tanning
    Tanning Beds
    Tattoo
    Education
    Adult Education
    Art Classes
    College Counseling
    Colleges & Universities
    Educational Services
    Elementary Schools
    Middle Schools & High Schools
    Preschools
    Private Tutors
    Religious Schools
    Special Education
    Specialty Schools
    Art Schools
    CPR Classes
    Cooking Schools
    Cosmetology Schools
    Dance Schools
    Driving Schools
    First Aid Classes
    Flight Instruction
    Food Safety Training
    Language Schools
    Massage Schools
    Swimming Lessons/Schools
    Vocational & Technical School
    Test Preparation
    Tutoring Centers
    Event Planning & Services
    Bartenders
    Boat Charters
    Cards & Stationery
    Caterers
    Clowns
    DJs
    Hotels
    Magicians
    Musicians
    Officiants
    Party & Event Planning
    Party Bus Rentals
    Party Equipment Rentals
    Party Supplies
    Personal Chefs
    Photo Booth Rentals
    Photographers
    Event Photography
    Session Photography
    Venues & Event Spaces
    Videographers
    Wedding Planning
    Financial Services
    Banks & Credit Unions
    Check Cashing/Pay-day Loans
    Financial Advising
    Insurance
    Investing
    Tax Services
    Food
    Bagels
    Bakeries
    Beer, Wine & Spirits
    Breweries
    Bubble Tea
    Butcher
    CSA
    Coffee & Tea
    Convenience Stores
    Cupcakes
    Desserts
    Distilleries
    Do-It-Yourself Food
    Donuts
    Farmers Market
    Food Delivery Services
    Food Trucks
    Gelato
    Grocery
    Ice Cream & Frozen Yogurt
    Internet Cafes
    Juice Bars & Smoothies
    Pretzels
    Shaved Ice
    Specialty Food
    Candy Stores
    Cheese Shops
    Chocolatiers & Shops
    Ethnic Food
    Fruits & Veggies
    Health Markets
    Herbs & Spices
    Meat Shops
    Seafood Markets
    Street Vendors
    Tea Rooms
    Wineries
    Health & Medical
    Acupuncture
    Cannabis Clinics
    Chiropractors
    Counseling & Mental Health
    Psychologists
    Dentists
    Cosmetic Dentists
    Endodontists
    General Dentistry
    Oral Surgeons
    Orthodontists
    Pediatric Dentists
    Periodontists
    Diagnostic Services
    Diagnostic Imaging
    Laboratory Testing
    Doctors
    Allergists
    Anesthesiologists
    Audiologist
    Cardiologists
    Cosmetic Surgeons
    Dermatologists
    Ear Nose & Throat
    Family Practice
    Fertility
    Gastroenterologist
    Gerontologists
    Internal Medicine
    Naturopathic/Holistic
    Neurologist
    Obstetricians & Gynecologists
    Oncologist
    Ophthalmologists
    Orthopedists
    Osteopathic Physicians
    Pediatricians
    Podiatrists
    Proctologists
    Psychiatrists
    Pulmonologist
    Sports Medicine
    Tattoo Removal
    Urologists
    Doulas
    Emergency Rooms
    Hearing Aid Providers
    Home Health Care
    Hospice
    Hospitals
    Hypnosis/Hypnotherapy
    Lactation Services
    Laser Eye Surgery/Lasik
    Lice Services
    Massage Therapy
    Medical Centers
    Medical Spas
    Medical Transportation
    Midwives
    Nutritionists
    Occupational Therapy
    Optometrists
    Physical Therapy
    Reflexology
    Rehabilitation Center
    Reiki
    Retirement Homes
    Speech Therapists
    Traditional Chinese Medicine
    Urgent Care
    Weight Loss Centers
    Home Services
    Building Supplies
    Cabinetry
    Carpet Installation
    Carpeting
    Chimney Sweeps
    Contractors
    Damage Restoration
    Door Sales/Installation
    Drywall Installation & Repair
    Electricians
    Fences & Gates
    Flooring
    Garage Door Services
    Gardeners
    Glass & Mirrors
    Gutter Services
    Handyman
    Heating & Air Conditioning/HVAC
    Home Cleaning
    Home Inspectors
    Home Organization
    Home Theatre Installation
    Home Window Tinting
    Interior Design
    Internet Service Providers
    Irrigation
    Keys & Locksmiths
    Landscape Architects
    Landscaping
    Lighting Fixtures & Equipment
    Masonry/Concrete
    Movers
    Painters
    Plumbing
    Pool Cleaners
    Pressure Washers
    Real Estate
    Apartments
    Commercial Real Estate
    Home Staging
    Mortgage Brokers
    Property Management
    Real Estate Agents
    Real Estate Services
    Shared Office Spaces
    University Housing
    Roofing
    Security Systems
    Shades & Blinds
    Solar Installation
    Structural Engineers
    Television Service Providers
    Tree Services
    Utilities
    Window Washing
    Windows Installation
    Hotels & Travel
    Airports
    Bed & Breakfast
    Campgrounds
    Car Rental
    Guest Houses
    Health Retreats
    Hostels
    Hotels
    Motorcycle Rental
    RV Parks
    RV Rental
    Resorts
    Ski Resorts
    Tours
    Train Stations
    Transportation
    Airlines
    Airport Shuttles
    Limos
    Public Transportation
    Taxis
    Travel Services
    Vacation Rental Agents
    Vacation Rentals
    Local Flavor
    Yelp Events
    Local Services
    Appliances & Repair
    Bail Bondsmen
    Bike Repair/Maintenance
    Carpet Cleaning
    Child Care & Day Care
    Community Service/Non-Profit
    Couriers & Delivery Services
    Dry Cleaning & Laundry
    Electronics Repair
    Funeral Services & Cemeteries
    Furniture Reupholstery
    IT Services & Computer Repair
    Data Recovery
    Mobile Phone Repair
    Telecommunications
    Jewelry Repair
    Junk Removal & Hauling
    Metal Fabricators
    Nanny Services
    Notaries
    Pest Control
    Printing Services
    Propane
    Recording & Rehearsal Studios
    Recycling Center
    Screen Printing
    Screen Printing/T-Shirt Printing
    Self Storage
    Sewing & Alterations
    Shipping Centers
    Shoe Repair
    Snow Removal
    Watch Repair
    Mass Media
    Print Media
    Radio Stations
    Television Stations
    Nightlife
    Adult Entertainment
    Bars
    Champagne Bars
    Cocktail Bars
    Dive Bars
    Gay Bars
    Hookah Bars
    Lounges
    Pubs
    Sports Bars
    Wine Bars
    Comedy Clubs
    Country Dance Halls
    Dance Clubs
    Jazz & Blues
    Karaoke
    Music Venues
    Piano Bars
    Pool Halls
    Pets
    Animal Shelters
    Horse Boarding
    Pet Adoption
    Pet Services
    Aquarium Services
    Dog Walkers
    Pet Boarding/Pet Sitting
    Pet Groomers
    Pet Training
    Pet Stores
    Veterinarians
    Professional Services
    Accountants
    Advertising
    Architects
    Boat Repair
    Career Counseling
    Editorial Services
    Employment Agencies
    Graphic Design
    Internet Service Providers
    Lawyers
    Bankruptcy Law
    Business Law
    Criminal Defense Law
    DUI Law
    Divorce & Family Law
    Employment Law
    Estate Planning Law
    General Litigation
    Immigration Law
    Personal Injury Law
    Real Estate Law
    Tax Law
    Legal Services
    Life Coach
    Marketing
    Matchmakers
    Office Cleaning
    Payroll Services
    Personal Assistants
    Private Investigation
    Public Relations
    Signmaking
    Talent Agencies
    Taxidermy
    Translation Services
    Video/Film Production
    Web Design
    Public Services & Government
    Courthouses
    Departments of Motor Vehicles
    Embassy
    Fire Departments
    Landmarks & Historical Buildings
    Libraries
    Police Departments
    Post Offices
    Real Estate
    Apartments
    Commercial Real Estate
    Home Staging
    Mortgage Brokers
    Property Management
    Real Estate Agents
    Real Estate Services
    Shared Office Spaces
    University Housing
    Religious Organizations
    Buddhist Temples
    Churches
    Hindu Temples
    Mosques
    Synagogues
    Restaurants
    Afghan
    African
    Senegalese
    South African
    American
    American
    Arabian
    Argentine
    Armenian
    Asian Fusion
    Australian
    Austrian
    Bangladeshi
    Barbeque
    Basque
    Belgian
    Brasseries
    Brazilian
    Breakfast & Brunch
    British
    Buffets
    Burgers
    Burmese
    Cafes
    Cafeteria
    Cajun/Creole
    Cambodian
    Caribbean
    Dominican
    Haitian
    Puerto Rican
    Trinidadian
    Catalan
    Cheesesteaks
    Chicken Wings
    Chinese
    Cantonese
    Dim Sum
    Shanghainese
    Szechuan
    Comfort Food
    Creperies
    Cuban
    Czech
    Delis
    Diners
    Ethiopian
    Fast Food
    Filipino
    Fish & Chips
    Fondue
    Food Court
    Food Stands
    French
    Gastropubs
    German
    Gluten-Free
    Greek
    Halal
    Hawaiian
    Himalayan/Nepalese
    Hot Dogs
    Hot Pot
    Hungarian
    Iberian
    Indian
    Indonesian
    Irish
    Italian
    Japanese
    Korean
    Kosher
    Laotian
    Latin American
    Colombian
    Salvadoran
    Venezuelan
    Live/Raw Food
    Malaysian
    Mediterranean
    Falafel
    Mexican
    Middle Eastern
    Egyptian
    Lebanese
    Modern European
    Mongolian
    Moroccan
    Pakistani
    Persian/Iranian
    Peruvian
    Pizza
    Polish
    Portuguese
    Russian
    Salad
    Sandwiches
    Scandinavian
    Scottish
    Seafood
    Singaporean
    Slovakian
    Soul Food
    Soup
    Southern
    Spanish
    Steakhouses
    Sushi Bars
    Taiwanese
    Tapas Bars
    Tapas/Small Plates
    Tex-Mex
    Thai
    Turkish
    Ukrainian
    Vegan
    Vegetarian
    Vietnamese
    Shopping
    Adult
    Antiques
    Art Galleries
    Arts & Crafts
    Art Supplies
    Cards & Stationery
    Costumes
    Embroidery & Crochet
    Fabric Stores
    Framing
    Auction Houses
    Baby Gear & Furniture
    Bespoke Clothing
    Books, Mags, Music & Video
    Bookstores
    Comic Books
    Music & DVDs
    Newspapers & Magazines
    Videos & Video Game Rental
    Vinyl Records
    Brewing Supplies
    Bridal
    Computers
    Cosmetics & Beauty Supply
    Department Stores
    Discount Store
    Drugstores
    Electronics
    Eyewear & Opticians
    Fashion
    Accessories
    Children's Clothing
    Department Stores
    Formal Wear
    Hats
    Leather Goods
    Lingerie
    Maternity Wear
    Men's Clothing
    Plus Size Fashion
    Shoe Stores
    Sports Wear
    Surf Shop
    Swimwear
    Used, Vintage & Consignment
    Women's Clothing
    Fireworks
    Flea Markets
    Flowers & Gifts
    Cards & Stationery
    Florists
    Gift Shops
    Gold Buyers
    Golf Equipment Shops
    Guns & Ammo
    Hobby Shops
    Home & Garden
    Appliances
    Furniture Stores
    Hardware Stores
    Home Decor
    Hot Tub & Pool
    Kitchen & Bath
    Mattresses
    Nurseries & Gardening
    Rugs
    Jewelry
    Knitting Supplies
    Luggage
    Medical Supplies
    Mobile Phones
    Motorcycle Gear
    Musical Instruments & Teachers
    Office Equipment
    Outlet Stores
    Pawn Shops
    Personal Shopping
    Photography Stores & Services
    Pool & Billiards
    Pop-up Shops
    Shopping Centers
    Sporting Goods
    Bikes
    Golf Equipment
    Outdoor Gear
    Sports Wear
    Thrift Stores
    Tobacco Shops
    Toy Stores
    Trophy Shops
    Uniforms
    Watches
    Wholesale Stores
    Wigs
CAT

new_entries = CATEGORIES.split("\n").map(&:strip).sort
new_entries.pop(2)

new_entries.each do |cat|
  Categories.create(name: cat)
end