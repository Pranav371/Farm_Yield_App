import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpensesCardWidget extends StatefulWidget {
  final String expenseCategory;
  final String expensePaidTo;
  final int expenseAmount;
  final int expenseId;
  final String expenseTimestamp;

  const ExpensesCardWidget({
    super.key,
    required this.expenseCategory,
    required this.expensePaidTo,
    required this.expenseAmount,
    required this.expenseId,
    required this.expenseTimestamp,
  });

  @override
  State<ExpensesCardWidget> createState() => _ExpensesCardWidgetState();
}

class _ExpensesCardWidgetState extends State<ExpensesCardWidget>
    with TickerProviderStateMixin {
  late AnimationController _hoverController;
  late AnimationController _tapController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;
  late Animation<double> _tapScaleAnimation;
  
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    
    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    
    _tapController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.02,
    ).animate(CurvedAnimation(
      parent: _hoverController,
      curve: Curves.easeOutCubic,
    ));
    
    _elevationAnimation = Tween<double>(
      begin: 2.0,
      end: 8.0,
    ).animate(CurvedAnimation(
      parent: _hoverController,
      curve: Curves.easeOutCubic,
    ));
    
    _tapScaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.98,
    ).animate(CurvedAnimation(
      parent: _tapController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _hoverController.dispose();
    _tapController.dispose();
    super.dispose();
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'food':
      case 'restaurant':
      case 'groceries':
        return Icons.restaurant_rounded;
      case 'transport':
      case 'fuel':
      case 'travel':
        return Icons.directions_car_rounded;
      case 'utilities':
      case 'electricity':
      case 'water':
        return Icons.electrical_services_rounded;
      case 'entertainment':
      case 'movies':
        return Icons.movie_rounded;
      case 'health':
      case 'medical':
        return Icons.local_hospital_rounded;
      case 'shopping':
        return Icons.shopping_bag_rounded;
      case 'education':
        return Icons.school_rounded;
      default:
        return Icons.receipt_rounded;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'food':
      case 'restaurant':
      case 'groceries':
        return Colors.orange;
      case 'transport':
      case 'fuel':
      case 'travel':
        return Colors.blue;
      case 'utilities':
      case 'electricity':
      case 'water':
        return Colors.amber;
      case 'entertainment':
      case 'movies':
        return Colors.purple;
      case 'health':
      case 'medical':
        return Colors.red;
      case 'shopping':
        return Colors.pink;
      case 'education':
        return Colors.indigo;
      default:
        return const Color(0xFF4CAF50);
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoryColor = _getCategoryColor(widget.expenseCategory);
    final categoryIcon = _getCategoryIcon(widget.expenseCategory);
    
    return AnimatedBuilder(
      animation: Listenable.merge([_scaleAnimation, _tapScaleAnimation]),
      builder: (context, child) => Transform.scale(
        scale: _scaleAnimation.value * _tapScaleAnimation.value,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          child: Material(
            elevation: _elevationAnimation.value,
            borderRadius: BorderRadius.circular(20),
            shadowColor: categoryColor.withOpacity(0.3),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                HapticFeedback.lightImpact();
                _tapController.forward().then((_) {
                  _tapController.reverse();
                });
              },
              onTapDown: (_) => _tapController.forward(),
              onTapUp: (_) => _tapController.reverse(),
              onTapCancel: () => _tapController.reverse(),
              onHover: (hovering) {
                setState(() => _isHovered = hovering);
                if (hovering) {
                  _hoverController.forward();
                } else {
                  _hoverController.reverse();
                }
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Theme.of(context).colorScheme.surface,
                      Theme.of(context).colorScheme.surface.withOpacity(0.8),
                    ],
                  ),
                  border: Border.all(
                    color: _isHovered 
                        ? categoryColor.withOpacity(0.3)
                        : Colors.grey.withOpacity(0.1),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header row with icon and amount
                    Row(
                      children: [
                        // Category icon
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: categoryColor.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            categoryIcon,
                            color: categoryColor,
                            size: 24,
                          ),
                        ),
                        
                        const SizedBox(width: 16),
                        
                        // Category and paid to
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.expenseCategory,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).colorScheme.onSurface,
                                  letterSpacing: -0.3,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                widget.expensePaidTo,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        // Amount
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                categoryColor.withOpacity(0.1),
                                categoryColor.withOpacity(0.05),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: categoryColor.withOpacity(0.2),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            "₹${widget.expenseAmount}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: categoryColor.withOpacity(0.9),
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Bottom row with metadata
                    Row(
                      children: [
                        // Expense ID chip
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "ID: ${widget.expenseId}",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                        
                        const Spacer(),
                        
                        // Date with icon
                        Row(
                          children: [
                            Icon(
                              Icons.schedule_rounded,
                              size: 16,
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.expenseTimestamp.split(' ')[0], // Show only date part
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



