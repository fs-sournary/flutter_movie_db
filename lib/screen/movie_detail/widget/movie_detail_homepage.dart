import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/generated/l10n.dart';
import 'package:flutter_movie_db/screen/movie_detail/bloc/movie_detail_bloc.dart';
import 'package:flutter_movie_db/utils/app_url_launcher.dart';

class MovieDetailHomePage extends StatelessWidget {
  const MovieDetailHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      buildWhen: (previous, current) {
        return previous.movieDetail.homepage != current.movieDetail.homepage;
      },
      builder: (context, state) {
        final homepage = state.movieDetail.homepage;
        if (homepage.isEmpty) {
          return Container();
        }
        final textTheme = Theme.of(context).textTheme;
        return Container(
          margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: S.current.movie_detail_home_learn_more_message,
                  style: textTheme.bodyText2?.copyWith(fontSize: 12),
                ),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: InkWell(
                    onTap: () async {
                      await openUrlLauncher(
                        url: homepage,
                        onUrlUnAvailable: () => _showSnackBar(context),
                      );
                    },
                    child: Text(
                      S.current.movie_detail_home_learn_more_action,
                      style: textTheme.bodyText2?.copyWith(
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  style: textTheme.bodySmall?.copyWith(
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    final snackBar = SnackBar(
      content: Text(S.current.movie_detail_unavailable_url_message),
      margin: const EdgeInsets.all(16.0),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
