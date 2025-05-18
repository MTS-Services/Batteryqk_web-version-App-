import 'package:flutter/material.dart';

class HeaderCell extends StatelessWidget {
  final int flex;
   final String? label;
  final List<IconData>? icons;
  final List<Color>? iconColors;
  final Color? color;
  final void Function(IconData)? onIconPressed;

  const HeaderCell({
    super.key,
    required this.flex,
    this.label,
    this.icons,
    this.iconColors,
    this.color,
    this.onIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double maxWidth = constraints.maxWidth;
          final bool isSmallScreen = maxWidth < 100;

          final double iconSize = isSmallScreen ? 14 : 18;
          final double iconPadding = isSmallScreen ? 2 : 4;
          final double spacing = isSmallScreen ? 3 : 6;
          final double textSize = isSmallScreen ? 10 : 13;

          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 6.0,
                vertical: 4.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (label != null) ...[
                    Flexible(
                      child: Text(
                        label!,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: textSize,
                          letterSpacing: 0.5,
                          color: color ?? Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(width: spacing),
                  ],
                  if (icons != null)
                    Row(
                      children: List.generate(icons!.length, (index) {
                        final iconData = icons![index];
                        final iconColor =
                            iconColors != null && index < iconColors!.length
                                ? iconColors![index]
                                : color ?? Colors.grey;

                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: iconPadding / 2,
                          ),
                          child: IconButton(
                            onPressed: () => onIconPressed?.call(iconData),
                            icon: Icon(iconData),
                            iconSize: iconSize,
                            color: iconColor,
                            padding: EdgeInsets.all(iconPadding),
                            constraints: const BoxConstraints(
                              minWidth: 11,
                              minHeight: 11,
                            ),
                          ),
                        );
                      },
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
