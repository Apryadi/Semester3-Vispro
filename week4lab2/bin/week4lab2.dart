import 'dart:math';

// Define the graph as an adjacency list with weights
Map<String, Map<String, int>> graph = {
  'A': {'B': 8, 'C': 7, 'D': 2, 'E': 10},
  'B': {'A': 8, 'C': 5, 'D': 6, 'E': 8},
  'C': {'A': 7, 'B': 5, 'D': 1, 'E': 4},
  'D': {'A': 2, 'B': 6, 'C': 1, 'E': 3},
  'E': {'A': 10, 'B': 8, 'C': 4, 'D': 3},
};

// Function to find the nearest unvisited vertex
String? findNearest(String current, Set<String> visited) {
  String? nearest;
  int minDistance = double.maxFinite.toInt();

  graph[current]!.forEach((vertex, distance) {
    if (!visited.contains(vertex) && distance < minDistance) {
      minDistance = distance;
      nearest = vertex;
    }
  });

  return nearest;
}

// Main function to find the path using greedy approach
void findGreedyPath() {
  String start = 'A'; // Always start at A
  Set<String> visited = {start}; // Keep track of visited vertices
  List<String> path = [start]; // Path to store the visited order
  String current = start;
  int totalWeight = 0;

  // Continue until all vertices are visited
  while (visited.length < graph.length) {
    String? nearest = findNearest(current, visited);
    if (nearest == null) break; // In case there's no valid next vertex
    
    totalWeight += graph[current]![nearest]!;
    visited.add(nearest);
    path.add(nearest);
    current = nearest;
  }

  // Finally, return to the start vertex
  totalWeight += graph[current]![start]!;
  path.add(start);

  // Print the final path and total weight
  print('Greedy path: $path');
  print('Total weight: $totalWeight');
}

void main() {
  findGreedyPath();
}
