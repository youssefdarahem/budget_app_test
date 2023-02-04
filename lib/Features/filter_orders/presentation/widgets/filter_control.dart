import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.dart';
import '../../domain/entities/filter_type.dart';
import '../cubit/filter_cubit.dart';
import 'filter_box.dart';

class FilterControlWidget extends StatelessWidget {
  const FilterControlWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.25,
      color: const Color.fromARGB(255, 255, 190, 25),
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Business Name',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: BlocBuilder<FilterCubit, FilterState>(
                  builder: (context, state) {
                    if (state is FilterLoading || state is FilterInitial) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is FilterLoaded) {
                      final today = state.filtered[FilterType.today] ?? [];
                      List<int> todayInfo =
                          Utils().extractRevenueAndOrder(today);
                      final thisWeek = state.filtered[FilterType.week] ?? [];
                      List<int> weekInfo =
                          Utils().extractRevenueAndOrder(thisWeek);
                      final thisMonth = state.filtered[FilterType.month] ?? [];
                      List<int> monthInfo =
                          Utils().extractRevenueAndOrder(thisMonth);
                      return ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          FilterBox(
                            title: 'Today\'s Revenue',
                            revenue: todayInfo[0].toDouble(),
                            orderNum: todayInfo[1],
                            filteredOrders: today,
                          ),
                          const SizedBox(width: 10),
                          FilterBox(
                            title: 'Week so Far',
                            revenue: weekInfo[0].toDouble(),
                            orderNum: weekInfo[1],
                            filteredOrders: thisWeek,
                          ),
                          const SizedBox(width: 10),
                          FilterBox(
                            title: 'Monthly Revenue',
                            revenue: monthInfo[0].toDouble(),
                            orderNum: monthInfo[1],
                            filteredOrders: thisMonth,
                          ),
                        ],
                      );
                    } else {
                      return const Text('Error');
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
