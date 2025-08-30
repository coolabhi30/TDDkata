# String Calculator Kata (Flutter - TDD Practice)

This project implements the **String Calculator Kata** using **Flutter & Dart** with a strict **Test-Driven Development (TDD)** approach.  
The focus is on practicing **unit testing** and **incremental design** instead of UI.

---

## 📂 Project Structure
```

lib/
└── string\_calculator.dart   # Implementation of StringCalculator
test/
└── string\_calculator\_test.dart   # Unit tests (TDD)

````

---

## 🚀 How to Run Tests
```bash
flutter test
````

---

## 🧪 TDD Progress Log

This log documents each step of the TDD cycle (**Red → Green → Refactor**) while building the String Calculator.

---

### ✅ Step 1: Empty String Returns 0

* **Test:** Input `""` should return `0`.
* **Status:** ❌ Failed → ✅ Passed after implementation.
* **Code:**

  ```dart
  int add(String numbers) {
    if (numbers.isEmpty) return 0;
    return int.parse(numbers);
  }
  ```

---

### ✅ Step 2: Single Number Returns Itself

* **Test:** Input `"1"` → `1`.
* **Status:** ❌ Failed → ✅ Passed after code update.

---

### ✅ Step 3: Two Numbers, Comma-Separated

* **Test:** `"1,2"` → `3`.
* **Code Update:** Split string by `,`.

---

### ✅ Step 4: Multiple Numbers

* **Test:** `"1,2,3,4"` → `10`.
* **Code Update:** Use `.split(",")` and `map(int.parse).reduce(...)`.

---

### ✅ Step 5: Support Newlines as Delimiters

* **Test:** `"1\n2,3"` → `6`.
* **Code Update:** Replace `\n` with `,` before splitting.

---

### ✅ Step 6: Support Custom Delimiters

* **Test:** `"//;\n1;2"` → `3`.
* **Code Update:** Detect custom delimiter using `//[delimiter]\n`.

---

### ✅ Step 7: Negative Numbers Not Allowed

* **Test:** `"-1,2,-3"` → throws `Exception("Negatives not allowed: -1, -3")`.
* **Code Update:** Check list for negatives.

---

### ✅ Step 8: Ignore Numbers > 1000

* **Test:** `"1001,2"` → `2`.
* **Code Update:** Filter out numbers greater than `1000`.

---

### ✅ Step 9: Delimiters of Any Length

* **Test:** `"//[***]\n1***2***3"` → `6`.

---

### ✅ Step 10: Multiple Custom Delimiters

* **Test:** `"//[*][%]\n1*2%3"` → `6`.

---

## 🎯 Learnings

* Practiced **TDD discipline** with incremental changes.
* Learned how **unit tests guide implementation**.
* Built a **robust parser** with small steps.

---

## 👨‍💻 Author

**Abhishek Singh Rawat**
Flutter Developer | Practicing TDD | String Calculator Kata

```
