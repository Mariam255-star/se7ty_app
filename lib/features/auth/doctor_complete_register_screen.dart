import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:se7ty_app/core/utils/colors.dart';
import 'package:se7ty_app/features/auth/models/specializations.dart';

class DoctorCompleteRegisterScreen extends StatefulWidget {
  const DoctorCompleteRegisterScreen({super.key});

  @override
  State<DoctorCompleteRegisterScreen> createState() =>
      _DoctorCompleteRegisterScreenState();
}

class _DoctorCompleteRegisterScreenState
    extends State<DoctorCompleteRegisterScreen> {
  File? profileImage;

  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phone1Controller = TextEditingController();
  final TextEditingController phone2Controller = TextEditingController();

  TimeOfDay? fromTime;
  TimeOfDay? toTime;

  String? selectedSpecialization;

  @override
  void dispose() {
    descriptionController.dispose();
    addressController.dispose();
    phone1Controller.dispose();
    phone2Controller.dispose();
    super.dispose();
  }

  Future pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        profileImage = File(picked.path);
      });
    }
  }

  Future pickTime(bool isFrom) async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        if (isFrom) {
          fromTime = time;
        } else {
          toTime = time;
        }
      });
    }
  }

  // Format time
  String formatTime(TimeOfDay? t) {
    if (t == null) return "";
    final hour = t.hourOfPeriod == 0 ? 12 : t.hourOfPeriod;
    final period = t.period == DayPeriod.am ? "AM" : "PM";
    return "$hour:${t.minute.toString().padLeft(2, '0')} $period";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          "إكمال عملية التسجيل",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Profile Image
            Center(
              child: InkWell(
                onTap: pickImage,
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: AppColors.accentColor,
                  backgroundImage:
                      profileImage != null ? FileImage(profileImage!) : null,
                  child: profileImage == null
                      ? const Icon(Icons.camera_alt, size: 40, color: Colors.grey)
                      : null,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Specialization Title
            Text(
              "التخصص",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 8),

            // استخدمنا الـ List<String> اللي عندك مباشرة باسم `specializations`
            DropdownButtonFormField<String>(
              value: selectedSpecialization,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.accentColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "اختر التخصص",
              ),
              items: specializations
                  .map((value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedSpecialization = value;
                  });
                }
              },
            ),

            const SizedBox(height: 25),

            Text(
              "نبذة تعريفية",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.accentColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText:
                      "مثل: استشاري العظام، أعمل على علاج مشاكل العمود الفقري والمفاصل…",
                ),
              ),
            ),

            const SizedBox(height: 25),

            Text(
              "عنوان العيادة",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 8),

            _buildField(addressController, "٥ شارع مصدق – الدقي"),

            const SizedBox(height: 25),

            Text(
              "ساعات العمل",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 8),

            Row(
              children: [
                Expanded(
                  child: _buildTimePicker(
                    "من",
                    formatTime(fromTime),
                    () => pickTime(true),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildTimePicker(
                    "إلى",
                    formatTime(toTime),
                    () => pickTime(false),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            Text(
              "رقم الهاتف ١",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
            ),
            const SizedBox(height: 8),
            _buildField(phone1Controller, "01123456789"),

            const SizedBox(height: 25),

            Text(
              "رقم الهاتف ٢ (اختياري)",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
            ),
            const SizedBox(height: 8),
            _buildField(phone2Controller, "01098765432"),

            const SizedBox(height: 35),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // هنا تضيفي منطق التسجيل، التأكد من الحقول، رفع الصورة ... الخ
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "التسجيل",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildField(TextEditingController controller, String hint) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.accentColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
        ),
      ),
    );
  }

  Widget _buildTimePicker(String label, String value, Function onTap) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.accentColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value.isEmpty ? label : value,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16,
              ),
            ),
            Icon(Icons.access_time, color: AppColors.primaryColor),
          ],
        ),
      ),
    );
  }
}
