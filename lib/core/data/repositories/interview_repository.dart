import 'package:ayol_uchun_exam/core/client.dart';
import 'package:ayol_uchun_exam/core/data/models/interview_model.dart';

class InterviewRepository{
  final ApiClient client;
  InterviewRepository({required this.client});

  Future<List<InterviewModel>>fetchInterview()async{
    final rawInterview = await client.fetchInterview();
    final detail = rawInterview.map((e)=> InterviewModel.fromJson(e)).toList();
    return detail;
  }
}