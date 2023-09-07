
// ignore_for_file: deprecated_member_use

import 'package:bookly_app/core/errors/failure.dart';

import 'package:bookly_app/features/home/presentation/data/models/book_model/item.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/utils/api_service.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo{
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<Item>>> fetchFeaturedBooks()async {
    try{
     var data=await apiService.get(endPoint:'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science');
     List<Item>books=[];
     for(var item in data['items']){
      try{
        books.add(Item.fromJson(item));
      }catch(e){
         books.add(Item.fromJson(item));
      }
     }
     return Right(books);
   
    }catch(e){
          if(e is DioError){
            return left(ServerFailure.fromDioError(e));
          }
          return left(ServerFailure(e.toString()));
    }
  }



  @override
  Future<Either<Failure, List<Item>>> fetchNewsetBooks()async {
   try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject:Programming');
      List<Item> books = [];
      for (var item in data['items']) {
        books.add(Item.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }



  @override
  Future<Either<Failure, List<Item>>> fetchSimilarBooks({required String category})async {
    try {
      var data = await apiService.get(
          endPoint:'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming');
      List<Item> books = [];
      for (var item in data['items']) {
        books.add(Item.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
  }
 
