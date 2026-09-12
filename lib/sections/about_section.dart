import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);

    return Container(
      width: double.infinity,
      color: AppColors.bgSecondary,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: isMobile ? 60 : 100,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1140),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Section Tag
              _buildSectionHeader(
                tag: 'GET TO KNOW ME',
                title: 'About Me',
                subtitle: 'A glimpse into my professional mindset and client dedication',
              ),
              const SizedBox(height: 48),

              // Content Layout (Split into cards or Column)
              Container(
                padding: EdgeInsets.all(isMobile ? 24 : 40),
                decoration: BoxDecoration(
                  color: AppColors.bgCard,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.border),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 25,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Main summary paragraph
                    Text(
                      'I am a motivated and communication-focused professional with experience in international client communication and sales. I enjoy understanding customer needs, solving problems, handling inquiries, and building positive client relationships.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: isMobile ? 16 : 19,
                        height: 1.75,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 36),
                    const Divider(color: AppColors.border, height: 1),
                    const SizedBox(height: 36),

                    // Key Stats Grid
                    _buildStatsGrid(isMobile),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader({
    required String tag,
    required String title,
    required String subtitle,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.accentPurple.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.accentPurple.withValues(alpha: 0.3),
            ),
          ),
          child: Text(
            tag,
            style: const TextStyle(
              color: AppColors.accentPurple,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 12),
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => AppColors.primaryGradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _buildStatsGrid(bool isMobile) {
    final stats = [
      _StatItem(
        icon: Icons.public_rounded,
        title: 'International Clients',
        subtitle: 'Global communication & empathy',
        color: AppColors.accentBlue,
      ),
      _StatItem(
        icon: Icons.chat_bubble_outline_rounded,
        title: 'Bangla & English',
        subtitle: 'Bilingual fluent support',
        color: AppColors.accentCyan,
      ),
      _StatItem(
        icon: Icons.headset_mic_outlined,
        title: 'Customer Support',
        subtitle: 'Inbound & outbound handling',
        color: AppColors.accentPurple,
      ),
      _StatItem(
        icon: Icons.trending_up_rounded,
        title: 'Sales & Follow-up',
        subtitle: 'Conversion & client retention',
        color: AppColors.accentGold,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        if (isMobile) {
          return Column(
            children: stats
                .map((s) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _buildStatCard(s),
                    ))
                .toList(),
          );
        } else {
          return Row(
            children: stats
                .map((s) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: _buildStatCard(s),
                      ),
                    ))
                .toList(),
          );
        }
      },
    );
  }

  Widget _buildStatCard(_StatItem item) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.bgDark.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: item.color.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(item.icon, color: item.color, size: 28),
          ),
          const SizedBox(height: 14),
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            item.subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  _StatItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });
}
