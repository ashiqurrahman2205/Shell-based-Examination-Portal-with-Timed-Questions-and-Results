# 🚀 Interactive Examination Portal with Timed Questions and Result Analytics  

## 📖 Overview  
This project is a command-line-based examination portal created using Bash scripting. It provides a secure, interactive environment for conducting tests, managing user accounts, and evaluating performance in a user-friendly format.  

## 🌟 Features  
- 🔒 **User Login System**: Includes Sign In and Sign Up functionality with password validation.  
- ⏱️ **Timed Tests**: Automatically transitions to the next question after 10 seconds.  
- 📚 **Question Bank**: Reads questions from a text file and dynamically loads them during the test.  
- 📝 **Result Generation**: Compares user answers with correct answers and calculates the score.  
- ⚠️ **Error Handling**: Alerts for invalid choices and mismatched passwords.  
- 🎨 **Decorative UI**: Colorful and visually appealing interface with animations and effects.  

## 🛠️ Prerequisites  
- 🖥️ Linux-based operating system.  
- 🐚 Bash shell (v4.0 or above).  

## 🚧 Installation & Usage  
```bash
# Clone this repository:
git clone https://github.com/ashiqurrahman2205/Shell-based-Examination-Portal-with-Timed-Questions-and-Results.git
cd exam-portal

# Add your questions to questionbank.txt:
# Ensure each question block is separated by a newline.

# Add corresponding answers to correctans.txt:
# Ensure one answer per line.

# Run the script:
./exam_portal.sh bash
```
## 📁 File Structure
```plaintext
├── correctans.txt       # Stores the correct answers for evaluation.
├── final_main_file.sh   # The main Bash script file for the portal.
├── log.txt              # Logs user sign-ins with timestamps.
├── mark_record.txt      # Records scores achieved by each user.
├── password.csv         # Stores encrypted passwords for user accounts.
├── questionbank.txt     # Stores the test questions in blocks of 5 lines.
├── userans.txt          # Logs user responses during the test.
├── username.csv         # Stores registered usernames.
```
