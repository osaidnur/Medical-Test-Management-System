# Medical Test Management System

A MIPS Assembly-based system built using the **MARS simulator**, designed to manage patient records and medical test data in a menu-driven interface. This project simulates real-world clinical data handling in a low-level programming context.

## 📚 Table of Contents

- [Features](#features)
- [System Options](#system-options)
- [Files Included](#files-included)
- [How to Run](#how-to-run)
- [Authors](#authors)

## 📌 Features

- Add and manage patient records
- Select from predefined medical tests
- Input and edit test results
- Error handling for invalid test results and inconsistent data values


## 🧮 System Options

Upon startup, the system reads test data from `MedicalTest.txt` and presents the following menu:

1. **Add a New Medical Test**  
   Enter a new test name, patient ID, and result to expand the current dataset.

2. **Search for a Test by Patient ID**  
   Locate and display all tests associated with a specific patient.

3. **Search for Unnormal Tests**  
   Filter and show tests that fall outside of the expected normal value range.

4. **Average Test Value**  
   Calculate and display the average value across all test results.

5. **Update an Existing Test Result**  
   Modify the result of a previously added test.

6. **Delete a Test**  
   Remove a test record from the current list.

7. **Exit and Write the Data to the File**  
   Save all current records back to `MedicalTest.txt` before exiting.

## 📁 Files Included

- `P1_1210733_1210125.asm` – Main MIPS assembly source code
- `MedicalTest.txt` – Contains the dataset used by the system
- `Project Report.pdf` – In-depth documentation and development details
- `Project_1_Description.pdf` – Original assignment brief and requirements

## 🛠️ How to Run

1. Download and open [MARS (MIPS Assembler and Runtime Simulator)]([http://courses.missouristate.edu/KenVollmar/MARS/](https://github.com/dpetersanderson/MARS/releases/tag/v.4.5.1)).
2. Load the file `P1_1210733_1210125.asm` into MARS.
3. Click **Assemble**, then **Run**.
4. Follow the menu prompts to test the system features.

## 👨‍💻 Authors

- **Osaid Hasan Nur** – 1210733
- **[Moath Wajeeh]** – 1210125
