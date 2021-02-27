import 'package:city_pass/models/activity.dart';
import 'package:city_pass/shared/timetable_row.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';

class ActivityInfo extends StatelessWidget {
  final Activity activity;
  const ActivityInfo({
    Key key,
    @required this.activity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text(
                "Là một trong những công trình mang tính lịch sử và lâu đời nhất TP. HCM, Thảo Cầm Viên Sài Gòn không chỉ là một di tích lịch sử mà còn là biểu tượng văn hóa đặc trưng của thành phố. \n\nĐược xây dựng cùng lúc với Bưu điện TP. HCM, Nhà thờ Đức Bà và chợ Bến Thành, Thảo Cầm Viên Sài Gòn được xem như một chứng nhân của lịch sử, đã cùng đi qua những thăng trầm của con người và vùng đất này. \n\nSức sống bền bỉ cùng những giá trị văn hóa đặc trưng đã mang đến cho Thảo Cầm Viên Sài Gòn một sắc thái riêng biệt và không thể nhầm lẫn với bất kỳ nơi nào khác.", //Replace with activity description
                style: TextStyle(fontSize: 14, height: 1.4),
              ),
            ),
          ),
          VerticalSpacing(of: 40),
          SingleChildScrollView(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                  //Replace with activity images
                  3,
                  (index) => Padding(
                    padding: index != 0 ? EdgeInsets.only(left:20) : EdgeInsets.zero,
                    child: SizedBox(
                      width: 330,
                      child: AspectRatio(
                        aspectRatio: 1.5,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/images/thao_cam_vien.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          VerticalSpacing(of: 50),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Thời gian hoạt động",
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                  VerticalSpacing(of: 10),
                  TimetableRow(dayOfWeek: "Thứ hai", openTime: "07:00 - 17:30"),
                  TimetableRow(dayOfWeek: "Thứ ba", openTime: "07:00 - 17:30"),
                  TimetableRow(dayOfWeek: "Thứ tư", openTime: "07:00 - 17:30"),
                  TimetableRow(dayOfWeek: "Thứ năm", openTime: "07:00 - 17:30"),
                  TimetableRow(dayOfWeek: "Thứ sáu", openTime: "07:00 - 17:30"),
                  TimetableRow(dayOfWeek: "Thứ bảy", openTime: "07:00 - 17:30"),
                  TimetableRow(
                      dayOfWeek: "Chủ nhật", openTime: "07:00 - 17:30"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
