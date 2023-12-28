import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:schooglink/utils/scaling.dart';

import '../routes/app_routes.dart';
import '../utils/app_decoration.dart';
import '../utils/app_style.dart';
import '../utils/color_constants.dart';
import '../viewmodels/breed_list_controller.dart';
import '../widgets/custom_image_veiw.dart';

class BreedListScreen extends GetWidget<BreedListController> {
  @override
  Widget build(BuildContext context) {
    Scaling scale = Scaling(context: context)..setCurrentDeviceSize();
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: AppBar(
          toolbarHeight: 48,
          forceMaterialTransparency: true,
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Dog Breeds',
            style: AppStyle.txtInterMedium24,
          ),
        ),
        body: Obx(() {
          if (controller.dogBreeds.length == 0) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text(
                    'Fetching Data !',
                    style: AppStyle.txtInterMedium15,
                  ),
                ],
              ),
            );
          } else {
            return SingleChildScrollView(
                child: Container(
              width: double.maxFinite,
              padding: scale.getPadding(
                left: 24,
                right: 24,
                bottom: 7,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: scale.getPadding(
                      top: 7,
                    ),
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (
                        context,
                        index,
                      ) {
                        return SizedBox(
                          height: scale.getScaledHeight(12),
                        );
                      },
                      itemCount: controller.dogBreeds.length,
                      itemBuilder: (context, index) {
                        Future<String> imageUrl = controller.fetchDogImage(controller.dogBreeds.value[index].referenceImageId);
                        return Container(
                          padding: scale.getPadding(
                            top: 7,
                            bottom: 7,
                          ),
                          decoration: AppDecoration.outlineBluegray6000f.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder16,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FutureBuilder<String>(
                                future: imageUrl,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return SizedBox(
                                      height: scale.getScaledHeight(107),
                                      width: scale.getScaledWidth(79),
                                      child: Center(child: CircularProgressIndicator()),
                                    );
                                  } else if (snapshot.hasError || !snapshot.hasData || snapshot.data == null) {
                                    return CustomImageView(
                                      svgPath: 'assets/images/image_not_found.svg', // Provide a default image path or handle appropriately
                                      height: scale.getScaledHeight(80),
                                      width: scale.getScaledWidth(80),
                                      radius: BorderRadius.circular(scale.getScaledHeight(10)),
                                      alignment: Alignment.center,
                                    );
                                  } else {
                                    return Card(
                                      clipBehavior: Clip.antiAlias,
                                      elevation: 0,
                                      margin: scale.getMargin(top: 10),
                                      color: ColorConstant.orange200,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadiusStyle.roundedBorder10,
                                      ),
                                      child: Container(
                                        height: scale.getScaledHeight(80),
                                        width: scale.getScaledWidth(80),
                                        decoration: AppDecoration.fillWhiteA700.copyWith(
                                          borderRadius: BorderRadiusStyle.roundedBorder10,
                                        ),
                                        child: Image.network(
                                          snapshot.data!,
                                          height: scale.getScaledHeight(80),
                                          width: scale.getScaledWidth(80),
                                          fit: BoxFit.fill,
                                          loadingBuilder: (context, child, loadingProgress) {
                                            if (loadingProgress == null) return child;
                                            return Center(child: CircularProgressIndicator());
                                          },
                                          errorBuilder: (context, error, stackTrace) {
                                            return CustomImageView(
                                              svgPath: 'assets/images/image_not_found.svg', // Provide a default image path or handle appropriately
                                              height: scale.getScaledHeight(80),
                                              width: scale.getScaledWidth(80),
                                              radius: BorderRadius.circular(scale.getScaledHeight(10)),
                                              alignment: Alignment.center,
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                              Padding(
                                padding: scale.getPadding(top: 5, bottom: 4, left: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: scale.getScaledWidth(210),
                                      child: Text(
                                        'Name : ${controller.dogBreeds.value[index].name}',
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        maxLines: 2,
                                        style: AppStyle.txtInterMedium15.copyWith(color: ColorConstant.indigoA200),
                                      ),
                                    ),
                                    if (controller.dogBreeds.value[index].breedGroup != null && controller.dogBreeds.value[index].breedGroup != "")
                                      detailRow(
                                        scale,
                                        index,
                                        'Breed Group',
                                        '${controller.dogBreeds.value[index].breedGroup}',
                                      ),
                                    if (controller.dogBreeds.value[index].bredFor != null && controller.dogBreeds.value[index].bredFor != "")
                                      detailRow(
                                        scale,
                                        index,
                                        'Bred For',
                                        '${controller.dogBreeds.value[index].bredFor}',
                                      ),
                                    if (controller.dogBreeds.value[index].lifeSpan != null && controller.dogBreeds.value[index].lifeSpan != "")
                                      detailRow(
                                        scale,
                                        index,
                                        'Life Span',
                                        '${controller.dogBreeds.value[index].lifeSpan}',
                                      ),
                                    if (controller.dogBreeds.value[index].temperament != null && controller.dogBreeds.value[index].temperament != "")
                                      detailRow(
                                        scale,
                                        index,
                                        'Temprament',
                                        '${controller.dogBreeds.value[index].temperament}',
                                      ),
                                    if (controller.dogBreeds.value[index].description != null && controller.dogBreeds.value[index].description != "")
                                      detailRow(
                                        scale,
                                        index,
                                        'Description',
                                        '${controller.dogBreeds.value[index].description}',
                                      ),
                                    if (controller.dogBreeds.value[index].history != null && controller.dogBreeds.value[index].history != "")
                                      detailRow(
                                        scale,
                                        index,
                                        'History',
                                        '${controller.dogBreeds.value[index].history}',
                                      ),
                                    if (controller.dogBreeds.value[index].origin != null && controller.dogBreeds.value[index].origin != "")
                                      detailRow(
                                        scale,
                                        index,
                                        'Origin',
                                        '${controller.dogBreeds.value[index].origin}',
                                      ),
                                    if (controller.dogBreeds.value[index].countryCode != null && controller.dogBreeds.value[index].countryCode != "")
                                      detailRow(
                                        scale,
                                        index,
                                        'Country Code',
                                        '${controller.dogBreeds.value[index].countryCode}',
                                      ),
                                    if (controller.dogBreeds.value[index].height.imperial != null &&
                                        controller.dogBreeds.value[index].height.imperial != "")
                                      detailRow(
                                        scale,
                                        index,
                                        'Height Imperial',
                                        '${controller.dogBreeds.value[index].height.imperial}',
                                      ),
                                    if (controller.dogBreeds.value[index].height.metric != null &&
                                        controller.dogBreeds.value[index].height.metric != "")
                                      detailRow(
                                        scale,
                                        index,
                                        'Height Metric',
                                        '${controller.dogBreeds.value[index].height.metric}',
                                      ),
                                    if (controller.dogBreeds.value[index].weight.imperial != null &&
                                        controller.dogBreeds.value[index].weight.imperial != "")
                                      detailRow(
                                        scale,
                                        index,
                                        'Weight Imperial',
                                        '${controller.dogBreeds.value[index].weight.imperial}',
                                      ),
                                    if (controller.dogBreeds.value[index].weight.metric != null &&
                                        controller.dogBreeds.value[index].weight.metric != "")
                                      detailRow(
                                        scale,
                                        index,
                                        'Weight Metric',
                                        '${controller.dogBreeds.value[index].weight.metric}',
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ));
          }
        }),
      ),
    );
  }

  Container detailRow(Scaling scale, int index, String text, String subtext) {
    return Container(
      width: scale.getScaledWidth(
        210,
      ),
      margin: scale.getMargin(
        top: 2,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '$text : ',
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtInterRegular13.copyWith(color: ColorConstant.gray900, fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: Text(
              '$subtext',
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterRegular13.copyWith(color: ColorConstant.gray900),
            ),
          ),
        ],
      ),
    );
  }
}
