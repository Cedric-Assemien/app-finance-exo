import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../utils/constants.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String selectedPeriod = '6 Months';
  String selectedMonth = 'Mar';
  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Report',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCongratulationsCard(),
            const SizedBox(height: 24),
            _buildDataMetricsSection(),
            const SizedBox(height: 24),
            _buildSavingSection(),
            const SizedBox(height: 24),
            _buildGoalsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildCongratulationsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius:
            BorderRadius.circular(80), // Augmentation du border radius
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.trending_up, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Congratulations! 🎉',
                  style: AppStyles.bodyLarge.copyWith(color: Colors.white),
                ),
                Text(
                  'Great progress! Keep controlling your finances!',
                  style: AppStyles.bodySmall
                      .copyWith(color: Colors.white, fontSize: 9),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildDataMetricsSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Data Metrics',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Income-Expense Insight Analyzer',
                      style: TextStyle(fontSize: 10, color: Colors.grey[600])),
                ],
              ),
              // Dropdown réel pour la sélection de période
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: DropdownButton<String>(
                  value: '6 Months',
                  icon: const Icon(Icons.keyboard_arrow_down),
                  underline: Container(), // Supprime la ligne par défaut
                  isDense: true,
                  items: <String>['3 Months', '6 Months', '1 Year']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildMetricIndicator(
                  '\$8,875.00', const Color.fromARGB(255, 255, 255, 255), true),
              _buildMetricIndicator(
                  '\$6,952.00', const Color.fromARGB(255, 21, 21, 21), false),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 150,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 6,
                minY: 0,
                maxY: 6,
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 3),
                      FlSpot(1, 2),
                      FlSpot(2, 4),
                      FlSpot(3, 3),
                      FlSpot(4, 5),
                      FlSpot(5, 3),
                      FlSpot(6, 4),
                    ],
                    isCurved: true,
                    color: AppColors.chartOrangeColor,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) {
                          if (index == 4) {
                            // Point pour Mai (index 4)
                            return FlDotCirclePainter(
                              radius: 6,
                              color: Colors.orange,
                              strokeWidth: 2,
                              strokeColor: Colors.white,
                            );
                          }
                          return FlDotCirclePainter(
                            radius: 0,
                            color: Colors.transparent,
                            strokeWidth: 0,
                            strokeColor: Colors.transparent,
                          );
                        }),
                  ),
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 2),
                      FlSpot(1, 1),
                      FlSpot(2, 3),
                      FlSpot(3, 2.5),
                      FlSpot(4, 3.5),
                      FlSpot(5, 2.5),
                      FlSpot(6, 3),
                    ],
                    isCurved: true,
                    color: AppColors.chartGreenColor,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) {
                          if (index == 4) {
                            // Point pour Mai (index 4)
                            return FlDotCirclePainter(
                              radius: 6,
                              color: Colors.green,
                              strokeWidth: 2,
                              strokeColor: Colors.white,
                            );
                          }
                          return FlDotCirclePainter(
                            radius: 0,
                            color: Colors.transparent,
                            strokeWidth: 0,
                            strokeColor: Colors.transparent,
                          );
                        }),
                  ),
                ],
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((LineBarSpot touchedSpot) {
                        final Color? color = touchedSpot.bar.color;
                        return LineTooltipItem(
                          touchedSpot.y.toStringAsFixed(1),
                          TextStyle(color: color, fontWeight: FontWeight.bold),
                        );
                      }).toList();
                    },
                    tooltipPadding: const EdgeInsets.all(8),
                    tooltipBorder:
                        BorderSide(color: Colors.grey.shade300, width: 0.5),
                    tooltipMargin: 8,
                    fitInsideHorizontally: true,
                    fitInsideVertically: true,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: months.map((month) {
                bool isSelected = month == selectedMonth;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedMonth = month;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.grey.shade200
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      month,
                      style: TextStyle(
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 24),
          _buildIncomeExpenseSection(),
        ],
      ),
    );
  }

  Widget _buildMetricIndicator(String value, Color color, bool isHighlighted) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isHighlighted ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(150),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        value,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: isHighlighted ? color : color,
        ),
      ),
    );
  }

  Widget _buildIncomeExpenseSection() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Average Income', style: AppStyles.bodySmall),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text('\$11,876.00',
                        style: AppStyles.bodyLarge
                            .copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_upward_rounded,
                          size: 16,
                          color: AppColors.greenColor,
                        ),
                        Text('+6.8%',
                            style: AppStyles.bodySmall
                                .copyWith(color: AppColors.greenColor)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Average Expense', style: AppStyles.bodySmall),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text('\$7,525.00',
                        style: AppStyles.bodyLarge
                            .copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_downward_rounded,
                          size: 16,
                          color: AppColors.redColor,
                        ),
                        Text('-6.8%',
                            style: AppStyles.bodySmall
                                .copyWith(color: AppColors.redColor)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSavingSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your Saving', style: AppStyles.bodyMedium),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$321,523.05',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildProgressChart(60, Icons.home_outlined),
                  SizedBox(width: 16),
                  _buildProgressChart(40, Icons.shopping_cart_outlined),
                  SizedBox(width: 16),
                  _buildProgressChart(70, Icons.school_outlined),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressChart(double percentage, IconData icon) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 45,
          height: 45,
          child: CircularProgressIndicator(
            value: percentage / 100,
            strokeWidth: 8,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.greenColor),
          ),
        ),
        Icon(icon, size: 24, color: Colors.grey.shade700),
      ],
    );
  }

  Widget _buildGoalsSection() {
    return Row(
      children: [
        Expanded(
          child: _buildGoalItem('Dream House', Icons.home_outlined),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildGoalItem('New Car', Icons.directions_car_outlined),
        ),
      ],
    );
  }

  Widget _buildGoalItem(String title, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey.shade200,
            child: Icon(icon, color: Colors.black),
          ),
          const SizedBox(width: 8),
          Text(title, style: AppStyles.bodyMedium),
        ],
      ),
    );
  }
}
