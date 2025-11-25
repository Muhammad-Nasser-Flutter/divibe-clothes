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
      description:
          'Experience ultimate comfort with our Urban Comfort Hoodie. Crafted from premium soft cotton blend, this hoodie features a modern relaxed fit perfect for everyday wear. The adjustable drawstring hood and spacious kangaroo pocket add functionality to style.',
      category: 'hoodies',
      basePrice: 79.99,
      imageUrl: 'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=500',
      rating: 4.8,
      reviewCount: 124,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#8B4513', '#E0E0E0']),
        ProductOption(name: 'Size', values: ['XS', 'S', 'M', 'L', 'XL', 'XXL']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '1',
        ['#000000', '#8B4513', '#E0E0E0'],
        ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
        79.99,
        'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=500',
      ),
    ),
    ProductModel(
      id: '2',
      name: 'Cozy Vibes Hoodie',
      description:
          'Embrace the chill with the Cozy Vibes Hoodie. Made with ultra-soft fleece lining, it keeps you warm without compromising on style. Perfect for lounging at home or casual outings.',
      category: 'hoodies',
      basePrice: 74.99,
      imageUrl: 'https://images.unsplash.com/photo-1509631179647-0177331693ae?w=500',
      rating: 4.5,
      reviewCount: 98,
      options: const [
        ProductOption(name: 'Color', values: ['#E0E0E0', '#FFB6C1', '#87CEEB']),
        ProductOption(name: 'Size', values: ['S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '2',
        ['#E0E0E0', '#FFB6C1', '#87CEEB'],
        ['S', 'M', 'L', 'XL'],
        74.99,
        'https://images.unsplash.com/photo-1509631179647-0177331693ae?w=500',
      ),
    ),
    ProductModel(
      id: '3',
      name: 'Oversized Street Hoodie',
      description:
          'Make a statement with our Oversized Street Hoodie. Featuring a trendy drop-shoulder design and heavyweight fabric, this piece defines modern streetwear aesthetics. Durable and stylish.',
      category: 'hoodies',
      basePrice: 89.99,
      imageUrl: 'https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?w=500',
      rating: 4.9,
      reviewCount: 203,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#FFFFFF', '#FF6B6B']),
        ProductOption(name: 'Size', values: ['M', 'L', 'XL', 'XXL']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '3',
        ['#000000', '#FFFFFF', '#FF6B6B'],
        ['M', 'L', 'XL', 'XXL'],
        89.99,
        'https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?w=500',
      ),
    ),
    ProductModel(
      id: '4',
      name: 'Vintage Washed Hoodie',
      description:
          'Achieve that perfect lived-in look with our Vintage Washed Hoodie. The unique garment-dye process gives each piece a distinct, retro character. Soft, comfortable, and effortlessly cool.',
      category: 'hoodies',
      basePrice: 84.99,
      imageUrl: 'https://images.unsplash.com/photo-1578587018452-892bacefd3f2?w=500',
      rating: 4.7,
      reviewCount: 156,
      options: const [
        ProductOption(name: 'Color', values: ['#8B7355', '#2F4F4F', '#696969']),
        ProductOption(name: 'Size', values: ['XS', 'S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '4',
        ['#8B7355', '#2F4F4F', '#696969'],
        ['XS', 'S', 'M', 'L', 'XL'],
        84.99,
        'https://images.unsplash.com/photo-1578587018452-892bacefd3f2?w=500',
      ),
    ),
    ProductModel(
      id: '5',
      name: 'Tech Fleece Hoodie',
      description:
          'Engineered for performance and style, the Tech Fleece Hoodie offers lightweight warmth. The sleek design and moisture-wicking fabric make it ideal for active lifestyles or modern urban looks.',
      category: 'hoodies',
      basePrice: 94.99,
      imageUrl: 'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=500',
      rating: 4.8,
      reviewCount: 187,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#1E3A8A', '#2D3748']),
        ProductOption(name: 'Size', values: ['S', 'M', 'L', 'XL', 'XXL']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '5',
        ['#000000', '#1E3A8A', '#2D3748'],
        ['S', 'M', 'L', 'XL', 'XXL'],
        94.99,
        'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=500',
      ),
    ),
    ProductModel(
      id: '6',
      name: 'Graphic Print Hoodie',
      description:
          'Stand out from the crowd with our Graphic Print Hoodie. Featuring bold, high-quality prints on a classic silhouette, this hoodie is a canvas for self-expression.',
      category: 'hoodies',
      basePrice: 79.99,
      imageUrl: 'https://images.unsplash.com/photo-1620799140188-3b2a02fd9a77?w=500',
      rating: 4.6,
      reviewCount: 142,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#FFFFFF', '#4A5568']),
        ProductOption(name: 'Size', values: ['XS', 'S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '6',
        ['#000000', '#FFFFFF', '#4A5568'],
        ['XS', 'S', 'M', 'L', 'XL'],
        79.99,
        'https://images.unsplash.com/photo-1620799140188-3b2a02fd9a77?w=500',
      ),
    ),

    // T-SHIRTS (6 products)
    ProductModel(
      id: '7',
      name: 'Essential Graphic Tee',
      description:
          'Your new go-to tee. The Essential Graphic Tee combines soft cotton fabric with minimalist graphics for a versatile look that pairs with anything.',
      category: 't-shirts',
      basePrice: 34.99,
      imageUrl: 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=500',
      rating: 4.9,
      reviewCount: 256,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#FFFFFF', '#808080']),
        ProductOption(name: 'Size', values: ['XS', 'S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '7',
        ['#000000', '#FFFFFF', '#808080'],
        ['XS', 'S', 'M', 'L', 'XL'],
        34.99,
        'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=500',
      ),
    ),
    ProductModel(
      id: '8',
      name: 'Vintage Band Tee',
      description:
          'Rock the retro look with our Vintage Band Tee. Soft, washed fabric and classic rock-inspired graphics give this tee an authentic vintage feel.',
      category: 't-shirts',
      basePrice: 39.99,
      imageUrl: 'https://images.unsplash.com/photo-1503341504253-dff4815485f1?w=500',
      rating: 4.7,
      reviewCount: 189,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#8B4513', '#2F4F4F']),
        ProductOption(name: 'Size', values: ['S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '8',
        ['#000000', '#8B4513', '#2F4F4F'],
        ['S', 'M', 'L', 'XL'],
        39.99,
        'https://images.unsplash.com/photo-1503341504253-dff4815485f1?w=500',
      ),
    ),
    ProductModel(
      id: '9',
      name: 'Oversized Plain Tee',
      description:
          'Simplicity meets modern style. The Oversized Plain Tee offers a boxy, relaxed fit in premium heavy cotton. A wardrobe staple for any streetwear enthusiast.',
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
        'https://images.unsplash.com/photo-1581655353564-df123a1eb820?w=500',
      ),
    ),
    ProductModel(
      id: '10',
      name: 'Striped Retro Tee',
      description:
          'Add a pop of pattern with the Striped Retro Tee. Classic horizontal stripes in vintage colorways bring a nostalgic 90s vibe to your casual rotation.',
      category: 't-shirts',
      basePrice: 36.99,
      imageUrl: 'https://images.unsplash.com/photo-1562157873-818bc0726f68?w=500',
      rating: 4.6,
      reviewCount: 145,
      options: const [
        ProductOption(name: 'Color', values: ['#1E3A8A', '#DC143C', '#228B22']),
        ProductOption(name: 'Size', values: ['S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '10',
        ['#1E3A8A', '#DC143C', '#228B22'],
        ['S', 'M', 'L', 'XL'],
        36.99,
        'https://images.unsplash.com/photo-1562157873-818bc0726f68?w=500',
      ),
    ),
    ProductModel(
      id: '11',
      name: 'Premium Cotton Tee',
      description:
          'Luxury you can feel. Our Premium Cotton Tee is crafted from 100% organic Supima cotton for unmatched softness and durability. The perfect base layer.',
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
        'https://images.unsplash.com/photo-1583743814966-8936f5b7be1a?w=500',
      ),
    ),
    ProductModel(
      id: '12',
      name: 'Pocket Detail Tee',
      description:
          'A subtle twist on a classic. The Pocket Detail Tee features a functional chest pocket and a comfortable regular fit. Casual, practical, and stylish.',
      category: 't-shirts',
      basePrice: 32.99,
      imageUrl: 'https://images.unsplash.com/photo-1618354691373-d851c5c3a990?w=500',
      rating: 4.5,
      reviewCount: 167,
      options: const [
        ProductOption(name: 'Color', values: ['#FFFFFF', '#87CEEB', '#FFB6C1']),
        ProductOption(name: 'Size', values: ['S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '12',
        ['#FFFFFF', '#87CEEB', '#FFB6C1'],
        ['S', 'M', 'L', 'XL'],
        32.99,
        'https://images.unsplash.com/photo-1618354691373-d851c5c3a990?w=500',
      ),
    ),

    // JEANS (5 products)
    ProductModel(
      id: '13',
      name: 'Streetwise Denim',
      description:
          'Rugged and ready. Streetwise Denim jeans offer a durable construction with a modern tapered fit. Perfect for the urban explorer.',
      category: 'jeans',
      basePrice: 89.99,
      imageUrl:
          'https://rukminim2.flixcart.com/image/480/640/xif0q/jacket/b/n/k/l-1-no-jakt-denim-lgrey-01-urbano-fashion-original-imah6j9fqyprj3zc.jpeg?q=90',
      rating: 4.6,
      reviewCount: 89,
      options: const [
        ProductOption(name: 'Color', values: ['#1E3A8A', '#000000']),
        ProductOption(name: 'Size', values: ['28', '30', '32', '34', '36']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '13',
        ['#1E3A8A', '#000000'],
        ['28', '30', '32', '34', '36'],
        89.99,
        'https://rukminim2.flixcart.com/image/480/640/xif0q/jacket/b/n/k/l-1-no-jakt-denim-lgrey-01-urbano-fashion-original-imah6j9fqyprj3zc.jpeg?q=90',
      ),
    ),
    ProductModel(
      id: '14',
      name: 'Slim Fit Black Jeans',
      description:
          'Sleek and versatile. Our Slim Fit Black Jeans are a wardrobe essential. The stretch denim ensures comfort while maintaining a sharp, tailored silhouette.',
      category: 'jeans',
      basePrice: 79.99,
      imageUrl: 'https://images.unsplash.com/photo-1604176354204-9268737828e4?w=500',
      rating: 4.7,
      reviewCount: 234,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#2F4F4F']),
        ProductOption(name: 'Size', values: ['28', '30', '32', '34', '36', '38']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '14',
        ['#000000', '#2F4F4F'],
        ['28', '30', '32', '34', '36', '38'],
        79.99,
        'https://images.unsplash.com/photo-1604176354204-9268737828e4?w=500',
      ),
    ),
    ProductModel(
      id: '15',
      name: 'Distressed Wide Leg',
      description:
          'Edgy and relaxed. The Distressed Wide Leg jeans feature authentic rip-and-repair details and a comfortable loose fit for a bold streetwear look.',
      category: 'jeans',
      basePrice: 94.99,
      imageUrl: 'https://images.unsplash.com/photo-1475178626620-a4d074967452?w=500',
      rating: 4.8,
      reviewCount: 176,
      options: const [
        ProductOption(name: 'Color', values: ['#1E3A8A', '#87CEEB']),
        ProductOption(name: 'Size', values: ['28', '30', '32', '34', '36']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '15',
        ['#1E3A8A', '#87CEEB'],
        ['28', '30', '32', '34', '36'],
        94.99,
        'https://images.unsplash.com/photo-1475178626620-a4d074967452?w=500',
      ),
    ),
    ProductModel(
      id: '16',
      name: 'Straight Leg Classic',
      description:
          'Timeless style. These Straight Leg Classic jeans offer a traditional fit that never goes out of fashion. Made from high-quality denim that gets better with age.',
      category: 'jeans',
      basePrice: 84.99,
      imageUrl: 'https://images.unsplash.com/photo-1541099649105-f69ad21f3246?w=500',
      rating: 4.5,
      reviewCount: 198,
      options: const [
        ProductOption(name: 'Color', values: ['#1E3A8A', '#000000', '#696969']),
        ProductOption(name: 'Size', values: ['29', '30', '32', '34', '36']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '16',
        ['#1E3A8A', '#000000', '#696969'],
        ['29', '30', '32', '34', '36'],
        84.99,
        'https://images.unsplash.com/photo-1541099649105-f69ad21f3246?w=500',
      ),
    ),
    ProductModel(
      id: '17',
      name: 'Vintage Wash Denim',
      description:
          'Old-school cool. Our Vintage Wash Denim features a carefully curated fade pattern for that authentic broken-in look from day one.',
      category: 'jeans',
      basePrice: 99.99,
      imageUrl: 'https://images.unsplash.com/photo-1582552938357-32b906df40cb?w=500',
      rating: 4.9,
      reviewCount: 267,
      options: const [
        ProductOption(name: 'Color', values: ['#4682B4', '#87CEEB']),
        ProductOption(name: 'Size', values: ['28', '30', '32', '34', '36']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '17',
        ['#4682B4', '#87CEEB'],
        ['28', '30', '32', '34', '36'],
        99.99,
        'https://images.unsplash.com/photo-1582552938357-32b906df40cb?w=500',
      ),
    ),

    // SWEATPANTS (5 products)
    ProductModel(
      id: '18',
      name: 'Chill Zone Sweatpants',
      description:
          'Maximum relaxation. Chill Zone Sweatpants are designed for downtime, featuring a soft brushed interior and an easy elastic waistband.',
      category: 'sweatpants',
      basePrice: 64.99,
      imageUrl: 'https://images.unsplash.com/photo-1506629082955-511b1aa562c8?w=500',
      rating: 4.7,
      reviewCount: 142,
      options: const [
        ProductOption(name: 'Color', values: ['#1E3A8A', '#000000', '#E0E0E0']),
        ProductOption(name: 'Size', values: ['XS', 'S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '18',
        ['#1E3A8A', '#000000', '#E0E0E0'],
        ['XS', 'S', 'M', 'L', 'XL'],
        64.99,
        'https://images.unsplash.com/photo-1506629082955-511b1aa562c8?w=500',
      ),
    ),
    ProductModel(
      id: '19',
      name: 'Cargo Joggers',
      description:
          'Utility meets comfort. Cargo Joggers combine the soft feel of sweatpants with functional cargo pockets. The tapered ankle cuffs provide a clean look.',
      category: 'sweatpants',
      basePrice: 69.99,
      imageUrl: 'https://images.unsplash.com/photo-1624378439575-d8705ad7ae80?w=500',
      rating: 4.8,
      reviewCount: 213,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#2F4F4F', '#8B7355']),
        ProductOption(name: 'Size', values: ['S', 'M', 'L', 'XL', 'XXL']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '19',
        ['#000000', '#2F4F4F', '#8B7355'],
        ['S', 'M', 'L', 'XL', 'XXL'],
        69.99,
        'https://images.unsplash.com/photo-1624378439575-d8705ad7ae80?w=500',
      ),
    ),
    ProductModel(
      id: '20',
      name: 'Athletic Track Pants',
      description:
          'Ready for action. These Athletic Track Pants feature breathable, quick-dry fabric and a streamlined fit, perfect for workouts or sporty street style.',
      category: 'sweatpants',
      basePrice: 59.99,
      imageUrl: 'https://images.unsplash.com/photo-1552902865-b72c031ac5ea?w=500',
      rating: 4.6,
      reviewCount: 178,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#1E3A8A', '#DC143C']),
        ProductOption(name: 'Size', values: ['XS', 'S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '20',
        ['#000000', '#1E3A8A', '#DC143C'],
        ['XS', 'S', 'M', 'L', 'XL'],
        59.99,
        'https://images.unsplash.com/photo-1552902865-b72c031ac5ea?w=500',
      ),
    ),
    ProductModel(
      id: '21',
      name: 'Relaxed Fit Joggers',
      description:
          'Everyday comfort. Relaxed Fit Joggers offer a roomy fit through the leg with a secure cuff. The perfect balance of lounge and lifestyle.',
      category: 'sweatpants',
      basePrice: 54.99,
      imageUrl: 'https://images.unsplash.com/photo-1517438476312-10d79c077509?w=500',
      rating: 4.5,
      reviewCount: 156,
      options: const [
        ProductOption(name: 'Color', values: ['#696969', '#000000', '#E0E0E0']),
        ProductOption(name: 'Size', values: ['S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '21',
        ['#696969', '#000000', '#E0E0E0'],
        ['S', 'M', 'L', 'XL'],
        54.99,
        'https://images.unsplash.com/photo-1517438476312-10d79c077509?w=500',
      ),
    ),
    ProductModel(
      id: '22',
      name: 'Premium Fleece Pants',
      description:
          'Elevated loungewear. Premium Fleece Pants are crafted from high-density fleece for superior warmth and a structured, premium feel.',
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
        'https://images.unsplash.com/photo-1555689502-c4b22d76c56f?w=500',
      ),
    ),

    // JACKETS (5 products)
    ProductModel(
      id: '23',
      name: 'Classic Denim Jacket',
      description:
          'An icon of style. The Classic Denim Jacket is a versatile layer that works with everything. Durable denim construction with timeless detailing.',
      category: 'jackets',
      basePrice: 99.99,
      imageUrl: 'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=500',
      rating: 4.8,
      reviewCount: 187,
      options: const [
        ProductOption(name: 'Color', values: ['#1E3A8A', '#A0522D', '#000000']),
        ProductOption(name: 'Size', values: ['S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '23',
        ['#1E3A8A', '#A0522D', '#000000'],
        ['S', 'M', 'L', 'XL'],
        99.99,
        'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=500',
      ),
    ),
    ProductModel(
      id: '24',
      name: 'Bomber Flight Jacket',
      description:
          'Aviation inspired. The Bomber Flight Jacket features a classic silhouette with ribbed cuffs and hem. Lightweight yet warm, it\'s a perfect transitional piece.',
      category: 'jackets',
      basePrice: 119.99,
      imageUrl: 'https://images.unsplash.com/photo-1591047139829-d91aecb6caea?w=500',
      rating: 4.7,
      reviewCount: 234,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#2F4F4F', '#8B4513']),
        ProductOption(name: 'Size', values: ['S', 'M', 'L', 'XL', 'XXL']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '24',
        ['#000000', '#2F4F4F', '#8B4513'],
        ['S', 'M', 'L', 'XL', 'XXL'],
        119.99,
        'https://images.unsplash.com/photo-1591047139829-d91aecb6caea?w=500',
      ),
    ),
    ProductModel(
      id: '25',
      name: 'Windbreaker Shell',
      description:
          'Weather the elements. Our Windbreaker Shell is lightweight, water-resistant, and packable. The color-block design adds a retro sporty touch.',
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
        'https://images.unsplash.com/photo-1544022613-e87ca75a784a?w=500',
      ),
    ),
    ProductModel(
      id: '26',
      name: 'Leather Biker Jacket',
      description:
          'Rebel attitude. The Leather Biker Jacket is made from premium faux leather with authentic moto details. A bold statement piece for any outfit.',
      category: 'jackets',
      basePrice: 149.99,
      imageUrl: 'https://images.unsplash.com/photo-1520975954732-35dd22299614?w=500',
      rating: 4.9,
      reviewCount: 312,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#8B4513']),
        ProductOption(name: 'Size', values: ['S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '26',
        ['#000000', '#8B4513'],
        ['S', 'M', 'L', 'XL'],
        149.99,
        'https://images.unsplash.com/photo-1520975954732-35dd22299614?w=500',
      ),
    ),
    ProductModel(
      id: '27',
      name: 'Puffer Vest',
      description:
          'Core warmth. The Puffer Vest offers essential insulation without the bulk of a full jacket. Great for layering over hoodies or flannels.',
      category: 'jackets',
      basePrice: 79.99,
      imageUrl: 'https://images.unsplash.com/photo-1610652492500-ded49ceeb378?w=500',
      rating: 4.5,
      reviewCount: 145,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#1E3A8A', '#DC143C']),
        ProductOption(name: 'Size', values: ['S', 'M', 'L', 'XL', 'XXL']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '27',
        ['#000000', '#1E3A8A', '#DC143C'],
        ['S', 'M', 'L', 'XL', 'XXL'],
        79.99,
        'https://images.unsplash.com/photo-1610652492500-ded49ceeb378?w=500',
      ),
    ),

    // SHORTS (4 products)
    ProductModel(
      id: '28',
      name: 'Cargo Utility Shorts',
      description:
          'Function first. Cargo Utility Shorts feature multiple pockets for all your essentials. Durable fabric and a comfortable fit make them ready for adventure.',
      category: 'shorts',
      basePrice: 49.99,
      imageUrl: 'https://images.unsplash.com/photo-1591195853828-11db59a44f6b?w=500',
      rating: 4.7,
      reviewCount: 198,
      options: const [
        ProductOption(name: 'Color', values: ['#8B7355', '#000000', '#2F4F4F']),
        ProductOption(name: 'Size', values: ['28', '30', '32', '34', '36']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '28',
        ['#8B7355', '#000000', '#2F4F4F'],
        ['28', '30', '32', '34', '36'],
        49.99,
        'https://images.unsplash.com/photo-1591195853828-11db59a44f6b?w=500',
      ),
    ),
    ProductModel(
      id: '29',
      name: 'Athletic Performance Shorts',
      description:
          'Train hard. Athletic Performance Shorts are built with moisture-wicking technology and a lightweight stretch fabric for unrestricted movement.',
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
        'https://images.unsplash.com/photo-1519689373023-dd07c7988603?w=500',
      ),
    ),
    ProductModel(
      id: '30',
      name: 'Denim Cut-Off Shorts',
      description:
          'Summer staple. Denim Cut-Off Shorts bring a raw, edgy vibe to your warm-weather wardrobe. Distressed hem and authentic wash.',
      category: 'shorts',
      basePrice: 44.99,
      imageUrl: 'https://images.unsplash.com/photo-1591195853828-11db59a44f6b?w=500',
      rating: 4.6,
      reviewCount: 156,
      options: const [
        ProductOption(name: 'Color', values: ['#1E3A8A', '#87CEEB', '#000000']),
        ProductOption(name: 'Size', values: ['28', '30', '32', '34']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '30',
        ['#1E3A8A', '#87CEEB', '#000000'],
        ['28', '30', '32', '34'],
        44.99,
        'https://images.unsplash.com/photo-1591195853828-11db59a44f6b?w=500',
      ),
    ),
    ProductModel(
      id: '31',
      name: 'Chino Casual Shorts',
      description:
          'Smart casual. Chino Casual Shorts offer a polished look with the comfort of soft cotton twill. Perfect for weekend brunches or beach days.',
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
        'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=500',
      ),
    ),

    // ACCESSORIES (4 products)
    ProductModel(
      id: '32',
      name: 'Knit Beanie',
      description:
          'Top it off. Our Knit Beanie is a classic winter essential. Soft, stretchy rib-knit fabric keeps you warm and stylish in cold weather.',
      category: 'accessories',
      basePrice: 24.99,
      imageUrl: 'https://images.unsplash.com/photo-1576871337632-b9aef4c17ab9?w=500',
      rating: 4.8,
      reviewCount: 289,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#1E3A8A', '#DC143C', '#E0E0E0']),
        ProductOption(name: 'Size', values: ['One Size']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '32',
        ['#000000', '#1E3A8A', '#DC143C', '#E0E0E0'],
        ['One Size'],
        24.99,
        'https://images.unsplash.com/photo-1576871337632-b9aef4c17ab9?w=500',
      ),
    ),
    ProductModel(
      id: '33',
      name: 'Snapback Cap',
      description:
          'Streetwear essential. The Snapback Cap features a structured crown, flat brim, and adjustable snap closure. Finished with premium embroidery.',
      category: 'accessories',
      basePrice: 29.99,
      imageUrl: 'https://images.unsplash.com/photo-1588850561407-ed78c282e89b?w=500',
      rating: 4.7,
      reviewCount: 234,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#FFFFFF', '#1E3A8A']),
        ProductOption(name: 'Size', values: ['One Size']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '33',
        ['#000000', '#FFFFFF', '#1E3A8A'],
        ['One Size'],
        29.99,
        'https://images.unsplash.com/photo-1588850561407-ed78c282e89b?w=500',
      ),
    ),
    ProductModel(
      id: '34',
      name: 'Canvas Tote Bag',
      description:
          'Carry it all. The Canvas Tote Bag is durable, spacious, and eco-friendly. Perfect for grocery runs, beach trips, or carrying your daily gear.',
      category: 'accessories',
      basePrice: 34.99,
      imageUrl: 'https://images.unsplash.com/photo-1590874103328-eac38a683ce7?w=500',
      rating: 4.9,
      reviewCount: 412,
      options: const [
        ProductOption(name: 'Color', values: ['#E0E0E0', '#000000', '#8B7355']),
        ProductOption(name: 'Size', values: ['One Size']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '34',
        ['#E0E0E0', '#000000', '#8B7355'],
        ['One Size'],
        34.99,
        'https://images.unsplash.com/photo-1590874103328-eac38a683ce7?w=500',
      ),
    ),
    ProductModel(
      id: '35',
      name: 'Leather Belt',
      description:
          'The finishing touch. Our Leather Belt is crafted from genuine leather with a classic metal buckle. Durable and stylish, it complements any jeans or chinos.',
      category: 'accessories',
      basePrice: 39.99,
      imageUrl: 'https://images.unsplash.com/photo-1624222247344-550fb60583bb?w=500',
      rating: 4.6,
      reviewCount: 178,
      options: const [
        ProductOption(name: 'Color', values: ['#000000', '#8B4513', '#A0522D']),
        ProductOption(name: 'Size', values: ['S', 'M', 'L', 'XL']),
      ],
      variants: ProductVariantHelper.generateVariants(
        '35',
        ['#000000', '#8B4513', '#A0522D'],
        ['S', 'M', 'L', 'XL'],
        39.99,
        'https://images.unsplash.com/photo-1624222247344-550fb60583bb?w=500',
      ),
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
    String imageUrl,
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
            imageUrl: imageUrl,
          ),
        );
      }
    }

    return variants;
  }
}
