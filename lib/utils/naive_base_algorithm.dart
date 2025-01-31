import 'dart:core';

class StringMatchingAlgorithm {
  // Function to find all occurrences of a pattern P in a text T
  static Map<String, dynamic> stringMatching(String T, String P) {
    int n = T.length; // Length of the text
    int m = P.length; // Length of the pattern
    List<int> s = []; // List to store the indices where the pattern matches
    int comparisons = 0; // Count of character comparisons

    // Iterate through the text T to find the pattern P
    for (int i = 0; i <= n - m; i++) {
      bool match = true;

      // Compare the substring starting at index i with the pattern P
      for (int j = 0; j < m; j++) {
        comparisons++;
        if (T[i + j] != P[j]) {
          match = false;
          break;
        }
      }

      // If match is found, add the index to the result list
      if (match) {
        s.add(i);
      }
    }

    // Return a map containing the results
    return {"matchedIndices": s, "comparisons": comparisons};
  }
}
