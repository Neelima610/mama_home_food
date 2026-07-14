import '../../models/product_model.dart';

class ProductData {
  ProductData._();

  static final List<ProductModel> products = [
    ProductModel(
      id: "veg_meals",
      name: "Traditional Veg Meals",
      description:
          "Fresh homemade Andhra-style vegetarian meals served with rice, dal, curry, pickle, papad and curd.",
      image: "",
      price: 120,
      oldPrice: 150,
      rating: 4.9,
      isVeg: true,
      isAvailable: true,
      isFavorite: false,
      categoryId: "lunch_boxes",
      isFeatured: true,
    ),

    ProductModel(
      id: "mini_meals",
      name: "Mini Meals",
      description:
          "Healthy homemade mini meals perfect for lunch.",
      image: "",
      price: 90,
      oldPrice: 110,
      rating: 4.8,
      isVeg: true,
      isAvailable: true,
      isFavorite: false,
      categoryId: "lunch_boxes",
      isFeatured: false,
    ),

    ProductModel(
      id: "mango_pickle",
      name: "Mango Pickle",
      description:
          "Traditional Andhra mango pickle made with premium spices.",
      image: "",
      price: 180,
      oldPrice: 220,
      rating: 4.9,
      isVeg: true,
      isAvailable: true,
      isFavorite: false,
      categoryId: "pickles",
      isFeatured: true,
    ),

    ProductModel(
      id: "gongura_pickle",
      name: "Gongura Pickle",
      description:
          "Authentic homemade Gongura pickle with rich flavor.",
      image: "",
      price: 170,
      oldPrice: 200,
      rating: 4.8,
      isVeg: true,
      isAvailable: true,
      isFavorite: false,
      categoryId: "pickles",
      isFeatured: false,
    ),

    ProductModel(
      id: "karam_podi",
      name: "Karam Podi",
      description:
          "Spicy homemade podi prepared using traditional methods.",
      image: "",
      price: 140,
      oldPrice: 170,
      rating: 4.7,
      isVeg: true,
      isAvailable: true,
      isFavorite: false,
      categoryId: "podi",
      isFeatured: true,
    ),

    ProductModel(
      id: "murukulu",
      name: "Murukulu",
      description:
          "Crunchy homemade murukulu prepared fresh every day.",
      image: "",
      price: 160,
      oldPrice: 190,
      rating: 4.8,
      isVeg: true,
      isAvailable: true,
      isFavorite: false,
      categoryId: "snacks",
      isFeatured: true,
    ),

    ProductModel(
      id: "boondi_laddu",
      name: "Boondi Laddu",
      description:
          "Traditional homemade sweet prepared with pure ghee.",
      image: "",
      price: 250,
      oldPrice: 280,
      rating: 4.9,
      isVeg: true,
      isAvailable: true,
      isFavorite: false,
      categoryId: "sweets",
      isFeatured: true,
    ),

    ProductModel(
      id: "monthly_lunch_plan",
      name: "Monthly Lunch Plan",
      description:
          "Healthy homemade lunch delivered every weekday.",
      image: "",
      price: 3000,
      oldPrice: 3500,
      rating: 5.0,
      isVeg: true,
      isAvailable: true,
      isFavorite: false,
      categoryId: "subscription",
      isFeatured: true,
    ),

    ProductModel(
      id: "birthday_catering",
      name: "Birthday Catering",
      description:
          "Homemade catering service for birthdays and family events.",
      image: "",
      price: 5000,
      oldPrice: 6000,
      rating: 5.0,
      isVeg: true,
      isAvailable: true,
      isFavorite: false,
      categoryId: "catering",
      isFeatured: true,
    ),
  ];
}