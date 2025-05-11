import 'package:flutter_test/flutter_test.dart';
import 'package:kite/model/event.dart';

void main() {
  group('Event', () {
    test('fromJson creates correct instance', () {
      // Arrange
      final json = {
        'year': '2022',
        'content':
            '<a data-wiki-id="Myanmar_civil_war_(2021%E2%80%93present)" href="https://en.wikipedia.org/wiki/Myanmar_civil_war_(2021%E2%80%93present)" title="Myanmar civil war (2021â€“present)">Myanmar civil war</a>: Government troops <b><a data-wiki-id="Mon_Taing_Pin_massacre" href="https://en.wikipedia.org/wiki/Mon_Taing_Pin_massacre" title="Mon Taing Pin massacre">killed 37 unarmed civilians</a></b> in <a data-wiki-id="Mondaingbin" href="https://en.wikipedia.org/wiki/Mondaingbin" title="Mondaingbin">Mondaingbin</a>.',
        'sort_year': 2022.0,
        'type': 'event',
      };

      // Act
      final event = Event.fromJson(json);

      // Assert
      expect(event.year, '2022');
      expect(
        event.content,
        '<a data-wiki-id="Myanmar_civil_war_(2021%E2%80%93present)" href="https://en.wikipedia.org/wiki/Myanmar_civil_war_(2021%E2%80%93present)" title="Myanmar civil war (2021â€“present)">Myanmar civil war</a>: Government troops <b><a data-wiki-id="Mon_Taing_Pin_massacre" href="https://en.wikipedia.org/wiki/Mon_Taing_Pin_massacre" title="Mon Taing Pin massacre">killed 37 unarmed civilians</a></b> in <a data-wiki-id="Mondaingbin" href="https://en.wikipedia.org/wiki/Mondaingbin" title="Mondaingbin">Mondaingbin</a>.',
      );
      expect(event.sortYear, 2022.0);
      expect(event.type, EventType.event);
    });

    test('supports different event types', () {
      // Act
      final peopleEvent = Event(
        year: '2001',
        content: '<b><a href="https://en.wikipedia.org/wiki/Douglas_Adams" data-wiki-id="Q42" title="Douglas Adams">Douglas Adams</a></b> (Hitchhiker\'s Guide author) died.',
        sortYear: 2001.2,
        type: EventType.people,
      );

      // Assert
      expect(peopleEvent.type, EventType.people);
    });
  });
}
