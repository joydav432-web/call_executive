import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CustomerHandlingSection extends StatelessWidget {
  const CustomerHandlingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);

    final steps = [
      _HandlingStep(
        stepNumber: '01',
        title: 'LISTEN',
        icon: Icons.hearing_rounded,
        description: 'Attentive, active listening without interruption to capture every concern.',
        color: AppColors.accentCyan,
      ),
      _HandlingStep(
        stepNumber: '02',
        title: 'UNDERSTAND',
        icon: Icons.psychology_alt_rounded,
        description: 'Empathizing deeply to identify the root cause and emotional context.',
        color: AppColors.accentBlue,
      ),
      _HandlingStep(
        stepNumber: '03',
        title: 'ANALYZE',
        icon: Icons.manage_search_rounded,
        description: 'Evaluating policies and resources to craft the most effective solution.',
        color: AppColors.accentPurple,
      ),
      _HandlingStep(
        stepNumber: '04',
        title: 'SOLVE',
        icon: Icons.task_alt_rounded,
        description: 'Delivering clear, prompt, and high-accuracy resolution with patience.',
        color: AppColors.accentGreen,
      ),
      _HandlingStep(
        stepNumber: '05',
        title: 'FOLLOW-UP',
        icon: Icons.published_with_changes_rounded,
        description: 'Proactively ensuring full satisfaction and reinforcing client trust.',
        color: AppColors.accentGold,
      ),
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

              // Steps Flow: Desktop Horizontal / Mobile Vertical
              isMobile
                  ? _buildVerticalFlow(steps)
                  : _buildHorizontalFlow(steps),

              const SizedBox(height: 48),

              // Approach Quote Banner
              _buildApproachBanner(isMobile),
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
            color: AppColors.accentGold.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.accentGold.withValues(alpha: 0.35),
            ),
          ),
          child: const Text(
            'SIGNATURE WORKFLOW ⭐⭐⭐',
            style: TextStyle(
              color: AppColors.accentGold,
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
            'How I Handle Customers',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'A proven 5-step strategic framework for handling inquiries and delighting clients',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalFlow(List<_HandlingStep> steps) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(steps.length * 2 - 1, (index) {
        if (index.isOdd) {
          // Connector Arrow
          return Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Icon(
              Icons.arrow_forward_rounded,
              color: AppColors.accentBlue.withValues(alpha: 0.6),
              size: 24,
            ),
          );
        }
        final stepIndex = index ~/ 2;
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: _StepCard(step: steps[stepIndex]),
          ),
        );
      }),
    );
  }

  Widget _buildVerticalFlow(List<_HandlingStep> steps) {
    return Column(
      children: List.generate(steps.length * 2 - 1, (index) {
        if (index.isOdd) {
          // Connector Arrow down
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Icon(
              Icons.arrow_downward_rounded,
              color: AppColors.accentBlue.withValues(alpha: 0.6),
              size: 24,
            ),
          );
        }
        final stepIndex = index ~/ 2;
        return _StepCard(step: steps[stepIndex]);
      }),
    );
  }

  Widget _buildApproachBanner(bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 32,
        vertical: isMobile ? 20 : 24,
      ),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.accentCyan.withValues(alpha: 0.4),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.accentCyan.withValues(alpha: 0.1),
            blurRadius: 25,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.lightbulb_rounded,
                color: AppColors.accentGold,
                size: 20,
              ),
              const SizedBox(width: 8),
              const Text(
                'CORE PHILOSOPHY',
                style: TextStyle(
                  color: AppColors.accentCyan,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontSize: isMobile ? 14 : 16.5,
                height: 1.6,
                fontFamily: 'Inter',
                color: AppColors.textPrimary,
              ),
              children: const [
                TextSpan(
                  text: 'My approach: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.accentCyan,
                  ),
                ),
                TextSpan(text: 'Stay calm  →  '),
                TextSpan(text: 'Listen carefully  →  '),
                TextSpan(text: 'Understand the issue  →  '),
                TextSpan(text: 'Provide the right solution  →  '),
                TextSpan(
                  text: 'Follow up when necessary.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.accentGreen,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StepCard extends StatefulWidget {
  final _HandlingStep step;

  const _StepCard({required this.step});

  @override
  State<_StepCard> createState() => _StepCardState();
}

class _StepCardState extends State<_StepCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        decoration: BoxDecoration(
          color: _isHovered ? AppColors.bgCardHover : AppColors.bgCard,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: _isHovered
                ? widget.step.color.withValues(alpha: 0.7)
                : AppColors.border,
            width: _isHovered ? 1.5 : 1.0,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: widget.step.color.withValues(alpha: 0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Step Number Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: widget.step.color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'STEP ${widget.step.stepNumber}',
                style: TextStyle(
                  color: widget.step.color,
                  fontSize: 10.5,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            const SizedBox(height: 14),

            // Icon Circle
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.step.color.withValues(
                  alpha: _isHovered ? 0.25 : 0.12,
                ),
              ),
              child: Icon(
                widget.step.icon,
                color: widget.step.color,
                size: 26,
              ),
            ),
            const SizedBox(height: 12),

            // Title
            Text(
              widget.step.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.1,
              ),
            ),
            const SizedBox(height: 8),

            // Description
            Text(
              widget.step.description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HandlingStep {
  final String stepNumber;
  final String title;
  final IconData icon;
  final String description;
  final Color color;

  _HandlingStep({
    required this.stepNumber,
    required this.title,
    required this.icon,
    required this.description,
    required this.color,
  });
}
