import 'package:get/get.dart';

import 'modules/home/home_page.dart';
import 'modules/movieDetails/movie_details_page.dart';
import 'modules/movieDetails/watch_movie_trailor_screen.dart';
import 'modules/search/search_page.dart';
import 'modules/search/search_result_view_page.dart';
import 'modules/ticket/ticket_details_page.dart';
import 'modules/ticket/ticket_page.dart';

class AppRoutes {
  static String homePage = '/';
  static String watchMovieTrailorScreen = '/watchMovieTrailorScreen';
  static String ticketPage = '/ticketPage';
  static String ticketDetailsPage = '/ticketDetailsPage';
  static String searchPage = '/searchPage';
  static String searchResultViewPage = '/searchResultViewPage';
  static String movieDetailsScreen(int movieId) =>
      '/movieDetailsScreen?id=$movieId';

  static List<GetPage<dynamic>>? getPages = [
    GetPage(name: homePage, page: () => const HomePage()),
    GetPage(
        name: '/movieDetailsScreen', page: () => const MovieDetailsScreen()),
    GetPage(
        name: '/watchMovieTrailorScreen',
        page: () => const WatchMovieTrailorScreen()),
    GetPage(name: ticketPage, page: () => const TicketPage()),
    GetPage(name: ticketDetailsPage, page: () => const TicketDetailsPage()),
    GetPage(name: searchPage, page: () => const SearchPage()),
    GetPage(
        name: '/searchResultViewPage',
        page: () => const SearchResultViewPage()),
  ];
}
