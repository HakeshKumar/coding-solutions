class Solution:
    def mergeAlternately(self, word1: str, word2: str) -> str:
        pointer1 = 0
        pointer2 = 0
        result = ""

        for i in range(0, len(word1) + len(word2)):
            if pointer1 < len(word1):
                result += word1[pointer1]
                pointer1 += 1

            if pointer2 < len(word2):
                result += word2[pointer2]
                pointer2 += 1

        return result
