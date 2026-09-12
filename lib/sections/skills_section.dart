import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    final isTablet = ResponsiveBreakpoints.isTablet(context);

    final List<_SkillItem> skills = [
      _SkillItem(
        icon: Icons.chat_rounded,
        title: 'Communication',
        description: 'Clear, polite and effective articulation across diverse channels',
        color: AppColors.accentBlue,
      ),
      _SkillItem(
        icon: Icons.headset_mic_rounded,
        title: 'Customer Support',
        description: 'Empathetic issue resolution with high first-contact resolution rates',
        color: AppColors.accentCyan,
      ),
      _SkillItem(
        icon: Icons.phone_forwarded_rounded,
        title: 'Inbound & Outbound Calling',
        description: 'Professional telephony etiquette for customer inquiries & cold outreach',
        color: AppColors.accentPurple,
      ),
      _SkillItem(
        icon: Icons.handshake_rounded,
        title: 'Client Relationship',
        description: 'Nurturing long-term loyalty and trust through active engagement',
        color: AppColors.accentGold,
      ),
      _SkillItem(
        icon: Icons.query_builder_rounded,
        title: 'Lead Follow-up',
        description: 'Timely re-engagement strategies to convert potential prospects',
        color: AppColors.accentPink,
      ),
      _SkillItem(
        icon: Icons.psychology_rounded,
        title: 'Problem Solving',
        description: 'Fast root-cause troubleshooting under demanding situations',
        color: AppColors.accentGreen,
      ),
      _SkillItem(
        icon: Icons.monetization_on_rounded,
        title: 'Sales & Telemarketing',
        description: 'Value proposition presentation, upselling, and closing deals',
        color: AppColors.accentGold,
      ),
      _SkillItem(
        icon: Icons.hearing_rounded,
        title: 'Active Listening',
        description: 'Attentive note-taking and understanding implicit client pain points',
        color: AppColors.accentCyan,
      ),
      _SkillItem(
        icon: Icons.computer_rounded,
        title: 'CRM & Digital Tools',
        description: 'Proficiency in CRM platforms, ticket trackers, and modern software',
        color: AppColors.accentBlue,
      ),
    ];

    int crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);

    return Container(
      width: double.infinity,
      color: AppColors.bgDark,
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

              // Grid of cards
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: skills.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: isMobile ? 2.4 : 1.6,
                ),
                itemBuilder: (context, index) {
                  return _SkillCard(item: skills[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.accentCyan.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.accentCyan.withValues(alpha: 0.3),
            ),
          ),
          child: const Text(
            'EXPERTISE & CAPABILITIES',
            style: TextStyle(
              color: AppColors.accentCyan,
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
            'Core Skills ⭐',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Specialized toolset engineered for peak communication and customer satisfaction',
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

class _SkillCard extends StatefulWidget {
  final _SkillItem item;

  const _SkillCard({required this.item});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: _isHovered ? AppColors.bgCardHover : AppColors.bgCard,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: _isHovered
                ? widget.item.color.withValues(alpha: 0.6)
                : AppColors.border,
            width: _isHovered ? 1.5 : 1.0,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: widget.item.color.withValues(alpha: 0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon container
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: widget.item.color.withValues(
                  alpha: _isHovered ? 0.25 : 0.12,
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(
                widget.item.icon,
                color: widget.item.color,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.item.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12.5,
                      height: 1.35,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillItem {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  _SkillItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });
}
