import 'package:cloth_ecommerce/features/home/data/models/product_model.dart';

/// Sample products data for the e-commerce app
/// This file contains all sample products organized by category
class ProductConstants {
  ProductConstants._();

  /// Get all sample products
  static List<ProductModel> getSampleProducts() {
    return [
      // HOODIES (6 products)
      ..._hoodies,
      // T-SHIRTS (6 products)
      ..._tShirts,
      // JEANS (6 products)
      ..._jeans,
      // SWEATPANTS (6 products)
      ..._sweatpants,
      // JACKETS (5 products)
      ..._jackets,
      // SHORTS (4 products)
      ..._shorts,
      // ACCESSORIES (2 products)
      ..._accessories,
    ];
  }

  static final List<ProductModel> _hoodies = [
    // HOODIES (6 products)
    ProductModel(
      id: '1',
      name: 'Urban Comfort Hoodie',
      category: 'hoodies',
      basePrice: 79.99,
      imageUrl: 'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=500',
      rating: 4.8,
      reviewCount: 124,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#8B4513', '#E0E0E0']),
        ProductOption(name: 'Size', values: ['XS', 'S', 'M', 'L', 'XL', 'XXL']),
      ],
      variants: ProductVariantHelper.generateVariants('1', ['#000000', '#8B4513', '#E0E0E0'], ['XS', 'S', 'M', 'L', 'XL', 'XXL'], 79.99),
    ),
    ProductModel(
      id: '2',
      name: 'Cozy Vibes Hoodie',
      category: 'hoodies',
      basePrice: 74.99,
      imageUrl: 'https://images.unsplash.com/photo-1509631179647-0177331693ae?w=500',
      rating: 4.5,
      reviewCount: 98,
      options: const [
        ProductOption(name: 'Color', values: ['#E0E0E0', '#FFB6C1', '#87CEEB']),
        ProductOption(name: 'Size', values: ['S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants('2', ['#E0E0E0', '#FFB6C1', '#87CEEB'], ['S', 'M', 'L', 'XL'], 74.99),
    ),
    ProductModel(
      id: '3',
      name: 'Oversized Street Hoodie',
      category: 'hoodies',
      basePrice: 89.99,
      imageUrl: 'https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?w=500',
      rating: 4.9,
      reviewCount: 203,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#FFFFFF', '#FF6B6B']),
        ProductOption(name: 'Size', values: ['M', 'L', 'XL', 'XXL']),
      ],
      variants: ProductVariantHelper.generateVariants('3', ['#000000', '#FFFFFF', '#FF6B6B'], ['M', 'L', 'XL', 'XXL'], 89.99),
    ),
    ProductModel(
      id: '4',
      name: 'Vintage Washed Hoodie',
      category: 'hoodies',
      basePrice: 84.99,
      imageUrl: 'https://images.unsplash.com/photo-1578587018452-892bacefd3f2?w=500',
      rating: 4.7,
      reviewCount: 156,
      options: const [
        ProductOption(name: 'Color', values: ['#8B7355', '#2F4F4F', '#696969']),
        ProductOption(name: 'Size', values: ['XS', 'S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants('4', ['#8B7355', '#2F4F4F', '#696969'], ['XS', 'S', 'M', 'L', 'XL'], 84.99),
    ),
    ProductModel(
      id: '5',
      name: 'Tech Fleece Hoodie',
      category: 'hoodies',
      basePrice: 94.99,
      imageUrl: 'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=500',
      rating: 4.8,
      reviewCount: 187,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#1E3A8A', '#2D3748']),
        ProductOption(name: 'Size', values: ['S', 'M', 'L', 'XL', 'XXL']),
      ],
      variants: ProductVariantHelper.generateVariants('5', ['#000000', '#1E3A8A', '#2D3748'], ['S', 'M', 'L', 'XL', 'XXL'], 94.99),
    ),
    ProductModel(
      id: '6',
      name: 'Graphic Print Hoodie',
      category: 'hoodies',
      basePrice: 79.99,
      imageUrl: 'https://images.unsplash.com/photo-1620799140188-3b2a02fd9a77?w=500',
      rating: 4.6,
      reviewCount: 142,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#FFFFFF', '#4A5568']),
        ProductOption(name: 'Size', values: ['XS', 'S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants('6', ['#000000', '#FFFFFF', '#4A5568'], ['XS', 'S', 'M', 'L', 'XL'], 79.99),
    ),

    // T-SHIRTS (6 products)
    ProductModel(
      id: '7',
      name: 'Essential Graphic Tee',
      category: 't-shirts',
      basePrice: 34.99,
      imageUrl: 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=500',
      rating: 4.9,
      reviewCount: 256,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#FFFFFF', '#808080']),
        ProductOption(name: 'Size', values: ['XS', 'S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants('7', ['#000000', '#FFFFFF', '#808080'], ['XS', 'S', 'M', 'L', 'XL'], 34.99),
    ),
    ProductModel(
      id: '8',
      name: 'Vintage Band Tee',
      category: 't-shirts',
      basePrice: 39.99,
      imageUrl: 'https://images.unsplash.com/photo-1503341504253-dff4815485f1?w=500',
      rating: 4.7,
      reviewCount: 189,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#8B4513', '#2F4F4F']),
        ProductOption(name: 'Size', values: ['S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants('8', ['#000000', '#8B4513', '#2F4F4F'], ['S', 'M', 'L', 'XL'], 39.99),
    ),
    ProductModel(
      id: '9',
      name: 'Oversized Plain Tee',
      category: 't-shirts',
      basePrice: 29.99,
      imageUrl: 'https://images.unsplash.com/photo-1581655353564-df123a1eb820?w=500',
      rating: 4.8,
      reviewCount: 312,
      options: const [
        ProductOption(name: 'Color', values: ['#FFFFFF', '#000000', '#E0E0E0', '#FFB6C1']),
        ProductOption(name: 'Size', values: ['XS', 'S', 'M', 'L', 'XL', 'XXL']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '9',
        ['#FFFFFF', '#000000', '#E0E0E0', '#FFB6C1'],
        ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
        29.99,
      ),
    ),
    ProductModel(
      id: '10',
      name: 'Striped Retro Tee',
      category: 't-shirts',
      basePrice: 36.99,
      imageUrl: 'https://images.unsplash.com/photo-1562157873-818bc0726f68?w=500',
      rating: 4.6,
      reviewCount: 145,
      options: const [
        ProductOption(name: 'Color', values: ['#1E3A8A', '#DC143C', '#228B22']),
        ProductOption(name: 'Size', values: ['S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants('10', ['#1E3A8A', '#DC143C', '#228B22'], ['S', 'M', 'L', 'XL'], 36.99),
    ),
    ProductModel(
      id: '11',
      name: 'Premium Cotton Tee',
      category: 't-shirts',
      basePrice: 44.99,
      imageUrl: 'https://images.unsplash.com/photo-1583743814966-8936f5b7be1a?w=500',
      rating: 4.9,
      reviewCount: 278,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#FFFFFF', '#1E3A8A', '#2F4F4F']),
        ProductOption(name: 'Size', values: ['XS', 'S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '11',
        ['#000000', '#FFFFFF', '#1E3A8A', '#2F4F4F'],
        ['XS', 'S', 'M', 'L', 'XL'],
        44.99,
      ),
    ),
    ProductModel(
      id: '12',
      name: 'Pocket Detail Tee',
      category: 't-shirts',
      basePrice: 32.99,
      imageUrl: 'https://images.unsplash.com/photo-1618354691373-d851c5c3a990?w=500',
      rating: 4.5,
      reviewCount: 167,
      options: const [
        ProductOption(name: 'Color', values: ['#FFFFFF', '#87CEEB', '#FFB6C1']),
        ProductOption(name: 'Size', values: ['S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants('12', ['#FFFFFF', '#87CEEB', '#FFB6C1'], ['S', 'M', 'L', 'XL'], 32.99),
    ),

    // JEANS (5 products)
    ProductModel(
      id: '13',
      name: 'Streetwise Denim',
      category: 'jeans',
      basePrice: 89.99,
      imageUrl: 'https://images.unsplash.com/photo-1542272454315-7fbfabf99ccf?w=500',
      rating: 4.6,
      reviewCount: 89,
      options: const [
        ProductOption(name: 'Color', values: ['#1E3A8A', '#000000']),
        ProductOption(name: 'Size', values: ['28', '30', '32', '34', '36']),
      ],
      variants: ProductVariantHelper.generateVariants('13', ['#1E3A8A', '#000000'], ['28', '30', '32', '34', '36'], 89.99),
    ),
    ProductModel(
      id: '14',
      name: 'Slim Fit Black Jeans',
      category: 'jeans',
      basePrice: 79.99,
      imageUrl: 'https://images.unsplash.com/photo-1604176354204-9268737828e4?w=500',
      rating: 4.7,
      reviewCount: 234,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#2F4F4F']),
        ProductOption(name: 'Size', values: ['28', '30', '32', '34', '36', '38']),
      ],
      variants: ProductVariantHelper.generateVariants('14', ['#000000', '#2F4F4F'], ['28', '30', '32', '34', '36', '38'], 79.99),
    ),
    ProductModel(
      id: '15',
      name: 'Distressed Wide Leg',
      category: 'jeans',
      basePrice: 94.99,
      imageUrl: 'https://images.unsplash.com/photo-1475178626620-a4d074967452?w=500',
      rating: 4.8,
      reviewCount: 176,
      options: const [
        ProductOption(name: 'Color', values: ['#1E3A8A', '#87CEEB']),
        ProductOption(name: 'Size', values: ['28', '30', '32', '34', '36']),
      ],
      variants: ProductVariantHelper.generateVariants('15', ['#1E3A8A', '#87CEEB'], ['28', '30', '32', '34', '36'], 94.99),
    ),
    ProductModel(
      id: '16',
      name: 'Straight Leg Classic',
      category: 'jeans',
      basePrice: 84.99,
      imageUrl: 'https://images.unsplash.com/photo-1541099649105-f69ad21f3246?w=500',
      rating: 4.5,
      reviewCount: 198,
      options: const [
        ProductOption(name: 'Color', values: ['#1E3A8A', '#000000', '#696969']),
        ProductOption(name: 'Size', values: ['29', '30', '32', '34', '36']),
      ],
      variants: ProductVariantHelper.generateVariants('16', ['#1E3A8A', '#000000', '#696969'], ['29', '30', '32', '34', '36'], 84.99),
    ),
    ProductModel(
      id: '17',
      name: 'Vintage Wash Denim',
      category: 'jeans',
      basePrice: 99.99,
      imageUrl: 'https://images.unsplash.com/photo-1582552938357-32b906df40cb?w=500',
      rating: 4.9,
      reviewCount: 267,
      options: const [
        ProductOption(name: 'Color', values: ['#4682B4', '#87CEEB']),
        ProductOption(name: 'Size', values: ['28', '30', '32', '34', '36']),
      ],
      variants: ProductVariantHelper.generateVariants('17', ['#4682B4', '#87CEEB'], ['28', '30', '32', '34', '36'], 99.99),
    ),

    // SWEATPANTS (5 products)
    ProductModel(
      id: '18',
      name: 'Chill Zone Sweatpants',
      category: 'sweatpants',
      basePrice: 64.99,
      imageUrl: 'https://images.unsplash.com/photo-1506629082955-511b1aa562c8?w=500',
      rating: 4.7,
      reviewCount: 142,
      options: const [
        ProductOption(name: 'Color', values: ['#1E3A8A', '#000000', '#E0E0E0']),
        ProductOption(name: 'Size', values: ['XS', 'S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants('18', ['#1E3A8A', '#000000', '#E0E0E0'], ['XS', 'S', 'M', 'L', 'XL'], 64.99),
    ),
    ProductModel(
      id: '19',
      name: 'Cargo Joggers',
      category: 'sweatpants',
      basePrice: 69.99,
      imageUrl: 'https://images.unsplash.com/photo-1624378439575-d8705ad7ae80?w=500',
      rating: 4.8,
      reviewCount: 213,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#2F4F4F', '#8B7355']),
        ProductOption(name: 'Size', values: ['S', 'M', 'L', 'XL', 'XXL']),
      ],
      variants: ProductVariantHelper.generateVariants('19', ['#000000', '#2F4F4F', '#8B7355'], ['S', 'M', 'L', 'XL', 'XXL'], 69.99),
    ),
    ProductModel(
      id: '20',
      name: 'Athletic Track Pants',
      category: 'sweatpants',
      basePrice: 59.99,
      imageUrl: 'https://images.unsplash.com/photo-1552902865-b72c031ac5ea?w=500',
      rating: 4.6,
      reviewCount: 178,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#1E3A8A', '#DC143C']),
        ProductOption(name: 'Size', values: ['XS', 'S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants('20', ['#000000', '#1E3A8A', '#DC143C'], ['XS', 'S', 'M', 'L', 'XL'], 59.99),
    ),
    ProductModel(
      id: '21',
      name: 'Relaxed Fit Joggers',
      category: 'sweatpants',
      basePrice: 54.99,
      imageUrl: 'https://images.unsplash.com/photo-1517438476312-10d79c077509?w=500',
      rating: 4.5,
      reviewCount: 156,
      options: const [
        ProductOption(name: 'Color', values: ['#696969', '#000000', '#E0E0E0']),
        ProductOption(name: 'Size', values: ['S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants('21', ['#696969', '#000000', '#E0E0E0'], ['S', 'M', 'L', 'XL'], 54.99),
    ),
    ProductModel(
      id: '22',
      name: 'Premium Fleece Pants',
      category: 'sweatpants',
      basePrice: 74.99,
      imageUrl: 'https://images.unsplash.com/photo-1555689502-c4b22d76c56f?w=500',
      rating: 4.9,
      reviewCount: 289,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#2F4F4F', '#1E3A8A', '#8B4513']),
        ProductOption(name: 'Size', values: ['XS', 'S', 'M', 'L', 'XL', 'XXL']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '22',
        ['#000000', '#2F4F4F', '#1E3A8A', '#8B4513'],
        ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
        74.99,
      ),
    ),

    // JACKETS (5 products)
    ProductModel(
      id: '23',
      name: 'Classic Denim Jacket',
      category: 'jackets',
      basePrice: 99.99,
      imageUrl: 'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=500',
      rating: 4.8,
      reviewCount: 187,
      options: const [
        ProductOption(name: 'Color', values: ['#1E3A8A', '#A0522D', '#000000']),
        ProductOption(name: 'Size', values: ['S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants('23', ['#1E3A8A', '#A0522D', '#000000'], ['S', 'M', 'L', 'XL'], 99.99),
    ),
    ProductModel(
      id: '24',
      name: 'Bomber Flight Jacket',
      category: 'jackets',
      basePrice: 119.99,
      imageUrl: 'https://images.unsplash.com/photo-1591047139829-d91aecb6caea?w=500',
      rating: 4.7,
      reviewCount: 234,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#2F4F4F', '#8B4513']),
        ProductOption(name: 'Size', values: ['S', 'M', 'L', 'XL', 'XXL']),
      ],
      variants: ProductVariantHelper.generateVariants('24', ['#000000', '#2F4F4F', '#8B4513'], ['S', 'M', 'L', 'XL', 'XXL'], 119.99),
    ),
    ProductModel(
      id: '25',
      name: 'Windbreaker Shell',
      category: 'jackets',
      basePrice: 89.99,
      imageUrl: 'https://images.unsplash.com/photo-1544022613-e87ca75a784a?w=500',
      rating: 4.6,
      reviewCount: 167,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#1E3A8A', '#DC143C', '#228B22']),
        ProductOption(name: 'Size', values: ['XS', 'S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '25',
        ['#000000', '#1E3A8A', '#DC143C', '#228B22'],
        ['XS', 'S', 'M', 'L', 'XL'],
        89.99,
      ),
    ),
    ProductModel(
      id: '26',
      name: 'Leather Biker Jacket',
      category: 'jackets',
      basePrice: 149.99,
      imageUrl: 'https://images.unsplash.com/photo-1520975954732-35dd22299614?w=500',
      rating: 4.9,
      reviewCount: 312,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#8B4513']),
        ProductOption(name: 'Size', values: ['S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants('26', ['#000000', '#8B4513'], ['S', 'M', 'L', 'XL'], 149.99),
    ),
    ProductModel(
      id: '27',
      name: 'Puffer Vest',
      category: 'jackets',
      basePrice: 79.99,
      imageUrl: 'https://images.unsplash.com/photo-1610652492500-ded49ceeb378?w=500',
      rating: 4.5,
      reviewCount: 145,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#1E3A8A', '#DC143C']),
        ProductOption(name: 'Size', values: ['S', 'M', 'L', 'XL', 'XXL']),
      ],
      variants: ProductVariantHelper.generateVariants('27', ['#000000', '#1E3A8A', '#DC143C'], ['S', 'M', 'L', 'XL', 'XXL'], 79.99),
    ),

    // SHORTS (4 products)
    ProductModel(
      id: '28',
      name: 'Cargo Utility Shorts',
      category: 'shorts',
      basePrice: 49.99,
      imageUrl: 'https://images.unsplash.com/photo-1591195853828-11db59a44f6b?w=500',
      rating: 4.7,
      reviewCount: 198,
      options: const [
        ProductOption(name: 'Color', values: ['#8B7355', '#000000', '#2F4F4F']),
        ProductOption(name: 'Size', values: ['28', '30', '32', '34', '36']),
      ],
      variants: ProductVariantHelper.generateVariants('28', ['#8B7355', '#000000', '#2F4F4F'], ['28', '30', '32', '34', '36'], 49.99),
    ),
    ProductModel(
      id: '29',
      name: 'Athletic Performance Shorts',
      category: 'shorts',
      basePrice: 39.99,
      imageUrl: 'https://images.unsplash.com/photo-1519689373023-dd07c7988603?w=500',
      rating: 4.8,
      reviewCount: 267,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#1E3A8A', '#DC143C', '#228B22']),
        ProductOption(name: 'Size', values: ['XS', 'S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '29',
        ['#000000', '#1E3A8A', '#DC143C', '#228B22'],
        ['XS', 'S', 'M', 'L', 'XL'],
        39.99,
      ),
    ),
    ProductModel(
      id: '30',
      name: 'Denim Cut-Off Shorts',
      category: 'shorts',
      basePrice: 44.99,
      imageUrl: 'https://images.unsplash.com/photo-1591195853828-11db59a44f6b?w=500',
      rating: 4.6,
      reviewCount: 156,
      options: const [
        ProductOption(name: 'Color', values: ['#1E3A8A', '#87CEEB', '#000000']),
        ProductOption(name: 'Size', values: ['28', '30', '32', '34']),
      ],
      variants: ProductVariantHelper.generateVariants('30', ['#1E3A8A', '#87CEEB', '#000000'], ['28', '30', '32', '34'], 44.99),
    ),
    ProductModel(
      id: '31',
      name: 'Chino Casual Shorts',
      category: 'shorts',
      basePrice: 54.99,
      imageUrl: 'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=500',
      rating: 4.5,
      reviewCount: 134,
      options: const [
        ProductOption(name: 'Color', values: ['#8B7355', '#1E3A8A', '#000000', '#E0E0E0']),
        ProductOption(name: 'Size', values: ['28', '30', '32', '34', '36']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '31',
        ['#8B7355', '#1E3A8A', '#000000', '#E0E0E0'],
        ['28', '30', '32', '34', '36'],
        54.99,
      ),
    ),

    // ACCESSORIES (4 products)
    ProductModel(
      id: '32',
      name: 'Knit Beanie',
      category: 'accessories',
      basePrice: 24.99,
      imageUrl: 'https://images.unsplash.com/photo-1576871337632-b9aef4c17ab9?w=500',
      rating: 4.8,
      reviewCount: 289,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#1E3A8A', '#DC143C', '#E0E0E0']),
        ProductOption(name: 'Size', values: ['One Size']),
      ],
      variants: ProductVariantHelper.generateVariants('32', ['#000000', '#1E3A8A', '#DC143C', '#E0E0E0'], ['One Size'], 24.99),
    ),
    ProductModel(
      id: '33',
      name: 'Snapback Cap',
      category: 'accessories',
      basePrice: 29.99,
      imageUrl: 'https://images.unsplash.com/photo-1588850561407-ed78c282e89b?w=500',
      rating: 4.7,
      reviewCount: 234,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#FFFFFF', '#1E3A8A']),
        ProductOption(name: 'Size', values: ['One Size']),
      ],
      variants: ProductVariantHelper.generateVariants('33', ['#000000', '#FFFFFF', '#1E3A8A'], ['One Size'], 29.99),
    ),
    ProductModel(
      id: '34',
      name: 'Canvas Tote Bag',
      category: 'accessories',
      basePrice: 34.99,
      imageUrl: 'https://images.unsplash.com/photo-1590874103328-eac38a683ce7?w=500',
      rating: 4.9,
      reviewCount: 412,
      options: const [
        ProductOption(name: 'Color', values: ['#E0E0E0', '#000000', '#8B7355']),
        ProductOption(name: 'Size', values: ['One Size']),
      ],
      variants: ProductVariantHelper.generateVariants('34', ['#E0E0E0', '#000000', '#8B7355'], ['One Size'], 34.99),
    ),
    ProductModel(
      id: '35',
      name: 'Leather Belt',
      category: 'accessories',
      basePrice: 39.99,
      imageUrl: 'https://images.unsplash.com/photo-1624222247344-550fb60583bb?w=500',
      rating: 4.6,
      reviewCount: 178,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#8B4513', '#A0522D']),
        ProductOption(name: 'Size', values: ['S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants('35', ['#000000', '#8B4513', '#A0522D'], ['S', 'M', 'L', 'XL'], 39.99),
    ),
  ];

  static final List<ProductModel> _tShirts = [
    // Add remaining t-shirts here - keeping file concise for now
  ];

  static final List<ProductModel> _jeans = [
    // Add jeans here
  ];

  static final List<ProductModel> _sweatpants = [
    // Add sweatpants here
  ];

  static final List<ProductModel> _jackets = [
    // Add jackets here
  ];

  static final List<ProductModel> _shorts = [
    // Add shorts here
  ];

  static final List<ProductModel> _accessories = [
    // Add accessories here
  ];
}

/// Helper class to generate product variants
class ProductVariantHelper {
  ProductVariantHelper._();

  /// Generate variants for a product based on colors and sizes
  static List<ProductVariant> generateVariants(
    String productId,
    List<String> colors,
    List<String> sizes,
    double basePrice,
  ) {
    final variants = <ProductVariant>[];
    int variantIndex = 0;

    for (final color in colors) {
      for (final size in sizes) {
        variantIndex++;
        // Vary price slightly based on size
        double variantPrice = basePrice;
        if (size == 'XL' || size == 'XXL' || size == '36' || size == '38') {
          variantPrice += 5.0;
        } else if (size == 'XS' || size == '28') {
          variantPrice -= 3.0;
        }

        // Generate varied stock levels (0-50)
        final stock = (variantIndex * 7) % 51;

        variants.add(
          ProductVariant(
            id: '$productId-v$variantIndex',
            optionValues: {
              'Color': color,
              'Size': size,
            },
            price: variantPrice,
            stock: stock,
            sku: '$productId-${color.replaceAll('#', '')}-$size',
          ),
        );
      }
    }

    return variants;
  }
}
