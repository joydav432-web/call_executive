import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launchUrl(String urlString) async {
    final Uri uri = Uri.parse(urlString);
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      // Fallback
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);

    return Container(
      width: double.infinity,
      color: AppColors.bgDark,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: isMobile ? 60 : 100,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Container(
            padding: EdgeInsets.all(isMobile ? 28 : 48),
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topLeft,
                radius: 1.5,
                colors: [
                  AppColors.accentBlue.withValues(alpha: 0.15),
                  AppColors.bgCard,
                ],
              ),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: AppColors.borderAccent),
              boxShadow: [
                BoxShadow(
                  color: AppColors.accentBlue.withValues(alpha: 0.15),
                  blurRadius: 40,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: [
                // Tag
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.accentBlue.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.accentBlue.withValues(alpha: 0.4),
                    ),
                  ),
                  child: const Text(
                    'GET IN TOUCH',
                    style: TextStyle(
                      color: AppColors.accentCyan,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Title
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) =>
                      AppColors.primaryGradient.createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  ),
                  child: Text(
                    'Ready to Elevate Your Customer Experience?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isMobile ? 24 : 32,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 14),

                // Subtitle
                const Text(
                  'Available for International Support, Inbound/Outbound Calling, and Client Relationship Management.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 15,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 36),

                // Contact Channels (Phone, Gmail, LinkedIn)
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    // Phone / Mobile Number
                    _buildContactCard(
                      icon: Icons.phone_in_talk_rounded,
                      label: 'Direct Phone',
                      value: '01793787087',
                      color: AppColors.accentCyan,
                      onTap: () => _launchUrl('tel:01793787087'),
                    ),

                    // Gmail
                    _buildContactCard(
                      icon: Icons.mail_outline_rounded,
                      label: 'Official Email',
                      value: 'joydav432@gmail.com',
                      color: AppColors.accentGold,
                      onTap: () => _launchUrl('mailto:joydav432@gmail.com'),
                    ),

                    // LinkedIn Button with Icon
                    _buildLinkedInCard(
                      onTap: () => _launchUrl('https://www.linkedin.com/feed'),
                    ),
                  ],
                ),
                const SizedBox(height: 36),
                const Divider(color: AppColors.border, height: 1),
                const SizedBox(height: 24),

                // Footer signature
                Text(
                  '© ${DateTime.now().year} Joydeb Kumar • Call Center Executive • All Rights Reserved',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.bgDark.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.3)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLinkedInCard({required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF0077B5), Color(0xFF0A66C2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0A66C2).withValues(alpha: 0.4),
              blurRadius: 15,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // LinkedIn 'in' Icon Badge
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                'in',
                style: TextStyle(
                  color: Color(0xFF0A66C2),
                  fontWeight: FontWeight.w900,
                  fontSize: 13,
                  height: 1.0,
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Professional Network',
                  style: TextStyle(
                    color: Color(0xFFD0E8FF),
                    fontSize: 10.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Connect on LinkedIn',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 16),
          ],
        ),
      ),
    );
  }
}
