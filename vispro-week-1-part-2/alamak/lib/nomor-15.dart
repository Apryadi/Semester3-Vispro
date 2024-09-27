import 'dart:collection';

void main() {
  // Definisikan tahapan proyek
  List<String> stages = ['A', 'B', 'C', 'D', 'E', 'F'];

  // Definisikan ketergantungan antar tahapan (graph adjacency list)
  Map<String, List<String>> dependencies = {
    'A': ['B', 'D'], // A harus selesai sebelum B dan D
    'B': ['C'],      // B harus selesai sebelum C
    'D': ['E'],      // D harus selesai sebelum E
    'C': ['F'],      // C harus selesai sebelum F
    'E': ['F'],      // E harus selesai sebelum F
  };

  // Panggil fungsi topological sort untuk mendapatkan urutan pengerjaan
  List<String>? order = topologicalSort(stages, dependencies);

  if (order == null) {
    print('Tidak ada urutan pengerjaan yang valid (terdapat siklus ketergantungan).');
  } else {
    print('Urutan pengerjaan yang efisien: ${order.join(' -> ')}');
  }
}

/// Fungsi untuk melakukan Topological Sort menggunakan Kahn's Algorithm
List<String>? topologicalSort(List<String> stages, Map<String, List<String>> dependencies) {
  // Hitung derajat masuk (in-degree) untuk setiap tahap
  Map<String, int> inDegree = {for (var stage in stages) stage: 0};

  // Bangun graf berdasarkan ketergantungan
  Map<String, List<String>> graph = {for (var stage in stages) stage: []};

  for (var entry in dependencies.entries) {
    String from = entry.key;
    for (String to in entry.value) {
      graph[from]?.add(to);
      inDegree[to] = inDegree[to]! + 1;
    }
  }

  // Inisialisasi queue dengan node yang memiliki in-degree 0 (tahapan yang bisa dikerjakan lebih dulu)
  Queue<String> queue = Queue<String>();
  for (var entry in inDegree.entries) {
    if (entry.value == 0) {
      queue.add(entry.key);
    }
  }

  List<String> order = [];

  // Proses elemen di queue
  while (queue.isNotEmpty) {
    String current = queue.removeFirst();
    order.add(current);

    // Kurangi in-degree untuk semua tetangga
    for (String neighbor in graph[current]!) {
      inDegree[neighbor] = inDegree[neighbor]! - 1;

      // Jika in-degree menjadi 0, tambahkan ke queue
      if (inDegree[neighbor] == 0) {
        queue.add(neighbor);
      }
    }
  }

  // Jika jumlah node dalam urutan sama dengan jumlah total tahapan, urutan valid
  if (order.length == stages.length) {
    return order;
  } else {
    // Jika tidak, berarti ada siklus (circular dependency)
    return null;
  }
}
