import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onContactPressed;
  final VoidCallback onResumePressed;

  const HeroSection({
    super.key,
    required this.onContactPressed,
    required this.onResumePressed,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: isMobile ? size.height * 0.9 : size.height * 0.95,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: isMobile ? 40 : 80,
      ),
      decoration: BoxDecoration(
        color: AppColors.bgDark,
        gradient: RadialGradient(
          center: const Alignment(-0.6, -0.4),
          radius: 1.2,
          colors: [
            AppColors.accentBlue.withValues(alpha: 0.12),
            AppColors.accentPurple.withValues(alpha: 0.05),
            Colors.transparent,
          ],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1140),
          child: isMobile
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildAvatar(isMobile: true),
                    const SizedBox(height: 36),
                    _buildHeroContent(context, isMobile: true),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: _buildHeroContent(context, isMobile: false),
                    ),
                    const SizedBox(width: 48),
                    Expanded(
                      flex: 5,
                      child: Center(child: _buildAvatar(isMobile: false)),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildAvatar({required bool isMobile}) {
    final double avatarSize = isMobile ? 220 : 300;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        // Outer glowing ring
        Container(
          width: avatarSize + 16,
          height: avatarSize + 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: AppColors.primaryGradient,
            boxShadow: [
              BoxShadow(
                color: AppColors.accentBlue.withValues(alpha: 0.35),
                blurRadius: 35,
                spreadRadius: 2,
              ),
              BoxShadow(
                color: AppColors.accentPurple.withValues(alpha: 0.25),
                blurRadius: 45,
                spreadRadius: 4,
              ),
            ],
          ),
        ),

        // Dark spacing ring
        Container(
          width: avatarSize + 8,
          height: avatarSize + 8,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.bgDark,
          ),
        ),

        // Avatar Image
        Container(
          width: avatarSize,
          height: avatarSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(
            'assets/images/joydeb.jpg',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: AppColors.bgCard,
                child: const Icon(
                  Icons.person,
                  size: 100,
                  color: AppColors.accentCyan,
                ),
              );
            },
          ),
        ),

        // Badge 1: Top Right
        Positioned(
          top: 10,
          right: isMobile ? -10 : -20,
          child: _buildBadge(
            icon: Icons.headset_mic_rounded,
            label: 'Call Specialist',
            color: AppColors.accentCyan,
          ),
        ),

        // Badge 2: Bottom Left
        Positioned(
          bottom: 20,
          left: isMobile ? -10 : -25,
          child: _buildBadge(
            icon: Icons.trending_up_rounded,
            label: 'Sales & Retention',
            color: AppColors.accentGold,
          ),
        ),
      ],
    );
  }

  Widget _buildBadge({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.bgCard.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: color.withValues(alpha: 0.4), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroContent(BuildContext context, {required bool isMobile}) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Greeting tag
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.accentBlue.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.accentBlue.withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.accentCyan,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                "HI, I'M",
                style: TextStyle(
                  color: AppColors.accentCyan,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Name
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => AppColors.primaryGradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: Text(
            'JOYDEB KUMAR',
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
            style: TextStyle(
              fontSize: isMobile ? 38 : 58,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.5,
              height: 1.1,
            ),
          ),
        ),
        const SizedBox(height: 10),

        // Role title
        Text(
          'CALL CENTER EXECUTIVE',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: isMobile ? 18 : 24,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
            letterSpacing: 2.0,
          ),
        ),
        const SizedBox(height: 14),

        // Key tag pills
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            _buildTag('Customer Support', AppColors.accentBlue),
            _buildTag('Client Communication', AppColors.accentPurple),
            _buildTag('Sales & Retention', AppColors.accentCyan),
          ],
        ),
        const SizedBox(height: 20),

        // Tagline quote
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.bgCard.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: Text(
            '“Helping customers with patience, clarity and professionalism.”',
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 15,
              fontStyle: FontStyle.italic,
              height: 1.4,
            ),
          ),
        ),
        const SizedBox(height: 28),

        // Action Buttons
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            ElevatedButton(
              onPressed: onContactPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accentBlue.withValues(alpha: 0.4),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 14,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.mail_outline_rounded,
                          color: Colors.white, size: 18),
                      SizedBox(width: 8),
                      Text(
                        'Contact Me',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: onResumePressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.accentPurple, AppColors.accentCyan],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accentPurple.withValues(alpha: 0.4),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 14,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.description_rounded,
                          color: Colors.white, size: 18),
                      SizedBox(width: 8),
                      Text(
                        'Resume',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
