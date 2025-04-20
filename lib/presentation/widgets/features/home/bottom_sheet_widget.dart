import 'package:flutter/material.dart';
import 'package:real_estate_app/common/constants/dimensions.dart';
import '../../../../common/constants/image_path.dart';
import 'asset_image_widget.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.sizeWidth(1),
      padding: EdgeInsets.all(6),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          AssetImageWidget(
            text: 'Gladkova St., 25',
            sliderWidth: 0.93,
          ),
          SizedBox(
            height: context.sizeHeight(0.4),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: AssetImageWidget(
                      imgPath: ImagePath.image3,
                      imgHeight: context.sizeHeight(0.5),
                      timing: 3600,
                      text: 'Gubina St., 11',
                      sliderWidth: 0.44,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        2,
                            (index) => Expanded(
                          child: AssetImageWidget(
                            imgPath: index.isEven
                                ? ImagePath.image1
                                : ImagePath.image2,
                            imgHeight: context.sizeHeight(0.4),
                            timing: 3650,
                            text:
                            index.isOdd ? 'Sedova St., 22' : 'Trefoleva., 43',
                            sliderWidth: 0.44,
                          ),
                        ),
                      ).columnInPadding(5),
                    ),
                  )
                ].rowInPadding(5)),
          ).padSymmetric(vertical: 5),
        ],
      ),
    );
  }
}
