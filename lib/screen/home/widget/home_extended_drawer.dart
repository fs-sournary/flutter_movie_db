import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/generated/l10n.dart';
import 'package:flutter_movie_db/model/movie_category_type.dart';
import 'package:flutter_movie_db/screen/home/bloc/home_bloc.dart';
import 'package:flutter_movie_db/screen/home/page/home_page.dart';

class HomeExtendedDrawer extends StatelessWidget {
  const HomeExtendedDrawer({
    Key? key,
    required this.destinations,
  }) : super(key: key);

  final List<Destination> destinations;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Drawer(
      width: 200,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.current.home_title,
                    style: textTheme.titleLarge
                        ?.copyWith(color: colorScheme.primary),
                  ),
                  const Icon(Icons.menu_open),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit_outlined),
                label: Container(
                  margin: const EdgeInsets.only(left: 16),
                  child: const Text('Compose'),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 16,
                  ),
                  alignment: Alignment.centerLeft,
                  onPrimary: colorScheme.onTertiaryContainer,
                  primary: colorScheme.tertiaryContainer,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, i) => _Item(
                index: i,
                item: destinations[i],
              ),
              itemCount: destinations.length,
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final int index;
  final Destination item;

  const _Item({
    Key? key,
    required this.index,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        return (previous.selectedIndex == index ||
                current.selectedIndex == index) &&
            previous.selectedIndex != current.selectedIndex;
      },
      builder: (context, state) {
        final colorScheme = Theme.of(context).colorScheme;
        final selected = state.selectedIndex == index;
        final trailing = index == 0 && selected
            ? Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.surface,
                ),
                padding: const EdgeInsets.all(8),
                child: Text(
                  MovieCategoryType.values.length.toString(),
                  style: Theme.of(context).textTheme.button,
                ),
              )
            : null;
        return Card(
          elevation: 0,
          margin: const EdgeInsets.only(bottom: 8),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          color: selected
              ? colorScheme.secondaryContainer
              : colorScheme.surfaceVariant,
          child: ListTile(
            leading: item.icon,
            title: Text(item.label),
            selected: selected,
            trailing: trailing,
            onTap: () {
              context.read<HomeBloc>().add(HomeIndexChanged(index));
            },
            style: ListTileStyle.drawer,
          ),
        );
      },
    );
  }
}
