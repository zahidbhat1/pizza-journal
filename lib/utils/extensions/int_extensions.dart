import 'package:pizzajournals/presenter/assets.gen.dart';

extension IntX on int {
  AssetGenImage? get rankingImageAsset {
    switch (this) {
      case 1:
        return Assets.images.rankingGold;
      case 2:
        return Assets.images.rankingSilver;
      case 3:
        return Assets.images.rankingBronze;
      default:
        return null;
    }
  }

  String get ordinalNumber {
    switch (this % 10) {
      case 1:
        return '${this}st';
      case 2:
        return '${this}nd';
      case 3:
        return '${this}rd';
      default:
        return '${this}th';
    }
  }

  String get shortHandNumber {
    if (this >= 1000000) {
      return '${(this / 1000000).toStringAsFixed(1)}M';
    } else if (this >= 1000) {
      return '${(this / 1000).toStringAsFixed(1)}K';
    } else {
      return toString();
    }
  }

  String get monthName {
    const List<String> months = [
      'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',
      'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'
    ];

    return months[this - 1];
  }
}