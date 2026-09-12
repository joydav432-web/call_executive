import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);

    final responsibilities = [
      'Responding promptly to international client inquiries across different time zones',
      'Understanding client requirements deeply and recommending tailored solutions',
      'Presenting services clearly with concise value propositions',
      'Following up consistently with potential clients to maximize conversion rates',
      'Handling objections professionally with tact, patience, and confidence',
      'Maintaining long-term client relationships to drive repeat business and positive ratings',
    ];

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
            children: [
              // Header
              _buildHeader(),
              const SizedBox(height: 50),

              // Experience Card / Timeline design
              Container(
                decoration: BoxDecoration(
                  color: AppColors.bgCard,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.border),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accentBlue.withValues(alpha: 0.1),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    // Top glowing gradient accent bar
                    Container(
                      height: 4,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: AppColors.primaryGradient,
                      ),
                    ),

                    // Main card body
                    Padding(
                      padding: EdgeInsets.all(isMobile ? 24 : 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Top row: Role, Badge, Platform
                          isMobile
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildPlatformBadge(),
                                    const SizedBox(height: 12),
                                    _buildRoleTitle(),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    _buildRoleTitle(),
                                    _buildPlatformBadge(),
                                  ],
                                ),
                          const SizedBox(height: 16),

                          // Subtitle & duration
                          Row(
                            children: [
                              const Icon(
                                Icons.verified_user_rounded,
                                color: AppColors.accentGreen,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Global Freelance Experience • Top Rated Communication',
                                style: TextStyle(
                                  color: AppColors.accentCyan,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          const Divider(color: AppColors.border, height: 1),
                          const SizedBox(height: 24),

                          // Responsibilities Title
                          const Text(
                            'Key Responsibilities & Impact:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 18),

                          // Responsibilities List
                          Column(
                            children: responsibilities
                                .map((resp) => _buildResponsibilityItem(resp))
                                .toList(),
                          ),

                          const SizedBox(height: 28),

                          // Bottom highlight pills
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              _buildMetricPill(
                                icon: Icons.speed_rounded,
                                title: '< 1 Hour',
                                subtitle: 'Average Response Time',
                              ),
                              _buildMetricPill(
                                icon: Icons.star_rounded,
                                title: '5.0 Rating',
                                subtitle: 'Client Satisfaction',
                              ),
                              _buildMetricPill(
                                icon: Icons.public_rounded,
                                title: '15+ Countries',
                                subtitle: 'Global Clients Reached',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => AppColors.primaryGradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: const Text(
            'International Client Communication & Sales',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Lead Generation • Inquiries Handling • Deal Closing',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildPlatformBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.accentGreen.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: AppColors.accentGreen.withValues(alpha: 0.4),
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.workspace_premium_rounded,
              color: AppColors.accentGreen, size: 18),
          SizedBox(width: 8),
          Text(
            'Fiverr Platform',
            style: TextStyle(
              color: AppColors.accentGreen,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResponsibilityItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 3),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.accentBlue.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_circle_rounded,
              size: 16,
              color: AppColors.accentBlue,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 15,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricPill({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.bgDark.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.accentGold, size: 20),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.accentGreen.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.accentGreen.withValues(alpha: 0.3),
            ),
          ),
          child: const Text(
            'TRACK RECORD & CAREER',
            style: TextStyle(
              color: AppColors.accentGreen,
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
          child: const Text(
            'Professional Experience',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Proven international track record in client engagement and sales excellence',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
