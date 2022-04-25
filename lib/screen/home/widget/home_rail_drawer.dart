import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/screen/home/bloc/home_bloc.dart';
import 'package:flutter_movie_db/screen/home/page/home_page.dart';

class HomeRailDrawer extends StatelessWidget {
  const HomeRailDrawer({
    Key? key,
    required this.destinations,
  }) : super(key: key);

  final List<Destination> destinations;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Drawer(
      width: 72,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: const Icon(Icons.menu),
            ),
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.edit_outlined),
              elevation: 0,
              backgroundColor: colorScheme.tertiaryContainer,
            ),
            const SizedBox(height: 40),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => _Item(
                index: index,
                item: destinations[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: destinations.length,
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    Key? key,
    required this.index,
    required this.item,
  }) : super(key: key);

  final int index;
  final Destination item;

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
        return Container(
          decoration: BoxDecoration(
            color: selected ? colorScheme.secondaryContainer : null,
            borderRadius:
                selected ? const BorderRadius.all(Radius.circular(32)) : null,
          ),
          child: IconButton(
            onPressed: () {
              context.read<HomeBloc>().add(HomeIndexChanged(index));
            },
            icon: item.icon,
          ),
        );
      },
    );
  }
}
