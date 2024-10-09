import 'dart:collection';

final class EntryItem extends LinkedListEntry<EntryItem>{
  final int angka;
  final String huruf;
  EntryItem(this.angka, this.huruf);

  String toString(){
    return '$angka : $huruf';
  }
}

void main(){
  final linkedList = LinkedList<EntryItem>();
  linkedList
    .addAll([EntryItem(69, 'enamSembilan'), EntryItem(12, 'duaBelas')]);
    print(linkedList.first);
    print(linkedList.last);

    linkedList.first.insertAfter(EntryItem(100, 'seratus'));
    linkedList.last.insertBefore(EntryItem(200, 'duaRatus'));

    for(var entry in linkedList) {
      print(entry);
    }

  // Remove item using index from list.
  linkedList.elementAt(2).unlink();
  print(linkedList); // (1 : A, 15 : E, 10 : D, 3 : C)
  // Remove first item.
  linkedList.first.unlink();
  print(linkedList); // (15 : E, 10 : D, 3 : C)
  // Remove last item from list.
  linkedList.remove(linkedList.last);
  print(linkedList); // (15 : E, 10 : D)
  // Remove all items.
  linkedList.clear();
  print(linkedList.length); // 0
  print(linkedList.isEmpty); // true
}