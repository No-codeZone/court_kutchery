import 'package:flutter/material.dart';

class LawyersScreen extends StatefulWidget {
  const LawyersScreen({super.key});

  @override
  State<LawyersScreen> createState() => _LawyersScreenState();
}

class _LawyersScreenState extends State<LawyersScreen> {
  int _selectedIndex = 1;
  String _selectedFilter = 'All Lawyer';

  final List<String> _filters = [
    'All Lawyer',
    'Family Lawyer',
    'Criminal Lawyer',
  ];

  final List<LawyerDetail> _lawyers = [
    LawyerDetail(
      name: 'Rakesh Singh',
      specialization: 'Criminal Lawyer',
      experience: '18 Years',
      rating: 4.5,
      reviews: 120,
      imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&q=80',
      pricePerMin: 10,
    ),
    LawyerDetail(
      name: 'Amrita Ghosh',
      specialization: 'Family Lawyer',
      experience: '9 Years',
      rating: 4.0,
      reviews: 85,
      imageUrl: 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=400&q=80',
      pricePerMin: 8,
    ),
    LawyerDetail(
      name: 'Sharika Chauhan',
      specialization: 'Cyber Lawyer',
      experience: '7 Years',
      rating: 4.2,
      reviews: 65,
      imageUrl: 'https://images.unsplash.com/photo-1580489944761-15a19d654956?w=400&q=80',
      pricePerMin: 15,
    ),
    LawyerDetail(
      name: 'Amarkant Dube',
      specialization: 'Corporate Lawyer',
      experience: '15 Years',
      rating: 4.8,
      reviews: 150,
      imageUrl: 'https://images.unsplash.com/photo-1560250097-0b93528c311a?w=400&q=80',
      pricePerMin: 20,
    ),
    LawyerDetail(
      name: 'Amar Mishra',
      specialization: 'Civil Lawyer',
      experience: '12 Years',
      rating: 4.3,
      reviews: 95,
      imageUrl: 'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?w=400&q=80',
      pricePerMin: 13,
    ),
    LawyerDetail(
      name: 'Prerna Sinha',
      specialization: 'Civil Lawyer',
      experience: '10 Years',
      rating: 4.1,
      reviews: 78,
      imageUrl: 'https://images.unsplash.com/photo-1594744803329-e58b31de8bf5?w=400&q=80',
      pricePerMin: 12,
    ),
  ];

  void _onBottomNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF2C3E66), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFF5E6D3),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFFD4A574),
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF4A5F8F),
                    width: 1.5,
                  ),
                ),
                child: const Icon(
                  Icons.balance,
                  color: Color(0xFF4A5F8F),
                  size: 16,
                ),
              ),
              const SizedBox(width: 6),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'COURT',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF2C3E66),
                      letterSpacing: 0.8,
                      height: 1.0,
                    ),
                  ),
                  Text(
                    'Kutchery',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF4A5F8F),
                      fontStyle: FontStyle.italic,
                      height: 1.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Stack(
              children: [
                const Icon(Icons.notifications_outlined, color: Color(0xFF2C3E66)),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&q=80',
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Chips
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SizedBox(
              height: 40,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: _filters.length,
                itemBuilder: (context, index) {
                  final isSelected = _selectedFilter == _filters[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: FilterChip(
                      label: Text(
                        _filters[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : const Color(0xFF2C3E66),
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          _selectedFilter = _filters[index];
                        });
                      },
                      backgroundColor: Colors.white,
                      selectedColor: const Color(0xFF5B7FD9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: isSelected
                              ? const Color(0xFF5B7FD9)
                              : Colors.grey.shade300,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      showCheckmark: false,
                    ),
                  );
                },
              ),
            ),
          ),
          // Lawyers List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: _lawyers.length,
              itemBuilder: (context, index) {
                return _buildLawyerCard(_lawyers[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildLawyerCard(LawyerDetail lawyer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Lawyer Image
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(lawyer.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Lawyer Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lawyer.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2C3E66),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  lawyer.specialization,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Exp: ${lawyer.experience}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                  ),
                ),
                const SizedBox(height: 6),
                // Rating Stars
                Row(
                  children: [
                    ...List.generate(5, (index) {
                      if (index < lawyer.rating.floor()) {
                        return const Icon(
                          Icons.star,
                          size: 14,
                          color: Color(0xFFFFA726),
                        );
                      } else if (index < lawyer.rating.ceil() &&
                          lawyer.rating % 1 != 0) {
                        return const Icon(
                          Icons.star_half,
                          size: 14,
                          color: Color(0xFFFFA726),
                        );
                      } else {
                        return Icon(
                          Icons.star_outline,
                          size: 14,
                          color: Colors.grey[300],
                        );
                      }
                    }),
                    const SizedBox(width: 4),
                    Text(
                      '${lawyer.rating}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Price and Actions
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE3F2FD),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '₹${lawyer.pricePerMin}/min',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF5B7FD9),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  // Call Button
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8EFFF),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.phone,
                        color: Color(0xFF5B7FD9),
                        size: 18,
                      ),
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Chat Button
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8EFFF),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.chat_bubble,
                        color: Color(0xFF5B7FD9),
                        size: 18,
                      ),
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onBottomNavTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF5B7FD9),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            activeIcon: Icon(Icons.people),
            label: 'Lawyers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            activeIcon: Icon(Icons.chat_bubble),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class LawyerDetail {
  final String name;
  final String specialization;
  final String experience;
  final double rating;
  final int reviews;
  final String imageUrl;
  final int pricePerMin;

  LawyerDetail({
    required this.name,
    required this.specialization,
    required this.experience,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
    required this.pricePerMin,
  });
}
