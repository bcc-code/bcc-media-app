import 'package:bccm_core/api.dart';

bool sectionIsVertical(element) =>
    element is Fragment$Section$$ListSection ||
    element is Fragment$Section$$DefaultGridSection ||
    element is Fragment$Section$$IconGridSection ||
    element is Fragment$Section$$PosterGridSection;
