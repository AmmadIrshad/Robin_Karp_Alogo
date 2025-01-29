//This class implements the Rabin-Karp Algorithm to calculate the similarity percentage between two texts.
// It does this by comparing small substrings (of length 3) and checking how many of them match using hashing.

class RobinKarpAlgorithm {
  // Function to compute the hash of a substring using the Rabin-Karp method
  static int hashString({required String substring, required int prime}) {
    int hashValue = 0;
    for (int i = 0; i < substring.length; i++) {
      //hashValue = (hashValue × prime + ASCII value of character) mod 1000000007
      hashValue = (hashValue * prime + substring.codeUnitAt(i)) %
          1000000007; // Using a large modulo to avoid overflow
    }
    return hashValue;
    /*
    Example Calculation:

  For substring "abc", where ASCII values are:
  a → 97 , b → 98 , c → 99
  Hash calculation:

  hashValue = (0 * 101 + 97) % 1000000007 = 97
  hashValue = (97 * 101 + 98) % 1000000007 = 9895
  hashValue = (9895 * 101 + 99) % 1000000007 = 999494
  So, "abc" would have a hash value of 999494.
     */
  }

  // Function to calculate the similarity level of two strings using Rabin-Karp
  static double rabinKarpSimilarity({
    required String conversionText,
    required String testerText,
  }) {
    //const int k = 3;
    int k = testerText.length < 3 ? testerText.length : 3;
    const int prime = 101;

    // Set to store hash values of substrings in conversionText
    Set<int> hashesS1 = {};
    // Set to store hash values of substrings in testerText
    Set<int> hashesS2 = {};

    // Compute hash for all substrings of length k in conversionText
    for (int i = 0; i <= conversionText.length - k; i++) {
      String substring = conversionText.substring(i, i + k);
      int substringHash = hashString(substring: substring, prime: prime);
      hashesS1.add(substringHash);
    }
    // Compute hash for all substrings of length k in testerText
    for (int i = 0; i <= testerText.length - k; i++) {
      String substring = testerText.substring(i, i + k);
      int substringHash = hashString(substring: substring, prime: prime);
      hashesS2.add(substringHash);
    }
    // Count the number of matching substrings based on hash values
    Set<int> commonHashes = hashesS1.intersection(hashesS2);
    /*
    1 Divides the text into substrings of length k (3 characters)
    2 Hashes each substring using hashString
    3 Stores the hash values in sets (hashesS1 and hashesS2)
    4 Finds how many hashed substrings are common in both texts.
    5 Computes the percentage similarity using the formula
    similarity=( total unique hashes / number of matching hashes )×100
     */
    double similarity =
        (commonHashes.length / hashesS1.union(hashesS2).length) * 100;
    return similarity;
  }
}
