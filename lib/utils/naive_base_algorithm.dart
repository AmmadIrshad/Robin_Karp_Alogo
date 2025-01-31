class StringMatchingAlgorithm {
  // Function to find all occurrences of a pattern P in a text T
  static List<int> stringMatching(String T, String P) {
    int n = T.length; // Length of the text
    int m = P.length; // Length of the pattern
    List<int> s = []; // List to store the indices where the pattern matches

    // Iterate through the text T to find the pattern P
    for (int i = 0; i <= n - m; i++) {
      bool match = true;

      // Compare the substring starting at index i with the pattern P
      for (int j = 0; j < m; j++) {
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

    return s;
  }
}
