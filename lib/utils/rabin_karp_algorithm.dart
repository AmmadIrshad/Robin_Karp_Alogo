import 'dart:core';

class StringMatchingRabinKarpAlgo {
  static Map<String, dynamic> rabinKarp(String T, String P, int prime) {
    int n = T.length; // Length of text
    int m = P.length; // Length of pattern
    int d = 256; // Number of possible characters (ASCII-based)
    int h = 1; // Value of d^(m-1) for rolling hash
    int pHash = 0; // Hash of pattern
    int tHash = 0; // Hash of current window in text
    int comparisons = 0; // Count of character comparisons
    List<int> s = []; // Store matching indices

    // Precompute h = d^(m-1) % prime
    for (int i = 0; i < m - 1; i++) {
      h = (h * d) % prime;
    }

    // Compute initial hashes for pattern and first window of text
    for (int i = 0; i < m; i++) {
      pHash = (d * pHash + P.codeUnitAt(i)) % prime;
      tHash = (d * tHash + T.codeUnitAt(i)) % prime;
    }

    // Slide the pattern over text
    for (int i = 0; i <= n - m; i++) {
      // Compare hash values
      if (pHash == tHash) {
        bool match = true;
        for (int j = 0; j < m; j++) {
          comparisons++;
          if (T[i + j] != P[j]) {
            match = false;
            break;
          }
        }
        if (match) {
          s.add(i);
        }
      }

      // Compute next window's hash
      if (i < n - m) {
        tHash =
            (d * (tHash - T.codeUnitAt(i) * h) + T.codeUnitAt(i + m)) % prime;
        if (tHash < 0) {
          tHash += prime; // Ensure non-negative hash
        }
      }
    }

    return {"matchedIndices": s, "comparisons": comparisons};
  }
}
