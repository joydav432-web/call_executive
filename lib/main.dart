import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'sections/navbar_section.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/customer_handling_section.dart';
import 'sections/experience_section.dart';
import 'sections/contact_section.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joydeb Kumar - Call Center Executive Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.bgDark,
        primaryColor: AppColors.accentBlue,
        fontFamily: 'Inter',
        useMaterial3: true,
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _handlingKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 400 && !_showBackToTop) {
      setState(() => _showBackToTop = true);
    } else if (_scrollController.offset <= 400 && _showBackToTop) {
      setState(() => _showBackToTop = false);
    }
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _showResumeDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.92),
      builder: (dialogContext) {
        final isMobile = ResponsiveBreakpoints.isMobile(dialogContext);

        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              // Tap background to dismiss
              GestureDetector(
                onTap: () => Navigator.pop(dialogContext),
                behavior: HitTestBehavior.opaque,
                child: const SizedBox.expand(),
              ),

              // Full CV display - natural readable width, scrollable, no box container
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: isMobile ? double.infinity : 820,
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 12 : 24,
                      vertical: 60,
                    ),
                    child: Image.asset(
                      'assets/images/joydeb_cv.jpg',
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
              ),

              // Floating Close (X) button at Top Right
              Positioned(
                top: 20,
                right: 20,
                child: SafeArea(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => Navigator.pop(dialogContext),
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E2235),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.35),
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.7),
                              blurRadius: 15,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.close_rounded,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      appBar: NavbarSection(
        onHeroTap: () => _scrollToSection(_heroKey),
        onAboutTap: () => _scrollToSection(_aboutKey),
        onSkillsTap: () => _scrollToSection(_skillsKey),
        onHandlingTap: () => _scrollToSection(_handlingKey),
        onExperienceTap: () => _scrollToSection(_experienceKey),
        onContactTap: () => _scrollToSection(_contactKey),
      ),
      endDrawer: _buildMobileDrawer(),
      floatingActionButton: _showBackToTop
          ? FloatingActionButton(
              mini: true,
              backgroundColor: AppColors.accentBlue,
              foregroundColor: Colors.white,
              onPressed: () {
                _scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOutCubic,
                );
              },
              child: const Icon(Icons.keyboard_arrow_up_rounded, size: 28),
            )
          : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // ① Hero Section
            HeroSection(
              key: _heroKey,
              onContactPressed: () => _scrollToSection(_contactKey),
              onResumePressed: () => _showResumeDialog(context),
            ),

            // ② About Me Section
            AboutSection(key: _aboutKey),

            // ③ Core Skills Section
            SkillsSection(key: _skillsKey),

            // ⑤ Customer Handling Section ⭐⭐⭐ (Between Skills & Experience)
            CustomerHandlingSection(key: _handlingKey),

            // ④ Professional Experience Section
            ExperienceSection(key: _experienceKey),

            // Contact & Footer Section
            ContactSection(key: _contactKey),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileDrawer() {
    return Drawer(
      backgroundColor: AppColors.bgSecondary,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.border, width: 1),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.headset_mic_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'JOYDEB KUMAR',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildDrawerItem(
              icon: Icons.home_rounded,
              label: 'Hero / Home',
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_heroKey);
              },
            ),
            _buildDrawerItem(
              icon: Icons.person_rounded,
              label: 'About Me',
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_aboutKey);
              },
            ),
            _buildDrawerItem(
              icon: Icons.star_rounded,
              label: 'Core Skills',
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_skillsKey);
              },
            ),
            _buildDrawerItem(
              icon: Icons.alt_route_rounded,
              label: 'Customer Handling',
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_handlingKey);
              },
            ),
            _buildDrawerItem(
              icon: Icons.work_history_rounded,
              label: 'Experience',
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_experienceKey);
              },
            ),
            _buildDrawerItem(
              icon: Icons.mail_rounded,
              label: 'Contact',
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_contactKey);
              },
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.bgCard,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border),
                ),
                child: const Column(
                  children: [
                    Text(
                      'Call Center Executive',
                      style: TextStyle(
                        color: AppColors.accentCyan,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Available for new opportunities',
                      style: TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.accentBlue, size: 22),
      title: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: onTap,
    );
  }
}
