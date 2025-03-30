import 'package:flutter/material.dart';

class CarbonFootprintScreen extends StatefulWidget {
  const CarbonFootprintScreen({super.key});

  @override
  State<CarbonFootprintScreen> createState() => _CarbonFootprintScreenState();
}

class _CarbonFootprintScreenState extends State<CarbonFootprintScreen> {
  final List<TransportationItem> _transportationItems = [TransportationItem()];
  final List<HomeEnergyItem> _homeEnergyItems = [HomeEnergyItem()];
  final List<DietItem> _dietItems = [DietItem()];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Your Carbon Footprint')),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 12.0,
          bottom: 40.0,
          left: 8.0,
          right: 8.0,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader('Transportation'),
              ..._transportationItems.map(
                (item) => _buildTransportationCard(item),
              ),
              _buildAddButton(() {
                setState(() {
                  _transportationItems.add(TransportationItem());
                });
              }),

              _buildSectionHeader('Home Energy'),
              ..._homeEnergyItems.map((item) => _buildHomeEnergyCard(item)),
              _buildAddButton(() {
                setState(() {
                  _homeEnergyItems.add(HomeEnergyItem());
                });
              }),

              _buildSectionHeader('Diet & Consumption'),
              ..._dietItems.map((item) => _buildDietCard(item)),
              _buildAddButton(() {
                setState(() {
                  _dietItems.add(DietItem());
                });
              }),

              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _calculateFootprint,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.primaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                  ),
                  child: const Text(
                    'Calculate Footprint',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    const Text(
                      'Want to reduce your carbon footprint?',
                      style: TextStyle(fontSize: 16),
                    ),
                    // TextButton(
                    //   onPressed: _showAIRecommendations,
                    GestureDetector(
                      onTap: _showAIRecommendations,
                      child: Text(
                        'Click here to know',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTransportationCard(TransportationItem item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Vehicle Type'),
              items:
                  ['Car', 'Motorcycle', 'Bus', 'Train']
                      .map(
                        (type) =>
                            DropdownMenuItem(value: type, child: Text(type)),
                      )
                      .toList(),
              onChanged: (value) => item.vehicleType = value,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Fuel Type'),
              items:
                  ['Petrol', 'Diesel', 'CNG', 'Electric']
                      .map(
                        (type) =>
                            DropdownMenuItem(value: type, child: Text(type)),
                      )
                      .toList(),
              onChanged: (value) => item.fuelType = value,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Distance (km)',
                suffixText: 'km',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) => item.distance = double.tryParse(value),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeEnergyCard(HomeEnergyItem item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Appliance Type'),
              items:
                  ['Air Conditioner', 'Refrigerator', 'TV', 'Washing Machine']
                      .map(
                        (type) =>
                            DropdownMenuItem(value: type, child: Text(type)),
                      )
                      .toList(),
              onChanged: (value) => item.applianceType = value,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Hours Used per Day',
                suffixText: 'hours',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) => item.hoursUsed = double.tryParse(value),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDietCard(DietItem item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Food Type'),
              items:
                  ['Meat', 'Dairy', 'Vegetables', 'Fruits']
                      .map(
                        (type) =>
                            DropdownMenuItem(value: type, child: Text(type)),
                      )
                      .toList(),
              onChanged: (value) => item.foodType = value,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Quantity (kg/week)',
                suffixText: 'kg',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) => item.quantity = double.tryParse(value),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton(VoidCallback onPressed) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.add),
      label: const Text('Add Item'),
    );
  }

  void _calculateFootprint() {
    // TODO: Implement carbon footprint calculation
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Carbon Footprint'),
            content: const Text(
              'Your carbon footprint calculation will appear here.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  void _showAIRecommendations() {
    // TODO: Implement AI recommendations
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('AI Recommendations'),
            content: const Text(
              'Based on your carbon footprint, here are some recommendations to reduce it...',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }
}

class TransportationItem {
  String? vehicleType;
  String? fuelType;
  double? distance;
}

class HomeEnergyItem {
  String? applianceType;
  double? hoursUsed;
}

class DietItem {
  String? foodType;
  double? quantity;
}
