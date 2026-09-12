import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class NavbarSection extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onHeroTap;
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onHandlingTap;
  final VoidCallback onExperienceTap;
  final VoidCallback onContactTap;

  const NavbarSection({
    super.key,
    required this.onHeroTap,
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onHandlingTap,
    required this.onExperienceTap,
    required this.onContactTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 40,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: AppColors.bgDark.withValues(alpha: 0.9),
        border: const Border(
          bottom: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1140),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              InkWell(
                onTap: onHeroTap,
                borderRadius: BorderRadius.circular(8),
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
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) =>
                          AppColors.primaryGradient.createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      ),
                      child: const Text(
                        'JOYDEB.K',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Desktop Navigation Links
              if (!isMobile)
                Row(
                  children: [
                    _buildNavLink('Home', onHeroTap),
                    _buildNavLink('About Me', onAboutTap),
                    _buildNavLink('Skills', onSkillsTap),
                    _buildNavLink('Process', onHandlingTap),
                    _buildNavLink('Experience', onExperienceTap),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: onContactTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: const Text(
                            'Get in Touch',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              else
                // Mobile Drawer button
                IconButton(
                  icon: const Icon(Icons.menu_rounded,
                      color: AppColors.accentCyan, size: 28),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavLink(String text, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          foregroundColor: AppColors.textSecondary,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
