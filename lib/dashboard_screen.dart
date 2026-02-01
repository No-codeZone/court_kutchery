import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Lawyer> _featuredLawyers = [
    Lawyer(
      name: 'Amar',
      specialization: 'Family Lawyer',
      experience: '8 Years',
      rating: 4.5,
      imageUrl: 'https://images.unsplash.com/photo-1560250097-0b93528c311a?w=400&q=80',
      isOnline: true,
      pricePerMin: 10,
    ),
    Lawyer(
      name: 'Amrita',
      specialization: 'Civil Lawyer',
      experience: '12 Years',
      rating: 4.8,
      imageUrl: 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=400&q=80',
      isOnline: true,
      pricePerMin: 12,
    ),
    Lawyer(
      name: 'Prerna',
      specialization: 'Criminal Lawyer',
      experience: '10 Years',
      rating: 4.6,
      imageUrl: 'https://images.unsplash.com/photo-1580489944761-15a19d654956?w=400&q=80',
      isOnline: true,
      pricePerMin: 15,
    ),
    Lawyer(
      name: 'Rabi',
      specialization: 'Corporate Lawyer',
      experience: '15 Years',
      rating: 4.9,
      imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&q=80',
      isOnline: true,
      pricePerMin: 20,
    ),
  ];

  void _onBottomNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.pushNamed(context, '/lawyers');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      drawer: const _SideNavigationDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.menu, color: Color(0xFF2C3E66)),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            );
          },
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
                  const Text(
                    'COURT',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2C3E66),
                      letterSpacing: 0.8,
                      height: 1.0,
                    ),
                  ),
                  const Text(
                    'Kutchery',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF4A5F8F),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Hi, Nilesh Soni ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2C3E66),
                        ),
                      ),
                      const Text(
                        '👋',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Legal Advice, Simplified',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Search Bar
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F9FD),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search by lawyer, city or case',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey[400],
                          size: 22,
                        ),
                        suffixIcon: Icon(
                          Icons.mic_outlined,
                          color: Colors.grey[400],
                          size: 22,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: _buildActionButton(
                          icon: Icons.phone_outlined,
                          label: 'Call to Lawyers',
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildActionButton(
                          icon: Icons.chat_bubble_outline,
                          label: 'Chat with Lawyers',
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Lawyers Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Lawyers',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2C3E66),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/lawyers');
                    },
                    child: const Row(
                      children: [
                        Text(
                          'View All',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF5B7FD9),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: Color(0xFF5B7FD9),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Lawyers Horizontal List
            SizedBox(
              height: 160,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: _featuredLawyers.length,
                itemBuilder: (context, index) {
                  return _buildLawyerCard(_featuredLawyers[index]);
                },
              ),
            ),
            const SizedBox(height: 24),
            // Categories Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2C3E66),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Row(
                      children: [
                        Text(
                          'View All',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF5B7FD9),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: Color(0xFF5B7FD9),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Categories Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: _buildCategoryCard(
                      'Family Lawyer',
                      'https://images.unsplash.com/photo-1600880292203-757bb62b4baf?w=400&q=80',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildCategoryCard(
                      'Criminal Lawyer',
                      'https://images.unsplash.com/photo-1589829545856-d10d557cf95f?w=400&q=80',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFE8EFFF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: const Color(0xFF5B7FD9),
              size: 28,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2C3E66),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLawyerCard(Lawyer lawyer) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 16),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(lawyer.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            lawyer.name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2C3E66),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            lawyer.specialization,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF4CAF50),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Chat',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, String imageUrl) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Image.network(
              imageUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 12,
              left: 12,
              right: 12,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
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

// ---------------------------------------------------------------------------
// Side Navigation Drawer
// ---------------------------------------------------------------------------
class _SideNavigationDrawer extends StatelessWidget {
  const _SideNavigationDrawer();

  /// Menu item definitions: label, outlined icon, filled/active icon
  static const List<_DrawerItem> _items = [
    _DrawerItem(label: 'My Cases', outlined: Icons.arrow_forward, filled: Icons.arrow_forward),
    _DrawerItem(label: 'Chat History', outlined: Icons.location_on_outlined, filled: Icons.location_on),
    _DrawerItem(label: 'Wallet', outlined: Icons.wallet_outlined, filled: Icons.wallet),
    _DrawerItem(label: 'Change Password', outlined: Icons.lock_outlined, filled: Icons.lock),
    _DrawerItem(label: 'About App', outlined: Icons.info_outlined, filled: Icons.info),
    _DrawerItem(label: 'Log Out', outlined: Icons.lock_outlined, filled: Icons.lock),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: Container(
        color: const Color(0xFFE8EFF8),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 16, 20),
              child: Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF2C3E66),
                      border: Border.all(color: const Color(0xFF4A5F8F), width: 2),
                    ),
                    child: const Center(
                      child: Icon(Icons.person, color: Colors.white, size: 22),
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Text(
                    'Nilesh Soni',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2C3E66),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.close, color: Color(0xFF2C3E66), size: 22),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: Color(0xFFCDD8E8), indent: 20, endIndent: 20),
            const SizedBox(height: 8),
            ...(_items.map((item) => _DrawerItemTile(item: item))),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem {
  final String label;
  final IconData outlined;
  final IconData filled;

  const _DrawerItem({
    required this.label,
    required this.outlined,
    required this.filled,
  });
}

class _DrawerItemTile extends StatelessWidget {
  final _DrawerItem item;

  const _DrawerItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          // TODO: wire up actual navigation per item
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: SizedBox(
            height: 48,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  item.outlined,
                  color: const Color(0xFF2C3E66),
                  size: 20,
                ),
                const SizedBox(width: 16),
                Text(
                  item.label,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2C3E66),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Lawyer {
  final String name;
  final String specialization;
  final String experience;
  final double rating;
  final String imageUrl;
  final bool isOnline;
  final int pricePerMin;

  Lawyer({
    required this.name,
    required this.specialization,
    required this.experience,
    required this.rating,
    required this.imageUrl,
    required this.isOnline,
    required this.pricePerMin,
  });
}