class ColorHelper {
  static String getColorName(String hexColor) {
    final hex = hexColor.toLowerCase().replaceAll('#', '');

    // Map of common hex colors to names
    final colorMap = {
      '000000': 'Black',
      'ffffff': 'White',
      'e0e0e0': 'Light Gray',
      '808080': 'Gray',
      '696969': 'Dark Gray',
      '2f4f4f': 'Charcoal',
      '4a5568': 'Slate',
      '2d3748': 'Gunmetal',
      '1e3a8a': 'Navy Blue',
      '4682b4': 'Steel Blue',
      '87ceeb': 'Sky Blue',
      'dc143c': 'Crimson',
      'ff6b6b': 'Coral Red',
      '228b22': 'Forest Green',
      '8b4513': 'Saddle Brown',
      'a0522d': 'Sienna',
      '8b7355': 'Tan',
      'ffb6c1': 'Light Pink',
    };

    return colorMap[hex] ?? 'Color';
  }
}
