import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:photosapp/ui/theme/colors.dart';
import 'package:photosapp/ui/screens/single_photo/single_photo_viewmodel.dart';

class SinglePhotoScreen extends StatefulWidget {
  const SinglePhotoScreen({Key? key}) : super(key: key);

  @override
  State<SinglePhotoScreen> createState() => _SinglePhotoScreenState();
}

class _SinglePhotoScreenState extends State<SinglePhotoScreen> {
  @override
  Widget build(BuildContext context) {
    final photo = context.watch<SinglePhotoViewModel>().photo;
    final model = context.read<SinglePhotoViewModel>();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  photo.fullUrl,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () => model.goBack(context),
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.mainColorStart,
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 65,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: AppColors.mainColorStart,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        photo.name,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        photo.userName,
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w300,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
